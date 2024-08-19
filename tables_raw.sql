CREATE TABLE HEALTHCARE.RAW.DW_Customer (
    CustomerID NUMBER,
    CustomerName varchar,
    Phone varchar,
    Email varchar,
    Street varchar,
    City varchar,
    State varchar,
    Zip_Code varchar
);
 
CREATE TABLE HEALTHCARE.RAW.DW_Product (
    ProductID NUMBER,
    ProductName VARCHAR,
    ProductCategory VARCHAR,
    UnitPrice NUMBER(10,2)
);
 
CREATE TABLE HEALTHCARE.RAW.DW_Sales (
    ProductID NUMBER,
    CustomerID NUMBER,
    StaffID NUMBER,
    StoreID NUMBER,
    Quantity NUMBER,
    Discount NUMBER,
    ListPrice NUMBER
);
 
COPY INTO HEALTHCARE.RAW.DW_Customer
  FROM 'gcs://elait_bucket15/Files/Bikestore/DWCustomer.csv'
  STORAGE_INTEGRATION = "my_gcs_integration"
  FILE_FORMAT = (TYPE = CSV);
 
COPY INTO HEALTHCARE.RAW.DW_Product
  FROM 'gcs://elait_bucket15/Files/Bikestore/DWProduct.csv'
  STORAGE_INTEGRATION = "my_gcs_integration"
  FILE_FORMAT = (TYPE = CSV);
 
COPY INTO HEALTHCARE.RAW.DW_Sales
  FROM 'gcs://elait_bucket15/Files/Bikestore/DWSales.csv'
  STORAGE_INTEGRATION = "my_gcs_integration"
  FILE_FORMAT = (TYPE = CSV);
 
SELECT * FROM HEALTHCARE.RAW.DW_CUSTOMER;

SELECT * FROM HEALTHCARE.RAW.DW_PRODUCT;

SELECT * FROM HEALTHCARE.RAW.DW_SALES;
 