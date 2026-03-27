import type { Alert } from "@/types/api";
import { Badge } from "@/components/ui/badge";
import { Button } from "@/components/ui/button";
import { formatRelativeTime } from "@/lib/format";
import {
  Table,
  TableBody,
  TableCell,
  TableHead,
  TableHeader,
  TableRow,
} from "@/components/ui/table";
import { CheckCircle, Eye, AlertCircle } from "lucide-react";

interface AlertListProps {
  alerts: Alert[];
  onAcknowledge: (id: string) => void;
  onResolve: (id: string) => void;
}

function statusBadge(status: string) {
  switch (status) {
    case "active":
      return (
        <Badge
          variant="outline"
          className="gap-1 rounded-sm border-destructive/30 bg-destructive/10 text-destructive font-mono text-[10px]"
        >
          <AlertCircle className="size-2.5" />
          Active
        </Badge>
      );
    case "acknowledged":
      return (
        <Badge
          variant="outline"
          className="gap-1 rounded-sm border-chart-4/30 bg-chart-4/10 text-chart-4 font-mono text-[10px]"
        >
          <Eye className="size-2.5" />
          Acknowledged
        </Badge>
      );
    case "resolved":
      return (
        <Badge
          variant="outline"
          className="gap-1 rounded-sm border-accent/30 bg-accent/10 text-accent font-mono text-[10px]"
        >
          <CheckCircle className="size-2.5" />
          Resolved
        </Badge>
      );
    default:
      return (
        <Badge variant="outline" className="rounded-sm font-mono text-[10px]">
          {status}
        </Badge>
      );
  }
}

export function AlertList({ alerts, onAcknowledge, onResolve }: AlertListProps) {
  if (alerts.length === 0) {
    return (
      <div className="flex flex-col items-center justify-center py-16 text-muted-foreground">
        <div className="flex h-16 w-16 items-center justify-center rounded-2xl bg-muted mb-4">
          <AlertCircle className="size-7 text-muted-foreground/40" />
        </div>
        <p className="text-sm">No alerts fired</p>
      </div>
    );
  }

  return (
    <div className="rounded-xl border border-border bg-background overflow-hidden">
      <Table>
        <TableHeader>
          <TableRow className="hover:bg-transparent border-b border-border">
            <TableHead className="text-[10px] font-mono uppercase tracking-wider">Rule Name</TableHead>
            <TableHead className="text-[10px] font-mono uppercase tracking-wider">Status</TableHead>
            <TableHead className="text-[10px] font-mono uppercase tracking-wider max-w-[300px]">Message</TableHead>
            <TableHead className="text-[10px] font-mono uppercase tracking-wider">Triggered</TableHead>
            <TableHead className="text-[10px] font-mono uppercase tracking-wider text-right">Actions</TableHead>
          </TableRow>
        </TableHeader>
        <TableBody>
          {alerts.map((alert) => (
            <TableRow key={alert.id} className="border-b border-border/50 hover:bg-card transition-colors">
              <TableCell className="font-medium text-sm">{alert.rule_name}</TableCell>
              <TableCell>{statusBadge(alert.status)}</TableCell>
              <TableCell className="max-w-[300px] truncate text-sm text-muted-foreground" title={alert.message}>
                {alert.message}
              </TableCell>
              <TableCell className="font-mono text-xs text-muted-foreground">
                {formatRelativeTime(alert.triggered_at)}
              </TableCell>
              <TableCell className="text-right">
                <div className="flex justify-end gap-1">
                  {alert.status === "active" && (
                    <Button
                      variant="outline"
                      size="xs"
                      className="font-mono text-[10px]"
                      onClick={() => onAcknowledge(alert.id)}
                    >
                      Acknowledge
                    </Button>
                  )}
                  {(alert.status === "active" ||
                    alert.status === "acknowledged") && (
                    <Button
                      variant="outline"
                      size="xs"
                      className="font-mono text-[10px]"
                      onClick={() => onResolve(alert.id)}
                    >
                      Resolve
                    </Button>
                  )}
                </div>
              </TableCell>
            </TableRow>
          ))}
        </TableBody>
      </Table>
    </div>
  );
}
