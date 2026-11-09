# Data Dictionary

| Table | Purpose | Important fields |
|---|---|---|
| users | Admin account | name, unique email, password hash |
| profiles | Owner profile | display_name, professional_title, headline, short_bio, about_content, location, contact_email, avatar_media_id, resume_media_id |
| focus_areas | Professional focus | title, slug, description, icon_key, sort_order, is_active |
| project_categories | Project grouping | name, slug, description, sort_order, is_active |
| projects | Portfolio projects | category, title, slug, summary, description, project_type, project_status, publication_status, dates, thumbnail, URLs, featured, published_at |
| project_sections | Case-study blocks | project_id, section_type, title, JSONB content, sort_order |
| technologies | Skills/tools | name, slug, category, icon_key, description, sort_order, is_active |
| project_technologies | Project-tech pivot | project_id, technology_id |
| media | Uploaded files | uploaded_by, disk, path, original_name, mime_type, size_bytes, dimensions, alt_text |
| project_media | Project gallery pivot | project_id, media_id, sort_order, role |
| experiences | Professional/project journey | organization, role, description, dates, is_current, sort_order, is_visible |
| educations | Education history | institution, qualification, field, description, dates, sort_order, is_visible |
| certifications | Certifications | name, issuer, credential_url/id, issue/expiry dates |
| featured_articles | External blog links | title, article_url, excerpt, thumbnail, published_at, featured, sort_order |
| site_settings | Public site config | unique setting_key, JSONB setting_value, group_name, is_public |
| navigation_items | Navbar/footer links | label, target_type, target_value, open_behavior, sort_order, is_visible |
| contact_messages | Public inquiries | inquiry_type, name, email, subject, message, status, read_at |

## Structured project block examples
`architecture_diagram`:
```json
{
  "image_media_id": 42,
  "caption": "High-level deployment topology",
  "alt": "Diagram of app services and private database network"
}
```

`code`:
```json
{
  "language": "yaml",
  "code": "services:\n  app:\n    image: example",
  "caption": "Simplified service configuration"
}
```

Never store or render arbitrary executable HTML/JavaScript. Validate JSONB schema based on block type. Add `created_at` and `updated_at` to mutable entities. Use deliberate FK delete rules.
