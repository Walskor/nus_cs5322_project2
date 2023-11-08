delete from INSURANCE.USERS;

select * from INSURANCE.USERS;

--alter system flush buffer_cache;

--manager run
begin
    INSERT INTO INSURANCE.USERS
    VALUES (1, 'John Doe', 'east', '123 Main St, New York, NY 10001', '555-1234', 'Y', 9999, CHAR_TO_LABEL('PROJECT_OLS_POL','S:C:ES'));
    INSERT INTO INSURANCE.USERS 
    VALUES (2, 'Jane Smith', 'west', '456 El Camino Real, San Francisco, CA 94101', '555-5678', 'Y', 8888, CHAR_TO_LABEL('PROJECT_OLS_POL','TS:C,H,J:COM'));
    INSERT INTO INSURANCE.USERS 
    VALUES (3, 'Mike Johnson', 'east', '789 Spring St, Los Angeles, CA 90001', '555-9876', 'N', null, CHAR_TO_LABEL('PROJECT_OLS_POL','C::ES'));
    INSERT INTO INSURANCE.USERS 
    VALUES (4, 'Emily Davis', 'west', '1234 North Ave, Chicago, IL 60606', '555-4567', 'Y', 7777, CHAR_TO_LABEL('PROJECT_OLS_POL','S:C,H,J:WA'));
    INSERT INTO INSURANCE.USERS 
    VALUES (5, 'David Brown', 'east', '567 South St, Seattle, WA 98101', '555-3456', 'Y', 100000, CHAR_TO_LABEL('PROJECT_OLS_POL','TS:C:EA'));
    INSERT INTO INSURANCE.USERS 
    VALUES (6, 'Walskor Wang', 'west', '511 West Cost Walk, Seattle, WA 37462', '151-7648', 'Y', 130000, CHAR_TO_LABEL('PROJECT_OLS_POL','S:C,H:'));
    COMMIT;
end;
/

SELECT SA_SESSION.LABEL('PROJECT_OLS_POL') FROM DUAL; -- current user session label
SELECT SA_SESSION.ROW_LABEL('PROJECT_OLS_POL') FROM DUAL; -- current data label to be applied
SELECT SA_SESSION.PRIVS('PROJECT_OLS_POL') FROM DUAL;

-- Mock data for MEDICAL_RECORDS table
INSERT INTO INSURANCE.MEDICAL_RECORDS (record_id, user_id, diagnosis, prescription, customer_pay, company_pay)
VALUES (1, 2, 'Common cold', 'Antibiotics', 50.00, 150.00);

INSERT INTO INSURANCE.MEDICAL_RECORDS (record_id, user_id, diagnosis, prescription, customer_pay, company_pay)
VALUES (2, 4, 'Fractured Arm', 'Cast', 100.00, 200.00);

-- Mock data for CAR_RECORDS table
INSERT INTO INSURANCE.CAR_RECORDS (record_id, user_id, situation, customer_pay, company_pay)
VALUES (1, 1, 'Accident - Minor Damage', 500.00, 800.00);

INSERT INTO INSURANCE.CAR_RECORDS (record_id, user_id, situation, customer_pay, company_pay)
VALUES (2, 4, 'Stolen Vehicle', 1000.00, 1500.00);

INSERT INTO INSURANCE.CAR_RECORDS (record_id, user_id, situation, customer_pay, company_pay)
VALUES (3, 5, 'Accident - Major Damage', 1000.00, 2000.00);

-- Mock data for JOURNEY_RECORDS table
INSERT INTO INSURANCE.JOURNEY_RECORDS (record_id, user_id, situation, customer_pay, company_pay)
VALUES (1, 2, 'Delayed Flight', 50.00, 100.00);

INSERT INTO INSURANCE.JOURNEY_RECORDS (record_id, user_id, situation, customer_pay, company_pay)
VALUES (2, 4, 'Cancelled Trip', 200.00, 300.00);
