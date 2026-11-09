# Security Baseline

## Authentication and sessions
- Sanctum stateful SPA cookies; no public registration.
- Bootstrap first admin through secure CLI/one-time process, never hardcoded credentials.
- Rate-limit login.
- Regenerate session after login; invalidate on logout.
- Same-origin deployment preferred.
- Configure stateful domains, CSRF, cookie secure/httpOnly/sameSite, trusted proxies.
- Do not disable CSRF to fix frontend auth.

## Authorization and data
- Admin routes require auth and Policies.
- Form Requests validate writes.
- Public API filters drafts server-side.
- Never serialize private admin fields.
- Frontend route guard is UX, not security.

## Input and rich content
- Structured content blocks with allowlisted types.
- Sanitize rich text; escape output.
- No arbitrary script/HTML.
- Validate URLs and reject javascript/data schemes.

## Uploads
- Validate MIME, extension, size, actual file content, dimensions.
- Generate server-side filenames.
- SVG disabled initially.
- Store outside executable source directories.
- Authenticated upload only.
- Prevent deleting referenced media.

## Infrastructure
- Only Nginx reachable from public edge.
- PostgreSQL and Redis private; no public port mapping.
- Grafana/Prometheus private or authenticated.
- Docker socket mount is privileged/sensitive.
- Pin image versions; avoid `latest` in production.
- Keep host and images patched.

## Secrets and backup
- `.env` not committed; only safe `.env.example`.
- Restrict production env file permissions.
- Rotate leaked credentials.
- Never store secrets in site settings or VITE variables.
- Back up PostgreSQL and media separately, preferably off-host.
- Test restore. A Docker volume is not a backup.

## Production checklist
- [ ] HTTPS
- [ ] APP_DEBUG=false
- [ ] Strong APP_KEY and DB credentials
- [ ] Registration disabled
- [ ] Login/contact rate limits
- [ ] Sanctum and CSRF verified
- [ ] DB/Redis private
- [ ] Monitoring protected
- [ ] Upload validation tested
- [ ] Backup and restore tested
- [ ] No secrets in logs
