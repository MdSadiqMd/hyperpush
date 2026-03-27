"use client"

import Link from "next/link"
import { motion } from "framer-motion"
import { CommunityLayout } from "@/components/community/community-layout"
import { Badge } from "@/components/ui/badge"
import { ArrowRight, Clock } from "lucide-react"

const posts = [
  {
    slug: "introducing-mesher",
    title: "Introducing hyperpush: Open-Source Error Tracking That Funds Itself",
    excerpt: "We're building the error tracking platform we always wanted — open source, self-hostable, with built-in economics that fund projects and pay the developers who fix bugs.",
    author: "Core Team",
    authorAvatar: "CT",
    date: "March 24, 2026",
    readTime: "8 min read",
    category: "Announcement",
    featured: true,
  },
  {
    slug: "why-token-economics",
    title: "Why We Chose Token Economics Over SaaS Pricing",
    excerpt: "Most open-source projects die from lack of funding. We explored every model — sponsorships, SaaS, foundations — before landing on token economics. Here's why.",
    author: "Core Team",
    authorAvatar: "CT",
    date: "March 20, 2026",
    readTime: "12 min read",
    category: "Deep Dive",
    featured: false,
  },
  {
    slug: "solana-error-tracking",
    title: "First-Class Solana Error Tracking: What It Actually Means",
    excerpt: "Every error tracker can capture console.error. But tracking Solana program failures — CPI errors, transaction simulation failures, RPC timeouts — requires purpose-built tooling.",
    author: "Core Team",
    authorAvatar: "CT",
    date: "March 16, 2026",
    readTime: "10 min read",
    category: "Technical",
    featured: false,
  },
  {
    slug: "mesh-lang-performance",
    title: "How Mesh Language Powers hyperpush's Event Pipeline",
    excerpt: "hyperpush processes millions of error events through Mesh's actor model. Here's how sub-millisecond process spawning and supervision trees make our pipeline fault-tolerant by default.",
    author: "Core Team",
    authorAvatar: "CT",
    date: "March 12, 2026",
    readTime: "14 min read",
    category: "Technical",
    featured: false,
  },
  {
    slug: "bounty-system-design",
    title: "Designing a Fair Bounty System for Bug Fixes",
    excerpt: "How do you price a bug fix fairly? How do you verify it? What prevents gaming? We walk through every design decision behind hyperpush's bounty system.",
    author: "Core Team",
    authorAvatar: "CT",
    date: "March 8, 2026",
    readTime: "11 min read",
    category: "Deep Dive",
    featured: false,
  },
  {
    slug: "oss-launch-program",
    title: "Announcing the OSS Launch Program: 6 Months Free for Open Source",
    excerpt: "We're giving the first 10 qualifying open-source projects the full Pro tier for 6 months — no credit card, no strings. Here's how to apply.",
    author: "Core Team",
    authorAvatar: "CT",
    date: "March 4, 2026",
    readTime: "5 min read",
    category: "Announcement",
    featured: false,
  },
]

const categoryColors: Record<string, string> = {
  Announcement: "bg-accent/20 text-accent border-accent/30",
  Technical: "bg-chart-2/20 text-chart-2 border-chart-2/30",
  "Deep Dive": "bg-chart-4/20 text-chart-4 border-chart-4/30",
}

export default function BlogPage() {
  const featured = posts.find((p) => p.featured)
  const rest = posts.filter((p) => !p.featured)

  return (
    <CommunityLayout
      title="Blog"
      subtitle="Engineering deep dives, product updates, and the thinking behind hyperpush."
    >
      {/* Featured post */}
      {featured && (
        <motion.div
          initial={{ opacity: 0, y: 20 }}
          animate={{ opacity: 1, y: 0 }}
          transition={{ duration: 0.5 }}
          className="mb-12"
        >
          <Link
            href={`/community/blog/${featured.slug}`}
            className="block rounded-xl border border-border bg-card hover:border-accent/20 transition-colors group overflow-hidden"
          >
            {/* Gradient banner */}
            <div className="h-48 bg-gradient-to-br from-accent/10 via-accent/5 to-transparent relative">
              <div className="absolute inset-0 bg-[linear-gradient(to_right,rgba(255,255,255,0.02)_1px,transparent_1px),linear-gradient(to_bottom,rgba(255,255,255,0.02)_1px,transparent_1px)] bg-[size:32px_32px]" />
              <div className="absolute top-4 left-4">
                <Badge className={`text-xs ${categoryColors[featured.category]}`}>
                  {featured.category}
                </Badge>
              </div>
              <div className="absolute bottom-4 right-4 text-xs font-mono text-accent/50">
                Featured
              </div>
            </div>
            <div className="p-6 md:p-8">
              <h2 className="text-2xl md:text-3xl font-bold tracking-tight mb-3 group-hover:text-accent transition-colors text-balance">
                {featured.title}
              </h2>
              <p className="text-muted-foreground mb-6 text-pretty leading-relaxed max-w-3xl">
                {featured.excerpt}
              </p>
              <div className="flex items-center justify-between">
                <div className="flex items-center gap-3">
                  <div className="w-7 h-7 rounded-full bg-muted flex items-center justify-center text-[10px] font-mono text-muted-foreground">
                    {featured.authorAvatar}
                  </div>
                  <div className="flex items-center gap-2 text-sm text-muted-foreground">
                    <span>{featured.author}</span>
                    <span>·</span>
                    <span>{featured.date}</span>
                    <span>·</span>
                    <span className="flex items-center gap-1">
                      <Clock className="w-3.5 h-3.5" />
                      {featured.readTime}
                    </span>
                  </div>
                </div>
                <span className="hidden sm:flex items-center gap-1.5 text-sm text-accent font-medium opacity-0 group-hover:opacity-100 transition-opacity">
                  Read post
                  <ArrowRight className="w-4 h-4" />
                </span>
              </div>
            </div>
          </Link>
        </motion.div>
      )}

      {/* Posts grid */}
      <div className="grid md:grid-cols-2 gap-6">
        {rest.map((post, index) => (
          <motion.div
            key={post.slug}
            initial={{ opacity: 0, y: 15 }}
            animate={{ opacity: 1, y: 0 }}
            transition={{ duration: 0.4, delay: 0.2 + index * 0.08 }}
          >
            <Link
              href={`/community/blog/${post.slug}`}
              className="block h-full rounded-xl border border-border bg-card hover:border-accent/20 transition-colors group p-6"
            >
              <div className="flex items-center gap-2.5 mb-4">
                <Badge className={`text-[10px] ${categoryColors[post.category]}`}>
                  {post.category}
                </Badge>
                <span className="text-xs text-muted-foreground flex items-center gap-1">
                  <Clock className="w-3 h-3" />
                  {post.readTime}
                </span>
              </div>
              <h3 className="text-lg font-semibold mb-2 group-hover:text-accent transition-colors text-balance">
                {post.title}
              </h3>
              <p className="text-sm text-muted-foreground mb-6 leading-relaxed text-pretty">
                {post.excerpt}
              </p>
              <div className="flex items-center gap-2.5 mt-auto">
                <div className="w-6 h-6 rounded-full bg-muted flex items-center justify-center text-[10px] font-mono text-muted-foreground">
                  {post.authorAvatar}
                </div>
                <div className="flex items-center gap-2 text-xs text-muted-foreground">
                  <span>{post.author}</span>
                  <span>·</span>
                  <span>{post.date}</span>
                </div>
              </div>
            </Link>
          </motion.div>
        ))}
      </div>
    </CommunityLayout>
  )
}
