import { useCallback, useEffect, useState } from "react";
import { api } from "@/lib/api";
import { formatRelativeTime } from "@/lib/format";
import { useProjectStore } from "@/stores/project-store";
import { useWsStore } from "@/stores/ws-store";
import type { Alert, AlertRule } from "@/types/api";
import {
  AlertRuleForm,
  type CreateRulePayload,
} from "@/components/alerts/alert-rule-form";
import { AlertList } from "@/components/alerts/alert-list";
import { Tabs, TabsContent, TabsList, TabsTrigger } from "@/components/ui/tabs";
import { Badge } from "@/components/ui/badge";
import { Button } from "@/components/ui/button";
import { Switch } from "@/components/ui/switch";
import {
  Dialog,
  DialogContent,
  DialogDescription,
  DialogHeader,
  DialogTitle,
  DialogTrigger,
} from "@/components/ui/dialog";
import {
  AlertDialog,
  AlertDialogAction,
  AlertDialogCancel,
  AlertDialogContent,
  AlertDialogDescription,
  AlertDialogFooter,
  AlertDialogHeader,
  AlertDialogTitle,
  AlertDialogTrigger,
} from "@/components/ui/alert-dialog";
import {
  Select,
  SelectContent,
  SelectItem,
  SelectTrigger,
  SelectValue,
} from "@/components/ui/select";
import { Skeleton } from "@/components/ui/skeleton";
import { Plus, Trash2, Bell, AlertCircle } from "lucide-react";
import { toast } from "sonner";

function conditionDescription(rule: AlertRule): string {
  const { condition } = rule;
  switch (condition.condition_type) {
    case "threshold":
      return `${condition.threshold} events in ${condition.window_minutes}min`;
    case "new_issue":
      return "When a new issue is created";
    case "regression":
      return "When a resolved issue regresses";
    default:
      return condition.condition_type;
  }
}

function formatNullableTime(dateStr: string | null): string {
  if (!dateStr) return "Never";
  return formatRelativeTime(dateStr);
}

export default function AlertsPage() {
  const activeProjectId = useProjectStore((s) => s.activeProjectId);

  const [rules, setRules] = useState<AlertRule[]>([]);
  const [rulesLoading, setRulesLoading] = useState(true);
  const [createDialogOpen, setCreateDialogOpen] = useState(false);
  const [isCreating, setIsCreating] = useState(false);

  const [alerts, setAlerts] = useState<Alert[]>([]);
  const [alertsLoading, setAlertsLoading] = useState(true);
  const [statusFilter, setStatusFilter] = useState<string>("all");

  const lastEvent = useWsStore((s) => s.lastEvent);

  const fetchRules = useCallback(async () => {
    if (!activeProjectId) return;
    try {
      const data = await api.alerts.rules(activeProjectId);
      setRules(data);
    } catch (err) {
      toast.error("Failed to load alert rules", {
        description: err instanceof Error ? err.message : "Unknown error",
      });
    } finally {
      setRulesLoading(false);
    }
  }, [activeProjectId]);

  const fetchAlerts = useCallback(async () => {
    if (!activeProjectId) return;
    try {
      const status = statusFilter === "all" ? undefined : statusFilter;
      const data = await api.alerts.list(activeProjectId, status);
      setAlerts(data);
    } catch (err) {
      toast.error("Failed to load alerts", {
        description: err instanceof Error ? err.message : "Unknown error",
      });
    } finally {
      setAlertsLoading(false);
    }
  }, [activeProjectId, statusFilter]);

  useEffect(() => {
    fetchRules();
  }, [fetchRules]);

  useEffect(() => {
    fetchAlerts();
  }, [fetchAlerts]);

  useEffect(() => {
    if (lastEvent?.type === "alert") {
      toast.warning("Alert Fired", {
        description: `${lastEvent.rule_name}: ${lastEvent.message}`,
        duration: 8000,
      });
      fetchAlerts();
    }
  }, [lastEvent, fetchAlerts]);

  async function handleCreateRule(payload: CreateRulePayload) {
    if (!activeProjectId) return;
    setIsCreating(true);
    try {
      await api.alerts.createRule(activeProjectId, payload as Parameters<typeof api.alerts.createRule>[1]);
      toast.success("Alert rule created");
      setCreateDialogOpen(false);
      fetchRules();
    } catch (err) {
      toast.error("Failed to create rule", {
        description: err instanceof Error ? err.message : "Unknown error",
      });
    } finally {
      setIsCreating(false);
    }
  }

  async function handleToggleRule(ruleId: string, currentEnabled: boolean) {
    try {
      await api.alerts.toggleRule(ruleId, !currentEnabled);
      toast.success(currentEnabled ? "Rule disabled" : "Rule enabled");
      fetchRules();
    } catch (err) {
      toast.error("Failed to toggle rule", {
        description: err instanceof Error ? err.message : "Unknown error",
      });
    }
  }

  async function handleDeleteRule(ruleId: string) {
    try {
      await api.alerts.deleteRule(ruleId);
      toast.success("Rule deleted");
      fetchRules();
    } catch (err) {
      toast.error("Failed to delete rule", {
        description: err instanceof Error ? err.message : "Unknown error",
      });
    }
  }

  async function handleAcknowledge(alertId: string) {
    try {
      await api.alerts.acknowledge(alertId);
      toast.success("Alert acknowledged");
      fetchAlerts();
    } catch (err) {
      toast.error("Failed to acknowledge alert", {
        description: err instanceof Error ? err.message : "Unknown error",
      });
    }
  }

  async function handleResolve(alertId: string) {
    try {
      await api.alerts.resolve(alertId);
      toast.success("Alert resolved");
      fetchAlerts();
    } catch (err) {
      toast.error("Failed to resolve alert", {
        description: err instanceof Error ? err.message : "Unknown error",
      });
    }
  }

  const activeAlertCount = alerts.filter((a) => a.status === "active").length;

  return (
    <div className="p-6 space-y-6">
      <div>
        <p className="text-[10px] font-mono text-accent uppercase tracking-wider mb-1">
          Monitoring
        </p>
        <h2 className="text-2xl font-bold tracking-tight">Alerts</h2>
        <p className="text-sm text-muted-foreground mt-1">
          Manage alert rules and view fired alerts
        </p>
      </div>

      <Tabs defaultValue="rules">
        <TabsList className="bg-muted/50">
          <TabsTrigger value="rules" className="gap-1.5 font-mono text-xs">
            <Bell className="size-3.5" />
            Rules
          </TabsTrigger>
          <TabsTrigger value="fired" className="gap-1.5 font-mono text-xs">
            <AlertCircle className="size-3.5" />
            Fired Alerts
            {activeAlertCount > 0 && (
              <Badge
                variant="outline"
                className="ml-1 h-4 rounded-sm border-destructive/30 bg-destructive/10 px-1 text-[9px] font-mono text-destructive"
              >
                {activeAlertCount}
              </Badge>
            )}
          </TabsTrigger>
        </TabsList>

        {/* Rules tab */}
        <TabsContent value="rules" className="space-y-4">
          <div className="flex justify-end">
            <Dialog open={createDialogOpen} onOpenChange={setCreateDialogOpen}>
              <DialogTrigger asChild>
                <Button size="sm" className="gap-1.5 font-mono text-xs">
                  <Plus className="size-3.5" />
                  Create Rule
                </Button>
              </DialogTrigger>
              <DialogContent>
                <DialogHeader>
                  <DialogTitle>Create Alert Rule</DialogTitle>
                  <DialogDescription>
                    Configure conditions that trigger alert notifications.
                  </DialogDescription>
                </DialogHeader>
                <AlertRuleForm
                  projectId={activeProjectId ?? ""}
                  onSubmit={handleCreateRule}
                  onCancel={() => setCreateDialogOpen(false)}
                  isSubmitting={isCreating}
                />
              </DialogContent>
            </Dialog>
          </div>

          {rulesLoading ? (
            <div className="grid gap-px bg-border rounded-xl overflow-hidden">
              {Array.from({ length: 3 }).map((_, i) => (
                <div key={i} className="bg-background p-6">
                  <Skeleton className="h-5 w-48 mb-3" />
                  <Skeleton className="h-4 w-72" />
                </div>
              ))}
            </div>
          ) : rules.length === 0 ? (
            <div className="flex flex-col items-center justify-center py-16 text-muted-foreground">
              <div className="flex h-16 w-16 items-center justify-center rounded-2xl bg-muted mb-4">
                <Bell className="size-7 text-muted-foreground/40" />
              </div>
              <p className="text-sm">No alert rules configured</p>
              <p className="text-[10px] font-mono text-muted-foreground/50 mt-2">
                Create a rule to start monitoring events
              </p>
            </div>
          ) : (
            <div className="grid gap-px bg-border rounded-xl overflow-hidden">
              {rules.map((rule) => (
                <div key={rule.id} className="bg-background p-5 group hover:bg-card transition-colors">
                  <div className="flex items-center justify-between mb-3">
                    <div className="flex items-center gap-3">
                      <Switch
                        checked={rule.enabled}
                        onCheckedChange={() =>
                          handleToggleRule(rule.id, rule.enabled)
                        }
                      />
                      <span className="text-sm font-semibold">{rule.name}</span>
                      {!rule.enabled && (
                        <Badge
                          variant="outline"
                          className="h-4 rounded-sm border-border px-1.5 text-[9px] font-mono text-muted-foreground"
                        >
                          Disabled
                        </Badge>
                      )}
                    </div>
                    <AlertDialog>
                      <AlertDialogTrigger asChild>
                        <Button variant="ghost" size="icon" className="h-7 w-7 opacity-0 group-hover:opacity-100 transition-opacity">
                          <Trash2 className="size-3.5 text-muted-foreground" />
                        </Button>
                      </AlertDialogTrigger>
                      <AlertDialogContent>
                        <AlertDialogHeader>
                          <AlertDialogTitle>Delete Rule</AlertDialogTitle>
                          <AlertDialogDescription>
                            Are you sure you want to delete "{rule.name}"?
                            This cannot be undone.
                          </AlertDialogDescription>
                        </AlertDialogHeader>
                        <AlertDialogFooter>
                          <AlertDialogCancel>Cancel</AlertDialogCancel>
                          <AlertDialogAction
                            variant="destructive"
                            onClick={() => handleDeleteRule(rule.id)}
                          >
                            Delete
                          </AlertDialogAction>
                        </AlertDialogFooter>
                      </AlertDialogContent>
                    </AlertDialog>
                  </div>
                  <div className="flex items-center gap-4 text-[10px] font-mono text-muted-foreground">
                    <span>
                      Condition:{" "}
                      <span className="text-foreground">
                        {conditionDescription(rule)}
                      </span>
                    </span>
                    <span>
                      Cooldown:{" "}
                      <span className="text-foreground">
                        {rule.cooldown_minutes}min
                      </span>
                    </span>
                    <span>
                      Last fired:{" "}
                      <span className="text-foreground">
                        {formatNullableTime(rule.last_fired_at)}
                      </span>
                    </span>
                  </div>
                </div>
              ))}
            </div>
          )}
        </TabsContent>

        {/* Fired Alerts tab */}
        <TabsContent value="fired" className="space-y-4">
          <div className="flex items-center justify-between">
            <p className="text-[10px] font-mono text-muted-foreground tabular-nums">
              {alerts.length} alert{alerts.length !== 1 ? "s" : ""}
            </p>
            <Select value={statusFilter} onValueChange={setStatusFilter}>
              <SelectTrigger className="w-[160px] font-mono text-xs">
                <SelectValue placeholder="Filter by status" />
              </SelectTrigger>
              <SelectContent>
                <SelectItem value="all">All</SelectItem>
                <SelectItem value="active">Active</SelectItem>
                <SelectItem value="acknowledged">Acknowledged</SelectItem>
                <SelectItem value="resolved">Resolved</SelectItem>
              </SelectContent>
            </Select>
          </div>

          {alertsLoading ? (
            <div className="space-y-2">
              {Array.from({ length: 5 }).map((_, i) => (
                <Skeleton key={i} className="h-12 w-full rounded-lg" />
              ))}
            </div>
          ) : (
            <AlertList
              alerts={alerts}
              onAcknowledge={handleAcknowledge}
              onResolve={handleResolve}
            />
          )}
        </TabsContent>
      </Tabs>
    </div>
  );
}
