CREATE OR REPLACE PROCEDURE INSURANCE.INSERT_CAR_RECORD (
    p_user_id NUMBER,
    p_situation VARCHAR2,
    p_customer_pay NUMBER,
    p_company_pay NUMBER
)
AS
    v_record_id NUMBER;
    v_row_label VARCHAR2(100);
    v_level VARCHAR2(50);
    v_group VARCHAR2(50);
    v_label VARCHAR2(100);
    v_premium NUMBER;
    v_region VARCHAR2(50);
BEGIN
    -- 查询是否存在用户
    SELECT premium, region INTO v_premium, v_region
    FROM INSURANCE.USERS
    WHERE user_id = p_user_id;

    -- 如果用户不存在，取消存储过程
    IF v_premium IS NULL THEN
        DBMS_OUTPUT.PUT_LINE('User does not exist. Procedure cancelled.');
        RETURN;
    END IF;

    -- 获取下一个记录 ID
    SELECT INSURANCE.car_record_id_seq.NEXTVAL INTO v_record_id FROM DUAL;

    -- 设置用户的标签
    IF v_premium > 100000 THEN
        v_level := 'TS';
    ELSE
        v_level := 'S';
    END IF;

    IF v_region = 'east' THEN
        v_group := 'ES';
    ELSE    
        v_group := 'WS';
    END IF;


    -- 拼接标签
    v_label := CHAR_TO_LABEL('PROJECT_OLS_POL', v_level || ':C:' || v_group);

    -- 插入新的理赔记录
    INSERT INTO INSURANCE.CAR_RECORDS (
        record_id,
        user_id,
        situation,
        customer_pay,
        company_pay,
        OLS_COL
    ) VALUES (
        v_record_id,
        p_user_id,
        p_situation,
        p_customer_pay,
        p_company_pay,
        v_label
    );

    COMMIT;
END INSERT_CAR_RECORD;
/
