import type { HealthSummary } from "@/types/api";
import { AlertCircle, Activity, Flame } from "lucide-react";

interface HealthStatsProps {
  data: HealthSummary;
}

const stats = [
  {
    key: "unresolved_count" as const,
    label: "Unresolved Issues",
    icon: AlertCircle,
    format: (v: number) => v.toLocaleString(),
    showDot: (v: number) => v > 0,
  },
  {
    key: "events_24h" as const,
    label: "Events (24h)",
    icon: Activity,
    format: (v: number) => v.toLocaleString(),
    showDot: () => false,
  },
  {
    key: "new_today" as const,
    label: "New Today",
    icon: Flame,
    format: (v: number) => v.toLocaleString(),
    showDot: () => false,
  },
] satisfies Array<{
  key: keyof HealthSummary;
  label: string;
  icon: React.ComponentType<{ className?: string }>;
  format: (v: number) => string;
  showDot: (v: number) => boolean;
}>;

export function HealthStats({ data }: HealthStatsProps) {
  return (
    <div className="grid grid-cols-3 gap-px bg-border rounded-xl overflow-hidden">
      {stats.map((stat) => {
        const value = data[stat.key];
        return (
          <div
            key={stat.key}
            className="bg-background p-6 group hover:bg-card transition-colors"
          >
            <div className="flex items-center gap-2 mb-3">
              <div className="flex h-8 w-8 items-center justify-center rounded-lg bg-muted group-hover:bg-accent/10 transition-colors">
                <stat.icon className="h-4 w-4 text-accent" />
              </div>
            </div>
            <div className="flex items-center gap-2">
              {stat.showDot(value) && (
                <span className="inline-block h-2 w-2 rounded-full bg-destructive animate-pulse" />
              )}
              <span className="text-2xl font-bold tabular-nums text-foreground">
                {stat.format(value)}
              </span>
            </div>
            <span className="text-xs text-muted-foreground mt-1 block">
              {stat.label}
            </span>
          </div>
        );
      })}
    </div>
  );
}
