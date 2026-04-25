import { createMDX } from "fumadocs-mdx/next";
import type { NextConfig } from "next";

const withMDX = createMDX();

const nextConfig: NextConfig = {
  async redirects() {
    return [
      {
        destination: "/docs/radix-migration",
        permanent: true,
        source: "/docs/radix-shadcn-migration",
      },
    ];
  },
  async rewrites() {
    return [
      {
        destination: "/api/raw/docs/:path*",
        source: "/docs/:path*.md",
      },
    ];
  },
  transpilePackages: ["@flutman/ui"],
};

export default withMDX(nextConfig);
