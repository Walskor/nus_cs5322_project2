-- AS manager
SELECT * FROM INSURANCE.USERS;
/

BEGIN
INSURANCE.CREATE_USER(
    p_name => 'Victor Li',
    p_region => 'east',
    p_address => '185 Jurong East, 323823',
    p_contact => '957-3756',
    p_is_customer => 'Y',
    p_premium => 1000,
    p_compartments => 'C'
);
END;
/

SELECT * FROM INSURANCE.USERS;
/

BEGIN
INSURANCE.CREATE_USER(
    p_name => 'Victor Li',
    p_region => 'east',
    p_address => '185 Jurong East, 323823',
    p_contact => '957-3756',
    p_is_customer => 'Y',
    p_premium => 9000,
    p_compartments => 'C'
);
END;/

SELECT * FROM INSURANCE.USERS;
/

