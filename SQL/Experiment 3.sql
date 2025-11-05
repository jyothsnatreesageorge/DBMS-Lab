mysql> SELECT * FROM BOOK_43;
+--------+--------+-----------+---------+------------+------------+------------------+
| ACC_NO | TITLE  | PUBLISHER | AUTHOR  | DOPR       | DOPB       | STATUS           |
+--------+--------+-----------+---------+------------+------------+------------------+
|   1001 | DBMS   | PEARSON   | NAVATHE | 2025-06-01 | 2024-10-10 | ISSUED           |
|   1002 | DBMS   | PEARSON   | NAVATHE | 2025-06-01 | 2024-10-10 | PRESENT IN LIB   |
|   1003 | DBMS   | PEARSON   | NAVATHE | 2025-06-01 | 2024-10-10 | REFERENCE        |
|   1004 | DBMS   | PEARSON   | NAVATHE | 2025-06-01 | 2024-10-10 | ISSUED           |
|   1005 | DBMS   | PEARSON   | NAVATHE | 2025-06-01 | 2024-10-10 | ISSUED           |
|   1006 | C PRO  | MGH       | DENNIS  | 2025-01-10 | 2024-06-01 | REFERENCE        |
|   1007 | JAVA   | OREILLY   | KATHY   | 2024-11-15 | 2023-12-10 | CANNOT BE ISSUED |
|   1008 | JAVA   | OREILLY   | KATHY   | 2024-11-15 | 2023-12-10 | CANNOT BE ISSUED |
|   1009 | AI     | MGH       | RUSSEL  | 2025-02-20 | 2025-01-15 | ISSUED           |
|   1010 | AI     | MGH       | RUSSEL  | 2025-02-20 | 2025-01-15 | REFERENCE        |
|   1011 | CLOUD  | PEARSON   | BUYYA   | 2025-07-15 | 2023-06-01 | ISSUED           |
|   1012 | PYTHON | WILEY     | ROSSUM  | 2025-07-01 | 2023-03-01 | PRESENT IN LIB   |
|   1013 | PYTHON | WILEY     | ROSSUM  | 2025-07-01 | 2023-03-01 | PRESENT IN LIB   |
|   1014 | PYTHON | WILEY     | ROSSUM  | 2025-07-01 | 2023-03-01 | REFERENCE        |
|   1015 | PYTHON | WILEY     | ROSSUM  | 2025-07-01 | 2023-03-01 | ISSUED           |
|   1016 | PYTHON | WILEY     | ROSSUM  | 2025-07-01 | 2023-03-01 | ISSUED           |
|   1017 | PYTHON | WILEY     | ROSSUM  | 2025-07-01 | 2023-03-01 | CANNOT BE ISSUED |
|   1018 | CLOUD  | PEARSON   | BUYYA   | 2025-07-15 | 2023-06-01 | REFERENCE        |
|   1019 | CLOUD  | PEARSON   | BUYYA   | 2025-07-15 | 2023-06-01 | PRESENT IN LIB   |
|   1020 | PYTHON | WILEY     | ROSSUM  | 2025-07-01 | 2023-03-01 | PRESENT IN LIB   |
|   1021 | PYTHON | WILEY     | ROSSUM  | 2025-07-01 | 2023-03-01 | ISSUED           |
|   1022 | JAVA   | OREILLY   | KATHY   | 2024-11-15 | 2023-12-10 | ISSUED           |
|   1023 | JAVA   | OREILLY   | KATHY   | 2024-11-15 | 2023-12-10 | REFERENCE        |
|   1024 | PYTHON | WILEY     | ROSSUM  | 2025-07-01 | 2023-03-01 | REFERENCE        |
|   1025 | PYTHON | WILEY     | ROSSUM  | 2025-07-01 | 2023-03-01 | PRESENT IN LIB   |
|   1026 | C PRO  | MGH       | DENNIS  | 2025-01-10 | 2024-06-01 | ISSUED           |
|   1027 | C PRO  | MGH       | DENNIS  | 2025-01-10 | 2024-06-01 | CANNOT BE ISSUED |
|   1028 | PYTHON | WILEY     | ROSSUM  | 2025-07-01 | 2023-03-01 | REFERENCE        |
|   1029 | PYTHON | WILEY     | ROSSUM  | 2025-07-01 | 2023-03-01 | ISSUED           |
|   1030 | JAVA   | OREILLY   | KATHY   | 2024-11-15 | 2023-12-10 | ISSUED           |
+--------+--------+-----------+---------+------------+------------+------------------+
30 rows in set (0.00 sec)


mysql> SELECT TITLE,COUNT(*) AS COPIES FROM BOOK_43 GROUP BY TITLE;
+--------+--------+
| TITLE  | COPIES |
+--------+--------+
| DBMS   |      5 |
| C PRO  |      3 |
| JAVA   |      5 |
| AI     |      2 |
| CLOUD  |      3 |
| PYTHON |     12 |
+--------+--------+
6 rows in set (0.00 sec)

mysql> SELECT TITLE,COUNT(*) AS REF_COPY FROM BOOK_43 WHERE STATUS='REFERENCE' GROUP BY TITLE;
+--------+----------+
| TITLE  | REF_COPY |
+--------+----------+
| DBMS   |        1 |
| C PRO  |        1 |
| AI     |        1 |
| PYTHON |        3 |
| CLOUD  |        1 |
| JAVA   |        1 |
+--------+----------+
6 rows in set (0.00 sec)

mysql> SELECT TITLE,COUNT(CASE WHEN STATUS='REFERENCE' THEN 1 END) AS REFCOPY,COUNT(CASE WHEN STATUS='ISSUED' THEN 1 END) AS ISSUEDCOPY,COUNT(CASE WHEN STATUS='PRESENT IN LIB' THEN 1 END) AS PRESENTCOPY FROM BOOK_43 GROUP BY TITLE;
+--------+---------+------------+-------------+
| TITLE  | REFCOPY | ISSUEDCOPY | PRESENTCOPY |
+--------+---------+------------+-------------+
| DBMS   |       1 |          3 |           1 |
| C PRO  |       1 |          1 |           0 |
| JAVA   |       1 |          2 |           0 |
| AI     |       1 |          1 |           0 |
| CLOUD  |       1 |          1 |           1 |
| PYTHON |       3 |          4 |           4 |
+--------+---------+------------+-------------+
6 rows in set (0.00 sec)

mysql> SELECT * FROM BOOK_43 WGERE STATUS='CANNOT BE ISSUED' ORDER BY PUBLISHER;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'STATUS='CANNOT BE ISSUED' ORDER BY PUBLISHER' at line 1
mysql> SELECT * FROM BOOK_43 WHERE STATUS='CANNOT BE ISSUED' ORDER BY PUBLISHER;
+--------+--------+-----------+--------+------------+------------+------------------+
| ACC_NO | TITLE  | PUBLISHER | AUTHOR | DOPR       | DOPB       | STATUS           |
+--------+--------+-----------+--------+------------+------------+------------------+
|   1027 | C PRO  | MGH       | DENNIS | 2025-01-10 | 2024-06-01 | CANNOT BE ISSUED |
|   1007 | JAVA   | OREILLY   | KATHY  | 2024-11-15 | 2023-12-10 | CANNOT BE ISSUED |
|   1008 | JAVA   | OREILLY   | KATHY  | 2024-11-15 | 2023-12-10 | CANNOT BE ISSUED |
|   1017 | PYTHON | WILEY     | ROSSUM | 2025-07-01 | 2023-03-01 | CANNOT BE ISSUED |
+--------+--------+-----------+-------- +------------+------------+------------------+
4 rows in set (0.00 sec)

mysql> SELECT * FROM BOOK_43 WHERE DOPR>=CURRENT_DATE-INTERVAL '6' MONTH;
+--------+--------+-----------+---------+------------+------------+------------------+
| ACC_NO | TITLE  | PUBLISHER | AUTHOR  | DOPR       | DOPB       | STATUS           |
+--------+--------+-----------+---------+------------+------------+------------------+
|   1001 | DBMS   | PEARSON   | NAVATHE | 2025-06-01 | 2024-10-10 | ISSUED           |
|   1002 | DBMS   | PEARSON   | NAVATHE | 2025-06-01 | 2024-10-10 | PRESENT IN LIB   |
|   1003 | DBMS   | PEARSON   | NAVATHE | 2025-06-01 | 2024-10-10 | REFERENCE        |
|   1004 | DBMS   | PEARSON   | NAVATHE | 2025-06-01 | 2024-10-10 | ISSUED           |
|   1005 | DBMS   | PEARSON   | NAVATHE | 2025-06-01 | 2024-10-10 | ISSUED           |
|   1009 | AI     | MGH       | RUSSEL  | 2025-02-20 | 2025-01-15 | ISSUED           |
|   1010 | AI     | MGH       | RUSSEL  | 2025-02-20 | 2025-01-15 | REFERENCE        |
|   1011 | CLOUD  | PEARSON   | BUYYA   | 2025-07-15 | 2023-06-01 | ISSUED           |
|   1012 | PYTHON | WILEY     | ROSSUM  | 2025-07-01 | 2023-03-01 | PRESENT IN LIB   |
|   1013 | PYTHON | WILEY     | ROSSUM  | 2025-07-01 | 2023-03-01 | PRESENT IN LIB   |
|   1014 | PYTHON | WILEY     | ROSSUM  | 2025-07-01 | 2023-03-01 | REFERENCE        |
|   1015 | PYTHON | WILEY     | ROSSUM  | 2025-07-01 | 2023-03-01 | ISSUED           |
|   1016 | PYTHON | WILEY     | ROSSUM  | 2025-07-01 | 2023-03-01 | ISSUED           |
|   1017 | PYTHON | WILEY     | ROSSUM  | 2025-07-01 | 2023-03-01 | CANNOT BE ISSUED |
|   1018 | CLOUD  | PEARSON   | BUYYA   | 2025-07-15 | 2023-06-01 | REFERENCE        |
|   1019 | CLOUD  | PEARSON   | BUYYA   | 2025-07-15 | 2023-06-01 | PRESENT IN LIB   |
|   1020 | PYTHON | WILEY     | ROSSUM  | 2025-07-01 | 2023-03-01 | PRESENT IN LIB   |
|   1021 | PYTHON | WILEY     | ROSSUM  | 2025-07-01 | 2023-03-01 | ISSUED           |
|   1024 | PYTHON | WILEY     | ROSSUM  | 2025-07-01 | 2023-03-01 | REFERENCE        |
|   1025 | PYTHON | WILEY     | ROSSUM  | 2025-07-01 | 2023-03-01 | PRESENT IN LIB   |
|   1028 | PYTHON | WILEY     | ROSSUM  | 2025-07-01 | 2023-03-01 | REFERENCE        |
|   1029 | PYTHON | WILEY     | ROSSUM  | 2025-07-01 | 2023-03-01 | ISSUED           |
+--------+--------+-----------+---------+------------+------------+------------------+
22 rows in set (0.00 sec)

mysql> SELECT TITLE,DOPB,DOPR,COUNT(*) AS COPY FROM BOOK_43 WHERE DOPR>DOPB AND DOPR<=DOPB+INTERVAL '12' MONTH GROUP BY TITLE,DOPR,DOPB HAVING COUNT(*)>10;
+--------+------------+------------+------+
| TITLE  | DOPB       | DOPR       | COPY |
+--------+------------+------------+------+
| PYTHON | 2023-03-01 | 2024-03-01 |   12 |
+--------+------------+------------+------+
1 row in set (0.00 sec)

