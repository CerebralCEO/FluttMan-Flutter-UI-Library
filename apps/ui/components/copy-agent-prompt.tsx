"use client";

import { useCopyToClipboard } from "@flutman/ui/hooks/use-copy-to-clipboard";
import { SparklesIcon } from "lucide-react";
import type * as React from "react";
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
  variant = "outline",
  ...props
}: React.ComponentProps<typeof Button> & {
  componentName: string;
}) {
  const { isCopied, copyToClipboard } = useCopyToClipboard();

  const agentPrompt = `You are a Flutter expert. Open the terminal in the root of this project and execute the command: \`flutman add ${componentName}\`. Once the component is downloaded into lib/ui/components/, review the Dart code and implement it in the current screen appropriately.`;

  return (
    <Tooltip>
      <TooltipTrigger
        render={
          <Button
            className={cn("gap-1.5 text-xs", className)}
            data-slot="copy-agent-prompt-button"
            onClick={() => copyToClipboard(agentPrompt)}
            size="sm"
            variant={variant}
            {...props}
          >
            <SparklesIcon className="size-3.5" />
            <span>Copy Agent Prompt</span>
          </Button>
        }
      />
      <TooltipPopup>{isCopied ? "Copied!" : "Copy Agent Prompt"}</TooltipPopup>
    </Tooltip>
  );
}
