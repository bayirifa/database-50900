-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2022-07-23 17:43:21.015

-- tables
-- Table: AdressInfo
CREATE TABLE AdressInfo (
    AddressID int NOT NULL,
    Addresstype varchar(20) NOT NULL,
    streetName varchar(200) NOT NULL,
    City varchar(40) NOT NULL,
    County varchar(50) NOT NULL,
    state char(2) NOT NULL,
    country varchar(60) NOT NULL,
    cutomerID int NOT NULL,
    CustomerInfo_customerID int NOT NULL,
    CONSTRAINT AdressInfo_pk PRIMARY KEY (AddressID)
);

-- Table: CustomerInfo
CREATE TABLE CustomerInfo (
    customerID int NOT NULL,
    customerLastname varchar(50) NOT NULL,
    customerFirstname varchar(50) NOT NULL,
    dateAccountOpen timestamp NOT NULL,
    PhoneInfo_phoneID int NOT NULL,
    phoneNumber int NOT NULL,
    AdressInfo_AddressID int NOT NULL,
    CONSTRAINT CustomerInfo_pk PRIMARY KEY (customerID)
);

-- Table: DeliveryInfo
CREATE TABLE DeliveryInfo (
    DeliveryInfo int NOT NULL,
    DeliveryMode varchar(20) NOT NULL COMMENT 'Home/work/other',
    CONSTRAINT DeliveryInfo_pk PRIMARY KEY (DeliveryInfo)
);

-- Table: DepartmentInfo
CREATE TABLE DepartmentInfo (
    deptID int NOT NULL,
    dept_Name varchar(50) NOT NULL,
    CONSTRAINT DepartmentInfo_pk PRIMARY KEY (deptID)
);

-- Table: DriverInfo
CREATE TABLE DriverInfo (
    driverID int NOT NULL,
    licenseNum char(12) NOT NULL,
    licenseTye varchar(20) NOT NULL,
    dateExpire date NOT NULL,
    stateIssued int NOT NULL,
    EmployeeInfo_employeeID int NOT NULL,
    CONSTRAINT DriverInfo_pk PRIMARY KEY (driverID)
);

-- Table: EmployeeInfo
CREATE TABLE EmployeeInfo (
    employeeID int NOT NULL,
    employeelastname varchar(50) NOT NULL,
    employeeFirstnamname varchar(50) NOT NULL,
    dateofBirth date NOT NULL,
    homeAdress varchar(300) NOT NULL,
    primaryContact int NOT NULL,
    emergencyContact int NOT NULL,
    dateHired date NOT NULL,
    dateResigned date NULL,
    CONSTRAINT EmployeeInfo_pk PRIMARY KEY (employeeID)
);

-- Table: HaulInformation
CREATE TABLE HaulInformation (
    HaulID int NOT NULL,
    dateOntruck timestamp NOT NULL,
    timeDelivered timestamp NOT NULL,
    deliveryNotes varchar(200) NULL,
    OrderInfo_OrderID int NOT NULL,
    DeliveryInfo_DeliveryInfo int NOT NULL,
    TruckInfo_truckID int NOT NULL,
    DriverInfo_driverID int NOT NULL,
    AdressInfo_AddressID int NOT NULL,
    CONSTRAINT HaulInformation_pk PRIMARY KEY (HaulID)
);

-- Table: OrderInfo
CREATE TABLE OrderInfo (
    OrderID int NOT NULL,
    orderDate timestamp NOT NULL,
    proQuantity int NOT NULL,
    discount decimal(5,3) NULL,
    totalCost double NOT NULL,
    HaulInformation_HaulID int NOT NULL,
    CustomerInfo_customerID int NOT NULL,
    EmployeeInfo_employeeID int NOT NULL,
    ProductInfo_productID int NOT NULL,
    CONSTRAINT OrderInfo_pk PRIMARY KEY (OrderID)
);

-- Table: PhoneInfo
CREATE TABLE PhoneInfo (
    phoneID int NOT NULL,
    phonetyoe varchar(20) NOT NULL COMMENT 'home/secondary/cellphone',
    CONSTRAINT PhoneInfo_pk PRIMARY KEY (phoneID)
);

-- Table: ProductInfo
CREATE TABLE ProductInfo (
    productSize varchar(20) NOT NULL,
    unitCost int NOT NULL,
    sellingPrice int NOT NULL,
    productBrandName int NOT NULL,
    dateProduced date NOT NULL,
    ExpiryDate int NOT NULL,
    DepartmentInfo_deptID int NOT NULL,
    StockInfo_stockID int NOT NULL,
    productID int NOT NULL,
    CONSTRAINT ProductInfo_pk PRIMARY KEY (productID)
);

-- Table: StockInfo
CREATE TABLE StockInfo (
    stockID int NOT NULL,
    stockDate date NOT NULL,
    quantityP int NOT NULL,
    ProductInfo_productID int NOT NULL,
    SupplyInfo_supplyID int NOT NULL,
    EmployeeInfo_employeeID int NOT NULL,
    CONSTRAINT StockInfo_pk PRIMARY KEY (stockID)
);

-- Table: SupplyInfo
CREATE TABLE SupplyInfo (
    supplyID int NOT NULL,
    supplyDate date NOT NULL,
    companyName varchar(100) NOT NULL,
    deliveryD_Nam varchar(100) NOT NULL,
    receivingcondition varchar(100) NOT NULL,
    CONSTRAINT SupplyInfo_pk PRIMARY KEY (supplyID)
);

-- Table: TruckInfo
CREATE TABLE TruckInfo (
    truckID int NOT NULL,
    truckNumplate char(7) NOT NULL,
    truckType varchar(100) NOT NULL,
    truckyear char(4) NOT NULL,
    truckmodel varchar(100) NOT NULL,
    truckLastService date NOT NULL,
    truckCondition varchar(100) NOT NULL,
    CONSTRAINT TruckInfo_pk PRIMARY KEY (truckID)
);

-- foreign keys
-- Reference: AdressInfo_CustomerInfo (table: AdressInfo)
ALTER TABLE AdressInfo ADD CONSTRAINT AdressInfo_CustomerInfo FOREIGN KEY AdressInfo_CustomerInfo (CustomerInfo_customerID)
    REFERENCES CustomerInfo (customerID);

-- Reference: CustomerInfo_AdressInfo (table: CustomerInfo)
ALTER TABLE CustomerInfo ADD CONSTRAINT CustomerInfo_AdressInfo FOREIGN KEY CustomerInfo_AdressInfo (AdressInfo_AddressID)
    REFERENCES AdressInfo (AddressID);

-- Reference: CustomerInfo_PhoneInfo (table: CustomerInfo)
ALTER TABLE CustomerInfo ADD CONSTRAINT CustomerInfo_PhoneInfo FOREIGN KEY CustomerInfo_PhoneInfo (PhoneInfo_phoneID)
    REFERENCES PhoneInfo (phoneID);

-- Reference: DriverInfo_EmployeeInfo (table: DriverInfo)
ALTER TABLE DriverInfo ADD CONSTRAINT DriverInfo_EmployeeInfo FOREIGN KEY DriverInfo_EmployeeInfo (EmployeeInfo_employeeID)
    REFERENCES EmployeeInfo (employeeID);

-- Reference: HaulInformation_AdressInfo (table: HaulInformation)
ALTER TABLE HaulInformation ADD CONSTRAINT HaulInformation_AdressInfo FOREIGN KEY HaulInformation_AdressInfo (AdressInfo_AddressID)
    REFERENCES AdressInfo (AddressID);

-- Reference: HaulInformation_DeliveryInfo (table: HaulInformation)
ALTER TABLE HaulInformation ADD CONSTRAINT HaulInformation_DeliveryInfo FOREIGN KEY HaulInformation_DeliveryInfo (DeliveryInfo_DeliveryInfo)
    REFERENCES DeliveryInfo (DeliveryInfo);

-- Reference: HaulInformation_DriverInfo (table: HaulInformation)
ALTER TABLE HaulInformation ADD CONSTRAINT HaulInformation_DriverInfo FOREIGN KEY HaulInformation_DriverInfo (DriverInfo_driverID)
    REFERENCES DriverInfo (driverID);

-- Reference: HaulInformation_OrderInfo (table: HaulInformation)
ALTER TABLE HaulInformation ADD CONSTRAINT HaulInformation_OrderInfo FOREIGN KEY HaulInformation_OrderInfo (OrderInfo_OrderID)
    REFERENCES OrderInfo (OrderID);

-- Reference: HaulInformation_TruckInfo (table: HaulInformation)
ALTER TABLE HaulInformation ADD CONSTRAINT HaulInformation_TruckInfo FOREIGN KEY HaulInformation_TruckInfo (TruckInfo_truckID)
    REFERENCES TruckInfo (truckID);

-- Reference: OrderInfo_CustomerInfo (table: OrderInfo)
ALTER TABLE OrderInfo ADD CONSTRAINT OrderInfo_CustomerInfo FOREIGN KEY OrderInfo_CustomerInfo (CustomerInfo_customerID)
    REFERENCES CustomerInfo (customerID);

-- Reference: OrderInfo_EmployeeInfo (table: OrderInfo)
ALTER TABLE OrderInfo ADD CONSTRAINT OrderInfo_EmployeeInfo FOREIGN KEY OrderInfo_EmployeeInfo (EmployeeInfo_employeeID)
    REFERENCES EmployeeInfo (employeeID);

-- Reference: OrderInfo_HaulInformation (table: OrderInfo)
ALTER TABLE OrderInfo ADD CONSTRAINT OrderInfo_HaulInformation FOREIGN KEY OrderInfo_HaulInformation (HaulInformation_HaulID)
    REFERENCES HaulInformation (HaulID);

-- Reference: OrderInfo_ProductInfo (table: OrderInfo)
ALTER TABLE OrderInfo ADD CONSTRAINT OrderInfo_ProductInfo FOREIGN KEY OrderInfo_ProductInfo (ProductInfo_productID)
    REFERENCES ProductInfo (productID);

-- Reference: ProductInfo_DepartmentInfo (table: ProductInfo)
ALTER TABLE ProductInfo ADD CONSTRAINT ProductInfo_DepartmentInfo FOREIGN KEY ProductInfo_DepartmentInfo (DepartmentInfo_deptID)
    REFERENCES DepartmentInfo (deptID);

-- Reference: ProductInfo_StockInfo (table: ProductInfo)
ALTER TABLE ProductInfo ADD CONSTRAINT ProductInfo_StockInfo FOREIGN KEY ProductInfo_StockInfo (StockInfo_stockID)
    REFERENCES StockInfo (stockID);

-- Reference: StockInfo_EmployeeInfo (table: StockInfo)
ALTER TABLE StockInfo ADD CONSTRAINT StockInfo_EmployeeInfo FOREIGN KEY StockInfo_EmployeeInfo (EmployeeInfo_employeeID)
    REFERENCES EmployeeInfo (employeeID);

-- Reference: StockInfo_SupplyInfo (table: StockInfo)
ALTER TABLE StockInfo ADD CONSTRAINT StockInfo_SupplyInfo FOREIGN KEY StockInfo_SupplyInfo (SupplyInfo_supplyID)
    REFERENCES SupplyInfo (supplyID);

-- End of file.

