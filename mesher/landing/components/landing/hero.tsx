"use client"

import { Button } from "@/components/ui/button"
import { ArrowRight, Github, Terminal } from "lucide-react"
import { motion } from "framer-motion"

export function Hero() {
  return (
    <section className="relative min-h-screen flex items-center justify-center overflow-hidden">
      {/* Grid background */}
      <div className="absolute inset-0 bg-[linear-gradient(to_right,rgba(255,255,255,0.02)_1px,transparent_1px),linear-gradient(to_bottom,rgba(255,255,255,0.02)_1px,transparent_1px)] bg-[size:64px_64px]" />
      
      {/* Gradient orb */}
      <div className="absolute top-1/2 left-1/2 -translate-x-1/2 -translate-y-1/2 w-[800px] h-[800px] bg-accent/5 rounded-full blur-[120px] pointer-events-none" />
      
      <div className="relative z-10 max-w-5xl mx-auto px-6 text-center pt-32 pb-24">
        <motion.div
          initial={{ opacity: 0, y: 20 }}
          animate={{ opacity: 1, y: 0 }}
          transition={{ duration: 0.5 }}
          className="flex items-center justify-center gap-2 mb-8"
        >
          <span className="inline-flex items-center gap-2 px-4 py-2 rounded-full border border-border bg-card/50 backdrop-blur-sm text-sm text-muted-foreground">
            <span className="w-2 h-2 rounded-full bg-accent animate-pulse" />
            Built on Solana
          </span>
        </motion.div>

        <motion.h1
          initial={{ opacity: 0, y: 20 }}
          animate={{ opacity: 1, y: 0 }}
          transition={{ duration: 0.5, delay: 0.1 }}
          className="text-4xl md:text-6xl lg:text-7xl font-bold tracking-tight text-balance mb-6"
        >
          Open-source error tracking
          <br />
          <span className="text-accent">that funds itself</span>
        </motion.h1>

        <motion.p
          initial={{ opacity: 0, y: 20 }}
          animate={{ opacity: 1, y: 0 }}
          transition={{ duration: 0.5, delay: 0.2 }}
          className="text-lg md:text-xl text-muted-foreground max-w-2xl mx-auto mb-10 text-pretty"
        >
          Full error tracking for web apps and Solana programs — free, open source, and self-hostable.
          Ship a project token that earns revenue for your treasury and pays developers who squash bugs.
        </motion.p>

        <motion.div
          initial={{ opacity: 0, y: 20 }}
          animate={{ opacity: 1, y: 0 }}
          transition={{ duration: 0.5, delay: 0.3 }}
          className="flex flex-col sm:flex-row items-center justify-center gap-4 mb-16"
        >
          <Button size="lg" className="h-12 px-8 gap-2">
            Join Waitlist
            <ArrowRight className="w-4 h-4" />
          </Button>
          <Button size="lg" variant="outline" className="h-12 px-8 gap-2">
            <Github className="w-4 h-4" />
            View on GitHub
          </Button>
        </motion.div>

        <motion.div
          initial={{ opacity: 0, y: 40 }}
          animate={{ opacity: 1, y: 0 }}
          transition={{ duration: 0.6, delay: 0.4 }}
          className="relative rounded-xl border border-border bg-card/80 backdrop-blur-sm overflow-hidden shadow-2xl"
        >
          {/* Terminal header */}
          <div className="flex items-center gap-2 px-4 py-3 border-b border-border bg-muted/50">
            <div className="flex gap-1.5">
              <div className="w-3 h-3 rounded-full bg-destructive/80" />
              <div className="w-3 h-3 rounded-full bg-chart-4/80" />
              <div className="w-3 h-3 rounded-full bg-accent/80" />
            </div>
            <span className="text-xs text-muted-foreground ml-2 font-mono">hyperpush init</span>
          </div>
          
          {/* Terminal content */}
          <div className="p-6 font-mono text-sm text-left">
            <div className="flex items-center gap-2 text-muted-foreground mb-3">
              <Terminal className="w-4 h-4" />
              <span>npm install @hyperpush/sdk</span>
            </div>
            <div className="space-y-2 text-muted-foreground/80">
              <p><span className="text-accent">✓</span> SDK installed successfully</p>
              <p><span className="text-accent">✓</span> Error tracking active</p>
              <p><span className="text-accent">✓</span> Solana program monitoring enabled</p>
              <p><span className="text-accent">✓</span> Public bug board connected</p>
              <p className="text-foreground mt-4">
                <span className="text-muted-foreground">→</span> Dashboard: <span className="text-accent underline">hyperpush.dev/dashboard</span>
              </p>
            </div>
          </div>
        </motion.div>
      </div>
    </section>
  )
}
