import type { Metadata } from "next"

export const metadata: Metadata = {
  title: "Privacy Policy - hyperpush",
  description: "Learn how hyperpush collects, uses, and protects your data. Our commitment to privacy and transparency.",
}

export default function PrivacyLayout({ children }: { children: React.ReactNode }) {
  return children
}
