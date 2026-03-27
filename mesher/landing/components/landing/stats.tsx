"use client"

import { motion } from "framer-motion"

const stats = [
  { value: "0", label: "Bugs Fixed" },
  { value: "$0", label: "Paid to Contributors" },
  { value: "0", label: "Projects Earning Revenue" },
  { value: "0%", label: "Projects Launched" },
]

export function Stats() {
  return (
    <section className="relative py-24 border-y border-border">
      <div className="max-w-7xl mx-auto px-6">
        <div className="grid grid-cols-2 md:grid-cols-4 gap-px bg-border">
          {stats.map((stat, index) => (
            <motion.div
              key={stat.label}
              initial={{ opacity: 0, y: 20 }}
              whileInView={{ opacity: 1, y: 0 }}
              viewport={{ once: true }}
              transition={{ duration: 0.5, delay: index * 0.1 }}
              className="bg-background p-8 md:p-12"
            >
              <p className="text-3xl md:text-4xl font-bold text-foreground mb-2">
                {stat.value}
              </p>
              <p className="text-muted-foreground">{stat.label}</p>
            </motion.div>
          ))}
        </div>
      </div>
    </section>
  )
}
