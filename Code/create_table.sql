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

CREATE TABLE INSURANCE.USERS (
    user_id NUMBER,
    name VARCHAR(50) NOT NULL,
    region VARCHAR(50) NOT NULL,
    address VARCHAR(100) NOT NULL,
    contact VARCHAR(50) NOT NULL,
    is_customer CHAR(1) NOT NULL,
    premium NUMBER,
    CONSTRAINT pk_User PRIMARY KEY (user_id)
);

select * from INSURANCE.USERS;


