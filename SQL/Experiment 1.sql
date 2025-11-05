mysql> CREATE DATABASE SAMPLE;
Query OK, 1 row affected (0.09 sec)

mysql> USE SAMPLE;
Database changed

mysql> CREATE TABLE EMP43(EMPNO NUMERIC(6),ENAME VARCHAR(20) NOT NULL,JOB VARCHAR(20) NOT NULL,DEPTNO NUMERIC(3),SAL NUMERIC(7,2));
Query OK, 0 rows affected (1.40 sec)

mysql> ALTER TABLE EMP43 ADD EXPERIENCE NUMERIC(2);
Query OK, 0 rows affected (0.39 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> ALTER TABLE EMP43 MODIFY COLUMN JOB VARCHAR(10) NOT NULL;
Query OK, 0 rows affected (1.97 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> CREATE TABLE DEPT43(DEPTNO NUMERIC(2) PRIMARY KEY,DNAME VARCHAR(10),LOC VARCHAR(10));
Query OK, 0 rows affected (0.55 sec)

mysql> CREATE TABLE EMP1_43(ENAME VARCHAR(20),EMPNO NUMERIC(3) CHECK(EMPNO>100));
Query OK, 0 rows affected (1.27 sec)

mysql> DESC EMP43;
+--------+--------------+------+-----+---------+-------+
| Field  | Type         | Null | Key | Default | Extra |
+--------+--------------+------+-----+---------+-------+
| EMPNO  | decimal(6,0) | YES  |     | NULL    |       |
| ENAME  | varchar(20)  | NO   |     | NULL    |       |
| JOB    | varchar(10)  | NO   |     | NULL    |       |
| DEPTNO | decimal(3,0) | YES  |     | NULL    |       |
| SAL    | decimal(7,2) | YES  |     | NULL    |       |
+--------+--------------+------+-----+---------+-------+
5 rows in set (0.00 sec)

mysql> DESC DEPT43;
+--------+--------------+------+-----+---------+-------+
| Field  | Type         | Null | Key | Default | Extra |
+--------+--------------+------+-----+---------+-------+
| DEPTNO | decimal(2,0) | NO   | PRI | NULL    |       |
| DNAME  | varchar(10)  | YES  |     | NULL    |       |
| LOC    | varchar(10)  | YES  |     | NULL    |       |
+--------+--------------+------+-----+---------+-------+
3 rows in set (0.01 sec)

mysql> TRUNCATE EMP43;
Query OK, 0 rows affected (1.26 sec)

mysql> DROP TABLE DEPT43;
Query OK, 0 rows affected (0.38 sec)

mysql> SHOW TABLES;
+------------------+
| Tables_in_SAMPLE |
+------------------+
| EMP1_43          |
| EMP43            |
+------------------+
2 rows in set (0.00 sec)

mysql> ALTER TABLE EMP43 DROP COLUMN EXPERIENCE;
Query OK, 0 rows affected (0.37 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> DROP TABLE EMP1_43;
Query OK, 0 rows affected (0.39 sec)

mysql> DROP DATABASE SAMPLE;
Query OK, 1 row affected (0.47 sec)

