use secondary roles all
;

-- USERS
use role securityadmin
;
CREATE
OR REPLACE USER "GITHUB@DEMO.LOCAL" TYPE = SERVICE WORKLOAD_IDENTITY = (
    TYPE = OIDC ISSUER = 'https://token.actions.githubusercontent.com' SUBJECT = 'repo:memadore/snowflake-dbt-demo'
);

-- RBAC
use role securityadmin
;
CREATE OR REPLACE ROLE PLATFORM_ADMIN;
grant role platform_admin
to role sysadmin
;

CREATE OR REPLACE ROLE DEMO_ADMIN;
grant role demo_admin
to role platform_admin
;

CREATE OR REPLACE ROLE DEMO_DATA_DEVELOPER;
grant role demo_data_developer
to user "GITHUB@DEMO.LOCAL"
;
grant role demo_data_developer
to role demo_admin
;

CREATE OR REPLACE ROLE DEMO_DATA_ANALYST;
grant role demo_data_analyst
to role demo_data_developer
;

CREATE OR REPLACE ROLE DEMO_DATA_VIEWER;
grant role demo_data_viewer
to role demo_data_analyst
;

-- - WAREHOUSES
use role sysadmin
;
create or replace warehouse platform_admin_xs
with auto_suspend = 60
initially_suspended = true
;
grant ownership
on warehouse platform_admin_xs
to role platform_admin
;

create or replace warehouse demo_transform_xs
with auto_suspend = 60
initially_suspended = true
;
grant ownership
on warehouse demo_transform_xs
to role demo_admin
;

create or replace warehouse demo_exploration_xs
with auto_suspend = 60
initially_suspended = true
;
grant ownership
on warehouse demo_exploration_xs
to role demo_admin
;

create or replace warehouse demo_reporting_xs
with auto_suspend = 60
initially_suspended = true
;
grant ownership
on warehouse demo_reporting_xs
to role demo_admin
;

use role securityadmin
;
grant usage
on warehouse platform_admin_xs
to user "GITHUB@DEMO.LOCAL"
;
grant usage
on warehouse demo_transform_xs
to role demo_data_developer
;
grant usage
on warehouse demo_exploration_xs
to role demo_data_analyst
;
grant usage
on warehouse demo_reporting_xs
to role demo_data_viewer
;

-- - DATABASE
use role sysadmin
;
create or replace database demo_dev_analytics
;
grant ownership
on database demo_dev_analytics
to role platform_admin
;
DROP SCHEMA DEMO_DEV_ANALYTICS.PUBLIC;
create or replace schema demo_dev_analytics.staging
;
grant ownership
on schema demo_dev_analytics.staging
to role demo_admin
;
create or replace schema demo_dev_analytics.intermediate
;
grant ownership
on schema demo_dev_analytics.intermediate
to role demo_admin
;
create or replace schema demo_dev_analytics.mart
;
grant ownership
on schema demo_dev_analytics.mart
to role demo_admin
;
create or replace schema demo_dev_analytics.reports
;
grant ownership
on schema demo_dev_analytics.reports
to role demo_admin
;
create or replace schema demo_dev_analytics.seeds
;
grant ownership
on schema demo_dev_analytics.seeds
to role demo_admin
;
create or replace schema demo_dev_analytics.snapshots
;
grant ownership
on schema demo_dev_analytics.snapshots
to role demo_admin
;
create or replace schema demo_dev_analytics.internal
;
grant ownership
on schema demo_dev_analytics.internal
to role demo_admin
;
create or replace schema demo_dev_analytics.metadata
;
grant ownership
on schema demo_dev_analytics.metadata
to role demo_admin
;
create or replace schema demo_dev_analytics.workspace
;
grant ownership
on schema demo_dev_analytics.workspace
to role demo_admin
;

create or replace database role demo_dev_analytics.admin
;
grant all privileges
on database demo_dev_analytics
to database role demo_dev_analytics.admin
;
grant all privileges
on all schemas in database demo_dev_analytics
to database role demo_dev_analytics.admin
;
grant all privileges
on future schemas in database demo_dev_analytics
to database role demo_dev_analytics.admin
;

create or replace database role demo_dev_analytics.data_developer
;
grant database role demo_dev_analytics.data_developer
to database role demo_dev_analytics.admin
;
grant usage, create schema, monitor
on database demo_dev_analytics
to database role demo_dev_analytics.data_developer
;
grant
    usage,
    monitor,
    create temporary table,
    create tag,
    create pipe,
    create procedure,
    create materialized view,
    create table,
    create file format,
    create stage,
    create task,
    create function,
    create external table,
    create sequence,
    create view,
    create stream,
    create dynamic table
on all schemas in database demo_dev_analytics
to database role demo_dev_analytics.data_developer
;
grant all privileges
on schema demo_dev_analytics.internal
to database role demo_dev_analytics.data_developer
;

create or replace database role demo_dev_analytics.data_analyst
;
grant database role demo_dev_analytics.data_analyst
to database role demo_dev_analytics.data_developer
;
grant usage
on database demo_dev_analytics
to database role demo_dev_analytics.data_analyst
;
grant usage
on schema demo_dev_analytics.staging
to database role demo_dev_analytics.data_analyst
;
grant select
on all tables in schema demo_dev_analytics.staging
to database role demo_dev_analytics.data_analyst
;
grant select
on future tables in schema demo_dev_analytics.staging
to database role demo_dev_analytics.data_analyst
;
grant select
on all views in schema demo_dev_analytics.staging
to database role demo_dev_analytics.data_analyst
;
grant select
on future views in schema demo_dev_analytics.staging
to database role demo_dev_analytics.data_analyst
;
grant usage
on schema demo_dev_analytics.intermediate
to database role demo_dev_analytics.data_analyst
;
grant select
on all tables in schema demo_dev_analytics.intermediate
to database role demo_dev_analytics.data_analyst
;
grant select
on future tables in schema demo_dev_analytics.intermediate
to database role demo_dev_analytics.data_analyst
;
grant select
on all views in schema demo_dev_analytics.intermediate
to database role demo_dev_analytics.data_analyst
;
grant select
on future views in schema demo_dev_analytics.intermediate
to database role demo_dev_analytics.data_analyst
;
grant usage
on schema demo_dev_analytics.mart
to database role demo_dev_analytics.data_analyst
;
grant select
on all tables in schema demo_dev_analytics.mart
to database role demo_dev_analytics.data_analyst
;
grant select
on future tables in schema demo_dev_analytics.mart
to database role demo_dev_analytics.data_analyst
;
grant select
on all views in schema demo_dev_analytics.mart
to database role demo_dev_analytics.data_analyst
;
grant select
on future views in schema demo_dev_analytics.mart
to database role demo_dev_analytics.data_analyst
;
grant usage
on schema demo_dev_analytics.seeds
to database role demo_dev_analytics.data_analyst
;
grant select
on all tables in schema demo_dev_analytics.seeds
to database role demo_dev_analytics.data_analyst
;
grant select
on future tables in schema demo_dev_analytics.seeds
to database role demo_dev_analytics.data_analyst
;
grant select
on all views in schema demo_dev_analytics.seeds
to database role demo_dev_analytics.data_analyst
;
grant select
on future views in schema demo_dev_analytics.seeds
to database role demo_dev_analytics.data_analyst
;

create or replace database role demo_dev_analytics.data_viewer
;
grant database role demo_dev_analytics.data_viewer
to database role demo_dev_analytics.data_analyst
;
grant usage
on database demo_dev_analytics
to database role demo_dev_analytics.data_viewer
;
grant usage
on schema demo_dev_analytics.mart
to database role demo_dev_analytics.data_viewer
;
grant select
on all tables in schema demo_dev_analytics.mart
to database role demo_dev_analytics.data_viewer
;
grant select
on future tables in schema demo_dev_analytics.mart
to database role demo_dev_analytics.data_viewer
;
grant select
on all views in schema demo_dev_analytics.mart
to database role demo_dev_analytics.data_viewer
;
grant select
on future views in schema demo_dev_analytics.mart
to database role demo_dev_analytics.data_viewer
;

use role securityadmin
;
grant database role demo_dev_analytics.data_developer
to role demo_data_developer
;
grant database role demo_dev_analytics.admin
to role demo_admin
;

use role sysadmin
;
create or replace database demo_uat_analytics
clone demo_dev_analytics
;
create or replace database demo_prod_analytics
clone demo_dev_analytics
;

use role securityadmin
;
grant database role demo_uat_analytics.data_analyst
to role demo_data_analyst
;
grant database role demo_prod_analytics.data_viewer
to role demo_data_viewer
;
