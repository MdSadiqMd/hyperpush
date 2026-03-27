import { useCallback, useEffect, useState } from "react";
import { api } from "@/lib/api";
import type { ProjectStorage } from "@/types/api";
import { Button } from "@/components/ui/button";
import { Skeleton } from "@/components/ui/skeleton";
import { Database, RefreshCw } from "lucide-react";
import { toast } from "sonner";

interface StorageInfoProps {
  projectId: string;
}

function formatBytes(bytes: number): string {
  if (bytes === 0) return "0 B";
  const units = ["B", "KB", "MB", "GB", "TB"];
  const k = 1024;
  const i = Math.floor(Math.log(bytes) / Math.log(k));
  const value = bytes / Math.pow(k, i);
  return `${value.toFixed(i > 0 ? 2 : 0)} ${units[i]}`;
}

function formatNumber(n: number): string {
  return n.toLocaleString();
}

export function StorageInfo({ projectId }: StorageInfoProps) {
  const [storage, setStorage] = useState<ProjectStorage | null>(null);
  const [loading, setLoading] = useState(true);
  const [refreshing, setRefreshing] = useState(false);

  const fetchStorage = useCallback(async () => {
    try {
      const data = await api.settings.storage(projectId);
      setStorage(data);
    } catch (err) {
      toast.error("Failed to load storage info", {
        description: err instanceof Error ? err.message : "Unknown error",
      });
    } finally {
      setLoading(false);
      setRefreshing(false);
    }
  }, [projectId]);

  useEffect(() => {
    fetchStorage();
  }, [fetchStorage]);

  function handleRefresh() {
    setRefreshing(true);
    fetchStorage();
  }

  if (loading) {
    return (
      <div className="grid grid-cols-2 gap-px bg-border rounded-xl overflow-hidden max-w-lg">
        <div className="bg-background p-6">
          <Skeleton className="h-8 w-8 rounded-lg mb-3" />
          <Skeleton className="h-8 w-24 mb-1" />
          <Skeleton className="h-3 w-28" />
        </div>
        <div className="bg-background p-6">
          <Skeleton className="h-8 w-8 rounded-lg mb-3" />
          <Skeleton className="h-8 w-24 mb-1" />
          <Skeleton className="h-3 w-28" />
        </div>
      </div>
    );
  }

  return (
    <div className="space-y-4">
      <div className="flex justify-end">
        <Button
          variant="outline"
          size="sm"
          className="gap-1.5 font-mono text-xs"
          onClick={handleRefresh}
          disabled={refreshing}
        >
          <RefreshCw
            className={`size-3.5 ${refreshing ? "animate-spin" : ""}`}
          />
          Refresh
        </Button>
      </div>

      {storage ? (
        <div className="grid grid-cols-2 gap-px bg-border rounded-xl overflow-hidden max-w-lg">
          <div className="bg-background p-6 group hover:bg-card transition-colors">
            <div className="flex h-8 w-8 items-center justify-center rounded-lg bg-muted group-hover:bg-accent/10 transition-colors mb-3">
              <Database className="h-4 w-4 text-accent" />
            </div>
            <p className="text-2xl font-bold tabular-nums">
              {formatNumber(storage.event_count)}
            </p>
            <p className="text-xs text-muted-foreground mt-1">
              Total stored events
            </p>
          </div>

          <div className="bg-background p-6 group hover:bg-card transition-colors">
            <div className="flex h-8 w-8 items-center justify-center rounded-lg bg-muted group-hover:bg-accent/10 transition-colors mb-3">
              <Database className="h-4 w-4 text-accent" />
            </div>
            <p className="text-2xl font-bold tabular-nums">
              {formatBytes(storage.estimated_bytes)}
            </p>
            <p className="text-xs text-muted-foreground mt-1">
              Approximate disk usage
            </p>
          </div>
        </div>
      ) : (
        <div className="flex flex-col items-center justify-center py-16 text-muted-foreground">
          <div className="flex h-16 w-16 items-center justify-center rounded-2xl bg-muted mb-4">
            <Database className="size-7 text-muted-foreground/40" />
          </div>
          <p className="text-sm">Unable to load storage info</p>
        </div>
      )}
    </div>
  );
}
