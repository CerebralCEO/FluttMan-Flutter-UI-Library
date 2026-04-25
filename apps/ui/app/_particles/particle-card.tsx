import { useCopyToClipboard } from "@flutman/ui/hooks/use-copy-to-clipboard";
import { Icons } from "@flutman/ui/shared/icons";
import { InformationCircleIcon } from "@hugeicons/core-free-icons";
import { HugeiconsIcon } from "@hugeicons/react";
import { SparklesIcon } from "lucide-react";
import { cache } from "react";
import { Index } from "@/registry/__index__";
import { Button } from "@/registry/default/ui/button";
import {
  Drawer,
  DrawerContent,
  DrawerPopup,
  DrawerTrigger,
} from "@/registry/default/ui/drawer";
import { CopyAgentPrompt } from "./copy-agent-prompt";
import { ParticleCardContainer } from "./particle-card-container";
import { CodeBlockCommand } from "@/components/code-block-command";
import { ComponentSource } from "@/components/component-source";
import { CopyRegistry } from "@/components/copy-registry";
import { getRegistryItem } from "@/lib/registry";

const getCachedRegistryItem = cache(async (name: string) => {
  return await getRegistryItem(name);
});

function ParticleRenderer({ name }: { name: string }) {
  const item = Index[name];
  const Component = item?.component;

  if (!Component) {
    return (
      <p className="text-muted-foreground text-sm">
        Component {name} not found
      </p>
    );
  }

  return <Component currentPage={1} totalPages={10} totalResults={100} />;
}

export async function ParticleCard({
  name,
  className,
  colSpan,
}: {
  name: string;
  className?: string;
  colSpan?: number;
}) {
  const flutmanUrl =
    process.env.NEXT_PUBLIC_APP_URL || "https://flutman.vercel.app";

  const particle = await getCachedRegistryItem(name);

  if (!particle) {
    return null;
  }

  return (
    <ParticleCardContainer
      className={className}
      colSpan={colSpan}
      footer={
        <>
          <p className="flex flex-1 gap-1 truncate text-muted-foreground text-xs">
            <HugeiconsIcon
              className="size-3 h-lh shrink-0"
              icon={InformationCircleIcon}
              strokeWidth={2}
            />
            <span className="truncate">{particle.description}</span>
          </p>
          <div className="flex items-center gap-1.5">
            {process.env.NODE_ENV === "development" && (
              <Button
                className="text-xs"
                disabled
                size="sm"
                title="Particle name"
                variant="outline"
              >
                {particle.name}
              </Button>
            )}
            <CopyRegistry
              value={`${flutmanUrl}/r/${name}.json`}
              variant="outline"
            />
            <CopyAgentPrompt name={name} variant="outline" />
            <Drawer position="right">
              <DrawerTrigger
                render={
                  <Button className="text-sm" size="sm" variant="outline" />
                }
              >
                View code
              </DrawerTrigger>
              <DrawerPopup
                className="max-w-4xl"
                showBar
                showCloseButton={false}
                variant="straight"
              >
                <DrawerContent className="flex flex-1 flex-col overflow-hidden p-6">
                  <div>
                    <h2 className="mb-4 font-heading font-semibold text-xl">
                      Installation
                    </h2>
                    <figure data-rehype-pretty-code-figure>
                      <CodeBlockCommand
                        __bun__={`flutman add ${name}`}
                        __npm__={`flutman add ${name}`}
                        __pnpm__={`flutman add ${name}`}
                        __yarn__={`flutman add ${name}`}
                      />
                    </figure>
                  </div>
                  <div className="flex h-full flex-1 flex-col overflow-hidden">
                    <div className="flex items-center justify-between gap-2">
                      <h2 className="mt-6 mb-4 font-heading font-semibold text-xl">
                        Code
                      </h2>
                      <Button
                        render={
                          <a
                            href={`https://v0.dev/chat/api/open?url=${encodeURIComponent(`${flutmanUrl}/r/${name}.json`)}`}
                            rel="noopener noreferrer"
                            target="_blank"
                          >
                            Open in<span className="sr-only">v0</span>
                            <Icons.v0 className="size-5" />
                          </a>
                        }
                        variant="outline"
                      />
                    </div>
                    <ComponentSource
                      className="flex min-h-0 flex-1 flex-col *:data-rehype-pretty-code-figure:mt-0"
                      collapsible={false}
                      name={name}
                    />
                  </div>
                </DrawerContent>
              </DrawerPopup>
            </Drawer>
          </div>
        </>
      }
    >
      <div data-particle data-slot="preview">
        <ParticleRenderer name={name} />
      </div>
    </ParticleCardContainer>
  );
}
