import { Button } from "@flutman/ui/components/button";
import Link from "next/link";

export function SiteCta() {
  return (
    <section>
      <div className="container flex w-full items-center justify-center gap-2 px-4 sm:px-6">
        <Button
          render={
            // biome-ignore lint(a11y/useAnchorContent): knwon
            <a
              href="https://zerofounder.com/waitlist"
              rel="noreferrer"
              target="_blank"
            />
          }
        >
          Join the waitlist
        </Button>
        <Button
          render={<Link href="https://zerofounder.com/jobs" />}
          variant="outline"
        >
          Join the company
        </Button>
      </div>
    </section>
  );
}
