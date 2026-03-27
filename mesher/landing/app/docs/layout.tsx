import type { Metadata } from "next"

export const metadata: Metadata = {
  title: "Documentation - hyperpush",
  description:
    "Learn how to integrate hyperpush into your project. Full error tracking, Solana program monitoring, token economics, and public bug boards.",
}

export default function DocsLayout({ children }: { children: React.ReactNode }) {
  return children
}
