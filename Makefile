include .env
export

dbt-build:
	uv run dbt build

dbt-compile:
	uv run dbt compile

dbt-deps:
	uv run dbt deps

dbt-project-evaluator:
	uv run dbt build --select package:dbt_project_evaluator

dbt-test:
	uv run dbt test

pre-commit-all-files:
	pre-commit run --all-files
