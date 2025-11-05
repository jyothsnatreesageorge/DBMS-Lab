SQL> CREATE TABLE EMPLOYEE2 (
      empid NUMBER PRIMARY KEY,
      empname VARCHAR2(50),
      designation VARCHAR2(50),
      dept VARCHAR2(50),
      salary NUMBER
   );
Table created.

SQL> INSERT INTO EMPLOYEE2 VALUES (201, 'Deepa', 'Manager', 'HR', 55000);
1 row created.

SQL> INSERT INTO EMPLOYEE2 VALUES (202, 'Eby', 'Clerk', 'Accounts', 25000);
1 row created.

SQL> COMMIT;
Commit complete.

SQL> CREATE OR REPLACE TRIGGER emp_count_trigger
   AFTER INSERT OR DELETE OR UPDATE ON EMPLOYEE2
   DECLARE v_count NUMBER;
   BEGIN
   SELECT COUNT(*) INTO v_count FROM EMPLOYEE;
   DBMS_OUTPUT.PUT_LINE('Total number of tuples in EMPLOYEE2: ' || v_count);
   END;
   /
Trigger created.

SQL> INSERT INTO EMPLOYEE2 VALUES (203, 'Fayiz', 'Developer', 'IT', 40000);
Total number of tuples in EMPLOYEE2: 3
1 row created.

SQL> UPDATE EMPLOYEE2 SET salary = 60000 WHERE empid = 201;
Total number of tuples in EMPLOYEE2: 3
1 row updated.

SQL> DELETE FROM EMPLOYEE2 WHERE empid = 202;
Total number of tuples in EMPLOYEE2: 2
1 row deleted.
