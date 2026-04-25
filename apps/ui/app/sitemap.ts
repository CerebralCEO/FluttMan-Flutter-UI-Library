import type { MetadataRoute } from "next";
import { source } from "@/lib/source";

export default function sitemap(): MetadataRoute.Sitemap {
  const pages = source.getPages();

  return [
    { url: "https://flutman" },
    { url: "https://flutman/particles" },
    ...pages.map((page) => ({
      url: `https://flutman${page.url}`,
    })),
  ];
}
