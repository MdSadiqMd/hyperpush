import type { LevelBreakdown } from "@/types/api";
import {
  Bar,
  BarChart,
  Cell,
  ResponsiveContainer,
  Tooltip,
  XAxis,
  YAxis,
} from "recharts";

interface LevelChartProps {
  data: LevelBreakdown[];
}

function getLevelColor(level: string): string {
  switch (level.toLowerCase()) {
    case "error":
    case "fatal":
      return "oklch(0.55 0.22 25)";
    case "warning":
      return "oklch(0.7 0.16 80)";
    case "info":
      return "oklch(0.65 0.15 200)";
    case "debug":
      return "oklch(0.4 0 0)";
    default:
      return "oklch(0.4 0 0)";
  }
}

function CustomTooltip({
  active,
  payload,
}: {
  active?: boolean;
  payload?: Array<{ payload: LevelBreakdown }>;
}) {
  if (!active || !payload?.length) return null;
  const item = payload[0].payload;
  return (
    <div className="rounded-lg border border-border bg-card/95 backdrop-blur-sm px-3 py-2 shadow-lg">
      <p className="text-[10px] font-mono capitalize text-muted-foreground">
        {item.level}
      </p>
      <p className="text-sm font-semibold tabular-nums text-foreground">
        {item.count.toLocaleString()} events
      </p>
    </div>
  );
}

export function LevelChart({ data }: LevelChartProps) {
  return (
    <ResponsiveContainer width="100%" height={200}>
      <BarChart data={data} margin={{ top: 4, right: 4, bottom: 0, left: 0 }}>
        <XAxis
          dataKey="level"
          axisLine={false}
          tickLine={false}
          tick={{ fill: "var(--color-muted-foreground)", fontSize: 11, fontFamily: "var(--font-mono)" }}
        />
        <YAxis
          axisLine={false}
          tickLine={false}
          tick={{ fill: "var(--color-muted-foreground)", fontSize: 11, fontFamily: "var(--font-mono)" }}
          width={40}
        />
        <Tooltip
          content={<CustomTooltip />}
          cursor={{ fill: "var(--color-accent)", opacity: 0.08 }}
        />
        <Bar dataKey="count" radius={[4, 4, 0, 0]}>
          {data.map((entry) => (
            <Cell key={entry.level} fill={getLevelColor(entry.level)} />
          ))}
        </Bar>
      </BarChart>
    </ResponsiveContainer>
  );
}
