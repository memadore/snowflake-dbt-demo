-- DATABASE
-- ANALYTICS
USE ROLE SYSADMIN;
CREATE
OR REPLACE DATABASE DEMO_TPCDS;
GRANT OWNERSHIP ON DATABASE DEMO_TPCDS TO ROLE PLATFORM_ADMIN;
USE DATABASE DEMO_TPCDS;
USE SCHEMA PUBLIC;
CREATE TABLE DBGEN_VERSION (
    DV_VERSION varchar(16),
    DV_CREATE_DATE date,
    DV_CREATE_TIME time,
    DV_CMDLINE_ARGS varchar(200)
);
CREATE TABLE CUSTOMER_ADDRESS (
    CA_ADDRESS_SK integer NOT NULL,
    CA_ADDRESS_ID char(16) NOT NULL,
    CA_STREET_NUMBER char(10),
    CA_STREET_NAME varchar(60),
    CA_STREET_TYPE char(15),
    CA_SUITE_NUMBER char(10),
    CA_CITY varchar(60),
    CA_COUNTY varchar(30),
    CA_STATE char(2),
    CA_ZIP char(10),
    CA_COUNTRY varchar(20),
    CA_GMT_OFFSET decimal(5, 2),
    CA_LOCATION_TYPE char(20),
    PRIMARY KEY (CA_ADDRESS_SK)
);
CREATE TABLE CUSTOMER_DEMOGRAPHICS (
    CD_DEMO_SK integer NOT NULL,
    CD_GENDER char(1),
    CD_MARITAL_STATUS char(1),
    CD_EDUCATION_STATUS char(20),
    CD_PURCHASE_ESTIMATE integer,
    CD_CREDIT_RATING char(10),
    CD_DEP_COUNT integer,
    CD_DEP_EMPLOYED_COUNT integer,
    CD_DEP_COLLEGE_COUNT integer,
    PRIMARY KEY (CD_DEMO_SK)
);
CREATE TABLE DATE_DIM (
    D_DATE_SK integer NOT NULL,
    D_DATE_ID char(16) NOT NULL,
    D_DATE date NOT NULL,
    D_MONTH_SEQ integer,
    D_WEEK_SEQ integer,
    D_QUARTER_SEQ integer,
    D_YEAR integer,
    D_DOW integer,
    D_MOY integer,
    D_DOM integer,
    D_QOY integer,
    D_FY_YEAR integer,
    D_FY_QUARTER_SEQ integer,
    D_FY_WEEK_SEQ integer,
    D_DAY_NAME char(9),
    D_QUARTER_NAME char(6),
    D_HOLIDAY char(1),
    D_WEEKEND char(1),
    D_FOLLOWING_HOLIDAY char(1),
    D_FIRST_DOM integer,
    D_LAST_DOM integer,
    D_SAME_DAY_LY integer,
    D_SAME_DAY_LQ integer,
    D_CURRENT_DAY char(1),
    D_CURRENT_WEEK char(1),
    D_CURRENT_MONTH char(1),
    D_CURRENT_QUARTER char(1),
    D_CURRENT_YEAR char(1),
    PRIMARY KEY (D_DATE_SK)
);
CREATE TABLE WAREHOUSE (
    W_WAREHOUSE_SK integer NOT NULL,
    W_WAREHOUSE_ID char(16) NOT NULL,
    W_WAREHOUSE_NAME varchar(20),
    W_WAREHOUSE_SQ_FT integer,
    W_STREET_NUMBER char(10),
    W_STREET_NAME varchar(60),
    W_STREET_TYPE char(15),
    W_SUITE_NUMBER char(10),
    W_CITY varchar(60),
    W_COUNTY varchar(30),
    W_STATE char(2),
    W_ZIP char(10),
    W_COUNTRY varchar(20),
    W_GMT_OFFSET decimal(5, 2),
    PRIMARY KEY (W_WAREHOUSE_SK)
);
CREATE TABLE SHIP_MODE (
    SM_SHIP_MODE_SK integer NOT NULL,
    SM_SHIP_MODE_ID char(16) NOT NULL,
    SM_TYPE char(30),
    SM_CODE char(10),
    SM_CARRIER char(20),
    SM_CONTRACT char(20),
    PRIMARY KEY (SM_SHIP_MODE_SK)
);
CREATE TABLE TIME_DIM (
    T_TIME_SK integer NOT NULL,
    T_TIME_ID char(16) NOT NULL,
    T_TIME integer NOT NULL,
    T_HOUR integer,
    T_MINUTE integer,
    T_SECOND integer,
    T_AM_PM char(2),
    T_SHIFT char(20),
    T_SUB_SHIFT char(20),
    T_MEAL_TIME char(20),
    PRIMARY KEY (T_TIME_SK)
);
CREATE TABLE REASON (
    R_REASON_SK integer NOT NULL,
    R_REASON_ID char(16) NOT NULL,
    R_REASON_DESC char(100),
    PRIMARY KEY (R_REASON_SK)
);
CREATE TABLE INCOME_BAND (
    IB_INCOME_BAND_SK integer NOT NULL,
    IB_LOWER_BOUND integer,
    IB_UPPER_BOUND integer,
    PRIMARY KEY (IB_INCOME_BAND_SK)
);
CREATE TABLE ITEM (
    I_ITEM_SK integer NOT NULL,
    I_ITEM_ID char(16) NOT NULL,
    I_REC_START_DATE date,
    I_REC_END_DATE date,
    I_ITEM_DESC varchar(200),
    I_CURRENT_PRICE decimal(7, 2),
    I_WHOLESALE_COST decimal(7, 2),
    I_BRAND_ID integer,
    I_BRAND char(50),
    I_CLASS_ID integer,
    I_CLASS char(50),
    I_CATEGORY_ID integer,
    I_CATEGORY char(50),
    I_MANUFACT_ID integer,
    I_MANUFACT char(50),
    I_SIZE char(20),
    I_FORMULATION char(20),
    I_COLOR char(20),
    I_UNITS char(10),
    I_CONTAINER char(10),
    I_MANAGER_ID integer,
    I_PRODUCT_NAME char(50),
    PRIMARY KEY (I_ITEM_SK)
);
CREATE TABLE STORE (
    S_STORE_SK integer NOT NULL,
    S_STORE_ID char(16) NOT NULL,
    S_REC_START_DATE date,
    S_REC_END_DATE date,
    S_CLOSED_DATE_SK integer,
    S_STORE_NAME varchar(50),
    S_NUMBER_EMPLOYEES integer,
    S_FLOOR_SPACE integer,
    S_HOURS char(20),
    S_MANAGER varchar(40),
    S_MARKET_ID integer,
    S_GEOGRAPHY_CLASS varchar(100),
    S_MARKET_DESC varchar(100),
    S_MARKET_MANAGER varchar(40),
    S_DIVISION_ID integer,
    S_DIVISION_NAME varchar(50),
    S_COMPANY_ID integer,
    S_COMPANY_NAME varchar(50),
    S_STREET_NUMBER varchar(10),
    S_STREET_NAME varchar(60),
    S_STREET_TYPE char(15),
    S_SUITE_NUMBER char(10),
    S_CITY varchar(60),
    S_COUNTY varchar(30),
    S_STATE char(2),
    S_ZIP char(10),
    S_COUNTRY varchar(20),
    S_GMT_OFFSET decimal(5, 2),
    S_TAX_PRECENTAGE decimal(5, 2),
    PRIMARY KEY (S_STORE_SK)
);
CREATE TABLE CALL_CENTER (
    CC_CALL_CENTER_SK integer NOT NULL,
    CC_CALL_CENTER_ID char(16) NOT NULL,
    CC_REC_START_DATE date,
    CC_REC_END_DATE date,
    CC_CLOSED_DATE_SK integer,
    CC_OPEN_DATE_SK integer,
    CC_NAME varchar(50),
    CC_CLASS varchar(50),
    CC_EMPLOYEES integer,
    CC_SQ_FT integer,
    CC_HOURS char(20),
    CC_MANAGER varchar(40),
    CC_MKT_ID integer,
    CC_MKT_CLASS char(50),
    CC_MKT_DESC varchar(100),
    CC_MARKET_MANAGER varchar(40),
    CC_DIVISION integer,
    CC_DIVISION_NAME varchar(50),
    CC_COMPANY integer,
    CC_COMPANY_NAME char(50),
    CC_STREET_NUMBER char(10),
    CC_STREET_NAME varchar(60),
    CC_STREET_TYPE char(15),
    CC_SUITE_NUMBER char(10),
    CC_CITY varchar(60),
    CC_COUNTY varchar(30),
    CC_STATE char(2),
    CC_ZIP char(10),
    CC_COUNTRY varchar(20),
    CC_GMT_OFFSET decimal(5, 2),
    CC_TAX_PERCENTAGE decimal(5, 2),
    PRIMARY KEY (CC_CALL_CENTER_SK)
);
CREATE TABLE CUSTOMER (
    C_CUSTOMER_SK integer NOT NULL,
    C_CUSTOMER_ID char(16) NOT NULL,
    C_CURRENT_CDEMO_SK integer,
    C_CURRENT_HDEMO_SK integer,
    C_CURRENT_ADDR_SK integer,
    C_FIRST_SHIPTO_DATE_SK integer,
    C_FIRST_SALES_DATE_SK integer,
    C_SALUTATION char(10),
    C_FIRST_NAME char(20),
    C_LAST_NAME char(30),
    C_PREFERRED_CUST_FLAG char(1),
    C_BIRTH_DAY integer,
    C_BIRTH_MONTH integer,
    C_BIRTH_YEAR integer,
    C_BIRTH_COUNTRY varchar(20),
    C_LOGIN char(13),
    C_EMAIL_ADDRESS char(50),
    C_LAST_REVIEW_DATE char(10),
    PRIMARY KEY (C_CUSTOMER_SK)
);
CREATE TABLE WEB_SITE (
    WEB_SITE_SK integer NOT NULL,
    WEB_SITE_ID char(16) NOT NULL,
    WEB_REC_START_DATE date,
    WEB_REC_END_DATE date,
    WEB_NAME varchar(50),
    WEB_OPEN_DATE_SK integer,
    WEB_CLOSE_DATE_SK integer,
    WEB_CLASS varchar(50),
    WEB_MANAGER varchar(40),
    WEB_MKT_ID integer,
    WEB_MKT_CLASS varchar(50),
    WEB_MKT_DESC varchar(100),
    WEB_MARKET_MANAGER varchar(40),
    WEB_COMPANY_ID integer,
    WEB_COMPANY_NAME char(50),
    WEB_STREET_NUMBER char(10),
    WEB_STREET_NAME varchar(60),
    WEB_STREET_TYPE char(15),
    WEB_SUITE_NUMBER char(10),
    WEB_CITY varchar(60),
    WEB_COUNTY varchar(30),
    WEB_STATE char(2),
    WEB_ZIP char(10),
    WEB_COUNTRY varchar(20),
    WEB_GMT_OFFSET decimal(5, 2),
    WEB_TAX_PERCENTAGE decimal(5, 2),
    PRIMARY KEY (WEB_SITE_SK)
);
CREATE TABLE STORE_RETURNS (
    SR_RETURNED_DATE_SK integer,
    SR_RETURN_TIME_SK integer,
    SR_ITEM_SK integer NOT NULL,
    SR_CUSTOMER_SK integer,
    SR_CDEMO_SK integer,
    SR_HDEMO_SK integer,
    SR_ADDR_SK integer,
    SR_STORE_SK integer,
    SR_REASON_SK integer,
    SR_TICKET_NUMBER integer NOT NULL,
    SR_RETURN_QUANTITY integer,
    SR_RETURN_AMT decimal(7, 2),
    SR_RETURN_TAX decimal(7, 2),
    SR_RETURN_AMT_INC_TAX decimal(7, 2),
    SR_FEE decimal(7, 2),
    SR_RETURN_SHIP_COST decimal(7, 2),
    SR_REFUNDED_CASH decimal(7, 2),
    SR_REVERSED_CHARGE decimal(7, 2),
    SR_STORE_CREDIT decimal(7, 2),
    SR_NET_LOSS decimal(7, 2),
    PRIMARY KEY (SR_ITEM_SK, SR_TICKET_NUMBER)
);
CREATE TABLE HOUSEHOLD_DEMOGRAPHICS (
    HD_DEMO_SK integer NOT NULL,
    HD_INCOME_BAND_SK integer,
    HD_BUY_POTENTIAL char(15),
    HD_DEP_COUNT integer,
    HD_VEHICLE_COUNT integer,
    PRIMARY KEY (HD_DEMO_SK)
);
CREATE TABLE WEB_PAGE (
    WP_WEB_PAGE_SK integer NOT NULL,
    WP_WEB_PAGE_ID char(16) NOT NULL,
    WP_REC_START_DATE date,
    WP_REC_END_DATE date,
    WP_CREATION_DATE_SK integer,
    WP_ACCESS_DATE_SK integer,
    WP_AUTOGEN_FLAG char(1),
    WP_CUSTOMER_SK integer,
    WP_URL varchar(100),
    WP_TYPE char(50),
    WP_CHAR_COUNT integer,
    WP_LINK_COUNT integer,
    WP_IMAGE_COUNT integer,
    WP_MAX_AD_COUNT integer,
    PRIMARY KEY (WP_WEB_PAGE_SK)
);
CREATE TABLE PROMOTION (
    P_PROMO_SK integer NOT NULL,
    P_PROMO_ID char(16) NOT NULL,
    P_START_DATE_SK integer,
    P_END_DATE_SK integer,
    P_ITEM_SK integer,
    P_COST decimal(15, 2),
    P_RESPONSE_TARGET integer,
    P_PROMO_NAME char(50),
    P_CHANNEL_DMAIL char(1),
    P_CHANNEL_EMAIL char(1),
    P_CHANNEL_CATALOG char(1),
    P_CHANNEL_TV char(1),
    P_CHANNEL_RADIO char(1),
    P_CHANNEL_PRESS char(1),
    P_CHANNEL_EVENT char(1),
    P_CHANNEL_DEMO char(1),
    P_CHANNEL_DETAILS varchar(100),
    P_PURPOSE char(15),
    P_DISCOUNT_ACTIVE char(1),
    PRIMARY KEY (P_PROMO_SK)
);
CREATE TABLE CATALOG_PAGE (
    CP_CATALOG_PAGE_SK integer NOT NULL,
    CP_CATALOG_PAGE_ID char(16) NOT NULL,
    CP_START_DATE_SK integer,
    CP_END_DATE_SK integer,
    CP_DEPARTMENT varchar(50),
    CP_CATALOG_NUMBER integer,
    CP_CATALOG_PAGE_NUMBER integer,
    CP_DESCRIPTION varchar(100),
    CP_TYPE varchar(100),
    PRIMARY KEY (CP_CATALOG_PAGE_SK)
);
CREATE TABLE INVENTORY (
    INV_DATE_SK integer NOT NULL,
    INV_ITEM_SK integer NOT NULL,
    INV_WAREHOUSE_SK integer NOT NULL,
    INV_QUANTITY_ON_HAND integer,
    PRIMARY KEY (INV_DATE_SK, INV_ITEM_SK, INV_WAREHOUSE_SK)
);
CREATE TABLE CATALOG_RETURNS (
    CR_RETURNED_DATE_SK integer,
    CR_RETURNED_TIME_SK integer,
    CR_ITEM_SK integer NOT NULL,
    CR_REFUNDED_CUSTOMER_SK integer,
    CR_REFUNDED_CDEMO_SK integer,
    CR_REFUNDED_HDEMO_SK integer,
    CR_REFUNDED_ADDR_SK integer,
    CR_RETURNING_CUSTOMER_SK integer,
    CR_RETURNING_CDEMO_SK integer,
    CR_RETURNING_HDEMO_SK integer,
    CR_RETURNING_ADDR_SK integer,
    CR_CALL_CENTER_SK integer,
    CR_CATALOG_PAGE_SK integer,
    CR_SHIP_MODE_SK integer,
    CR_WAREHOUSE_SK integer,
    CR_REASON_SK integer,
    CR_ORDER_NUMBER integer NOT NULL,
    CR_RETURN_QUANTITY integer,
    CR_RETURN_AMOUNT decimal(7, 2),
    CR_RETURN_TAX decimal(7, 2),
    CR_RETURN_AMT_INC_TAX decimal(7, 2),
    CR_FEE decimal(7, 2),
    CR_RETURN_SHIP_COST decimal(7, 2),
    CR_REFUNDED_CASH decimal(7, 2),
    CR_REVERSED_CHARGE decimal(7, 2),
    CR_STORE_CREDIT decimal(7, 2),
    CR_NET_LOSS decimal(7, 2),
    PRIMARY KEY (CR_ITEM_SK, CR_ORDER_NUMBER)
);
CREATE TABLE WEB_RETURNS (
    WR_RETURNED_DATE_SK integer,
    WR_RETURNED_TIME_SK integer,
    WR_ITEM_SK integer NOT NULL,
    WR_REFUNDED_CUSTOMER_SK integer,
    WR_REFUNDED_CDEMO_SK integer,
    WR_REFUNDED_HDEMO_SK integer,
    WR_REFUNDED_ADDR_SK integer,
    WR_RETURNING_CUSTOMER_SK integer,
    WR_RETURNING_CDEMO_SK integer,
    WR_RETURNING_HDEMO_SK integer,
    WR_RETURNING_ADDR_SK integer,
    WR_WEB_PAGE_SK integer,
    WR_REASON_SK integer,
    WR_ORDER_NUMBER integer NOT NULL,
    WR_RETURN_QUANTITY integer,
    WR_RETURN_AMT decimal(7, 2),
    WR_RETURN_TAX decimal(7, 2),
    WR_RETURN_AMT_INC_TAX decimal(7, 2),
    WR_FEE decimal(7, 2),
    WR_RETURN_SHIP_COST decimal(7, 2),
    WR_REFUNDED_CASH decimal(7, 2),
    WR_REVERSED_CHARGE decimal(7, 2),
    WR_ACCOUNT_CREDIT decimal(7, 2),
    WR_NET_LOSS decimal(7, 2),
    PRIMARY KEY (WR_ITEM_SK, WR_ORDER_NUMBER)
);
CREATE TABLE WEB_SALES (
    WS_SOLD_DATE_SK integer,
    WS_SOLD_TIME_SK integer,
    WS_SHIP_DATE_SK integer,
    WS_ITEM_SK integer NOT NULL,
    WS_BILL_CUSTOMER_SK integer,
    WS_BILL_CDEMO_SK integer,
    WS_BILL_HDEMO_SK integer,
    WS_BILL_ADDR_SK integer,
    WS_SHIP_CUSTOMER_SK integer,
    WS_SHIP_CDEMO_SK integer,
    WS_SHIP_HDEMO_SK integer,
    WS_SHIP_ADDR_SK integer,
    WS_WEB_PAGE_SK integer,
    WS_WEB_SITE_SK integer,
    WS_SHIP_MODE_SK integer,
    WS_WAREHOUSE_SK integer,
    WS_PROMO_SK integer,
    WS_ORDER_NUMBER integer NOT NULL,
    WS_QUANTITY integer,
    WS_WHOLESALE_COST decimal(7, 2),
    WS_LIST_PRICE decimal(7, 2),
    WS_SALES_PRICE decimal(7, 2),
    WS_EXT_DISCOUNT_AMT decimal(7, 2),
    WS_EXT_SALES_PRICE decimal(7, 2),
    WS_EXT_WHOLESALE_COST decimal(7, 2),
    WS_EXT_LIST_PRICE decimal(7, 2),
    WS_EXT_TAX decimal(7, 2),
    WS_COUPON_AMT decimal(7, 2),
    WS_EXT_SHIP_COST decimal(7, 2),
    WS_NET_PAID decimal(7, 2),
    WS_NET_PAID_INC_TAX decimal(7, 2),
    WS_NET_PAID_INC_SHIP decimal(7, 2),
    WS_NET_PAID_INC_SHIP_TAX decimal(7, 2),
    WS_NET_PROFIT decimal(7, 2),
    PRIMARY KEY (WS_ITEM_SK, WS_ORDER_NUMBER)
);
CREATE TABLE CATALOG_SALES (
    CS_SOLD_DATE_SK integer,
    CS_SOLD_TIME_SK integer,
    CS_SHIP_DATE_SK integer,
    CS_BILL_CUSTOMER_SK integer,
    CS_BILL_CDEMO_SK integer,
    CS_BILL_HDEMO_SK integer,
    CS_BILL_ADDR_SK integer,
    CS_SHIP_CUSTOMER_SK integer,
    CS_SHIP_CDEMO_SK integer,
    CS_SHIP_HDEMO_SK integer,
    CS_SHIP_ADDR_SK integer,
    CS_CALL_CENTER_SK integer,
    CS_CATALOG_PAGE_SK integer,
    CS_SHIP_MODE_SK integer,
    CS_WAREHOUSE_SK integer,
    CS_ITEM_SK integer NOT NULL,
    CS_PROMO_SK integer,
    CS_ORDER_NUMBER integer NOT NULL,
    CS_QUANTITY integer,
    CS_WHOLESALE_COST decimal(7, 2),
    CS_LIST_PRICE decimal(7, 2),
    CS_SALES_PRICE decimal(7, 2),
    CS_EXT_DISCOUNT_AMT decimal(7, 2),
    CS_EXT_SALES_PRICE decimal(7, 2),
    CS_EXT_WHOLESALE_COST decimal(7, 2),
    CS_EXT_LIST_PRICE decimal(7, 2),
    CS_EXT_TAX decimal(7, 2),
    CS_COUPON_AMT decimal(7, 2),
    CS_EXT_SHIP_COST decimal(7, 2),
    CS_NET_PAID decimal(7, 2),
    CS_NET_PAID_INC_TAX decimal(7, 2),
    CS_NET_PAID_INC_SHIP decimal(7, 2),
    CS_NET_PAID_INC_SHIP_TAX decimal(7, 2),
    CS_NET_PROFIT decimal(7, 2),
    PRIMARY KEY (CS_ITEM_SK, CS_ORDER_NUMBER)
);
CREATE TABLE STORE_SALES (
    SS_SOLD_DATE_SK integer,
    SS_SOLD_TIME_SK integer,
    SS_ITEM_SK integer NOT NULL,
    SS_CUSTOMER_SK integer,
    SS_CDEMO_SK integer,
    SS_HDEMO_SK integer,
    SS_ADDR_SK integer,
    SS_STORE_SK integer,
    SS_PROMO_SK integer,
    SS_TICKET_NUMBER integer NOT NULL,
    SS_QUANTITY integer,
    SS_WHOLESALE_COST decimal(7, 2),
    SS_LIST_PRICE decimal(7, 2),
    SS_SALES_PRICE decimal(7, 2),
    SS_EXT_DISCOUNT_AMT decimal(7, 2),
    SS_EXT_SALES_PRICE decimal(7, 2),
    SS_EXT_WHOLESALE_COST decimal(7, 2),
    SS_EXT_LIST_PRICE decimal(7, 2),
    SS_EXT_TAX decimal(7, 2),
    SS_COUPON_AMT decimal(7, 2),
    SS_NET_PAID decimal(7, 2),
    SS_NET_PAID_INC_TAX decimal(7, 2),
    SS_NET_PROFIT decimal(7, 2),
    PRIMARY KEY (SS_ITEM_SK, SS_TICKET_NUMBER)
);
CREATE
OR REPLACE FILE FORMAT TPCDS_CSV_ZSTD TYPE
= 'CSV' FIELD_DELIMITER
= '|' COMPRESSION
= 'ZSTD' EMPTY_FIELD_AS_NULL
= TRUE NULL_IF
= ('');
COPY INTO CALL_CENTER
FROM
@~/call_center.csv.zst FILE_FORMAT = (FORMAT_NAME = TPCDS_CSV_ZSTD);
COPY INTO CATALOG_PAGE
FROM
@~/catalog_page.csv.zst FILE_FORMAT = (FORMAT_NAME = TPCDS_CSV_ZSTD);
COPY INTO CUSTOMER
FROM
@~/customer.csv.zst FILE_FORMAT = (FORMAT_NAME = TPCDS_CSV_ZSTD);
COPY INTO CUSTOMER_ADDRESS
FROM
@~/customer_address.csv.zst FILE_FORMAT = (FORMAT_NAME = TPCDS_CSV_ZSTD);
COPY INTO CUSTOMER_DEMOGRAPHICS
FROM
@~/customer_demographics.csv.zst FILE_FORMAT = (FORMAT_NAME = TPCDS_CSV_ZSTD);
COPY INTO DATE_DIM
FROM
@~/date_dim.csv.zst FILE_FORMAT = (FORMAT_NAME = TPCDS_CSV_ZSTD);
COPY INTO HOUSEHOLD_DEMOGRAPHICS
FROM
@~/household_demographics.csv.zst FILE_FORMAT = (FORMAT_NAME = TPCDS_CSV_ZSTD);
COPY INTO INCOME_BAND
FROM
@~/income_band.csv.zst FILE_FORMAT = (FORMAT_NAME = TPCDS_CSV_ZSTD);
COPY INTO ITEM
FROM
@~/item.csv.zst FILE_FORMAT = (FORMAT_NAME = TPCDS_CSV_ZSTD);
COPY INTO PROMOTION
FROM
@~/promotion.csv.zst FILE_FORMAT = (FORMAT_NAME = TPCDS_CSV_ZSTD);
COPY INTO REASON
FROM
@~/reason.csv.zst FILE_FORMAT = (FORMAT_NAME = TPCDS_CSV_ZSTD);
COPY INTO SHIP_MODE
FROM
@~/ship_mode.csv.zst FILE_FORMAT = (FORMAT_NAME = TPCDS_CSV_ZSTD);
COPY INTO STORE
FROM
@~/store.csv.zst FILE_FORMAT = (FORMAT_NAME = TPCDS_CSV_ZSTD);
COPY INTO TIME_DIM
FROM
@~/time_dim.csv.zst FILE_FORMAT = (FORMAT_NAME = TPCDS_CSV_ZSTD);
COPY INTO WAREHOUSE
FROM
@~/warehouse.csv.zst FILE_FORMAT = (FORMAT_NAME = TPCDS_CSV_ZSTD);
COPY INTO WEB_PAGE
FROM
@~/web_page.csv.zst FILE_FORMAT = (FORMAT_NAME = TPCDS_CSV_ZSTD);
COPY INTO WEB_SITE
FROM
@~/web_site.csv.zst FILE_FORMAT = (FORMAT_NAME = TPCDS_CSV_ZSTD);
COPY INTO CATALOG_RETURNS
FROM
@~/catalog_returns.csv.zst FILE_FORMAT = (FORMAT_NAME = TPCDS_CSV_ZSTD);
COPY INTO CATALOG_SALES
FROM
@~/catalog_sales.csv.zst FILE_FORMAT = (FORMAT_NAME = TPCDS_CSV_ZSTD);
COPY INTO INVENTORY
FROM
@~/inventory.csv.zst FILE_FORMAT = (FORMAT_NAME = TPCDS_CSV_ZSTD);
COPY INTO STORE_RETURNS
FROM
@~/store_returns.csv.zst FILE_FORMAT = (FORMAT_NAME = TPCDS_CSV_ZSTD);
COPY INTO STORE_SALES
FROM
@~/store_sales.csv.zst FILE_FORMAT = (FORMAT_NAME = TPCDS_CSV_ZSTD);
COPY INTO WEB_RETURNS
FROM
@~/web_returns.csv.zst FILE_FORMAT = (FORMAT_NAME = TPCDS_CSV_ZSTD);
COPY INTO WEB_SALES
FROM
@~/web_sales.csv.zst FILE_FORMAT = (FORMAT_NAME = TPCDS_CSV_ZSTD);
COPY INTO DBGEN_VERSION
FROM
@~/dbgen_version.csv.zst FILE_FORMAT = (FORMAT_NAME = TPCDS_CSV_ZSTD);
