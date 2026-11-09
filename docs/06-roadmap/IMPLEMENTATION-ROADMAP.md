# Implementation Roadmap

## Phase 0 — Project Foundation (current)
Deliverables: PRD, architecture, ERD, data dictionary, API specification/OpenAPI, folder structure, deployment topology, security and environment baseline.
Exit: scope, relationships, auth/deployment approach reviewed.

## Phase 1 — Repository and infrastructure
1. Create root repository/folders.
2. Scaffold Laravel and React/Vite/TypeScript.
3. Add Dockerfiles and Nginx.
4. Add app Compose with PostgreSQL/Redis.
5. Add health checks and persistent volumes.
6. Add local development override and Makefile.
7. Verify startup and persistence.
Exit: app starts, Laravel connects DB/Redis, frontend served, data survives container recreation.

## Phase 2 — Backend
1. API versioning and migrations.
2. Models and relationships.
3. Secure admin bootstrap.
4. Sanctum SPA authentication.
5. Policies and Form Requests.
6. Public API resources.
7. Admin CRUD.
8. Media upload and safe deletion.
9. Contact form/rate limiting.
10. Automated tests.

## Phase 3 — Public frontend
Design tokens, public layout, Home, About, Projects/filter, project detail block renderer, Contact, SEO, responsive behavior, API states.

## Phase 4 — Admin dashboard
Login/session, dashboard, profile, focus areas, projects, categories, technologies, experience, education, certifications, media, featured articles, navigation, settings, contact inbox.

## Phase 5 — Monitoring and operations
Separate monitoring Compose, Prometheus, Grafana, Node Exporter, cAdvisor, dashboards, access protection, backup scripts, restore test.

## Phase 6 — Production
Ubuntu host, production env, deploy, migrate, bootstrap admin, domain/TLS or Tunnel, monitoring, security review, backups, then CI/CD.

Definition of done each phase: docs updated, tests pass, no secrets committed, failure modes reviewed, commands reproducible, actual status documented.
