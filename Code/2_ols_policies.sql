-- as LBACSYS
BEGIN
  SA_SYSDBA.CREATE_POLICY (
    policy_name => 'PROJECT_OLS_POL',
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