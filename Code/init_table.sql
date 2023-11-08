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
    VALUES (5, 'David Brown', 'east', '567 South St, Seattle, WA 98101', '555-3456', 'N', 100000, CHAR_TO_LABEL('PROJECT_OLS_POL','TS:C:EA'));
    COMMIT;
end;
/

SELECT SA_SESSION.LABEL('PROJECT_OLS_POL') FROM DUAL; -- current user session label
SELECT SA_SESSION.ROW_LABEL('PROJECT_OLS_POL') FROM DUAL; -- current data label to be applied
SELECT SA_SESSION.PRIVS('PROJECT_OLS_POL') FROM DUAL;

  --(3, 'Mike Johnson', 'north', '789 Spring St, Los Angeles, CA 90001', '555-9876', 'N', null),  
  --(4, 'Emily Davis', 'south', '1234 North Ave, Chicago, IL 60606', '555-4567', 'Y', 7777),  
  --(5, 'David Brown', 'east', '567 South St, Seattle, WA 98101', '555-3456', 'N', 6666);