import { promises as fs } from "fs";
import { type NextRequest, NextResponse } from "next/server";
import path from "path";

export async function GET(
  request: NextRequest,
  { params }: { params: Promise<{ name: string }> },
) {
  try {
    const resolvedParams = await params;
    const name = resolvedParams.name;

    // Resolve path to registry/flutter from the app directory
    // process.cwd() in Next.js app dir points to apps/ui
    const registryPath = path.join(
      process.cwd(),
      "../../registry/flutter",
      name,
    );

    console.log("Attempting to read from:", registryPath);

    // Check if directory exists
    try {
      await fs.access(registryPath);
    } catch {
      return NextResponse.json(
        { error: `Component '${name}' not found` },
        { status: 404 },
      );
    }

    // Read the .dart file
    const dartFilePath = path.join(registryPath, `${name}.dart`);
    let code: string;
    try {
      code = await fs.readFile(dartFilePath, "utf-8");
    } catch {
      return NextResponse.json(
        { error: `Dart file for '${name}' not found` },
        { status: 404 },
      );
    }

    // Read the .mdx file for metadata
    const mdxFilePath = path.join(registryPath, `${name}.mdx`);
    let dependencies: string[] = [];

    try {
      const mdxContent = await fs.readFile(mdxFilePath, "utf-8");
      // Parse frontmatter for dependencies
      const frontmatterMatch = mdxContent.match(/---\n([\s\S]*?)\n---/);
      if (frontmatterMatch) {
        const frontmatter = frontmatterMatch[1];
        const depsMatch = frontmatter.match(/dependencies:\s*\[(.*?)\]/);
        if (depsMatch) {
          dependencies = depsMatch[1]
            .split(",")
            .map((d) => d.trim().replace(/['"]/g, ""))
            .filter((d) => d.length > 0);
        }
      }
    } catch {
      // MDX file not found or parse error, use empty dependencies
      dependencies = [];
    }

    // Return the response
    return NextResponse.json({
      name,
      code,
      dependencies,
    });
  } catch (error) {
    console.error("API Error:", error);
    return NextResponse.json({ error: String(error) }, { status: 500 });
  }
}
