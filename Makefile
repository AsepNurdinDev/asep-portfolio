# Target commands; Compose files are created in Phase 1.
APP_COMPOSE=infra/docker/compose.yml
MONITORING_COMPOSE=infra/monitoring/compose.yml
APP_PROJECT=portfolio-app
MONITORING_PROJECT=portfolio-monitoring

.PHONY: app-config app-up app-down app-logs app-ps monitoring-config monitoring-up monitoring-down monitoring-logs
app-config:
	docker compose -f $(APP_COMPOSE) -p $(APP_PROJECT) config
app-up:
	docker compose -f $(APP_COMPOSE) -p $(APP_PROJECT) up -d --build
app-down:
	docker compose -f $(APP_COMPOSE) -p $(APP_PROJECT) down
app-logs:
	docker compose -f $(APP_COMPOSE) -p $(APP_PROJECT) logs -f
app-ps:
	docker compose -f $(APP_COMPOSE) -p $(APP_PROJECT) ps
monitoring-config:
	docker compose -f $(MONITORING_COMPOSE) -p $(MONITORING_PROJECT) config
monitoring-up:
	docker compose -f $(MONITORING_COMPOSE) -p $(MONITORING_PROJECT) up -d
monitoring-down:
	docker compose -f $(MONITORING_COMPOSE) -p $(MONITORING_PROJECT) down
monitoring-logs:
	docker compose -f $(MONITORING_COMPOSE) -p $(MONITORING_PROJECT) logs -f
