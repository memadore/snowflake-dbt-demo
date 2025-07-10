include .env
export

dbt-build:
	uv run dbt build

dbt-compile:
	uv run dbt compile

dbt-deps:
	uv run dbt deps

dbt-docs:
	uv run dbt docs generate && uv run dbt docs serve

dbt-project-evaluator:
	export DBT_PROJECT_EVALUATOR_ENABLED=true && uv run dbt build --select package:dbt_project_evaluator

dbt-snapshot:
	uv run dbt snapshot

dbt-test:
	uv run dbt test

pre-commit-all-files:
	pre-commit run --all-files
