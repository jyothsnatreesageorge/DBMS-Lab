SQL> CREATE TABLE Employee (
      empid NUMBER PRIMARY KEY,
      empname VARCHAR2(50),
      joining_date DATE,
      relieving_date DATE,
      salary NUMBER
      );
Table created.

SQL> INSERT INTO Employee VALUES (101, 'Anita', TO_DATE('01-01-2010', 'DD-MM-YYYY'), TO_DATE('31-12-2020', 'DD-MM-YYYY'), 40000);
1 row created.

SQL> INSERT INTO Employee VALUES (102, 'Binu', TO_DATE('15-06-2015', 'DD-MM-YYYY'), TO_DATE('30-06-2021', 'DD-MM-YYYY'), 35000);
1 row created.

SQL> INSERT INTO Employee VALUES (103, 'Cyril', TO_DATE('10-10-2018', 'DD-MM-YYYY'), NULL, 30000);
1 row created.

SQL> COMMIT;
Commit complete.

SQL> DECLARE
      CURSOR emp_cur IS SELECT empid, empname, joining_date, relieving_date FROM Employee WHERE relieving_date IS NOT NULL;
      v_id Employee.empid%TYPE;
      v_name Employee.empname%TYPE;
      v_join Employee.joining_date%TYPE;
      v_rel Employee.relieving_date%TYPE;
      v_years NUMBER;
    BEGIN
          OPEN emp_cur;
          LOOP
            FETCH emp_cur INTO v_id, v_name, v_join, v_rel;
            EXIT WHEN emp_cur%NOTFOUND;
            v_years := TRUNC(MONTHS_BETWEEN(v_rel, v_join) / 12);
            DBMS_OUTPUT.PUT_LINE('EmpID: ' || v_id || ' Name: ' || v_name || ' Service: ' || v_years || ' years');
          END LOOP;
          CLOSE emp_cur;
    END;
    /


OUTPUT
EmpID: 101 Name: Anita Service: 10 years
EmpID: 102 Name: Binu Service: 6 years


SQL> DECLARE
      CURSOR pension_cur IS SELECT empid, empname, joining_date, relieving_date, salary FROM Employee WHERE relieving_date IS NOT NULL;
      v_id Employee.empid%TYPE;
      v_name Employee.empname%TYPE;
      v_join Employee.joining_date%TYPE;
      v_rel Employee.relieving_date%TYPE;
      v_sal Employee.salary%TYPE;
      v_years NUMBER;
      v_pension NUMBER;
      BEGIN
            OPEN pension_cur;
            LOOP
                  FETCH pension_cur INTO v_id, v_name, v_join, v_rel, v_sal;
                  EXIT WHEN pension_cur%NOTFOUND;
                  v_years := TRUNC(MONTHS_BETWEEN(v_rel, v_join) / 12);
                  v_pension := (v_years * v_sal) / 100;
                  DBMS_OUTPUT.PUT_LINE('EmpID: ' || v_id || ' Name: ' || v_name || ' Pension: ' || v_pension);
            END LOOP;
            CLOSE pension_cur;
      END;
      /


OUTPUT
EmpID: 101 Name: Anita Pension: 4000
EmpID: 102 Name: Binu Pension: 2100
