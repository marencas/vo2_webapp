/*
CREATE TABLE v_customer
	( objectid serial PRIMARY KEY,
      businessname VARCHAR(100) NOT NULL,
      createddate DATE NOT NULL,
      addressline1 VARCHAR(200) NULL,
      addressline2 VARCHAR(200) NULL,
      city VARCHAR(100) NULL,
      prov_state VARCHAR(2) NULL,
      post_zip_code VARCHAR(20) NULL,
      phonenumber1 VARCHAR(15) NULL,
      phonenumber2 VARCHAR(15) NULL,
      phonenumber3 VARCHAR(15) NULL,
      email1 VARCHAR(50) NULL,
      email2 VARCHAR(50) NULL,
      email3 VARCHAR(50) NULL,
      isdeleted BOOLEAN NOT NULL,
      vip BOOLEAN NOT NULL DEFAULT FALSE,
      businessrepoid INTEGER,
      businessoccupation VARCHAR(50)
     ); */

/*
CREATE TABLE v_contract (
    objectid SERIAL PRIMARY KEY,
    custoid INTEGER REFERENCES v_customer (objectid),
    createddate DATE NOT NULL,
    effectivedate DATE NULL,
    enddate DATE NULL,
    parentcontractoid INTEGER DEFAULT 0,
    isdeleted BOOLEAN NOT NULL DEFAULT FALSE);*/
    
CREATE TABLE v_course (
    objectid SERIAL PRIMARY KEY,
    coursename VARCHAR(100) NOT NULL,
    createddate DATE NOT NULL,
    isdeleted BOOLEAN NOT NULL DEFAULT FALSE,
    isonline BOOLEAN NOT NULL DEFAULT FALSE,
    courselength INT NULL CHECK (courselength > 0)
    );
    
CREATE TABLE v_staff (
    objectid SERIAL PRIMARY KEY,
    firstname VARCHAR(100) NOT NULL,
    lastname VARCHAR(100) NOT NULL,
    middlename VARCHAR(100) NULL,
    dateofbirth VARCHAR(100) NOT NULL,
    sinnumber INTEGER NOT NULL UNIQUE,
    addressline1 VARCHAR(200) NULL,
    addressline2 VARCHAR(200) NULL,
    city VARCHAR(100) NULL,
    prov_state VARCHAR(2) NULL,
    post_zip_code VARCHAR(20) NULL,
    phonenumber1 VARCHAR(15) NULL,
    phonenumber2 VARCHAR(15) NULL,
    email1 VARCHAR(50) NULL,
    email2 VARCHAR(50) NULL
    );
    
CREATE TABLE v_staff_nok (
    objectid SERIAL PRIMARY KEY,
    firstname VARCHAR(100) NOT NULL,
    lastname VARCHAR(100) NOT NULL,
    middlename VARCHAR(100) NULL,
    );
    
CREATE TABLE v_student (
    objectid SERIAL PRIMARY KEY,
    firstname VARCHAR(100) NOT NULL,
    lastname VARCHAR(100) NOT NULL,
    middlename VARCHAR(100) NULL,
    cust_oid INTEGER REFERENCES v_customer (objectid),
    test_enable BOOLEAN NOT NULL DEFAULT FALSE,
    work_email VARCHAR(100) NOT NULL
    );
    
CREATE TABLE v_onlinetest (
    objectid SERIAL PRIMARY KEY,
    courseoid INTEGER NOT NULL REFERENCES v_courseoid (objectid)
    );
    
CREATE TABLE v_testanswers (
    objectid SERIAL PRIMARY KEY,
    onlinetestoid INTEGER NOT NULL REFERENCES v_onlinetest (objectid),
    testquestion
