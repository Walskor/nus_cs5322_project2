CREATE OR REPLACE PROCEDURE INSURANCE.CREATE_USER (
    p_name VARCHAR2,
    p_region VARCHAR2,
    p_address VARCHAR2,
    p_contact VARCHAR2,
    p_is_customer CHAR,
    p_premium NUMBER,
    p_compartments VARCHAR2(50)
)
AS
    v_user_id NUMBER;
    v_user_count NUMBER;
    v_level VARCHAR2(50);
    v_group VARCHAR2(50);
    v_label VARCHAR2(100);
BEGIN
    -- 检查用户是否已存在
    SELECT COUNT(*) INTO v_user_count
    FROM INSURANCE.USERS
    WHERE name = p_name
      AND region = p_region
      AND address = p_address
      AND contact = p_contact;

    IF p_premium > 100000 THEN
            v_level := 'TS';
        ELSE
            v_level := 'S';
        END IF;
    
    IF p_region = 'east' THEN
            v_group := 'ES';
        ELSE    
            v_group := 'WS';
        END IF;

    IF v_user_count > 0 THEN
        -- 用户已存在，更新信息
        DBMS_OUTPUT.PUT_LINE('User exists.');

        -- 拼接标签
        v_label := CHAR_TO_LABEL('PROJECT_OLS_POL', v_level || ':' || p_compartments ||':' || v_group);

        UPDATE INSURANCE.USERS
        SET is_customer = p_is_customer,
            premium = p_premium,
            OLS_COL = v_label
        WHERE name = p_name
          AND region = p_region
          AND address = p_address
          AND contact = p_contact;

        DBMS_OUTPUT.PUT_LINE('User updated successfully.');
    ELSE
        -- 用户不存在，创建新用户
        -- 获取下一个用户 ID
        SELECT user_id_seq.NEXTVAL INTO v_user_id FROM DUAL;
        v_label := CHAR_TO_LABEL('PROJECT_OLS_POL', v_level || ':' || p_compartments ||':' || v_group);
        -- 插入新用户
        INSERT INTO INSURANCE.USERS (
            user_id,
            name,
            region,
            address,
            contact,
            is_customer,
            premium,
            OLS_COL
        ) VALUES (
            v_user_id,
            p_name,
            p_region,
            p_address,
            p_contact,
            p_is_customer,
            p_premium,
            v_label
        );

        DBMS_OUTPUT.PUT_LINE('User created successfully. User ID: ' || v_user_id);
    END IF;

    COMMIT;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
        ROLLBACK;
END CREATE_USER;
/


-- BEGIN
-- INSURANCE.CREATE_USER(
--     p_name => 'Simon Lu',
--     p_region => 'east',
--     p_address => '123 Queenstown, 123923',
--     p_contact => '142-8472',
--     p_is_customer => 'Y',
--     p_premium => 7000,
--     p_compartments => 'C'
-- );
-- END;
/
