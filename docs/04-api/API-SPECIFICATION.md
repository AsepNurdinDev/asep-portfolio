# REST API Specification

Base path: `/api/v1`. JSON responses except media upload (`multipart/form-data`). Authentication: Sanctum stateful SPA session cookies, same-origin.

## Response conventions
Single:
```json
{"data":{"id":12,"title":"Nexus Homelab","slug":"nexus-homelab"}}
```
Collection:
```json
{"data":[],"meta":{"current_page":1,"last_page":1,"per_page":12,"total":0}}
```
Validation error:
```json
{"message":"The given data was invalid.","errors":{"title":["The title field is required."]}}
```

HTTP: 200 success, 201 created, 204 deleted, 401 unauthenticated, 403 forbidden, 404 not found, 409 conflict, 422 validation, 429 rate limited.

## Sanctum SPA flow
1. `GET /sanctum/csrf-cookie`
2. `POST /login` with credentials and CSRF token.
3. `GET /api/v1/admin/me`.
4. Send cookies and X-XSRF-TOKEN on state-changing requests.
5. `POST /logout`.

Login/logout are commonly registered in Laravel web routes; Sanctum provides the CSRF endpoint. Configure stateful middleware for the installed Laravel version. No public registration.

## Public endpoints
| Method | Endpoint | Description |
|---|---|---|
| GET | `/home` | Aggregated homepage |
| GET | `/profile` | Public profile |
| GET | `/focus-areas` | Active focus areas |
| GET | `/projects` | Published projects, filters and pagination |
| GET | `/projects/{slug}` | Published project detail |
| GET | `/project-categories` | Active categories |
| GET | `/technologies` | Active technologies |
| GET | `/experiences` | Visible experiences |
| GET | `/educations` | Visible education |
| GET | `/certifications` | Visible certifications |
| GET | `/featured-articles` | Featured external blog articles |
| GET | `/navigation` | Visible navigation |
| GET | `/site-settings` | Allowlisted public settings |
| POST | `/contact-messages` | Submit contact inquiry |
| GET | `/health` | Minimal health response |

Project query params: `category`, `type`, `status`, `technology`, `search`, `featured`, `page`, `per_page` (max 24). Server always filters draft/unpublished projects.

## Admin endpoints
All require authenticated admin session and Policy authorization.

- `GET /admin/me`
- `GET /admin/dashboard`
- Profile: `GET/PUT /admin/profile`
- Focus areas: CRUD `/admin/focus-areas`
- Projects: CRUD `/admin/projects`, plus `POST /admin/projects/{id}/publish`, `POST /admin/projects/{id}/unpublish`, `PUT /admin/projects/{id}/sections`
- Categories: CRUD `/admin/project-categories`
- Technologies: CRUD `/admin/technologies`
- Experiences: CRUD `/admin/experiences`
- Education: CRUD `/admin/educations`
- Certifications: CRUD `/admin/certifications`
- Media: `GET/POST /admin/media`, `GET/DELETE /admin/media/{id}`
- Featured articles: CRUD `/admin/featured-articles`
- Navigation: CRUD `/admin/navigation`
- Settings: `GET/PUT /admin/site-settings`
- Contact inbox: `GET /admin/contact-messages`, `GET/PATCH/DELETE /admin/contact-messages/{id}`

## Media upload
`POST /admin/media` multipart fields: `file` required, `alt_text` optional. Validate actual MIME, extension, size, dimensions. MVP allow JPEG/PNG/WebP and PDF for resume. SVG disallowed initially. Store on Laravel public disk. Block deletion if referenced.

## Contact form
Fields: inquiry_type (`career` or `collaboration`), name, email, subject, message. Apply validation, IP rate limiting, and anti-spam control. No public read/list endpoint.

## Implementation rules
- Form Requests for writes.
- API Resources for responses.
- Policies for admin authorization.
- Eager loading; no N+1.
- Transactions for project and section/pivot synchronization.
- Explicit public cache invalidation after mutations.
- Do not cache admin/auth/contact responses.
- Keep OpenAPI updated as implementation evolves.
