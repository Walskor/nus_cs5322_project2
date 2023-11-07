delete from USERS;

select * from USERS;

begin
    INSERT INTO INSURANCE.USERS (user_id, name, region, address, contact, is_customer, premium)  
    VALUES (1, 'John Doe', 'east', '123 Main St, New York, NY 10001', '555-1234', 'Y', 9999, CHAR_TO_LABEL('PROJECT_OLS_POL','S:C:ES'));
    INSERT INTO INSURANCE.USERS (user_id, name, region, address, contact, is_customer, premium)  
    VALUES (2, 'Jane Smith', 'west', '456 El Camino Real, San Francisco, CA 94101', '555-5678', 'Y', 8888, CHAR_TO_LABEL('PROJECT_OLS_POL','TS:C,H,J:COM'));
end;
/

SELECT SA_SESSION.LABEL('PROJECT_OLS_POL') FROM DUAL; -- current user session label
SELECT SA_SESSION.ROW_LABEL('PROJECT_OLS_POL') FROM DUAL; -- current data label to be applied
SELECT SA_SESSION.PRIVS('PROJECT_OLS_POL') FROM DUAL;

  --(3, 'Mike Johnson', 'north', '789 Spring St, Los Angeles, CA 90001', '555-9876', 'N', null),  
  --(4, 'Emily Davis', 'south', '1234 North Ave, Chicago, IL 60606', '555-4567', 'Y', 7777),  
  --(5, 'David Brown', 'east', '567 South St, Seattle, WA 98101', '555-3456', 'N', 6666);