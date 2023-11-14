-- AS manager
SELECT USER_ID,
       NAME,
       region,
       is_customer,
       premium,
       LABEL_TO_CHAR(OLS_COL) AS "Label"
FROM INSURANCE.USERS;   
/

BEGIN
INSURANCE.CREATE_USER(
    p_user_id => 9,
    p_name => 'Victor Li'
);
END;
/

SELECT USER_ID,
       NAME,
       region,
       is_customer,
       premium,
       LABEL_TO_CHAR(OLS_COL) AS "Label"
FROM INSURANCE.USERS;   
/

