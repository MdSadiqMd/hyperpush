"use client"

import { useState } from "react"
import { motion } from "framer-motion"
import { CommunityLayout } from "@/components/community/community-layout"
import { Badge } from "@/components/ui/badge"
import { Button } from "@/components/ui/button"
import { Clock, ArrowUpRight, Coins, Target, Users, Filter } from "lucide-react"

type SeverityFilter = "all" | "critical" | "high" | "medium" | "low"
type StatusFilter = "open" | "in-progress" | "all"

const bounties = [
  {
    id: "MSH-1024",
    title: "Transaction signature verification failed on mainnet",
    description: "Users report failed transactions when interacting with the staking program. Error occurs during signature verification step after priority fee computation.",
    project: "solana-dex",
    severity: "critical" as const,
    bounty: 250,
    currency: "USDC",
    timeOpen: "2h 14m",
    claimants: 3,
    skills: ["Solana", "Rust", "Anchor"],
    status: "open" as const,
  },
  {
    id: "MSH-1023",
    title: "RPC connection timeout after priority fee spike",
    description: "RPC calls to getRecentPrioritizationFees time out under high network load. Fallback logic doesn't trigger correctly.",
    project: "defi-aggregator",
    severity: "high" as const,
    bounty: 150,
    currency: "USDC",
    timeOpen: "4h 32m",
    claimants: 5,
    skills: ["TypeScript", "Solana Web3.js"],
    status: "open" as const,
  },
  {
    id: "MSH-1022",
    title: "Priority fee calculation returns negative value",
    description: "Edge case where fee estimation returns negative when recent fees array is empty. Causes downstream panic in the transaction builder.",
    project: "nft-marketplace",
    severity: "medium" as const,
    bounty: 75,
    currency: "USDC",
    timeOpen: "8h 15m",
    claimants: 2,
    skills: ["Rust", "Solana"],
    status: "in-progress" as const,
  },
  {
    id: "MSH-1021",
    title: "Session replay missing mouse events on wallet connect",
    description: "Replay recordings drop mouse events when a wallet adapter modal opens. Likely caused by shadow DOM event boundary.",
    project: "trading-platform",
    severity: "low" as const,
    bounty: 25,
    currency: "USDC",
    timeOpen: "1d 3h",
    claimants: 1,
    skills: ["JavaScript", "DOM APIs"],
    status: "open" as const,
  },
  {
    id: "MSH-1019",
    title: "Websocket reconnection drops queued messages",
    description: "When the websocket connection drops and reconnects, any messages queued during the outage are silently discarded instead of being replayed.",
    project: "defi-aggregator",
    severity: "high" as const,
    bounty: 200,
    currency: "USDC",
    timeOpen: "12h 45m",
    claimants: 4,
    skills: ["TypeScript", "WebSocket"],
    status: "open" as const,
  },
  {
    id: "MSH-1018",
    title: "Token metadata fetch fails for compressed NFTs",
    description: "Attempting to read metadata for cNFTs via DAS API returns null. Standard NFTs work fine. Affects collection display in portfolio view.",
    project: "nft-marketplace",
    severity: "medium" as const,
    bounty: 100,
    currency: "USDC",
    timeOpen: "1d 8h",
    claimants: 2,
    skills: ["Solana", "Metaplex", "TypeScript"],
    status: "open" as const,
  },
  {
    id: "MSH-1016",
    title: "Rate limiter allows burst above configured threshold",
    description: "Token bucket implementation allows ~20% burst above the configured max when multiple workers process requests simultaneously.",
    project: "trading-platform",
    severity: "medium" as const,
    bounty: 120,
    currency: "USDC",
    timeOpen: "2d 1h",
    claimants: 0,
    skills: ["Mesh", "Concurrency"],
    status: "open" as const,
  },
  {
    id: "MSH-1014",
    title: "CSV export truncates transaction hashes",
    description: "Exported CSV files truncate Solana transaction signatures to 32 characters instead of the full 88-character base58 encoding.",
    project: "solana-dex",
    severity: "low" as const,
    bounty: 30,
    currency: "USDC",
    timeOpen: "3d 5h",
    claimants: 1,
    skills: ["TypeScript", "CSV"],
    status: "in-progress" as const,
  },
]

const severityColors: Record<string, string> = {
  critical: "bg-destructive/20 text-destructive border-destructive/30",
  high: "bg-chart-5/20 text-chart-5 border-chart-5/30",
  medium: "bg-chart-4/20 text-chart-4 border-chart-4/30",
  low: "bg-muted text-muted-foreground border-border",
}

const statusColors: Record<string, string> = {
  open: "bg-accent/20 text-accent border-accent/30",
  "in-progress": "bg-chart-4/20 text-chart-4 border-chart-4/30",
}

const summaryStats = [
  { label: "Open Bounties", value: "47", icon: Target },
  { label: "Total Value", value: "$12,850", icon: Coins },
  { label: "Active Hunters", value: "89", icon: Users },
]

export default function BountiesPage() {
  const [severity, setSeverity] = useState<SeverityFilter>("all")
  const [status, setStatus] = useState<StatusFilter>("open")

  const filtered = bounties.filter((b) => {
    if (severity !== "all" && b.severity !== severity) return false
    if (status !== "all" && b.status !== status) return false
    return true
  })

  return (
    <CommunityLayout
      title="Bounties"
      subtitle="Open issues with rewards attached. Pick a bug, submit a fix, get paid when it's verified."
    >
      {/* Stats row */}
      <div className="grid grid-cols-1 sm:grid-cols-3 gap-px bg-border rounded-xl overflow-hidden mb-10">
        {summaryStats.map((stat, index) => (
          <motion.div
            key={stat.label}
            initial={{ opacity: 0, y: 10 }}
            animate={{ opacity: 1, y: 0 }}
            transition={{ duration: 0.4, delay: index * 0.1 }}
            className="bg-card p-6"
          >
            <stat.icon className="w-4 h-4 text-accent mb-3" />
            <p className="text-2xl font-bold text-foreground mb-0.5">{stat.value}</p>
            <p className="text-sm text-muted-foreground">{stat.label}</p>
          </motion.div>
        ))}
      </div>

      {/* Filters */}
      <div className="flex flex-wrap items-center gap-4 mb-8">
        <div className="flex items-center gap-2">
          <Filter className="w-4 h-4 text-muted-foreground" />
          <span className="text-sm text-muted-foreground">Severity:</span>
          <div className="flex gap-1 p-1 bg-muted/50 rounded-lg">
            {(["all", "critical", "high", "medium", "low"] as const).map((s) => (
              <button
                key={s}
                onClick={() => setSeverity(s)}
                className={`px-3 py-1 text-xs rounded-md transition-colors capitalize ${
                  severity === s
                    ? "bg-background text-foreground font-medium shadow-sm"
                    : "text-muted-foreground hover:text-foreground"
                }`}
              >
                {s}
              </button>
            ))}
          </div>
        </div>
        <div className="flex items-center gap-2">
          <span className="text-sm text-muted-foreground">Status:</span>
          <div className="flex gap-1 p-1 bg-muted/50 rounded-lg">
            {(["open", "in-progress", "all"] as const).map((s) => (
              <button
                key={s}
                onClick={() => setStatus(s)}
                className={`px-3 py-1 text-xs rounded-md transition-colors capitalize ${
                  status === s
                    ? "bg-background text-foreground font-medium shadow-sm"
                    : "text-muted-foreground hover:text-foreground"
                }`}
              >
                {s === "in-progress" ? "In Progress" : s === "all" ? "All" : "Open"}
              </button>
            ))}
          </div>
        </div>
      </div>

      {/* Bounty cards */}
      <div className="space-y-4">
        {filtered.map((bounty, index) => (
          <motion.div
            key={bounty.id}
            initial={{ opacity: 0, y: 15 }}
            animate={{ opacity: 1, y: 0 }}
            transition={{ duration: 0.4, delay: 0.2 + index * 0.05 }}
            className="rounded-xl border border-border bg-card hover:border-accent/20 transition-colors group"
          >
            <div className="p-5">
              <div className="flex items-start justify-between gap-4 mb-3">
                <div className="flex-1 min-w-0">
                  <div className="flex items-center gap-2.5 mb-2 flex-wrap">
                    <span className="text-xs font-mono text-muted-foreground">{bounty.id}</span>
                    <Badge className={`text-[10px] ${severityColors[bounty.severity]}`}>
                      {bounty.severity}
                    </Badge>
                    <Badge className={`text-[10px] ${statusColors[bounty.status]}`}>
                      {bounty.status === "in-progress" ? "In Progress" : "Open"}
                    </Badge>
                  </div>
                  <h3 className="text-lg font-semibold group-hover:text-accent transition-colors mb-1.5">
                    {bounty.title}
                  </h3>
                  <p className="text-sm text-muted-foreground leading-relaxed">
                    {bounty.description}
                  </p>
                </div>
                <div className="text-right shrink-0">
                  <p className="text-2xl font-bold text-foreground">${bounty.bounty}</p>
                  <p className="text-xs text-muted-foreground font-mono">{bounty.currency}</p>
                </div>
              </div>

              <div className="flex items-center justify-between mt-4 pt-4 border-t border-border">
                <div className="flex items-center gap-4 text-sm text-muted-foreground">
                  <span className="font-mono">{bounty.project}</span>
                  <span className="flex items-center gap-1">
                    <Clock className="w-3.5 h-3.5" />
                    {bounty.timeOpen}
                  </span>
                  <span className="flex items-center gap-1">
                    <Users className="w-3.5 h-3.5" />
                    {bounty.claimants} {bounty.claimants === 1 ? "hunter" : "hunters"}
                  </span>
                </div>
                <div className="hidden sm:flex items-center gap-2">
                  {bounty.skills.map((skill) => (
                    <span
                      key={skill}
                      className="px-2 py-0.5 text-[10px] font-mono rounded border border-border bg-muted/50 text-muted-foreground"
                    >
                      {skill}
                    </span>
                  ))}
                </div>
              </div>
            </div>
          </motion.div>
        ))}
      </div>

      {filtered.length === 0 && (
        <div className="text-center py-16">
          <p className="text-muted-foreground">No bounties match your filters.</p>
          <Button
            variant="outline"
            size="sm"
            className="mt-4"
            onClick={() => { setSeverity("all"); setStatus("open") }}
          >
            Reset Filters
          </Button>
        </div>
      )}

      {/* Bottom CTA */}
      <div className="mt-12 rounded-xl border border-accent/20 bg-accent/5 p-8 text-center">
        <h3 className="text-xl font-semibold mb-2">Want your project&apos;s bugs listed here?</h3>
        <p className="text-muted-foreground mb-6 max-w-lg mx-auto">
          Add hyperpush to your project and opt in to the public bug board. Community developers will help fix your bugs — funded by your project treasury.
        </p>
        <Button className="gap-2">
          Get Started
          <ArrowUpRight className="w-4 h-4" />
        </Button>
      </div>
    </CommunityLayout>
  )
}
