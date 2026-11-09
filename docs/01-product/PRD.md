# Product Requirements Document

- Product: Personal Portfolio CMS
- Owner: Asep Nurdin
- Status: Draft for technical review
- Release target: MVP

## 1. Overview
Website portofolio profesional dengan CMS privat. Public website menampilkan profil, focus areas, proyek, pengalaman, pendidikan, sertifikasi, artikel blog pilihan, dan kontak. Semua konten yang sering berubah dikelola melalui Admin Dashboard tanpa mengedit source code.

Satu React application melayani public routes dan admin routes. Laravel menyediakan REST API, autentikasi, validasi, otorisasi, dan akses database.

## 2. Vision and goals
Memperkuat personal brand sebagai engineer yang memahami software dan sistem yang menjalankannya: DevOps, infrastructure, networking, cybersecurity, dan software engineering.

Goals:
- Menunjukkan kemampuan melalui proyek dan bukti teknis.
- Memudahkan pemilik memperbarui konten.
- Mendukung career opportunities dan client collaboration.
- Menjadi proyek praktik backend, containerization, deployment, dan monitoring.

## 3. Users
| User | Kebutuhan |
|---|---|
| Recruiter/employer | Profil, fokus, pengalaman, bukti pekerjaan |
| Potential client | Kapabilitas, contoh proyek, kontak |
| Technical visitor | Arsitektur, stack, proses, dokumentasi |
| Owner/admin | Mengelola konten melalui dashboard |

## 4. Scope MVP
Public:
- `/` Home
- `/about` About
- `/projects` daftar dan filter proyek
- `/projects/:slug` detail/case study
- `/contact` kontak

Admin:
- `/admin/login`
- `/admin` dashboard
- `/admin/profile`
- `/admin/focus-areas`
- `/admin/projects`
- `/admin/project-categories`
- `/admin/technologies`
- `/admin/experiences`
- `/admin/educations`
- `/admin/certifications`
- `/admin/media`
- `/admin/featured-articles`
- `/admin/navigation`
- `/admin/settings`
- `/admin/messages`

Blog tetap eksternal. CMS hanya menyimpan URL blog dan metadata artikel pilihan.

## 5. Functional requirements
### FR-01 Home
Menampilkan headline, title, intro, foto, focus areas, featured projects, featured articles, dan CTA. Data diambil dari API.

### FR-02 Profile
Admin mengelola nama tampilan, professional title, headline, bio, about content, foto, CV, lokasi, email, dan social links. Hanya satu profile utama.

### FR-03 Focus areas
CRUD, aktivasi, dan pengurutan bidang fokus. Field: title, slug, description, icon_key, sort_order, is_active.

### FR-04 Projects
Admin mengelola title, slug, category, type, status, dates, summary, description, thumbnail, gallery, technologies, repository/live/docs URL, featured, dan publication status.
- Project type: `personal`, `client`, `learning`, `research`
- Project status: `planned`, `in_progress`, `completed`, `archived`
- Publication: `draft`, `published`
- Draft tidak boleh muncul di public API.
- Slug unik.
- Featured hanya untuk project published.
- Case study memakai ordered structured content blocks.

### FR-05 Categories and technologies
CRUD kategori proyek dan teknologi. Project dan technology memiliki relasi many-to-many.

### FR-06 Experience, education, certification
CRUD dan sorting untuk perjalanan profesional, pendidikan, sertifikasi.

### FR-07 Media library
Upload, list, search, delete. Simpan file pada Laravel `public` disk dengan persistent volume. Validasi MIME, ukuran, ekstensi, nama file. SVG tidak diizinkan pada MVP.

### FR-08 Featured articles
Simpan title, excerpt, URL artikel eksternal, thumbnail, tanggal, featured, sort order. Tidak menyimpan isi blog.

### FR-09 Site settings and navigation
Kelola SEO, logo, favicon, social links, blog URL, kontak, footer, CTA, navigation. Hanya route type yang diizinkan; jangan menerima arbitrary script/HTML.

### FR-10 Contact messages
Form publik menerima `inquiry_type` (`career`/`collaboration`), name, email, subject, message. Simpan untuk admin. Terapkan rate limit dan anti-spam. Public tidak dapat membaca pesan.

### FR-11 Authentication
Tidak ada public registration. Sanctum cookie-based SPA authentication. Admin routes wajib authenticated dan authorized. Login rate limited.

### FR-12 Dashboard
Ringkasan projects, drafts, published, media, unread messages.

## 6. Non-functional requirements
- Responsive mobile/tablet/desktop.
- Public API pagination dan cache.
- Eager loading untuk menghindari N+1.
- HTTPS production.
- CSRF, rate limiting, Policies, Form Requests.
- PostgreSQL dan Redis private-only.
- Persistent database/media volumes.
- Backup dan restore diuji.
- Monitoring host/container.
- Accessible focus states, keyboard navigation, alt text, loading/empty/error states.

## 7. Content blocks
MVP block types:
`rich_text`, `image`, `image_gallery`, `architecture_diagram`, `code`, `callout`, `bullet_list`, `metrics`.

Konten block disimpan terstruktur dan divalidasi sesuai tipe. Jangan menerima executable HTML/JS bebas.

## 8. Out of scope
Public registration, multi-tenant, blog engine, comments, e-commerce, page builder bebas, Kubernetes, S3/object storage, multi-admin role matrix kompleks, automatic RSS import.

## 9. MVP acceptance criteria
1. Admin login/logout aman.
2. Semua modul konten utama dapat dikelola dari admin.
3. Public site membaca data dari API.
4. Draft tidak terlihat di public API.
5. Project detail berdasarkan slug.
6. Contact form menyimpan pesan dan rate-limited.
7. Automated tests auth, authorization, validation, visibility lulus.
8. Docker Compose menjalankan aplikasi.
9. Database dan media bertahan setelah container recreate.
10. Monitoring dapat dijalankan terpisah.
11. Backup/restore diuji.
12. HTTPS; database, Redis, monitoring tidak terbuka publik.

## 10. Risks
| Risiko | Mitigasi |
|---|---|
| CMS terlalu kompleks | Batasi MVP pada modul di atas |
| HTML berbahaya | Structured blocks dan sanitization |
| Media hilang | Persistent volume + backup |
| Sanctum cross-origin rumit | Same-origin reverse proxy |
| Client work tidak boleh dipublikasi | Verifikasi izin sebelum publish |
| Monitoring membebani server | Compose terpisah dan resource limit |
