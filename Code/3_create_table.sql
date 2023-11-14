-- See created tablespace
SELECT * FROM DBA_DATA_FILES;

-- check all tablespaces
select * from DBA_TABLESPACES;

-- check all tables in a tablespace
select * from DBA_TABLES;

select instance_name from v$instance;


-- -------------------------------------------------
-- User Table
-- -------------------------------------------------
CREATE SEQUENCE INSURANCE.user_id_seq START WITH 1 INCREMENT BY 1;

CREATE TABLE INSURANCE.USERS (
    user_id NUMBER DEFAULT INSURANCE.user_id_seq.NEXTVAL,
    name VARCHAR(50) NOT NULL,
    region VARCHAR(50) NOT NULL,
    address VARCHAR(100) NOT NULL,
    contact VARCHAR(50) NOT NULL,
    is_customer CHAR(1) NOT NULL,
    premium NUMBER,
    CONSTRAINT pk_User PRIMARY KEY (user_id)
);

-- -------------------------------------------------
-- MEDICAL_RECORDS Table
-- -------------------------------------------------
CREATE SEQUENCE INSURANCE.medical_record_id_seq START WITH 1 INCREMENT BY 1;


CREATE TABLE INSURANCE.MEDICAL_RECORDS (
    record_id NUMBER DEFAULT INSURANCE.medical_record_id_seq.NEXTVAL,
    user_id NUMBER,
    diagnosis VARCHAR(200),
    prescription VARCHAR(100),
    customer_pay NUMBER,
    company_pay NUMBER,
    CONSTRAINT pk_Medical PRIMARY KEY (record_id)
);

-- -------------------------------------------------
-- CAR_RECORDS Table
-- -------------------------------------------------
CREATE SEQUENCE INSURANCE.car_record_id_seq START WITH 1 INCREMENT BY 1;


CREATE TABLE INSURANCE.CAR_RECORDS (
    record_id NUMBER DEFAULT INSURANCE.car_record_id_seq.NEXTVAL,
    user_id NUMBER,
    situation VARCHAR(200),
    customer_pay NUMBER,
    company_pay NUMBER,
    CONSTRAINT pk_Car PRIMARY KEY (record_id)
);

-- -------------------------------------------------
-- JOURNEY_RECORDS Table
-- -------------------------------------------------
CREATE SEQUENCE INSURANCE.journey_record_id_seq START WITH 1 INCREMENT BY 1;

CREATE TABLE INSURANCE.JOURNEY_RECORDS (
    record_id NUMBER DEFAULT INSURANCE.journey_record_id_seq.NEXTVAL,
    user_id NUMBER,
    situation VARCHAR(200),
    customer_pay NUMBER,
    company_pay NUMBER,
    CONSTRAINT pk_Journey PRIMARY KEY (record_id)
);




