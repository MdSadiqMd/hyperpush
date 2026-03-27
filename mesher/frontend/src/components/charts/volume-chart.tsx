import type { VolumePoint } from "@/types/api";
import {
  Area,
  AreaChart,
  CartesianGrid,
  ResponsiveContainer,
  Tooltip,
  XAxis,
  YAxis,
} from "recharts";

interface VolumeChartProps {
  data: VolumePoint[];
  bucket: "hour" | "day";
}

function formatBucketLabel(bucket: string, mode: "hour" | "day"): string {
  const date = new Date(bucket);
  if (isNaN(date.getTime())) return bucket;
  if (mode === "hour") {
    return date.toLocaleTimeString([], { hour: "2-digit", minute: "2-digit" });
  }
  return date.toLocaleDateString([], { month: "short", day: "numeric" });
}

function CustomTooltip({
  active,
  payload,
  label,
  bucket,
}: {
  active?: boolean;
  payload?: Array<{ value: number }>;
  label?: string;
  bucket: "hour" | "day";
}) {
  if (!active || !payload?.length) return null;
  return (
    <div className="rounded-lg border border-border bg-card/95 backdrop-blur-sm px-3 py-2 shadow-lg">
      <p className="text-[10px] font-mono text-muted-foreground">
        {formatBucketLabel(label ?? "", bucket)}
      </p>
      <p className="text-sm font-semibold tabular-nums text-foreground">
        {payload[0].value.toLocaleString()} events
      </p>
    </div>
  );
}

export function VolumeChart({ data, bucket }: VolumeChartProps) {
  return (
    <ResponsiveContainer width="100%" height={240}>
      <AreaChart data={data} margin={{ top: 4, right: 4, bottom: 0, left: 0 }}>
        <defs>
          <linearGradient id="volumeFill" x1="0" y1="0" x2="0" y2="1">
            <stop offset="0%" stopColor="oklch(0.75 0.18 160)" stopOpacity={0.3} />
            <stop offset="100%" stopColor="oklch(0.75 0.18 160)" stopOpacity={0.02} />
          </linearGradient>
        </defs>
        <CartesianGrid
          stroke="var(--color-border)"
          strokeDasharray="3 3"
          vertical={false}
        />
        <XAxis
          dataKey="bucket"
          axisLine={false}
          tickLine={false}
          tick={{ fill: "var(--color-muted-foreground)", fontSize: 11, fontFamily: "var(--font-mono)" }}
          tickFormatter={(v: string) => formatBucketLabel(v, bucket)}
        />
        <YAxis
          axisLine={false}
          tickLine={false}
          tick={{ fill: "var(--color-muted-foreground)", fontSize: 11, fontFamily: "var(--font-mono)" }}
          width={40}
        />
        <Tooltip
          content={<CustomTooltip bucket={bucket} />}
          cursor={{ stroke: "var(--color-border)" }}
        />
        <Area
          type="monotone"
          dataKey="count"
          stroke="oklch(0.75 0.18 160)"
          strokeWidth={1.5}
          fill="url(#volumeFill)"
        />
      </AreaChart>
    </ResponsiveContainer>
  );
}
