CREATE TABLE final.HUB_CUSTOMERS (
    H_Hash_Customer      VARCHAR(32)   NOT NULL, 
    Customer_name        VARCHAR(30)   NOT NULL, 
    Nation_Name          VARCHAR(25)   NOT NULL, 
    Region_Name          VARCHAR(25)   NOT NULL, 
    H_Load_Source        VARCHAR(50)   NOT NULL, 
    H_Load_Date          TIMESTAMP     NOT NULL DEFAULT CURRENT_TIMESTAMP, 
    CONSTRAINT pk_customers PRIMARY KEY (H_Hash_Customer)
);

CREATE TABLE final.HUB_ORDERS (
    H_Hash_Order      VARCHAR(32)   NOT NULL, 
    Order_date        DATE          NOT NULL, 
    Order_clerk       VARCHAR(15)   NOT NULL, 
    H_Load_Source    VARCHAR(50)   NOT NULL, 
    H_Load_Date      TIMESTAMP     NOT NULL DEFAULT CURRENT_TIMESTAMP, 
    CONSTRAINT pk_orders PRIMARY KEY (H_Hash_Order)
);

CREATE TABLE final.HUB_PARTS_SUPPLIERS (
    H_Hash_Part_Supplier  VARCHAR(32)   NOT NULL, 
    Supplier_name         VARCHAR(25)   NOT NULL, 
    Part_name             VARCHAR(55)   NOT NULL, 
    Nation_Name           VARCHAR(25)   NOT NULL, 
    Region_Name           VARCHAR(25)   NOT NULL, 
    H_Load_Source    VARCHAR(50)   NOT NULL, 
    H_Load_Date      TIMESTAMP     NOT NULL DEFAULT CURRENT_TIMESTAMP, 
    CONSTRAINT pk_parts_suppliers PRIMARY KEY (H_Hash_Part_Supplier)
);

CREATE TABLE final.LINK_CUSTOMER_ORDER (
    L_Customer_Order_HK   VARCHAR(32)   NOT NULL, 
    H_Customer_HK         VARCHAR(32)   NOT NULL,
    H_Order_HK            VARCHAR(32)   NOT NULL,
    H_Load_Source    VARCHAR(50)   NOT NULL, 
    H_Load_Date      TIMESTAMP     NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT pk_customer_order PRIMARY KEY (L_Customer_Order_HK)
);

CREATE TABLE final.LINK_ORDER_PART (
    L_Order_Part_HK      VARCHAR(32)   NOT NULL, 
    H_Order_HK           VARCHAR(32)   NOT NULL,
    H_Part_Supplier_HK   VARCHAR(32)   NOT NULL,
    H_Load_Source    VARCHAR(50)   NOT NULL, 
    H_Load_Date      TIMESTAMP     NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT pk_order_part PRIMARY KEY (L_Order_Part_HK)
);

CREATE TABLE final.SATELITE_CUSTOMER_CONTACT (
    H_Customer_HK VARCHAR(32) NOT NULL,
    Load_Date TIMESTAMP NOT NULL,
    Address VARCHAR(40),
    Phone VARCHAR(15)
    Hash_Diff TEXT,
    Load_Source TEXT,
    CONSTRAINT pk_customer_contact PRIMARY KEY (H_Customer_HK, Load_Date)
) DISTRIBUTED REPLICATED;

CREATE TABLE final.SATELITE_CUSTOMER_ACCOUNT (
    H_Customer_HK VARCHAR(32) NOT NULL,
    Load_Date TIMESTAMP NOT NULL,
    Account_Balance Double,
    Hash_Diff TEXT,
    Load_Source TEXT,
    CONSTRAINT pk_customer_account PRIMARY KEY (H_Customer_HK, Load_Date)
) DISTRIBUTED REPLICATED;

CREATE TABLE final.SATELITE_PART_SUPPLIER_STOCK (
    H_Part_Supplier_HK VARCHAR(32) NOT NULL,
    Load_Date TIMESTAMP NOT NULL,
    Available_Quantity VARCHAR(40),
    Supply_Cost VARCHAR(15)
    Hash_Diff TEXT,
    Load_Source TEXT,
    CONSTRAINT pk_PART_SUPPLIER_STOCK PRIMARY KEY (H_Part_Supplier_HK, Load_Date)
) DISTRIBUTED REPLICATED;

CREATE TABLE final.SATELITE_PART_SUPPLIER_MANUFACTURER (
    H_Part_Supplier_HK VARCHAR(32) NOT NULL,
    Load_Date TIMESTAMP NOT NULL,
    Manufacturer VARCHAR(25),
    Brand VARCHAR(10),
    "Type" VARCHAR(25),
    Hash_Diff TEXT,
    Load_Source TEXT,
    CONSTRAINT pk_PART_SUPPLIER_MANUFACTURER PRIMARY KEY (H_Part_Supplier_HK, Load_Date)
) DISTRIBUTED REPLICATED;

CREATE TABLE final.SATELITE_PART_SUPPLIER_RETAIL (
    H_Part_Supplier_HK VARCHAR(32) NOT NULL,
    Load_Date TIMESTAMP NOT NULL,
    Size Integer,
    Container VARCHAR(10),
    Retail_Price VARCHAR(25),
    Hash_Diff Double,
    Load_Source TEXT,
    CONSTRAINT pk_PART_SUPPLIER_RETAIL PRIMARY KEY (H_Part_Supplier_HK, Load_Date)
) DISTRIBUTED REPLICATED;

CREATE TABLE final.SATELITE_PART_SUPPLIER_SUPPLIER (
    H_Part_Supplier_HK VARCHAR(32) NOT NULL,
    Load_Date TIMESTAMP NOT NULL,
    Address VARCHAR(40),
    Phone VARCHAR(15),
    Hash_Diff Double,
    Load_Source TEXT,
    CONSTRAINT pk_PART_SUPPLIER_SUPPLIER PRIMARY KEY (H_Part_Supplier_HK, Load_Date)
) DISTRIBUTED REPLICATED;v

CREATE TABLE final.SATELITE_PART_SUPPLIER_ACCOUNT (
    H_Part_Supplier_HK VARCHAR(32) NOT NULL,
    Load_Date TIMESTAMP NOT NULL,
    Account_Balance Double,
    Hash_Diff Double,
    Load_Source TEXT,
    CONSTRAINT pk_PART_SUPPLIER_ACCOUNT PRIMARY KEY (H_Part_Supplier_HK, Load_Date)
) DISTRIBUTED REPLICATED;

CREATE TABLE final.SATELITE_ORDER_PRIORITY (
    H_Order_HK      VARCHAR(32)   NOT NULL, 
    Load_Date TIMESTAMP NOT NULL,
    Order_Priority VARCHAR(15),
    Ship_Priority Integer,
    Hash_Diff Double,
    Load_Source TEXT,
    CONSTRAINT pk_ORDER_PRIORITY PRIMARY KEY (H_Order_HK, Load_Date)
);

CREATE TABLE final.SATELITE_ORDER_INFO (
    H_Order_HK      VARCHAR(32)   NOT NULL, 
    Load_Date TIMESTAMP NOT NULL,
    Total_Price Double,
    Order_Date Date,
    Hash_Diff Double,
    Load_Source TEXT,
    CONSTRAINT pk_ORDER_INFO PRIMARY KEY (H_Order_HK, Load_Date)
);

CREATE TABLE final.SATELITE_ORDER_PART_SHIPMENT (
    L_Order_Part_HK      VARCHAR(32)   NOT NULL, 
    Load_Date TIMESTAMP NOT NULL,
    Ship_Instruct VARCHAR(25),
    Ship_Mode VARCHAR(10),
    Ship_Date Date,
    Hash_Diff Double,
    Load_Source TEXT,
    CONSTRAINT pk_ORDER_PART_SHIPMENT  PRIMARY KEY (L_Order_Part_HK, Load_Date)
);

CREATE TABLE final.SATELITE_ORDER_PART_PRICE (
    L_Order_Part_HK      VARCHAR(32)   NOT NULL, 
    Load_Date TIMESTAMP NOT NULL,
    Extended_Price Double,
    Discount Double,
    Tax Double,
    Receipt_Date Date,
    Hash_Diff Double,
    Load_Source TEXT,
    CONSTRAINT pk_ORDER_PART_PRICE  PRIMARY KEY (L_Order_Part_HK, Load_Date)
);

CREATE TABLE final.SATELITE_ORDER_PART_INFO (
    L_Order_Part_HK      VARCHAR(32)   NOT NULL, 
    Load_Date TIMESTAMP NOT NULL,
    Line_Number Integer,
    Quantity Double,
    Return_FLag VARCHAR(1),
    Line_Status VARCHAR(1),
    Commit_Date Date,
    Hash_Diff Double,
    Load_Source TEXT,
    CONSTRAINT pk_ORDER_PART_PRICE  PRIMARY KEY (L_Order_Part_HK, Load_Date)
);