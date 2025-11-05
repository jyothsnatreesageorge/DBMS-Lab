
SQL> CREATE TABLE EMPLOYEE3 (
      empid NUMBER PRIMARY KEY,
      empname VARCHAR2(50),
      salary NUMBER
      );
Table created.

SQL> CREATE TABLE INC (
      empid NUMBER,
      incr NUMBER
      );
Table created.

SQL> INSERT INTO EMPLOYEE3 VALUES (301, 'Gokul', 20000);
1 row created.

SQL> INSERT INTO EMPLOYEE3 VALUES (302, 'Hari', 30000);
1 row created.

SQL> COMMIT;
Commit complete.

SQL> CREATE OR REPLACE TRIGGER salary_increment_trigger
      AFTER UPDATE OF salary ON EMPLOYEE3 FOR EACH ROW
      DECLARE v_diff NUMBER;
      BEGIN
        v_diff := :NEW.salary - :OLD.salary;
        IF v_diff > 1000 THEN
          INSERT INTO INC(empid, incr) VALUES (:OLD.empid, v_diff);
          DBMS_OUTPUT.PUT_LINE('Increment record inserted for EmpID: ' || :OLD.empid || ', Increment: ' || v_diff);
        END IF;
    END;
    /
Trigger created.

SQL> UPDATE EMPLOYEE3 SET salary = 22000 WHERE empid = 301;
Increment record inserted for EmpID: 301, Increment: 2000
1 row updated.

SQL> UPDATE EMPLOYEE3 SET salary = 30500 WHERE empid = 302;
1 row updated.

SQL> SELECT * FROM INC;

     EMPID       INCR
---------- ----------
       301       2000
