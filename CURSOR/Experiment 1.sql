CREATE TABLE Person (
  pid NUMBER PRIMARY KEY,
  pname VARCHAR2(50),
  DOB DATE
);

Table created.
SQL> INSERT INTO Person VALUES (1, 'Ravi', TO_DATE('15-06-2001', 'DD-MM-YYYY'));
1 row created.

SQL> INSERT INTO Person VALUES (2, 'Meena', TO_DATE('23-03-1999', 'DD-MM-YYYY'));
1 row created.

SQL> INSERT INTO Person VALUES (3, 'Ajay', TO_DATE('10-12-1985', 'DD-MM-YYYY'));
1 row created.

SQL> COMMIT;

SQL> SET SERVEROUTPUT ON;

SQL> DECLARE
      CURSOR person_cur IS SELECT pid, pname, DOB FROM Person;
      v_pid Person.pid%TYPE;
      v_name Person.pname%TYPE;
      v_dob Person.DOB%TYPE;
      v_age NUMBER;
    BEGIN
    OPEN person_cur;
    LOOP
      FETCH person_cur INTO v_pid, v_name, v_dob;
      EXIT WHEN person_cur%NOTFOUND;
      v_age := TRUNC(MONTHS_BETWEEN(SYSDATE, v_dob) / 12);
      DBMS_OUTPUT.PUT_LINE('PID: ' || v_pid || ' Name: ' || v_name || ' Age: ' || v_age);
    END LOOP;
  CLOSE person_cur;
  END;
  /


OUTPUT
PID: 1 Name: Ravi Age: 24
PID: 2 Name: Meena Age: 26
PID: 3 Name: Ajay Age: 39
