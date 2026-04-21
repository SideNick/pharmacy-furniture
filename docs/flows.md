# Flows

## Flow 1. Admin creates a pharmacy
1. Admin opens the admin area.
2. Creates a pharmacy with number, address, and status.

## Flow 2. Admin creates a furniture type
1. Admin creates a furniture type.
2. Adds code, title, category, optional notes.

## Flow 3. Admin creates a furniture item
1. Admin selects pharmacy.
2. Admin selects furniture type.
3. System creates an immutable internal item id.
4. System generates a human-readable inventory code.
5. System generates a QR code for the item.

## Flow 4. Pharmacy employee scans QR
1. Employee scans QR using a phone camera.
2. Opens a public page for one unique furniture item.
3. Sees item title, pharmacy, inventory code, and status.

## Flow 5. Confirm presence
1. Employee taps "Confirm presence".
2. System records an inventory event with timestamp.

## Flow 6. Report damage
1. Employee taps "Report damage".
2. Adds comment and photo.
3. System stores a damage report.
4. System creates a Bitrix24 task via webhook.
5. System stores the Bitrix task id.

## Flow 7. Admin reviews records
1. Admin views items, inventory events, and damage reports.
2. Admin filters by pharmacy, furniture type, and status.