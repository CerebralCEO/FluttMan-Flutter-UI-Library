#!/usr/bin/env node

/**
 * FlutMan Registry Sync Script
 *
 * This script syncs the local registry/flutter/ directory to the Supabase ComponentRegistry table.
 * It reads .dart files for code and .mdx files for dependencies, then performs an upsert.
 *
 * Usage: pnpm tsx scripts/sync-registry.ts
 */

// test sync
import { promises as fs } from "node:fs";
import path from "node:path";
import { createClient } from "@supabase/supabase-js";

// Initialize Supabase client with service role key for admin access
const supabaseUrl = process.env.SUPABASE_URL;
const supabaseServiceKey = process.env.SUPABASE_SERVICE_KEY;

if (!supabaseUrl || !supabaseServiceKey) {
  console.error(
    "❌ Error: SUPABASE_URL and SUPABASE_SERVICE_KEY environment variables are required",
  );
  process.exit(1);
}

const supabase = createClient(supabaseUrl, supabaseServiceKey, {
  auth: {
    persistSession: false,
    autoRefreshToken: false,
  },
});

const REGISTRY_DIR = path.join(
  process.cwd(),
  "apps",
  "ui",
  "registry",
  "flutter",
);

interface ComponentData {
  name: string;
  code: string;
  dependencies: string[];
}

/**
 * Parse dependencies from MDX frontmatter
 * Expected format: ---\ndependencies: ["package1", "package2"]\n---
 */
function parseDependencies(mdxContent: string): string[] {
  const frontmatterMatch = mdxContent.match(/---\n([\s\S]*?)\n---/);
  if (!frontmatterMatch?.[1]) {
    return [];
  }

  const frontmatter = frontmatterMatch[1];
  const depsMatch = frontmatter.match(/dependencies:\s*\[(.*?)\]/);

  if (!depsMatch?.[1]) {
    return [];
  }

  return depsMatch[1]
    .split(",")
    .map((d) => d.trim().replace(/['"]/g, ""))
    .filter((d) => d.length > 0);
}

/**
 * Read a single component's data from registry/flutter/{name}/
 */
async function readComponent(name: string): Promise<ComponentData | null> {
  const componentDir = path.join(REGISTRY_DIR, name);
  const dartFilePath = path.join(componentDir, `${name}.dart`);
  const mdxFilePath = path.join(componentDir, `${name}.mdx`);

  try {
    // Check if directory exists
    await fs.access(componentDir);
  } catch {
    console.warn(`⚠️  Component directory not found: ${componentDir}`);
    return null;
  }

  let code: string;
  try {
    code = await fs.readFile(dartFilePath, "utf-8");
  } catch {
    console.warn(`⚠️  Dart file not found for component: ${name}`);
    return null;
  }

  let dependencies: string[] = [];
  try {
    const mdxContent = await fs.readFile(mdxFilePath, "utf-8");
    dependencies = parseDependencies(mdxContent);
  } catch {
    // MDX file not found, use empty dependencies
    dependencies = [];
  }

  return { name, code, dependencies };
}

/**
 * Get all component directories from registry/flutter/
 */
async function getAllComponents(): Promise<string[]> {
  try {
    await fs.access(REGISTRY_DIR);
  } catch {
    console.error(`❌ Registry directory not found: ${REGISTRY_DIR}`);
    return [];
  }

  const entries = await fs.readdir(REGISTRY_DIR, { withFileTypes: true });
  return entries
    .filter((entry) => entry.isDirectory())
    .map((entry) => entry.name);
}

/**
 * Sync a single component to Supabase
 */
async function syncComponent(component: ComponentData): Promise<boolean> {
  try {
    const { error } = await supabase.from("ComponentRegistry").upsert(
      {
        name: component.name,
        code: component.code,
        dependencies: component.dependencies,
      },
      {
        onConflict: "name",
      },
    );

    if (error) {
      console.error(`❌ Failed to sync ${component.name}:`, error.message);
      return false;
    }

    return true;
  } catch (error) {
    console.error(`❌ Error syncing ${component.name}:`, error);
    return false;
  }
}

/**
 * Main sync function
 */
async function main(): Promise<void> {
  console.log("🚀 Starting FlutMan Registry Sync...\n");
  console.log(`📁 Registry directory: ${REGISTRY_DIR}`);
  console.log(`🔗 Supabase URL: ${supabaseUrl}\n`);

  const componentNames = await getAllComponents();

  if (componentNames.length === 0) {
    console.log("ℹ️  No components found in registry.");
    process.exit(0);
  }

  console.log(`📦 Found ${componentNames.length} component(s) to sync:\n`);

  let successCount = 0;
  let failCount = 0;

  for (const name of componentNames) {
    process.stdout.write(`  ⏳ Syncing ${name}... `);

    const component = await readComponent(name);
    if (!component) {
      console.log("❌ SKIP (missing files)");
      failCount++;
      continue;
    }

    const success = await syncComponent(component);
    if (success) {
      console.log(`✅ DONE (${component.dependencies.length} deps)`);
      successCount++;
    } else {
      failCount++;
    }
  }

  console.log(`\n${"=".repeat(50)}`);
  console.log("📊 Sync Summary:");
  console.log(`   ✅ Successful: ${successCount}`);
  console.log(`   ❌ Failed: ${failCount}`);
  console.log("=".repeat(50));

  if (failCount > 0) {
    process.exit(1);
  }

  console.log("\n✨ All components synced successfully!");
}

main().catch((error) => {
  console.error("\n💥 Fatal error during sync:", error);
  process.exit(1);
});
