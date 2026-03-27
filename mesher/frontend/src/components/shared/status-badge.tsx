import { Badge } from "@/components/ui/badge";
import { cn } from "@/lib/utils";

type StatusVariant =
  | "error"
  | "warning"
  | "info"
  | "debug"
  | "resolved"
  | "archived"
  | "unresolved";

interface StatusBadgeProps {
  variant: StatusVariant;
  className?: string;
  children?: React.ReactNode;
}

const variantStyles: Record<StatusVariant, string> = {
  error:
    "border-destructive/30 bg-destructive/10 text-destructive",
  warning:
    "border-chart-4/30 bg-chart-4/10 text-chart-4",
  info: "border-chart-2/30 bg-chart-2/10 text-chart-2",
  debug: "border-border bg-muted text-muted-foreground",
  resolved: "border-accent/30 bg-accent/10 text-accent",
  archived: "border-border bg-muted text-muted-foreground",
  unresolved: "border-destructive/30 bg-destructive/10 text-destructive",
};

const variantLabels: Record<StatusVariant, string> = {
  error: "Error",
  warning: "Warning",
  info: "Info",
  debug: "Debug",
  resolved: "Resolved",
  archived: "Archived",
  unresolved: "Unresolved",
};

export function StatusBadge({ variant, className, children }: StatusBadgeProps) {
  return (
    <Badge
      variant="outline"
      className={cn(
        "rounded-sm px-1.5 py-0 text-[10px] font-mono font-medium leading-5",
        variantStyles[variant],
        className
      )}
    >
      {children ?? variantLabels[variant]}
    </Badge>
  );
}
