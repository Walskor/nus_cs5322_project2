--manager 
SELECT SA_SESSION.LABEL('PROJECT_OLS_POL') FROM DUAL; --label=TS:C,H,J:COM,EAST,WEST,EA,ES,WA,WS

select * from INSURANCE.USERS; --can see all data


--SALE_EAST_1  
SELECT SA_SESSION.LABEL('PROJECT_OLS_POL') FROM DUAL; --label=S:C:ES

select * from INSURANCE.USERS; --can see id 1,3


--ANALYST  
SELECT SA_SESSION.LABEL('PROJECT_OLS_POL') FROM DUAL; --label=S:C,H,J:WA

select * from INSURANCE.USERS; --can see id 4

--HIGH_ANALYST_EAST_WEST
SELECT SA_SESSION.LABEL('PROJECT_OLS_POL') FROM DUAL; --label=TS:C:EA,WA

select * from INSURANCE.USERS; --can see id 5




-- get row label info
SELECT LABEL_TO_CHAR(OLS_COL) AS "Label",
       SUBSTR(LABEL_TO_CHAR(OLS_COL), 1, INSTR(LABEL_TO_CHAR(OLS_COL), ':', 1) - 1) AS "FirstPart",
       SUBSTR(LABEL_TO_CHAR(OLS_COL), INSTR(LABEL_TO_CHAR(OLS_COL), ':', 1) + 1,
              LENGTH(LABEL_TO_CHAR(OLS_COL)) - 2 * INSTR(LABEL_TO_CHAR(OLS_COL), ':') - 1) AS "MiddlePart",
       SUBSTR(LABEL_TO_CHAR(OLS_COL), INSTR(LABEL_TO_CHAR(OLS_COL), ':', -1) + 1) AS "LastPart"
FROM INSURANCE.USERS;