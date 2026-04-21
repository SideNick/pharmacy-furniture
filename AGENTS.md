# AGENTS.md

## Project
Internal web service for pharmacy furniture inventory, QR-based confirmation, damage reporting, and Bitrix24 task creation.

## Product priorities
1. MVP first.
2. Do not add forecasting, advanced analytics, warehouse integrations, or PDF reporting unless explicitly requested.
3. Every feature must support the pharmacy furniture workflow.

## Stack target
- Next.js + TypeScript
- Supabase (Postgres, Auth, Storage)
- Vercel deployment
- Bitrix24 incoming webhook integration

## Working rules
- Make minimal, high-confidence changes.
- Do not refactor unrelated files.
- Before coding, explain the plan and list touched files.
- After coding, provide manual verification steps.
- Keep UI simple and functional.
- Never store secrets in the repository.
- Prefer scoped diffs over large rewrites.

## Domain rules
- QR must point to a unique furniture item page, not to pharmacy+type only.
- Internal item_id is immutable.
- Human-readable inventory code is separate from the internal id.
- Damage reports must preserve comment, timestamp, pharmacy, item, and Bitrix task id.
- Furniture statuses: planned, in_stock, delivered, installed, broken, under_repair, written_off, moved.

## Initial MVP
- pharmacies
- furniture types
- furniture items
- QR generation
- public furniture item page
- confirm presence
- damage report with photo
- Bitrix24 task creation

## Out of scope for MVP
- forecasting
- ML prediction
- complex warehouse sync
- PDF dashboards
- role-heavy enterprise permissions