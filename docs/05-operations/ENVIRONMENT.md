# Environment Configuration

Names may be adjusted to the exact Laravel version and Docker image.

| Variable | Purpose | Notes |
|---|---|---|
| APP_NAME | Application name | Asep Portfolio |
| APP_ENV | Environment | local/production |
| APP_KEY | Laravel key | Generate securely; never commit |
| APP_DEBUG | Debug | false in production |
| APP_URL | Canonical URL | Replace placeholder |
| APP_TIMEZONE | App timezone | `Asia/Makassar` placeholder; confirm |
| LOG_CHANNEL | Logging | stderr/stack |
| LOG_LEVEL | Log level | info in production |
| DB_CONNECTION | Driver | pgsql |
| DB_HOST | Compose service | postgres |
| DB_PORT | Internal port | 5432 |
| DB_DATABASE | Database | environment-specific |
| DB_USERNAME | DB user | environment-specific |
| DB_PASSWORD | DB password | strong secret |
| CACHE_STORE | Cache | redis |
| QUEUE_CONNECTION | Queue | redis/database |
| SESSION_DRIVER | Session | redis/database |
| SESSION_SECURE_COOKIE | Cookie | true in HTTPS production |
| SESSION_SAME_SITE | SameSite | lax for same-origin |
| REDIS_HOST | Compose service | redis |
| REDIS_PORT | Internal port | 6379 |
| FILESYSTEM_DISK | Media disk | public |
| SANCTUM_STATEFUL_DOMAINS | SPA origins | include local and production host |
| SESSION_DOMAIN | Cookie domain | configure intentionally |
| TRUSTED_PROXIES | Proxy trust | configure actual proxy chain |

Frontend public-only variables:
- `VITE_APP_NAME`
- `VITE_API_BASE_URL` (prefer `/api/v1` for same-origin)

Never expose secrets in `VITE_*`.

Postgres container:
- `POSTGRES_DB`
- `POSTGRES_USER`
- `POSTGRES_PASSWORD`

Monitoring:
- `GF_SECURITY_ADMIN_USER`
- `GF_SECURITY_ADMIN_PASSWORD`
- `PROMETHEUS_RETENTION_TIME`
- `PROMETHEUS_RETENTION_SIZE`

Secret rules:
1. Commit `.env.example`, never `.env`.
2. Use separate local and production secrets.
3. Restrict server env file permissions.
4. Rotate credentials after exposure.
5. Do not store credentials in `site_settings`.
