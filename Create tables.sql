CREATE SCHEMA memory.final

CREATE TABLE memory.final.HUB_CUSTOMERS (
    H_Hash_Customer      VARCHAR(32)   NOT NULL, 
    Customer_Key         BIGINT        NOT NULL,
    H_Load_Source        VARCHAR(50)   NOT NULL, 
    H_Load_Date          TIMESTAMP     NOT NULL DEFAULT CURRENT_TIMESTAMP, 
    CONSTRAINT pk_customers PRIMARY KEY (H_Hash_Customer)
);

CREATE TABLE memory.final.HUB_ORDERS (
    H_Hash_Order      VARCHAR(32)   NOT NULL, 
    Order_Key         BIGINT        NOT NULL,
    H_Load_Source    VARCHAR(50)   NOT NULL, 
    H_Load_Date      TIMESTAMP     NOT NULL DEFAULT CURRENT_TIMESTAMP, 
    CONSTRAINT pk_orders PRIMARY KEY (H_Hash_Order)
);

CREATE TABLE memory.final.HUB_PARTS_SUPPLIERS (
    H_Hash_Part_Supplier  VARCHAR(32)   NOT NULL, 
    Supplier_Key          BIGINT        NOT NULL,
    Part_Key         BIGINT        NOT NULL,
    H_Load_Source    VARCHAR(50)   NOT NULL, 
    H_Load_Date      TIMESTAMP     NOT NULL DEFAULT CURRENT_TIMESTAMP, 
    CONSTRAINT pk_parts_suppliers PRIMARY KEY (H_Hash_Part_Supplier)
);

CREATE TABLE memory.final.HUB_NATIONS (
    H_Hash_Nation        VARCHAR(32)   NOT NULL, 
    Nation_Key           BIGINT        NOT NULL,
    H_Load_Source        VARCHAR(50)   NOT NULL, 
    H_Load_Date          TIMESTAMP     NOT NULL DEFAULT CURRENT_TIMESTAMP, 
    CONSTRAINT pk_nations PRIMARY KEY (H_Hash_Nation)
);

CREATE TABLE memory.final.HUB_REGIONS (
    H_Hash_Region        VARCHAR(32)   NOT NULL, 
    Region_Key           BIGINT        NOT NULL,
    H_Load_Source        VARCHAR(50)   NOT NULL, 
    H_Load_Date          TIMESTAMP     NOT NULL DEFAULT CURRENT_TIMESTAMP, 
    CONSTRAINT pk_regions PRIMARY KEY (H_Hash_Region)
);

CREATE TABLE memory.final.LINK_CUSTOMER_ORDER (
    L_Customer_Order_HK   VARCHAR(32)   NOT NULL, 
    H_Customer_HK         VARCHAR(32)   NOT NULL,
    H_Order_HK            VARCHAR(32)   NOT NULL,
    H_Load_Source    VARCHAR(50)   NOT NULL, 
    H_Load_Date      TIMESTAMP     NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT pk_customer_order PRIMARY KEY (L_Customer_Order_HK)
);

CREATE TABLE memory.final.LINK_ORDER_PART (
    L_Order_Part_HK      VARCHAR(32)   NOT NULL, 
    H_Order_HK           VARCHAR(32)   NOT NULL,
    H_Part_Supplier_HK   VARCHAR(32)   NOT NULL,
    H_Load_Source    VARCHAR(50)   NOT NULL, 
    H_Load_Date      TIMESTAMP     NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT pk_order_part PRIMARY KEY (L_Order_Part_HK)
);

CREATE TABLE memory.final.LINK_CUSTOMER_NATION (
    L_Customer_Nation_HK   VARCHAR(32)   NOT NULL, 
    H_Customer_HK          VARCHAR(32)   NOT NULL,
    H_Nation_HK            VARCHAR(32)   NOT NULL,
    H_Load_Source    VARCHAR(50)   NOT NULL, 
    H_Load_Date      TIMESTAMP     NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT pk_customer_nation PRIMARY KEY (L_Customer_Nation_HK)
);

CREATE TABLE memory.final.LINK_PART_SUPPLIER_NATION (
    L_Part_Supplier_Nation_HK   VARCHAR(32)   NOT NULL, 
    H_Part_Supplier_HK          VARCHAR(32)   NOT NULL,
    H_Nation_HK            VARCHAR(32)   NOT NULL,
    H_Load_Source    VARCHAR(50)   NOT NULL, 
    H_Load_Date      TIMESTAMP     NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT pk_part_supplier_nation PRIMARY KEY (L_Part_Supplier_Nation_HK)
);

CREATE TABLE memory.final.LINK_NATION_REGION (
    L_Nation_Region_HK   VARCHAR(32)   NOT NULL, 
    H_Region_HK          VARCHAR(32)   NOT NULL,
    H_Nation_HK            VARCHAR(32)   NOT NULL,
    H_Load_Source    VARCHAR(50)   NOT NULL, 
    H_Load_Date      TIMESTAMP     NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT pk_nation_region PRIMARY KEY (L_Nation_Region_HK)
);

CREATE TABLE memory.final.SATELITE_CUSTOMER_CONTACT (
    H_Customer_HK VARCHAR(32) NOT NULL,
    Load_Date TIMESTAMP NOT NULL,
    Customer_Name VARCHAR(25) NOT NULL,
    Address VARCHAR(40) NOT NULL,
    Phone VARCHAR(15) NOT NULL,
    Hash_Diff VARCHAR,
    Load_Source TEXT,
    CONSTRAINT pk_customer_contact PRIMARY KEY (H_Customer_HK, Load_Date)
);

CREATE TABLE memory.final.SATELITE_CUSTOMER_ACCOUNT (
    H_Customer_HK VARCHAR(32) NOT NULL,
    Load_Date TIMESTAMP NOT NULL,
    Account_Balance Double NOT NULL,
    Hash_Diff VARCHAR,
    Load_Source TEXT,
    CONSTRAINT pk_customer_account PRIMARY KEY (H_Customer_HK, Load_Date)
);

CREATE TABLE memory.final.SATELITE_PART_SUPPLIER_STOCK (
    H_Part_Supplier_HK VARCHAR(32) NOT NULL,
    Load_Date TIMESTAMP NOT NULL,
    Available_Quantity VARCHAR(40) NOT NULL,
    Supply_Cost VARCHAR(15) NOT NULL,
    Hash_Diff VARCHAR,
    Load_Source TEXT,
    CONSTRAINT pk_part_supplier_stock PRIMARY KEY (H_Part_Supplier_HK, Load_Date)
);

CREATE TABLE memory.final.SATELITE_PART_SUPPLIER_MANUFACTURER (
    H_Part_Supplier_HK VARCHAR(32) NOT NULL,
    Load_Date TIMESTAMP NOT NULL,
    Manufacturer VARCHAR(25) NOT NULL,
    Brand VARCHAR(10) NOT NULL,
    "Type" VARCHAR(25) NOT NULL,
    Hash_Diff VARCHAR,
    Load_Source TEXT,
    CONSTRAINT pk_part_supplier_manufacturer PRIMARY KEY (H_Part_Supplier_HK, Load_Date)
);

CREATE TABLE memory.final.SATELITE_PART_SUPPLIER_RETAIL (
    H_Part_Supplier_HK VARCHAR(32) NOT NULL,
    Load_Date TIMESTAMP NOT NULL,
    Size Integer NOT NULL,
    Container VARCHAR(10) NOT NULL,
    Retail_Price VARCHAR(25) NOT NULL,
    Hash_Diff VARCHAR,
    Load_Source TEXT,
    CONSTRAINT pk_part_supplier_retail PRIMARY KEY (H_Part_Supplier_HK, Load_Date)
);

CREATE TABLE memory.final.SATELITE_PART_SUPPLIER_INFO (
    H_Part_Supplier_HK VARCHAR(32) NOT NULL,
    Load_Date TIMESTAMP NOT NULL,    
    Supplier_Name VARCHAR(25) NOT NULL,
    Address VARCHAR(40) NOT NULL,
    Phone VARCHAR(15) NOT NULL,
    Hash_Diff VARCHAR,
    Load_Source TEXT,
    CONSTRAINT pk_part_supplier_info PRIMARY KEY (H_Part_Supplier_HK, Load_Date)
);

CREATE TABLE memory.final.SATELITE_PART_SUPPLIER_ACCOUNT (
    H_Part_Supplier_HK VARCHAR(32) NOT NULL,
    Load_Date TIMESTAMP NOT NULL,
    Account_Balance Double NOT NULL,
    Hash_Diff VARCHAR,
    Load_Source TEXT,
    CONSTRAINT pk_part_supplier_account PRIMARY KEY (H_Part_Supplier_HK, Load_Date)
);

CREATE TABLE memory.final.SATELITE_ORDER_PRIORITY (
    H_Order_HK      VARCHAR(32)   NOT NULL, 
    Load_Date TIMESTAMP NOT NULL,
    Order_Priority VARCHAR(15) NOT NULL,
    Ship_Priority Integer NOT NULL,
    Hash_Diff VARCHAR,
    Load_Source TEXT,
    CONSTRAINT pk_order_priority PRIMARY KEY (H_Order_HK, Load_Date)
);

CREATE TABLE memory.final.SATELITE_ORDER_INFO (
    H_Order_HK      VARCHAR(32)   NOT NULL, 
    Load_Date TIMESTAMP NOT NULL,
    Total_Price Double NOT NULL,
    Order_Date Date NOT NULL,
    Order_Clerk VARCHAR(15) NOT NULL,
    Hash_Diff VARCHAR,
    Load_Source TEXT,
    CONSTRAINT pk_order_info PRIMARY KEY (H_Order_HK, Load_Date)
);

CREATE TABLE memory.final.SATELITE_ORDER_PART_SHIPMENT (
    L_Order_Part_HK      VARCHAR(32)   NOT NULL, 
    Load_Date TIMESTAMP NOT NULL,
    Ship_Instruct VARCHAR(25) NOT NULL,
    Ship_Mode VARCHAR(10) NOT NULL,
    Ship_Date Date NOT NULL,
    Hash_Diff VARCHAR,
    Load_Source TEXT,
    CONSTRAINT pk_order_part_shipment  PRIMARY KEY (L_Order_Part_HK, Load_Date)
);

CREATE TABLE memory.final.SATELITE_ORDER_PART_PRICE (
    L_Order_Part_HK      VARCHAR(32)   NOT NULL, 
    Load_Date TIMESTAMP NOT NULL,
    Extended_Price Double NOT NULL,
    Discount Double NOT NULL,
    Tax Double NOT NULL,
    Receipt_Date Date NOT NULL,
    Hash_Diff VARCHAR,
    Load_Source TEXT,
    CONSTRAINT pk_order_part_price  PRIMARY KEY (L_Order_Part_HK, Load_Date)
);

CREATE TABLE memory.final.SATELITE_ORDER_PART_INFO (
    L_Order_Part_HK      VARCHAR(32)   NOT NULL, 
    Load_Date TIMESTAMP NOT NULL,
    Line_Number Integer NOT NULL,
    Quantity Double NOT NULL,
    Return_Flag VARCHAR(1) NOT NULL,
    Line_Status VARCHAR(1) NOT NULL,
    Commit_Date Date NOT NULL,
    Hash_Diff VARCHAR,
    Load_Source TEXT,
    CONSTRAINT pk_order_part_info PRIMARY KEY (L_Order_Part_HK, Load_Date)
);

CREATE TABLE memory.final.SATELITE_NATION_REGION_INFO (
    L_Nation_Region_HK   VARCHAR(32)   NOT NULL, 
    Load_Date TIMESTAMP NOT NULL,
    Nation_Name VARCHAR(1) NOT NULL,
    Region_name VARCHAR(1) NOT NULL,
    Hash_Diff VARCHAR,
    Load_Source TEXT,
    CONSTRAINT pk_nation_region_info PRIMARY KEY (L_Nation_Region_HK, Load_Date)
);

INSERT INTO memory.final.HUB_CUSTOMERS
SELECT DISTINCT
    to_hex(md5(cast(C_CUSTKEY AS varchar))) AS H_Hash_Customer,
    custkey                         AS Customer_Key,
    'TPC-H'                         AS H_Load_Source,
    current_timestamp               AS H_Load_Date
FROM CUSTOMER;

INSERT INTO memory.final.HUB_ORDERS
SELECT DISTINCT
    to_hex(md5(cast(O_ORDERKEY AS varchar))) AS H_Hash_Order,
    orderkey                         AS Order_Key,
    'TPC-H',
    current_timestamp
FROM ORDERS;

INSERT INTO memory.final.HUB_PARTS_SUPPLIERS
SELECT DISTINCT
    to_hex(md5(concat_ws('|', partkey, suppkey)))   AS H_Hash_Part_Supplier,
    suppkey                                 AS Supplier_Key,
    partkey                                 AS Part_Key,
    'TPC-H',
    current_timestamp
FROM PARTSUPP;

INSERT INTO memory.final.HUB_NATIONS
SELECT DISTINCT
    to_hex(md5(cast(nationkey AS varchar))) AS H_Hash_Nation,
    nationkey                       AS Nation_Key,
    'TPC-H',
    current_timestamp
FROM NATION;

INSERT INTO memory.final.HUB_REGIONS
SELECT DISTINCT
    to_hex(md5(cast(regionkey AS varchar))) AS H_Hash_Region,
    regionkey                       AS Region_Key,
    'TPC-H',
    current_timestamp
FROM NATION;

INSERT INTO memory.final.LINK_CUSTOMER_ORDER
SELECT DISTINCT
    to_hex(md5(concat_ws('|', customerkey, orderkey))),
    to_hex(md5(cast(custkey AS varchar))),
    to_hex(md5(cast(orderkey AS varchar))),
    'TPC-H',
    current_timestamp
FROM ORDERS;

INSERT INTO memory.final.LINK_ORDER_PART
SELECT DISTINCT
    to_hex(md5(concat_ws('|', orderkey, partkey, suppkey))),
    to_hex(md5(cast(orderkey AS varchar))),
    to_hex(md5(concat_ws('|', psrtkey, suppkey))),
    'TPC-H',
    current_timestamp
FROM LINEITEM;

INSERT INTO memory.final.LINK_CUSTOMER_NATION
SELECT DISTINCT
    to_hex(md5(concat_ws('|', custkey, nationkey))),
    to_hex(md5(cast(custkey AS varchar))),
    to_hex(md5(cast(nationkey AS varchar))),
    'TPC-H',
    current_timestamp
FROM CUSTOMER;

INSERT INTO memory.final.LINK_PART_SUPPLIER_NATION
SELECT DISTINCT
    to_hex(md5(concat_ws('|', PS.partkey, PS.suppkey, S.nationkey))),
    to_hex(md5(concat_ws('|', PS.partkey, PS.suppkey))),
    to_hex(md5(cast(S.nationkey AS varchar))),
    'TPC-H',
    current_timestamp
FROM PARTSUPP PS
JOIN SUPPLIER S ON PS.PS_SUPPKEY = S.S_SUPPKEY;

INSERT INTO memory.final.LINK_NATION_REGION
SELECT DISTINCT
    to_hex(md5(concat_ws('|', nationkey, regionkey))),
    to_hex(md5(cast(regionkey AS varchar))),
    to_hex(md5(cast(nationkey AS varchar))),
    'TPC-H',
    current_timestamp
FROM NATION;

INSERT INTO memory.final.SATELITE_CUSTOMER_CONTACT
SELECT
    to_hex(md5(cast(custkey AS varchar))),
    current_timestamp,
    name,
    address,
    phone,
    to_hex(md5(concat_ws('|', name, address, phone))),
    'TPC-H'
FROM CUSTOMER;

INSERT INTO memory.final.SATELITE_CUSTOMER_ACCOUNT
SELECT
    to_hex(md5(cast(custkey AS varchar))),
    current_timestamp,
    acctbal,
    to_hex(md5(cast(acctbal AS varchar))),
    'TPC-H'
FROM CUSTOMER;

INSERT INTO memory.final.SATELITE_PART_SUPPLIER_STOCK
SELECT
    to_hex(md5(concat_ws('|', partkey, suppkey))),
    current_timestamp,
    availqty,
    supplycost,
    to_hex(md5(concat_ws('|', availqty, supplycost))),
    'TPC-H'
FROM PARTSUPP;

INSERT INTO memory.final.SATELITE_PART_SUPPLIER_MANUFACTURER
SELECT
    to_hex(md5(concat_ws('|', P.partkey, PS.suppkey))),
    current_timestamp,
    P.mfgr,
    P.brand,
    P.type,
    to_hex(md5(concat_ws('|', P.mfgr, P.brand, P.type))),
    'TPC-H'
FROM PART P
JOIN PARTSUPP PS ON P.partkey = PS.partkey;

INSERT INTO memory.final.SATELITE_PART_SUPPLIER_RETAIL
SELECT
    to_hex(md5(concat_ws('|', P.P_PARTKEY, PS.PS_SUPPKEY))),
    current_timestamp,
    P.size,
    P.container,
    P.retailprice,
    to_hex(md5(concat_ws('|', P.size, P.container, P.retailprice))),
    'TPC-H'
FROM PART P
JOIN PARTSUPP PS ON P.partkey = PS.partkey;

INSERT INTO memory.final.SATELITE_PART_SUPPLIER_INFO
SELECT
    to_hex(md5(concat_ws('|', PS.partkey, PS.suppkey))),
    current_timestamp,
    S.name,
    S.address,
    S.phone,
    to_hex(md5(concat_ws('|', S.name, S.address, S.phone))),
    'TPC-H'
FROM PARTSUPP PS
JOIN SUPPLIER S ON PS.suppkey = S.suppkey;

INSERT INTO memory.final.SATELITE_PART_SUPPLIER_ACCOUNT
SELECT
    to_hex(md5(concat_ws('|', PS.partkey, PS.suppkey))),
    current_timestamp,
    S.acctbal,
    to_hex(md5(cast(S.acctbal AS varchar))),
    'TPC-H'
FROM PARTSUPP PS
JOIN SUPPLIER S ON PS.suppkey = S.suppkey;

INSERT INTO memory.final.SATELITE_ORDER_PRIORITY
SELECT
    to_hex(md5(cast(orderkey AS varchar))),
    current_timestamp,
    orderpriority,
    shippriority,
    to_hex(md5(concat_ws('|', orderpriority, shippriority))),
    'TPC-H'
FROM ORDERS;

INSERT INTO memory.final.SATELITE_ORDER_INFO
SELECT
    to_hex(md5(cast(orderkey AS varchar))),
    current_timestamp,
    totalprice,
    orderdate,
    clerk,
    to_hex(md5(concat_ws('|', totalprice, orderdate, clerk))),
    'TPC-H'
FROM ORDERS;

INSERT INTO memory.final.SATELITE_ORDER_PART_SHIPMENT
SELECT
    to_hex(md5(concat_ws('|', orderkey, partkey, suppkey))),
    current_timestamp,
    shipinstruct,
    shipmode,
    shipdate,
    to_hex(md5(concat_ws('|', shipinstruct, shipmode, shipdate))),
    'TPC-H'
FROM LINEITEM;

INSERT INTO memory.final.SATELITE_ORDER_PART_PRICE
SELECT
    to_hex(md5(concat_ws('|', orderkey, partkey, suppkey))),
    current_timestamp,
    extendedprice,
    discount,
    tax,
    receiptdate,
    to_hex(md5(concat_ws('|', extendedprice, discount, tax, receiptdate))),
    'TPC-H'
FROM LINEITEM;

INSERT INTO memory.final.SATELITE_ORDER_PART_INFO
SELECT
    to_hex(md5(concat_ws('|', orderkey, partkey, suppkey))),
    current_timestamp,
    linenumber,
    quantity,
    returnflag,
    linestatus,
    commitdate,
    to_hex(md5(concat_ws('|',
        linenumber,
        quantity,
        returnflag,
        linestatus,
        commitdate
    ))),
    'TPC-H'
FROM LINEITEM;

INSERT INTO memory.final.SATELITE_NATION_REGION_INFO
SELECT
    to_hex(md5(concat_ws('|', N.nationkey, N.regionkey))),
    current_timestamp,
    N.name,
    R.name,
    to_hex(md5(concat_ws('|', N.name, R.name))),
    'TPC-H'
FROM NATION N
JOIN REGION R ON N.regionkey = R.regionkey;