# Architecture Decision Records

## ADR-001 Backend — Laravel REST API
Chosen for migrations, validation, policies, queues, filesystem, testing, and ecosystem.

## ADR-002 Frontend — React + Vite + TypeScript
Separate SPA with explicit REST boundary.

## ADR-003 Database — PostgreSQL
Relational integrity and JSONB for validated project blocks/settings; aligns with existing PostgreSQL learning.

## ADR-004 Authentication — Sanctum stateful SPA
Cookie-based first-party authentication. Same-origin reverse proxy is preferred. Correct stateful domains, CSRF, cookie, and proxy configuration is mandatory. Revisit if moving to separate sites.

## ADR-005 Public and admin — one React application
Shared design system/types/API client; separate route groups and layouts.

## ADR-006 Orchestration — Docker Compose
Appropriate for a single Ubuntu server; no Kubernetes requirement.

## ADR-007 Monitoring — separate Compose project
Independent lifecycle, resource control, and access policy.

## ADR-008 Media — Laravel local public disk + persistent volume
Simple single-server MVP. Back up separately. Move to object storage if multi-node scaling is needed.

## ADR-009 Deployment — same-origin Nginx routing
Simplifies Sanctum cookies and CSRF.

## ADR-010 Blog — external
CMS stores blog URL and featured article metadata only.

## ADR-011 Project case study — ordered structured blocks in JSONB
Flexible content with allowlisted block renderer; no arbitrary HTML/script.
