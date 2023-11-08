CREATE USER SALE_EAST_1 IDENTIFIED BY password; / 
CREATE USER SALE_WEST_1 IDENTIFIED BY password; /

CREATE USER analyst_east IDENTIFIED BY password; /
CREATE USER ANALYST_WEST_1 IDENTIFIED BY password; /

CREATE USER HIGH_ANALYST_EAST_WEST IDENTIFIED BY password; /

CREATE USER manager IDENTIFIED BY password; /

---     ---

GRANT CONNECT to SALE_EAST_1; /
GRANT CONNECT to SALE_WEST_1; /

GRANT CONNECT to analyst_east; /
GRANT CONNECT to ANALYST_WEST_1; /

GRANT CONNECT to HIGH_ANALYST_EAST_WEST; /

GRANT CONNECT to manager; /

--- ---
GRANT ALL PRIVILEGES ON INSURANCE.USERS TO LBACSYS;/

GRANT ALL PRIVILEGES ON INSURANCE.USERS TO SALE_EAST_1; /
GRANT ALL PRIVILEGES ON INSURANCE.USERS TO SALE_WEST_1; /

GRANT ALL PRIVILEGES ON INSURANCE.USERS TO analyst_east; /
GRANT ALL PRIVILEGES ON INSURANCE.USERS TO ANALYST_WEST_1; /

GRANT ALL PRIVILEGES ON INSURANCE.USERS TO HIGH_ANALYST_EAST_WEST; /

GRANT ALL PRIVILEGES ON INSURANCE.USERS TO manager; /

--LBACSYS
BEGIN
SA_USER_ADMIN.SET_LEVELS (
  policy_name => 'PROJECT_OLS_POL',
  user_name => 'SALE_EAST_1',
  max_level => 'S');
SA_USER_ADMIN.SET_COMPARTMENTS (
  policy_name => 'PROJECT_OLS_POL',
  user_name => 'SALE_EAST_1',
  read_comps => 'C');
SA_USER_ADMIN.SET_GROUPS (
  policy_name => 'PROJECT_OLS_POL',
  user_name => 'SALE_EAST_1',
  read_groups => 'ES');
SA_USER_ADMIN.SET_USER_PRIVS (
  policy_name => 'PROJECT_OLS_POL',
  user_name => 'SALE_EAST_1',
  privileges => '');
  
SA_USER_ADMIN.SET_LEVELS (
  policy_name => 'PROJECT_OLS_POL',
  user_name => 'ANALYST_WEST_1',
  max_level => 'S');
SA_USER_ADMIN.SET_COMPARTMENTS (
  policy_name => 'PROJECT_OLS_POL',
  user_name => 'ANALYST_WEST_1',
  read_comps => 'C,H,J');
SA_USER_ADMIN.SET_GROUPS (
  policy_name => 'PROJECT_OLS_POL',
  user_name => 'ANALYST_WEST_1',
  read_groups => 'WA');
SA_USER_ADMIN.SET_USER_PRIVS (
  policy_name => 'PROJECT_OLS_POL',
  user_name => 'ANALYST_WEST_1',
  privileges => '');
  
SA_USER_ADMIN.SET_LEVELS (
  policy_name => 'PROJECT_OLS_POL',
  user_name => 'HIGH_ANALYST_EAST_WEST',
  max_level => 'TS');
SA_USER_ADMIN.SET_COMPARTMENTS (
  policy_name => 'PROJECT_OLS_POL',
  user_name => 'HIGH_ANALYST_EAST_WEST',
  read_comps => 'C');
SA_USER_ADMIN.SET_GROUPS (
  policy_name => 'PROJECT_OLS_POL',
  user_name => 'HIGH_ANALYST_EAST_WEST',
  read_groups => 'EA,WA');
SA_USER_ADMIN.SET_USER_PRIVS (
  policy_name => 'PROJECT_OLS_POL',
  user_name => 'HIGH_ANALYST_EAST_WEST',
  privileges => '');

SA_USER_ADMIN.SET_LEVELS (
  policy_name => 'PROJECT_OLS_POL',
  user_name => 'manager',
  max_level => 'TS');
SA_USER_ADMIN.SET_COMPARTMENTS (
  policy_name => 'PROJECT_OLS_POL',
  user_name => 'manager',
  read_comps => 'C,H,J');
SA_USER_ADMIN.SET_GROUPS (
  policy_name => 'PROJECT_OLS_POL',
  user_name => 'manager',
  read_groups => 'COM');
SA_USER_ADMIN.SET_USER_PRIVS (
  policy_name => 'PROJECT_OLS_POL',
  user_name => 'manager',
  privileges => 'FULL');
END;
/


SELECT * FROM DBA_SA_USER_LEVELS;
SELECT * FROM DBA_SA_USER_COMPARTMENTS;
SELECT * FROM DBA_SA_USER_GROUPS;
SELECT * FROM DBA_SA_USER_PRIVS;