import fs from "node:fs/promises";
import path from "node:path";
import { Index } from "@/registry/__index__";
import { ComponentPreviewTabs } from "@/components/component-preview-tabs";
import { ComponentSource } from "@/components/component-source";
import { cn } from "@/lib/utils";

interface ComponentPreviewProps
  extends Omit<React.ComponentProps<"div">, "ref"> {
  name: string;
  align?: "center" | "start" | "end";
  description?: string;
  hideCode?: boolean;
}

// Extract base component name from particle names (e.g., p-button-1 -> button)
function getBaseComponentName(particleName: string): string {
  // Match pattern: p-{component}-{number} or p-{component}
  const match = particleName.match(/^p-(.+?)(?:-\d+)?$/);
  return match?.[1] ?? particleName;
}

export async function ComponentPreview({
  name,
  className,
  align = "center",
  hideCode = false,
  ...props
}: ComponentPreviewProps) {
  const Component = Index[name]?.component;
  const metaClassName = Index[name]?.meta?.className;

  if (!Component) {
    return (
      <p className="text-muted-foreground text-sm">
        Component{" "}
        <code className="relative rounded bg-muted px-[0.3rem] py-[0.2rem] font-mono text-[.8125rem]">
          {name}
        </code>{" "}
        not found in registry.
      </p>
    );
  }

  // Try to read Dart code from registry/flutter/
  const baseName = getBaseComponentName(name);
  const dartFilePath = path.join(
    process.cwd(),
    "registry",
    "flutter",
    baseName,
    `${baseName}.dart`,
  );

  let dartCode: string | undefined;
  let useDart = false;

  try {
    dartCode = await fs.readFile(dartFilePath, "utf-8");
    useDart = true;
  } catch {
    // Dart file doesn't exist, will fall back to React code
  }

  return (
    <ComponentPreviewTabs
      align={align}
      className={cn(metaClassName, className)}
      component={<Component />}
      hideCode={hideCode}
      name={name}
      source={
        useDart ? (
          <ComponentSource
            collapsible={false}
            language="dart"
            name={baseName}
            src={undefined}
            title={`${baseName}.dart`}
          />
        ) : (
          <ComponentSource collapsible={false} name={name} />
        )
      }
      {...props}
    />
  );
}
