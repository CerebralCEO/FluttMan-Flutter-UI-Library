import { siteConfig } from "@flutman/ui/lib/config";
import { GitHubLink } from "@flutman/ui/shared/github-link";
import { ModeSwitcher } from "@flutman/ui/shared/mode-switcher";
import { ProductLabel } from "@flutman/ui/shared/product-label";
import { ProductsDropdown } from "@flutman/ui/shared/products-dropdown";
import Link from "next/link";

export function SiteHeader({
  mobileNav,
  children,
  currentProduct,
}: {
  mobileNav?: React.ReactNode;
  children?: React.ReactNode;
  currentProduct?: string;
}) {
  const gatewayOrigin = process.env.NEXT_PUBLIC_FLUTMAN_URL || "";
  const gatewayHome = gatewayOrigin ? `${gatewayOrigin}/` : "/";
  const isExternal = !!gatewayOrigin;

  return (
    <header className="sticky top-0 z-40 w-full bg-sidebar/80 backdrop-blur-sm before:absolute before:inset-x-0 before:bottom-0 before:h-px before:bg-border/64">
      <div className="container relative flex h-(--header-height) w-full items-center justify-between gap-2 px-4 sm:px-6">
        {mobileNav}
        <div className="-mt-0.5 flex shrink-0 items-center gap-1.5 font-heading text-2xl sm:text-[1.625em]">
          {isExternal ? (
            <a aria-label="Home" href={gatewayHome}>
              flutman.dev
            </a>
          ) : (
            <Link aria-label="Home" href={gatewayHome}>
              flutman.dev
            </Link>
          )}
          <ProductLabel
            currentProduct={currentProduct}
            items={siteConfig.products}
          />
        </div>
        <div className="ms-auto flex items-center gap-2 md:flex-1 md:justify-end">
          {children}
          <ProductsDropdown items={siteConfig.products} />
          <GitHubLink />
          <ModeSwitcher />
        </div>
      </div>
    </header>
  );
}
