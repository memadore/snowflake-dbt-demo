include .env
export

dbt-build:
	uv run dbt build

dbt-build-diff:
	uv run dbt build --select state:modified+ --defer --state ./.states/dev

dbt-clone:
	uv run dbt clone --select state:modified+,config.materialized:incremental,state:old --state ./.states/dev

dbt-compile:
	uv run dbt compile

dbt-debug:
	uv run dbt debug

dbt-deps:
	uv run dbt deps

dbt-docs:
	uv run dbt docs generate && uv run dbt docs serve

dbt-project-evaluator:
	export DBT_PROJECT_EVALUATOR_ENABLED=true &&\
	export DBT_PROJECT_EVALUATOR_SEVERITY=error &&\
	uv run dbt build --select package:dbt_project_evaluator

dbt-run:
	uv run dbt run

dbt-snapshot:
	uv run dbt snapshot

dbt-sync-states:
	mkdir -p .states
	snow --config-file config.toml stage copy snow://dbt/snowflake_dbt_demo/versions/LAST/target/manifest.json --database demo_dev_analytics --schema internal ./.states/dev
	snow --config-file config.toml stage copy snow://dbt/snowflake_dbt_demo/versions/LAST/target/manifest.json --database demo_uat_analytics --schema internal ./.states/uat
	snow --config-file config.toml stage copy snow://dbt/snowflake_dbt_demo/versions/LAST/target/manifest.json --database demo_prod_analytics --schema internal ./.states/prod

dbt-test:
	uv run dbt test

pre-commit-all-files:
	pre-commit run --all-files
