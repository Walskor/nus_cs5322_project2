-- as LBACSYS
BEGIN
  SA_SYSDBA.CREATE_POLICY (
    policy_name => 'PROJECT_OLS_POL',
    column_name => 'OLS_COL',
    default_options => 'ALL_CONTROL');
END;
/

-- Verify policy created
SELECT * FROM ALL_SA_POLICIES;

SELECT * FROM DBA_ROLE_PRIVS WHERE GRANTEE='LBACSYS';

-- Create levels
BEGIN
  SA_COMPONENTS.CREATE_LEVEL (
    policy_name => 'PROJECT_OLS_POL',
    level_num => 10,
    short_name => 'C',
    long_name => 'CONFIDENTIAL');
  SA_COMPONENTS.CREATE_LEVEL (
    policy_name => 'PROJECT_OLS_POL',
    level_num => 20,
    short_name => 'S',
    long_name => 'SECRET');
  SA_COMPONENTS.CREATE_LEVEL (
    policy_name => 'PROJECT_OLS_POL',
    level_num => 30,
    short_name => 'TS',
    long_name => 'TOP_SECRET');
END;
/
SELECT * FROM ALL_SA_LEVELS;
/

-- Create compartments
BEGIN
  SA_COMPONENTS.CREATE_COMPARTMENT (
    policy_name => 'PROJECT_OLS_POL',
    comp_num => '1',
    short_name => 'C',
    long_name => 'CAR');
  SA_COMPONENTS.CREATE_COMPARTMENT (
    policy_name => 'PROJECT_OLS_POL',
    comp_num => '2',
    short_name => 'H',
    long_name => 'HEALTH');
  SA_COMPONENTS.CREATE_COMPARTMENT (
    policy_name => 'PROJECT_OLS_POL',
    comp_num => '3',
    short_name => 'J',
    long_name => 'JOURNEY');
END;
/
SELECT * FROM ALL_SA_COMPARTMENTS;
/

-- Create groups
BEGIN
  SA_COMPONENTS.CREATE_GROUP (
    policy_name => 'PROJECT_OLS_POL',
    group_num => '1',
    short_name => 'COM',
    long_name => 'COMPANY');

  SA_COMPONENTS.CREATE_GROUP (
    policy_name => 'PROJECT_OLS_POL',
    group_num => '10',
    short_name => 'EAST',
    long_name => 'EAST',
    parent_name => 'COM');
  SA_COMPONENTS.CREATE_GROUP (
    policy_name => 'PROJECT_OLS_POL',
    group_num => '20',
    short_name => 'WEST',
    long_name => 'WEST',
    parent_name => 'COM');
    
  SA_COMPONENTS.CREATE_GROUP (
    policy_name => 'PROJECT_OLS_POL',
    group_num => '100',
    short_name => 'EA',
    long_name => 'EAST_ANALYST',
    parent_name => 'EAST');
  SA_COMPONENTS.CREATE_GROUP (
    policy_name => 'PROJECT_OLS_POL',
    group_num => '101',
    short_name => 'ES',
    long_name => 'EAST_SERVICE',
    parent_name => 'EAST');
  SA_COMPONENTS.CREATE_GROUP (
    policy_name => 'PROJECT_OLS_POL',
    group_num => '200',
    short_name => 'WA',
    long_name => 'WEST_ANALYST',
    parent_name => 'WEST');
  SA_COMPONENTS.CREATE_GROUP (
    policy_name => 'PROJECT_OLS_POL',
    group_num => '201',
    short_name => 'WS',
    long_name => 'WEST_SERVICE',
    parent_name => 'WEST');
END;
/
SELECT * FROM ALL_SA_GROUPS;


BEGIN
  SA_LABEL_ADMIN.CREATE_LABEL(
    policy_name => 'PROJECT_OLS_POL',
    label_tag => '11',
    label_value => 'S:C:ES',
    data_label => TRUE);
  SA_LABEL_ADMIN.CREATE_LABEL(
    policy_name => 'PROJECT_OLS_POL',
    label_tag => '12',
    label_value => 'S:C,H,J:WA',
    data_label => TRUE);
  SA_LABEL_ADMIN.CREATE_LABEL(
    policy_name => 'PROJECT_OLS_POL',
    label_tag => '13',
    label_value => 'TS:C,H,J:COM',
    data_label => TRUE);
  SA_LABEL_ADMIN.CREATE_LABEL(
    policy_name => 'PROJECT_OLS_POL',
    label_tag => '14',
    label_value => 'C::ES',
    data_label => TRUE);
  SA_LABEL_ADMIN.CREATE_LABEL(
    policy_name => 'PROJECT_OLS_POL',
    label_tag => '15',
    label_value => 'TS:C:EA',
    data_label => TRUE);
END;
/

-- Drop all labels
BEGIN
  FOR ROW IN (SELECT * FROM ALL_SA_LABELS)
  LOOP
    SA_LABEL_ADMIN.DROP_LABEL (
      policy_name => 'PROJECT_OLS_POL',
      label_value => ROW.LABEL);
  END LOOP;
END;
/

--check all labels
SELECT * FROM ALL_SA_LABELS;

BEGIN
  SA_SYSDBA.DROP_POLICY (
    policy_name => 'PROJECT_OLS_POL');
END;
/

--apply policy
--dba run
CREATE USER INSURANCE DEFAULT TABLESPACE INSURANCE QUOTA UNLIMITED ON INSURANCE;

--dba run
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

--LBACSYS run
BEGIN
  SA_POLICY_ADMIN.APPLY_SCHEMA_POLICY (
    policy_name => 'PROJECT_OLS_POL',
    schema_name => 'INSURANCE');
END;
/
SELECT * FROM ALL_SA_TABLE_POLICIES;

-- Drop if needed
BEGIN
  SA_POLICY_ADMIN.REMOVE_SCHEMA_POLICY (
    policy_name => 'PROJECT_OLS_POL',
    schema_name => 'INSURANCE',
    drop_column => TRUE);
END;
/