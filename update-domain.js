#!/usr/bin/env node
/**
 * One-click domain updater for Flutman UI
 *
 * Usage:
 *   node update-domain.js
 *
 * Configuration:
 *   Edit OldDomain and NewDomain variables below
 */

const fs = require("node:fs");
const path = require("node:path");

// ═══════════════════════════════════════════════════════════════
// ⚙️ CONFIGURATION - Edit these for your target domain & brand
// ═══════════════════════════════════════════════════════════════

// DOMAIN SETTINGS
// Current domain (what to replace)
const OldDomain = "flutman.vercel.app";
// New domain (what to set) - Common values:
//   "flutman.vercel.app"  - Vercel deployment
//   "flutman.vercel.app"         - Custom domain
//   "flutman.dev"         - Dev domain
const NewDomain = "flutman.vercel.app";

// BRAND NAME SETTINGS (for metadata, titles, descriptions)
// Set to true to also replace brand names (flutman → flutman)
const ReplaceBrandNames = true;
// Old brand variations
const OldBrandLower = "flutman"; // flutman → flutman
const OldBrandTitle = "Flutman"; // Flutman → Flutman
const OldBrandUpper = "FLUTMAN"; // FLUTMAN → FLUTMAN
// New brand variations
const NewBrandLower = "flutman";
const NewBrandTitle = "Flutman";
const NewBrandUpper = "FLUTMAN";

// ═══════════════════════════════════════════════════════════════
// 🚀 SCRIPT
// ═══════════════════════════════════════════════════════════════

const FilePatterns = [
  /\.(ts|tsx|js|cjs|mts|md|mdx|json|txt|css|scss|yaml|yml|toml|lock)$/,
];
const ExcludeDirs = [
  "node_modules",
  ".next",
  ".git",
  "dist",
  "build",
  "out",
  "coverage",
  ".turbo",
  "skills",
];

const stats = {
  filesScanned: 0,
  filesModified: 0,
  replacementsMade: 0,
  errors: [],
};

function shouldProcessFile(filePath) {
  const fileName = path.basename(filePath);
  const matchesPattern = FilePatterns.some((pattern) => pattern.test(fileName));
  const inExcludedDir = ExcludeDirs.some(
    (dir) => filePath.includes(`\\${dir}\\`) || filePath.includes(`/${dir}/`),
  );
  return matchesPattern && !inExcludedDir;
}

function processFile(filePath) {
  try {
    const content = fs.readFileSync(filePath, "utf8");
    let newContent = content;
    let modified = false;

    // Replace https:// URLs
    const httpsPattern = new RegExp(`https://${escapeRegex(OldDomain)}`, "g");
    const httpsMatches = (content.match(httpsPattern) || []).length;
    if (httpsMatches > 0) {
      newContent = newContent.replace(httpsPattern, `https://${NewDomain}`);
      stats.replacementsMade += httpsMatches;
      modified = true;
    }

    // Replace bare domain (for non-URL references)
    const barePattern = new RegExp(escapeRegex(OldDomain), "g");
    const bareMatches = (content.match(barePattern) || []).length;
    if (bareMatches > 0) {
      newContent = newContent.replace(barePattern, NewDomain);
      stats.replacementsMade += bareMatches;
      modified = true;
    }

    // Replace brand names (flutman → flutman) if enabled
    if (ReplaceBrandNames) {
      // Lowercase: flutman → flutman
      const brandLowerPattern = new RegExp(
        `\\b${escapeRegex(OldBrandLower)}\\b`,
        "g",
      );
      const brandLowerMatches = (newContent.match(brandLowerPattern) || [])
        .length;
      if (brandLowerMatches > 0) {
        newContent = newContent.replace(brandLowerPattern, NewBrandLower);
        stats.replacementsMade += brandLowerMatches;
        modified = true;
      }

      // Title case: Flutman → Flutman
      const brandTitlePattern = new RegExp(
        `\\b${escapeRegex(OldBrandTitle)}\\b`,
        "g",
      );
      const brandTitleMatches = (newContent.match(brandTitlePattern) || [])
        .length;
      if (brandTitleMatches > 0) {
        newContent = newContent.replace(brandTitlePattern, NewBrandTitle);
        stats.replacementsMade += brandTitleMatches;
        modified = true;
      }

      // Uppercase: FLUTMAN → FLUTMAN
      const brandUpperPattern = new RegExp(
        `\\b${escapeRegex(OldBrandUpper)}\\b`,
        "g",
      );
      const brandUpperMatches = (newContent.match(brandUpperPattern) || [])
        .length;
      if (brandUpperMatches > 0) {
        newContent = newContent.replace(brandUpperPattern, NewBrandUpper);
        stats.replacementsMade += brandUpperMatches;
        modified = true;
      }
    }

    if (modified) {
      fs.writeFileSync(filePath, newContent, "utf8");
      stats.filesModified++;
      console.log(`  ✓ ${path.relative(process.cwd(), filePath)}`);
    }
  } catch (err) {
    stats.errors.push({ file: filePath, error: err.message });
    console.log(
      `  ✗ ${path.relative(process.cwd(), filePath)} - ${err.message}`,
    );
  }
}

function escapeRegex(string) {
  return string.replace(/[.*+?^${}()|[\]\\]/g, "\\$&");
}

function scanDirectory(dir) {
  const items = fs.readdirSync(dir);

  for (const item of items) {
    const fullPath = path.join(dir, item);
    const stat = fs.statSync(fullPath);

    if (stat.isDirectory()) {
      // Skip excluded directories
      if (!ExcludeDirs.includes(item)) {
        scanDirectory(fullPath);
      }
    } else if (stat.isFile() && shouldProcessFile(fullPath)) {
      stats.filesScanned++;
      processFile(fullPath);
    }
  }
}

// ═══════════════════════════════════════════════════════════════
// 🎯 MAIN EXECUTION
// ═══════════════════════════════════════════════════════════════

console.log("═══════════════════════════════════════════════════════════════");
console.log(`  🔄 Domain Updater: ${OldDomain} → ${NewDomain}`);
console.log("═══════════════════════════════════════════════════════════════");
console.log("");

const startTime = Date.now();

console.log("🔍 Scanning...");
scanDirectory(process.cwd());

const duration = ((Date.now() - startTime) / 1000).toFixed(1);

console.log("");
console.log("═══════════════════════════════════════════════════════════════");
console.log("  ✅ UPDATE COMPLETE");
console.log("═══════════════════════════════════════════════════════════════");
console.log(`  Files scanned:    ${stats.filesScanned}`);
console.log(`  Files modified:   ${stats.filesModified}`);
console.log(`  Replacements:     ${stats.replacementsMade}`);
console.log(`  Errors:           ${stats.errors.length}`);
console.log(`  Duration:         ${duration}s`);
console.log("");

if (stats.errors.length > 0) {
  console.log("  ⚠️  Errors encountered:");
  for (const err of stats.errors) {
    console.log(`     • ${err.file}: ${err.error}`);
  }
  console.log("");
}

console.log(`  🎯 Domain updated from '${OldDomain}' to '${NewDomain}'`);
console.log("");
console.log("  💡 Next steps:");
console.log(
  "     1. Clear Next.js cache: Remove-Item -Recurse -Force .\\apps\\ui\\.next",
);
console.log("     2. Regenerate llms.txt if needed");
console.log("     3. Restart dev server");
console.log("");
