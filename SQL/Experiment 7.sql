mysql> SELECT * FROM FACULTY2_43;;
+------------+--------------+--------------------+---------------------+------------+---------------+
| FACULTY_ID | NAME         | EMAILID            | DESIGNATION         | JOIN_DATE  | RELIEVED_DATE |
+------------+--------------+--------------------+---------------------+------------+---------------+
|        101 | ANITA NAIR   | anita@college.edu  | PROFESSOR           | 2025-06-01 | NULL          |
|        102 | RAJESH KUMAR | rajesh@college.edu | PROFESSOR           | 2018-07-10 | NULL          |
|        103 | MEERA THOMAS | meera@college.edu  | ASSISTANT PROFESSOR | 2020-01-05 | NULL          |
+------------+--------------+--------------------+---------------------+------------+---------------+
3 rows in set (0.00 sec)

mysql> SELECT * FROM STUDENT2_43;
+--------+---------+------------+-----------+------+------+--------+--------------+-----------------+------------+
| ROLLNO | NAME    | UTYREG     | ADDRESS   | ADMN | PASS | BRANCH | CLASSTEACHER | EMAILID         | PHNO       |
+--------+---------+------------+-----------+------+------+--------+--------------+-----------------+------------+
|    201 | ARJUN   | UTY2021001 | KOCHI     | 2020 | 2024 | CSE    |          101 | arjun@uni.edu   | 9876543210 |
|    202 | DIVYA   | UTY2021002 | TVM       | 2020 | 2024 | CSE    |          101 | divya@uni.edu   | 9876543211 |
|    203 | RAHUL   | UTY2021003 | KOZHIKODE | 2021 | 2025 | ECE    |          102 | rahul@uni.edu   | 9876543212 |
|    204 | SANDEEP | UTY2021004 | KOTTAYAM  | 2021 | 2025 | MECH   |          103 | sandeep@uni.edu | 9876543213 |
+--------+---------+------------+-----------+------+------+--------+--------------+-----------------+------------+
4 rows in set (0.00 sec)

mysql> SELECT * FROM COURSE_43;
+-----------+--------+--------+--------------+
| COURSE_ID | ROLLNO | TOTAL  | GRADE        |
+-----------+--------+--------+--------------+
|       301 |    201 | 890.00 | DISTINCTION  |
|       302 |    202 | 750.00 | FIRST CLASS  |
|       303 |    203 | 680.00 | SECOND CLASS |
|       304 |    204 | 720.00 | FIRST CLASS  |
+-----------+--------+--------+--------------+
4 rows in set (0.00 sec)

mysql> SELECT * FROM PROJECT_43;
+---------+--------+-------------------------------+------------+----------+----------+
| PROJ_ID | ROLLNO | TITLE                         | FACULTY_ID | DURATION | AREA     |
+---------+--------+-------------------------------+------------+----------+----------+
|     401 |    201 | AI BASED TRAFFIC SYSTEM       |        101 |     2025 | AI       |
|     402 |    202 | SMART AGRICULTURAL MONITORING |        102 |     2025 | IOT      |
|     403 |    203 | 5G NETWORK OPTIMISATION       |        102 |     2024 | NETWORKS |
|     404 |    204 | ROBORIC ARM FOR MANUFACTURING |        103 |     2025 | ROBOTICS |
+---------+--------+-------------------------------+------------+----------+----------+
4 rows in set (0.01 sec)

mysql> SELECT ROLLNO,NAME,ADDRESS,PASS,BRANCH FROM STUDENT2_43 WHERE BRANCH='CSE' GROUP BY PASS,ROLLNO,NAME,ADDRESS,BRANCH;
+--------+-------+---------+------+--------+
| ROLLNO | NAME  | ADDRESS | PASS | BRANCH |
+--------+-------+---------+------+--------+
|    201 | ARJUN | KOCHI   | 2024 | CSE    |
|    202 | DIVYA | TVM     | 2024 | CSE    |
+--------+-------+---------+------+--------+
2 rows in set (0.00 sec)

mysql> SELECT ROLLNO,NAME,BRANCH,PASS FROM STUDENT2_43 ORDER BY PASS,BRANCH;
+--------+---------+--------+------+
| ROLLNO | NAME    | BRANCH | PASS |
+--------+---------+--------+------+
|    201 | ARJUN   | CSE    | 2024 |
|    202 | DIVYA   | CSE    | 2024 |
|    203 | RAHUL   | ECE    | 2025 |
|    204 | SANDEEP | MECH   | 2025 |
+--------+---------+--------+------+
4 rows in set (0.00 sec)

mysql> SELECT P.* FROM PROJECT_43 P JOIN STUDENT2_43 S ON P.ROLLNO=S.ROLLNO WHERE S.BRANCH='CSE';
+---------+--------+-------------------------------+------------+----------+------+
| PROJ_ID | ROLLNO | TITLE                         | FACULTY_ID | DURATION | AREA |
+---------+--------+-------------------------------+------------+----------+------+
|     401 |    201 | AI BASED TRAFFIC SYSTEM       |        101 |     2025 | AI   |
|     402 |    202 | SMART AGRICULTURAL MONITORING |        102 |     2025 | IOT  |
+---------+--------+-------------------------------+------------+----------+------+
2 rows in set (0.00 sec)

mysql> SELECT NAME,COUNT(*) AS PROJ_COUNT FROM FACULTY2_43 F JOIN PROJECT_43 P ON F.FACULTY_ID=P.FACULTY_ID GROUP BY (P.FACULTY_ID) HAVING COUNT(P.FACULTY_ID)>1;
+--------------+------------+
| NAME         | PROJ_COUNT |
+--------------+------------+
| RAJESH KUMAR |          2 |
+--------------+------------+
1 row in set (0.00 sec)

mysql> SELECT S.NAME,S.BRANCH,C.TOTAL,PASS FROM STUDENT2_43 S JOIN COURSE_43 C ON S.ROLLNO=C.ROLLNO WHERE C.TOTAL=(SELECT MAX(C2.TOTAL)FROM STUDENT2_43 S2 JOIN COURSE_43 C2 ON S2.ROLLNO=C2.ROLLNO WHERE S2.PASS=S.PASS);
+---------+--------+--------+------+
| NAME    | BRANCH | TOTAL  | PASS |
+---------+--------+--------+------+
| ARJUN   | CSE    | 890.00 | 2024 |
| SANDEEP | MECH   | 720.00 | 2025 |
+---------+--------+--------+------+
2 rows in set (0.01 sec)

mysql> SELECT S.*,C.TOTAL,PASS FROM STUDENT2_43 S JOIN COURSE_43 C ON S.ROLLNO=C.ROLLNO WHERE C.TOTAL=(SELECT MAX(C2.TOTAL)FROM STUDENT2_43 S2 JOIN COURSE_43 C2 ON S2.ROLLNO=C2.ROLLNO WHERE S2.PASS=S.PASS);
+--------+---------+------------+----------+------+------+--------+--------------+-----------------+------------+--------+------+
| ROLLNO | NAME    | UTYREG     | ADDRESS  | ADMN | PASS | BRANCH | CLASSTEACHER | EMAILID         | PHNO       | TOTAL  | PASS |
+--------+---------+------------+----------+------+------+--------+--------------+-----------------+------------+--------+------+
|    201 | ARJUN   | UTY2021001 | KOCHI    | 2020 | 2024 | CSE    |          101 | arjun@uni.edu   | 9876543210 | 890.00 | 2024 |
|    204 | SANDEEP | UTY2021004 | KOTTAYAM | 2021 | 2025 | MECH   |          103 | sandeep@uni.edu | 9876543213 | 720.00 | 2025 |
+--------+---------+------------+----------+------+------+--------+--------------+-----------------+------------+--------+------+
2 rows in set (0.00 sec)

mysql> SELECT S.* FROM STUDENT2_43 S JOIN COURSE_43 C ON S.ROLLNO=C.ROLLNO WHERE C.GRADE='FIRST CLASS' AND S.ADMN=2020;
+--------+-------+------------+---------+------+------+--------+--------------+---------------+------------+
| ROLLNO | NAME  | UTYREG     | ADDRESS | ADMN | PASS | BRANCH | CLASSTEACHER | EMAILID       | PHNO       |
+--------+-------+------------+---------+------+------+--------+--------------+---------------+------------+
|    202 | DIVYA | UTY2021002 | TVM     | 2020 | 2024 | CSE    |          101 | divya@uni.edu | 9876543211 |
+--------+-------+------------+---------+------+------+--------+--------------+---------------+------------+
1 row in set (0.00 sec)

mysql> SELECT P.TITLE,F.NAME,F.EMAILID,S.BRANCH FROM PROJECT_43 P JOIN FACULTY2_43 F ON P.FACULTY_ID=F.FACULTY_ID JOIN STUDENT2_43 S ON S.ROLLNO=P.ROLLNO WHERE AREA='IOT' ORDER BY S.BRANCH;
+-------------------------------+--------------+--------------------+--------+
| TITLE                         | NAME         | EMAILID            | BRANCH |
+-------------------------------+--------------+--------------------+--------+
| SMART AGRICULTURAL MONITORING | RAJESH KUMAR | rajesh@college.edu | CSE    |
+-------------------------------+--------------+--------------------+--------+
1 row in set (0.00 sec)

mysql> SELECT S.BRANCH,S.ADMN,C.GRADE,COUNT(GRADE) AS COUNT FROM COURSE_43 C JOIN STUDENT2_43 S ON C.ROLLNO=S.ROLLNO GROUP BY S.BRANCH,S.ADMN,C.GRADE;
+--------+------+--------------+-------+
| BRANCH | ADMN | GRADE        | COUNT |
+--------+------+--------------+-------+
| CSE    | 2020 | DISTINCTION  |     1 |
| CSE    | 2020 | FIRST CLASS  |     1 |
| ECE    | 2021 | SECOND CLASS |     1 |
| MECH   | 2021 | FIRST CLASS  |     1 |
+--------+------+--------------+-------+
4 rows in set (0.00 sec)

mysql> SELECT * FROM STUDENT2_43 S WHERE ADMN=2021 ORDER BY BRANCH ASC;
+--------+---------+------------+-----------+------+------+--------+--------------+-----------------+------------+
| ROLLNO | NAME    | UTYREG     | ADDRESS   | ADMN | PASS | BRANCH | CLASSTEACHER | EMAILID         | PHNO       |
+--------+---------+------------+-----------+------+------+--------+--------------+-----------------+------------+
|    203 | RAHUL   | UTY2021003 | KOZHIKODE | 2021 | 2025 | ECE    |          102 | rahul@uni.edu   | 9876543212 |
|    204 | SANDEEP | UTY2021004 | KOTTAYAM  | 2021 | 2025 | MECH   |          103 | sandeep@uni.edu | 9876543213 |
+--------+---------+------------+-----------+------+------+--------+--------------+-----------------+------------+
2 rows in set (0.00 sec)

mysql> SELECT * FROM STUDENT2_43 ORDER BY BRANCH,ADMN ASC;
+--------+---------+------------+-----------+------+------+--------+--------------+-----------------+------------+
| ROLLNO | NAME    | UTYREG     | ADDRESS   | ADMN | PASS | BRANCH | CLASSTEACHER | EMAILID         | PHNO       |
+--------+---------+------------+-----------+------+------+--------+--------------+-----------------+------------+
|    201 | ARJUN   | UTY2021001 | KOCHI     | 2020 | 2024 | CSE    |          101 | arjun@uni.edu   | 9876543210 |
|    202 | DIVYA   | UTY2021002 | TVM       | 2020 | 2024 | CSE    |          101 | divya@uni.edu   | 9876543211 |
|    203 | RAHUL   | UTY2021003 | KOZHIKODE | 2021 | 2025 | ECE    |          102 | rahul@uni.edu   | 9876543212 |
|    204 | SANDEEP | UTY2021004 | KOTTAYAM  | 2021 | 2025 | MECH   |          103 | sandeep@uni.edu | 9876543213 |
+--------+---------+------------+-----------+------+------+--------+--------------+-----------------+------------+
4 rows in set (0.00 sec)

mysql> SELECT S.BRANCH,S.PASS,MAX(C.TOTAL) AS BEST,MIN(C.TOTAL) AS WORST,AVG(C.TOTAL) AS AVERAGE FROM COURSE_43 C JOIN STUDENT2_43 S ON C.ROLLNO=S.ROLLNO GROUP BY S.BRANCH,S.PASS;
+--------+------+--------+--------+------------+
| BRANCH | PASS | BEST   | WORST  | AVERAGE    |
+--------+------+--------+--------+------------+
| CSE    | 2024 | 890.00 | 750.00 | 820.000000 |
| ECE    | 2025 | 680.00 | 680.00 | 680.000000 |
| MECH   | 2025 | 720.00 | 720.00 | 720.000000 |
+--------+------+--------+--------+------------+
3 rows in set (0.00 sec)

