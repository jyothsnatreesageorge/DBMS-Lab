mysql> SELECT * FROM BOOK2_43;
+--------+--------+-----------+------------+-----------+------+
| ACC_NO | TITLE  | PUBLISHER | DOP        | STATUS    | YEAR |
+--------+--------+-----------+------------+-----------+------+
|   1001 | DBMS   | PEARSON   | 2022-01-10 | ISSUED    | 2021 |
|   1002 | OS     | MGH       | 2022-02-12 | ISSUED    | 2020 |
|   1003 | CN     | WILEY     | 2023-01-15 | AVAILABLE | 2022 |
|   1004 | PYTHON | REILLY    | 2023-06-20 | ISSUED    | 2023 |
|   1005 | C PRO  | PEARSON   | 2023-07-10 | AVAILABLE | 2021 |
|   1006 | AI     | SPRINGER  | 2023-08-10 | ISSUED    | 2022 |
+--------+--------+-----------+------------+-----------+------+

mysql> SELECT * FROM MEMBER_43;
+--------+---------+----------+-----------+
| MEM_ID | NAME    | NO_BOOKS | MAX_LIMIT |
+--------+---------+----------+-----------+
|   2001 | ALICE   |        2 |         2 |
|   2002 | BOB     |        2 |         2 |
|   2003 | CHARLIE |        1 |         2 |
|   2004 | DIANA   |        1 |         1 |
+--------+---------+----------+-----------+

mysql> SELECT * FROM BOOKISSUE_43;
+--------+--------+------------+
| ACC_NO | MEM_ID | DOI        |
+--------+--------+------------+
|   1001 |   2001 | 2025-07-10 |
|   1002 |   2002 | 2025-07-15 |
|   1004 |   2001 | 2025-07-01 |
|   1004 |   2003 | 2025-07-03 |
|   1006 |   2004 | 2025-07-05 |
|   1004 |   2002 | 2025-07-02 |
+--------+--------+------------+

mysql> SELECT TITLE FROM BOOK2_43 B JOIN BOOKISSUE_43 BI ON B.ACC_NO=BI.ACC_NO WHERE B.STATUS='ISSUED' AND (CURRENT_DATE-BI.DOI)>15;
+--------+
| TITLE  |
+--------+
| DBMS   |
| OS     |
| PYTHON |
| PYTHON |
| PYTHON |
| AI     |
+--------+

mysql> SELECT NAME FROM MEMBER_43 WHERE NO_BOOKS=MAX_LIMIT;
+-------+
| NAME  |
+-------+
| ALICE |
| BOB   |
| DIANA |
+-------+

mysql> SELECT B.*,COUNT(DISTINCT BI.MEM_ID) AS MEMBER_COUNT FROM BOOK2_43 B JOIN BOOKISSUE_43 BI ON B.ACC_NO=BI.ACC_NO GROUP BY B.ACC_NO HAVING COUNT(DISTINCT BI.MEM_ID)=(SELECT MAX(SUB.MEMBER_COUNT) FROM
 (SELECT COUNT(DISTINCT BI.MEM_ID) AS MEMBER_COUNT FROM BOOK2_43 JOIN BOOKISSUE_43 BI ON B.ACC_NO=BI.ACC_NO GROUP BY B.ACC_NO)AS SUB) OR COUNT(DISTINCT BI.MEM_ID)=(SELECT MIN(SUB.MEMBER_COUNT) FROM (SELEC
T COUNT(DISTINCT BI.MEM_ID) AS MEMBER_COUNT FROM BOOK2_43 B JOIN BOOKISSUE_43 BI ON B.ACC_NO=BI.ACC_NO GROUP BY B.ACC_NO)AS SUB) ORDER BY MEMBER_COUNT DESC;
+--------+--------+-----------+------------+--------+------+--------------+
| ACC_NO | TITLE  | PUBLISHER | DOP        | STATUS | YEAR | MEMBER_COUNT |
+--------+--------+-----------+------------+--------+------+--------------+
|   1004 | PYTHON | REILLY    | 2023-06-20 | ISSUED | 2023 |            3 |
|   1001 | DBMS   | PEARSON   | 2022-01-10 | ISSUED | 2021 |            1 |
|   1002 | OS     | MGH       | 2022-02-12 | ISSUED | 2020 |            1 |
|   1006 | AI     | SPRINGER  | 2023-08-10 | ISSUED | 2022 |            1 |
+--------+--------+-----------+------------+--------+------+--------------+

mysql> SELECT B.* FROM BOOK2_43 B WHERE NOT EXISTS(SELECT 1 FROM MEMBER_43 M WHERE NOT EXISTS(SELECT 1 FROM BOOKISSUE_43 BI WHERE B.ACC_NO=BI.ACC_NO AND BI.MEM_ID=M.MEM_ID))UNION SELECT B.* FROM BOOK2_43
B WHERE ACC_NO NOT IN (SELECT ACC_NO FROM BOOKISSUE_43);
+--------+-------+-----------+------------+-----------+------+
| ACC_NO | TITLE | PUBLISHER | DOP        | STATUS    | YEAR |
+--------+-------+-----------+------------+-----------+------+
|   1003 | CN    | WILEY     | 2023-01-15 | AVAILABLE | 2022 |
|   1005 | C PRO | PEARSON   | 2023-07-10 | AVAILABLE | 2021 |
+--------+-------+-----------+------------+-----------+------+

