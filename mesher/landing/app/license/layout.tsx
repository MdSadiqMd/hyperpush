import type { Metadata } from "next"

export const metadata: Metadata = {
  title: "License - hyperpush",
  description: "hyperpush open-source license information. AGPL-3.0 for core, MIT for SDKs.",
}

export default function LicenseLayout({ children }: { children: React.ReactNode }) {
  return children
}
