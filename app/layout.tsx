import type { Metadata } from "next";
import Link from "next/link";
import "./globals.css";

export const metadata: Metadata = {
  title: "Pharmacy Furniture QR",
  description: "Internal MVP scaffold for pharmacy furniture inventory workflows."
};

export default function RootLayout({
  children
}: Readonly<{
  children: React.ReactNode;
}>) {
  return (
    <html lang="en">
      <body>
        <div className="shell">
          <header className="shell__header">
            <div>
              <p className="eyebrow">Internal MVP scaffold</p>
              <h1>Pharmacy Furniture QR</h1>
              <p className="shell__subtitle">
                Placeholder screens for inventory confirmation and damage
                reporting.
              </p>
            </div>
            <nav className="shell__nav" aria-label="Primary">
              <Link href="/">Home</Link>
              <Link href="/admin">Admin</Link>
              <Link href="/items/demo-rack-001">Sample item</Link>
            </nav>
          </header>
          <main>{children}</main>
        </div>
      </body>
    </html>
  );
}

