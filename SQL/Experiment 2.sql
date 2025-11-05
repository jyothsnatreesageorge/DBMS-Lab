mysql> SELECT * FROM COLLEGE_43;
+--------------+--------------+------------+
| COLLEGE_CODE | COLLEGE_NAME | ADDRESS    |
+--------------+--------------+------------+
|          101 | RIT          | KOTTAYAM   |
|          102 | CET          | TRIVANDRUM |
|          103 | GEC          | TRISSUR    |
|          104 | TKM          | KOLLAM     |
|          105 | NSS          | PALAKKAD   |
|          106 | MEC          | ERNAKULAM  |
|          107 | GEC          | TRIVANDRUM |
|          108 | MACE         | ERNAKULAM  |
|          109 | GEC          | IDUKKI     |
|          110 | GEC          | WAYANAD    |
+--------------+--------------+------------+
10 rows in set (0.00 sec)

mysql> SELECT * FROM FACULTY_43;
+--------------+--------------+--------------+---------------+------+-------+------------+
| COLLEGE_CODE | FACULTY_CODE | FACULTY_NAME | QUALIFICATION | EXP  | DEPT  | ADDRESS    |
+--------------+--------------+--------------+---------------+------+-------+------------+
|          101 |         1001 | ANU          | MTECH         |   10 | CSE   | KOCHI      |
|          102 |         1002 | RAVI         | PHD           |   15 | ECE   | TRIVANDRUM |
|          101 |         1003 | MAYA         | BTECH         |    4 | MECH  | KOLLAM     |
|          103 |         1004 | JITHIN       | MTECH         |   12 | CIVIL | TRISSUR    |
|          104 |         1005 | SNEHA        | PHD           |    8 | CSE   | ERNAKULAM  |
|          105 |         1006 | ARJUN        | MTECH         |   11 | MECH  | PALAKKAD   |
|          101 |         1007 | DIYA         | BTECH         |    2 | EEE   | KOCHI      |
|          109 |         1008 | FARHAN       | MTECH         |    9 | CSE   | IDUKKI     |
|          110 |         1009 | MEERA        | PHD           |   14 | ECE   | WAYANAD    |
|          106 |         1010 | RENJITH      | MTECH         |    7 | CIVIL | KOTTAYAM   |
|          107 |         1011 | SHAJI        | PHD           |   13 | RAI   | ALAPPUZHA  |
|          108 |         1012 | JOE          | MTECH         |    7 | RAI   | KOTTAYAM   |
|          109 |         1013 | NITHIN       | BTECH         |    3 | ARCH  | KOZHKODE   |
|          103 |         1014 | NEETHU       | MTECH         |   14 | ARCH  | KASARGOD   |
|          104 |         1015 | VARUN        | PHD           |    8 | EEE   | WAYANAD    |
|          105 |         1016 | ARUN         | BTECH         |    5 | RAI   | TRISSUR    |
|          106 |         1017 | ARATHY       | BTECH         |    6 | ECE   | TRIVANDRUM |
|          107 |         1018 | ABHINAV      | MTECH         |   10 | MECH  | PALAKKAD   |
|          110 |         1020 | JOHN         | MTECH         |   13 | MECH  | IDUKKI     |
|          108 |         1019 | SHAJAHAN     | BTECH         |    1 | CIVIL | ALAPPUZHA  |
+--------------+--------------+--------------+---------------+------+-------+------------+
20 rows in set (0.00 sec)

mysql> SELECT * FROM FACULTY_43 WHERE COLLEGE_CODE=105 AND EXP>=10;
+--------------+--------------+--------------+---------------+------+------+----------+
| COLLEGE_CODE | FACULTY_CODE | FACULTY_NAME | QUALIFICATION | EXP  | DEPT | ADDRESS  |
+--------------+--------------+--------------+---------------+------+------+----------+
|          105 |         1006 | ARJUN        | MTECH         |   11 | MECH | PALAKKAD |
+--------------+--------------+--------------+---------------+------+------+----------+
1 row in set (0.00 sec)

mysql> SELECT * FROM FACULTY WHERE COLLEGE_CODE=107 AND EXP>=10 AND QUALIFICATION!='MTECH';
+--------------+--------------+--------------+---------------+------+------+-----------+
| COLLEGE_CODE | FACULTY_CODE | FACULTY_NAME | QUALIFICATION | EXP  | DEPT | ADDRESS   |
+--------------+--------------+--------------+---------------+------+------+-----------+
|          107 |         1011 | SHAJI        | PHD           |   13 | RAI  | ALAPPUZHA |
+--------------+--------------+--------------+---------------+------+------+-----------+
1 row in set (0.00 sec)

mysql> SELECT * FROM FACULTY_43 WHERE COLLEGE_CODE=101 ORDER BY DEPT,EXP ASC;
+--------------+--------------+--------------+---------------+------+------+-----------+
| COLLEGE_CODE | FACULTY_CODE | FACULTY_NAME | QUALIFICATION | EXP  | DEPT | ADDRESS   |
+--------------+--------------+--------------+---------------+------+------+-----------+
|          101 |         1021 | RAHMAN       | BTECH         |    2 | CSE  | ALAPPUZHA |
|          101 |         1001 | ANU          | MTECH         |   10 | CSE  | KOCHI     |
|          101 |         1007 | DIYA         | BTECH         |    2 | EEE  | KOCHI     |
|          101 |         1003 | MAYA         | BTECH         |    4 | MECH | KOLLAM    |
+--------------+--------------+--------------+---------------+------+------+-----------+
4 rows in set (0.00 sec)

mysql> SELECT COLLEGE_NAME FROM COLLEGE_43,FACULTY_43 WHERE COLLEGE_43.COLLEGE_CODE=FACULTY_43.COLLEGE_CODE GROUP BY FACULTY_43.COLLEGE_CODE HAVING COUNT(*)>=2;
+--------------+
| COLLEGE_NAME |
+--------------+
| RIT          |
| GEC          |
| TKM          |
| NSS          |
| MEC          |
| GEC          |
| MACE         |
| GEC          |
| GEC          |
+--------------+
9 rows in set (0.00 sec)

mysql> SELECT COLLEGE_NAME,NUM_FACULTY FROM(SELECT C.COLLEGE_NAME,COUNT(F.FACULTY_CODE) AS NUM_FACULTY FROM COLLEGE_43 C JOIN FACULTY_43 F ON C.COLLEGE_CODE=F.COLLEGE_CODE GROUP BY C.COLLEGE_CODE,C.COLLEGE_NAME) AS COUNTS WHERE NUM_FACULTY=(SELECT MIN(COUNTS2.NUM_FACULTY)FROM(SELECT COUNT(F2.FACULTY_CODE) AS NUM_FACULTY FROM COLLEGE_43 C2 JOIN FACULTY_43 F2 ON C2.COLLEGE_CODE=F2.COLLEGE_CODE GROUP BY C2.COLLEGE_CODE) AS COUNTS2)OR NUM_FACULTY=(SELECT MAX(COUNTS3.NUM_FACULTY)FROM (SELECT COUNT(F3.FACULTY_CODE)AS NUM_FACULTY FROM COLLEGE_43 C3 JOIN FACULTY_43 F3 ON C3.COLLEGE_CODE=F3.COLLEGE_COD
E GROUP BY C3.COLLEGE_CODE)AS COUNTS3);
+--------------+-------------+
| COLLEGE_NAME | NUM_FACULTY |
+--------------+-------------+
| RIT          |           4 |
| CET          |           1 |
+--------------+-------------+
2 rows in set (0.00 sec)
