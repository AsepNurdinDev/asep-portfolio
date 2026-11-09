# Asep Nurdin — Personal Portfolio CMS
## Phase 0: Project Foundation

Fondasi dokumentasi untuk portfolio CMS dengan Laravel REST API, React + Vite + TypeScript, PostgreSQL, Sanctum SPA authentication, Redis, Docker Compose, Nginx, Prometheus, Grafana, dan local media storage pada persistent volume.

### Isi
- `docs/01-product/PRD.md` — kebutuhan produk, scope, user stories, acceptance criteria.
- `docs/02-architecture/ARCHITECTURE.md` — arsitektur aplikasi dan alur request.
- `docs/02-architecture/DEPLOYMENT-TOPOLOGY.md` — topologi deployment dan jaringan.
- `docs/02-architecture/FOLDER-STRUCTURE.md` — struktur folder target.
- `docs/03-database/ERD.md` — ERD Mermaid.
- `docs/03-database/DATA-DICTIONARY.md` — definisi tabel dan field.
- `docs/04-api/API-SPECIFICATION.md` — endpoint dan konvensi API.
- `docs/04-api/openapi.yaml` — OpenAPI 3.1 baseline.
- `docs/05-operations/SECURITY.md` — baseline keamanan.
- `docs/05-operations/ENVIRONMENT.md` — environment variables.
- `docs/06-roadmap/IMPLEMENTATION-ROADMAP.md` — tahapan setelah Phase 0.
- `docs/DECISIONS.md` — keputusan arsitektur.

### Cara menggunakan
1. Ekstrak folder ini ke root repository.
2. Review PRD, arsitektur, ERD, dan API contract.
3. Ganti placeholder domain dan environment saat implementasi.
4. Jangan commit `.env` atau secret.

**Status:** documentation baseline, belum merupakan implementasi aplikasi.

### Prinsip
Konten portofolio dikelola dari database melalui admin. Layout, komponen UI, validasi content blocks, dan design system tetap berada di source code. Public API hanya mengembalikan konten published/active.
