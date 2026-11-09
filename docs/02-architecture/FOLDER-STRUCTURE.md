# Target Folder Structure

```text
asep-portfolio/
├── backend/                         # Laravel REST API
│   ├── app/
│   │   ├── Http/Controllers/Api/V1/{Admin,Public}/
│   │   ├── Http/Requests/Api/V1/
│   │   ├── Http/Resources/Api/V1/
│   │   ├── Jobs/
│   │   ├── Models/
│   │   ├── Policies/
│   │   ├── Services/
│   │   └── Support/
│   ├── database/{factories,migrations,seeders}/
│   ├── routes/
│   ├── storage/
│   ├── tests/{Feature/Api/V1/Admin,Feature/Api/V1/Public,Unit}/
│   ├── Dockerfile
│   └── composer.json
├── frontend/                        # One React SPA
│   ├── public/
│   ├── src/
│   │   ├── app/
│   │   ├── assets/
│   │   ├── components/{common,forms,ui}/
│   │   ├── features/{auth,dashboard,profile,focus-areas,projects,project-categories,technologies,experiences,educations,certifications,media,featured-articles,navigation,settings,messages}/
│   │   ├── layouts/{public,admin}/
│   │   ├── pages/{public,admin}/
│   │   ├── routes/
│   │   ├── services/
│   │   ├── hooks/
│   │   ├── lib/
│   │   ├── types/
│   │   └── styles/
│   ├── Dockerfile
│   └── package.json
├── infra/
│   ├── docker/{nginx,php,postgres,redis}/
│   │   ├── compose.yml
│   │   └── compose.dev.yml
│   ├── monitoring/
│   │   ├── prometheus/{rules,prometheus.yml}
│   │   ├── grafana/{provisioning,dashboards}
│   │   └── compose.yml
│   └── scripts/
├── docs/{01-product,02-architecture,03-database,04-api,05-operations,06-roadmap}/
├── .env.example
├── .gitignore
├── Makefile
└── README.md
```

Rules:
- Keep Laravel framework conventions.
- Keep public/admin layouts separate.
- Keep feature API calls out of page components.
- Do not commit dependencies, build output, runtime uploads, or secrets.
- Compose and monitoring configs live under `infra/`.
