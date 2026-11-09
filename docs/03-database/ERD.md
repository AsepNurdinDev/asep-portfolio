# Entity Relationship Diagram

```mermaid
erDiagram
 USERS {
  bigint id PK
  string name
  string email UK
  string password
 }
 PROFILES {
  bigint id PK
  string display_name
  string professional_title
  string headline
  text short_bio
  text about_content
  string location
  string contact_email
  bigint avatar_media_id FK
  bigint resume_media_id FK
 }
 FOCUS_AREAS {
  bigint id PK
  string title
  string slug UK
  text description
  string icon_key
  int sort_order
  boolean is_active
 }
 PROJECT_CATEGORIES {
  bigint id PK
  string name
  string slug UK
  text description
  int sort_order
  boolean is_active
 }
 PROJECTS {
  bigint id PK
  bigint project_category_id FK
  string title
  string slug UK
  text summary
  text description
  string project_type
  string project_status
  string publication_status
  date started_at
  date ended_at
  bigint thumbnail_media_id FK
  string repository_url
  string live_url
  string documentation_url
  boolean is_featured
  timestamp published_at
 }
 PROJECT_SECTIONS {
  bigint id PK
  bigint project_id FK
  string section_type
  string title
  jsonb content
  int sort_order
 }
 TECHNOLOGIES {
  bigint id PK
  string name
  string slug UK
  string category
  string icon_key
  text description
  int sort_order
  boolean is_active
 }
 PROJECT_TECHNOLOGIES {
  bigint project_id PK,FK
  bigint technology_id PK,FK
 }
 MEDIA {
  bigint id PK
  bigint uploaded_by FK
  string disk
  string path
  string original_name
  string mime_type
  bigint size_bytes
  int width
  int height
  text alt_text
 }
 PROJECT_MEDIA {
  bigint project_id PK,FK
  bigint media_id PK,FK
  int sort_order
  string role
 }
 EXPERIENCES {
  bigint id PK
  string organization
  string role
  text description
  date started_at
  date ended_at
  boolean is_current
  int sort_order
  boolean is_visible
 }
 EDUCATIONS {
  bigint id PK
  string institution
  string qualification
  string field_of_study
  text description
  date started_at
  date ended_at
  int sort_order
  boolean is_visible
 }
 CERTIFICATIONS {
  bigint id PK
  string name
  string issuer
  string credential_url
  string credential_id
  date issued_at
  date expires_at
  int sort_order
  boolean is_visible
 }
 FEATURED_ARTICLES {
  bigint id PK
  string title
  string article_url
  text excerpt
  bigint thumbnail_media_id FK
  date published_at
  boolean is_featured
  int sort_order
 }
 SITE_SETTINGS {
  bigint id PK
  string setting_key UK
  jsonb setting_value
  string group_name
  boolean is_public
 }
 NAVIGATION_ITEMS {
  bigint id PK
  string label
  string target_type
  string target_value
  string open_behavior
  int sort_order
  boolean is_visible
 }
 CONTACT_MESSAGES {
  bigint id PK
  string inquiry_type
  string name
  string email
  string subject
  text message
  string status
  timestamp read_at
 }
 USERS ||--o{ MEDIA : uploads
 PROJECT_CATEGORIES ||--o{ PROJECTS : categorizes
 PROJECTS ||--o{ PROJECT_SECTIONS : contains
 PROJECTS ||--o{ PROJECT_TECHNOLOGIES : uses
 TECHNOLOGIES ||--o{ PROJECT_TECHNOLOGIES : assigned
 PROJECTS ||--o{ PROJECT_MEDIA : displays
 MEDIA ||--o{ PROJECT_MEDIA : attached
```

## Relationship and constraint notes
- `profiles`: single primary profile; enforce singleton in application/bootstrap logic.
- `projects`: one primary category in MVP. Add category pivot only if multi-category is later required.
- `project_sections`: ordered JSONB blocks validated against `section_type`.
- `project_technologies`: many-to-many.
- `project_media`: gallery/architecture/screenshot attachments.
- `media.uploaded_by` references users.
- `site_settings`: JSONB values but keys and schemas are allowlisted in code. Never store secrets.
- `navigation_items.target_type` allowlist: `internal_route`, `external_url`; reject javascript/data URLs.
- Contact messages: public create only, admin read/update only.

Enum-like values:
- project_type: `personal`, `client`, `learning`, `research`
- project_status: `planned`, `in_progress`, `completed`, `archived`
- publication_status: `draft`, `published`
- section_type: `rich_text`, `image`, `image_gallery`, `architecture_diagram`, `code`, `callout`, `bullet_list`, `metrics`
- inquiry_type: `career`, `collaboration`
- message status: `unread`, `read`, `archived`

Indexes:
- Unique users.email, focus_areas.slug, project_categories.slug, projects.slug, technologies.slug, site_settings.setting_key.
- Index projects(publication_status, is_featured, published_at), projects(project_category_id), project_sections(project_id, sort_order), contact_messages(status, created_at).
- Cascade project sections and pivot rows when project deleted. Restrict media deletion while referenced.
