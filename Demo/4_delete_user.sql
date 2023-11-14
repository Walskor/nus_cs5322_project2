-- AS manager
SELECT * FROM INSURANCE.USERS;
/

BEGIN
INSURANCE.CREATE_USER(
    p_user_id => 9,
    p_name => 'Victor Li'
);
END;
/

SELECT * FROM INSURANCE.USERS;
/

