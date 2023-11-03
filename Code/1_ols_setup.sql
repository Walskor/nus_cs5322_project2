--- check whether oracle ols is installed, if anything returned, then enabled---
SELECT * FROM v$option WHERE parameter = 'Oracle Label Security';


-- Unlock LBACSYS account
ALTER USER LBACSYS IDENTIFIED BY password ACCOUNT UNLOCK;