"use client";

import { CheckIcon, SparklesIcon } from "lucide-react";
import type * as React from "react";
import { useState } from "react";
import { Button } from "@/registry/default/ui/button";
import {
  Tooltip,
  TooltipPopup,
  TooltipTrigger,
} from "@/registry/default/ui/tooltip";
import { cn } from "@/lib/utils";

export function CopyAgentPrompt({
  componentName,
  className,
  ...props
}: React.ComponentProps<typeof Button> & {
  componentName: string;
}) {
  const [isCopied, setIsCopied] = useState(false);

  const agentPrompt = `You are a Flutter expert. Open the terminal in the root of this project and execute the command: \`flutman add ${componentName}\`. Once the component is downloaded into lib/ui/components/, review the Dart code and implement it in the current screen appropriately.`;

  const handleCopy = async () => {
    try {
      await navigator.clipboard.writeText(agentPrompt);
      setIsCopied(true);
      setTimeout(() => setIsCopied(false), 2000);
    } catch {
      // Silently fail if clipboard is not available
    }
  };

  return (
    <Tooltip>
      <TooltipTrigger
        render={
          <Button
            className={cn(
              "gap-1.5 bg-black text-white text-xs hover:bg-black/90 dark:bg-white dark:text-black dark:hover:bg-white/90",
              className,
            )}
            data-slot="copy-agent-prompt-button"
            onClick={handleCopy}
            size="sm"
            variant="default"
            {...props}
          >
            {isCopied ? (
              <CheckIcon className="size-3.5" />
            ) : (
              <SparklesIcon className="size-3.5" />
            )}
            <span>{isCopied ? "Copied!" : "Copy Prompt"}</span>
          </Button>
        }
      />
      <TooltipPopup>{isCopied ? "Copied!" : "Copy Prompt"}</TooltipPopup>
    </Tooltip>
  );
}
