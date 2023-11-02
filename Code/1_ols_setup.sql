--- check whether oracle ols is installed, if anything returned, then enabled---
SELECT * FROM v$option WHERE parameter = 'Oracle Label Security';
