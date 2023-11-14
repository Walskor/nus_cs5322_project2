-- AS sale_east_1
SELECT SA_SESSION.LABEL('PROJECT_OLS_POL') FROM DUAL;
/

SELECT * FROM INSURANCE.USERS;
/

SELECT * FROM INSURANCE.CAR_RECORDS;
/

BEGIN
INSURANCE.INSERT_CAR_RECORD(
    p_user_id => 1, 
    p_situation => 'Some Accident', 
    p_customer_pay => 150, 
    p_company_pay => 200
);
END;
/

SELECT * FROM INSURANCE.CAR_RECORDS;
/