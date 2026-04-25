import type { MetadataRoute } from "next";
import { source } from "@/lib/source";

export default function sitemap(): MetadataRoute.Sitemap {
  const pages = source.getPages();

  return [
    { url: "https://flutman.vercel.app" },
    { url: "https://flutman.vercel.app/particles" },
    ...pages.map((page) => ({
      url: `https://flutman.vercel.app${page.url}`,
    })),
  ];
}
