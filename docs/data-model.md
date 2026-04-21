# Data model

## pharmacies
- id
- pharmacy_number
- name
- address
- status
- created_at

## furniture_types
- id
- type_code
- title
- category
- notes
- created_at

## furniture_items
- id
- internal_item_id
- inventory_code
- pharmacy_id
- furniture_type_id
- status
- installed_at
- qr_slug
- created_at

## inventory_events
- id
- furniture_item_id
- event_type
- actor_name
- actor_contact
- created_at

## damage_reports
- id
- furniture_item_id
- pharmacy_id
- comment
- photo_url
- status
- bitrix_task_id
- created_at

## users
- id
- role
- full_name
- email
- phone
- created_at

## bitrix_tasks
- id
- damage_report_id
- external_task_id
- webhook_status
- payload_snapshot
- created_at