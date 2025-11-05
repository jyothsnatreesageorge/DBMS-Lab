mysql> SELECT * FROM BRANCH_43;
+-----------+--------------+-------------+
| BRANCH_ID | BRANCH_NAME  | BRANCH_CITY |
+-----------+--------------+-------------+
| B001      | MAIN BRANCH  | MUMBAI      |
| B002      | WEST BRANCH  | MUMBAI      |
| B003      | EAST BRANCH  | DELHI       |
| B004      | NORTH BRANCH | PUNE        |
+-----------+--------------+-------------+
4 rows in set (0.00 sec)

mysql> SELECT * FROM CUSTOMER_43;
+---------+-----------+-----------+
| CUST_ID | CUST_NAME | CUST_CITY |
+---------+-----------+-----------+
| C001    | ALICE     | MUMBAI    |
| C002    | BOB       | MUMBAI    |
| C003    | CHARLIE   | DELHI     |
| C004    | DIANA     | PUNE      |
| C005    | EVA       | DELHI     |
| C006    | FRANK     | MUMBAI    |
+---------+-----------+-----------+
6 rows in set (0.00 sec)

mysql> SELECT * FROM SAVINGS_43;
+-----------+---------+--------------+----------+
| BRANCH_ID | CUST_ID | SAVING_ACCNO | BALANCE  |
+-----------+---------+--------------+----------+
| B001      | C001    |         1001 |  8000.50 |
| B002      | C001    |         1002 | 12000.00 |
| B003      | C003    |         1003 |  2000.00 |
| B004      | C004    |         1004 | 15000.00 |
| B003      | C005    |         1005 |  5000.25 |
+-----------+---------+--------------+----------+
5 rows in set (0.00 sec)

mysql> SELECT * FROM LOAN_43;
+---------+-----------+------------+----------+
| CUST_ID | BRANCH_ID | LOAN_ACCNO | BALANCE  |
+---------+-----------+------------+----------+
| C002    | B001      |       2001 | 35000.00 |
| C001    | B002      |       2002 |  8000.00 |
| C003    | B003      |       2003 | 12000.00 |
| C006    | B002      |       2004 |  5000.00 |
| C002    | B002      |       2005 | 18000.00 |
| C005    | B003      |       2006 |  9000.00 |
+---------+-----------+------------+----------+
6 rows in set (0.00 sec)

mysql> SELECT DISTINCT C.* FROM CUSTOMER_43 C LEFT JOIN SAVINGS_43 S ON S.CUST_ID=C.CUST_ID LEFT JOIN LOAN_43 L ON C.CUST_ID=L.CUST_ID LEFT JOIN BRANCH_43 B ON S.BRANCH_ID=B.BRANCH_ID OR L.BRANCH_ID=B.BRANCH_ID WHERE C.CUST_CITY=B.BRANCH_CITY;
+---------+-----------+-----------+
| CUST_ID | CUST_NAME | CUST_CITY |
+---------+-----------+-----------+
| C001    | ALICE     | MUMBAI    |
| C002    | BOB       | MUMBAI    |
| C003    | CHARLIE   | DELHI     |
| C004    | DIANA     | PUNE      |
| C005    | EVA       | DELHI     |
| C006    | FRANK     | MUMBAI    |
+---------+-----------+-----------+
6 rows in set (0.00 sec)

mysql> SELECT DISTINCT C.* FROM CUSTOMER_43 C LEFT JOIN SAVINGS_43 S ON S.CUST_ID=C.CUST_ID LEFT JOIN LOAN_43 L ON C.CUST_ID=L.CUST_ID LEFT JOIN BRANCH_43 B ON S.BRANCH_ID=B.BRANCH_ID OR L.BRANCH_ID=B.BRANCH_ID WHERE C.CUST_CITY="DELHI";
+---------+-----------+-----------+
| CUST_ID | CUST_NAME | CUST_CITY |
+---------+-----------+-----------+
| C003    | CHARLIE   | DELHI     |
| C005    | EVA       | DELHI     |
+---------+-----------+-----------+
2 rows in set (0.00 sec)

mysql> SELECT C.*,GROUP_CONCAT(DISTINCT B.BRANCH_NAME ORDER BY B.BRANCH_NAME SEPARATOR ',') AS BRANCHES FROM CUSTOMER_43 C LEFT JOIN SAVINGS_43 S ON C.CUST_ID=S.CUST_ID LEFT JOIN LOAN_43 L ON C.CUST_ID=L.CUST_ID LEFT JOIN BRANCH_43 B ON S.BRANCH_ID=B.BRANCH_ID OR L.BRANCH_ID=B.BRANCH_ID GROUP BY CUST_ID HAVING COUNT(DISTINCT B.BRANCH_NAME)>1;
+---------+-----------+-----------+-------------------------+
| CUST_ID | CUST_NAME | CUST_CITY | BRANCHES                |
+---------+-----------+-----------+-------------------------+
| C001    | ALICE     | MUMBAI    | MAIN BRANCH,WEST BRANCH |
| C002    | BOB       | MUMBAI    | MAIN BRANCH,WEST BRANCH |
+---------+-----------+-----------+-------------------------+
2 rows in set (0.00 sec)

mysql> SELECT DISTINCT C.* FROM CUSTOMER_43 C JOIN LOAN_43 L ON C.CUST_ID=L.CUST_ID WHERE C.CUST_ID NOT IN(SELECT CUST_ID FROM SAVINGS_43);
+---------+-----------+-----------+
| CUST_ID | CUST_NAME | CUST_CITY |
+---------+-----------+-----------+
| C002    | BOB       | MUMBAI    |
| C006    | FRANK     | MUMBAI    |
+---------+-----------+-----------+
2 rows in set (0.00 sec)

mysql> SELECT DISTINCT C.* FROM CUSTOMER_43 C JOIN SAVINGS_43 S ON C.CUST_ID=S.CUST_ID WHERE C.CUST_ID NOT IN(SELECT CUST_ID FROM LOAN_43);
+---------+-----------+-----------+
| CUST_ID | CUST_NAME | CUST_CITY |
+---------+-----------+-----------+
| C004    | DIANA     | PUNE      |
+---------+-----------+-----------+
1 row in set (0.00 sec)

mysql> SELECT DISTINCT C.* FROM CUSTOMER_43 C JOIN SAVINGS_43 S ON C.CUST_ID=S.CUST_ID WHERE C.CUST_ID IN(SELECT CUST_ID FROM SAVINGS_43) UNION SELECT DISTINCT C.* FROM CUSTOMER_43 C JOIN LOAN_43 L ON C.CUST_ID=L.CUST_ID WHERE C.CUST_ID IN(SELECT CUST_ID FROM LOAN_43);
+---------+-----------+-----------+
| CUST_ID | CUST_NAME | CUST_CITY |
+---------+-----------+-----------+
| C001    | ALICE     | MUMBAI    |
| C003    | CHARLIE   | DELHI     |
| C004    | DIANA     | PUNE      |
| C005    | EVA       | DELHI     |
| C002    | BOB       | MUMBAI    |
| C006    | FRANK     | MUMBAI    |
+---------+-----------+-----------+
6 rows in set (0.01 sec)

mysql> SELECT C.*,GROUP_CONCAT(DISTINCT B.BRANCH_NAME ORDER BY B.BRANCH_NAME SEPARATOR ',') AS BRANCHES FROM CUSTOMER_43 C LEFT JOIN LOAN_43 L ON C.CUST_ID=L.CUST_ID LEFT JOIN BRANCH_43 B ON L.BRANCH_ID=B.BRANCH_ID WHERE C.CUST_ID NOT IN(SELECT CUST_ID FROM SAVINGS_43) GROUP BY C.CUST_ID HAVING COUNT(DISTINCT B.BRANCH_NAME)>1;
+---------+-----------+-----------+-------------------------+
| CUST_ID | CUST_NAME | CUST_CITY | BRANCHES                |
+---------+-----------+-----------+-------------------------+
| C002    | BOB       | MUMBAI    | MAIN BRANCH,WEST BRANCH |
+---------+-----------+-----------+-------------------------+
1 row in set (0.00 sec)

mysql> SELECT BRANCH_ID,COUNT(DISTINCT CUST_ID)AS TOTAL,SUM(CASE WHEN HAS_LOAN=1 AND HAS_SAVING=0 THEN 1 ELSE 0 END)AS LOAN_CUST,SUM(CASE WHEN HAS_LOAN=0 AND HAS_SAVING=1 THEN 1 ELSE 0 END)AS SAVING_CUST,SUM(CASE WHEN HAS_LOAN=1 AND HAS_SAVING=1 THEN 1 ELSE 0 END) AS BOTH_CUST FROM(SELECT BRANCH_ID,CUST_ID,MAX(HAS_LOAN)AS HAS_LOAN,MAX(HAS_SAVING) AS HAS_SAVING FROM(SELECT S.BRANCH_ID,S.CUST_ID,0 AS HAS_LOAN,1 AS HAS_SAVING FROM SAVINGS_43 S UNION ALL SELECT L.BRANCH_ID,L.CUST_ID,1 AS HAS_LOAN,0 AS HAS_SAVINGS FROM LOAN_43 L)T GROUP BY BRANCH_ID,CUST_ID)X GROUP BY BRANCH_ID;
+-----------+-------+-----------+-------------+-----------+
| BRANCH_ID | TOTAL | LOAN_CUST | SAVING_CUST | BOTH_CUST |
+-----------+-------+-----------+-------------+-----------+
| B001      |     2 |         1 |           1 |         0 |
| B002      |     3 |         2 |           0 |         1 |
| B003      |     2 |         0 |           0 |         2 |
| B004      |     1 |         0 |           1 |         0 |
+-----------+-------+-----------+-------------+-----------+
4 rows in set (0.00 sec)

mysql> SELECT B.* FROM BRANCH_43 B WHERE B.BRANCH_ID NOT IN(SELECT DISTINCT BRANCH_ID FROM LOAN_43);
+-----------+--------------+-------------+
| BRANCH_ID | BRANCH_NAME  | BRANCH_CITY |
+-----------+--------------+-------------+
| B004      | NORTH BRANCH | PUNE        |
+-----------+--------------+-------------+
1 row in set (0.00 sec)

mysql> SELECT B.BRANCH_ID,B.BRANCH_NAME,SUM(L.BALANCE) AS TOTAL_LOAN FROM BRANCH_43 B JOIN LOAN_43 L ON L.BRANCH_ID=B.BRANCH_ID GROUP BY B.BRANCH_ID,B.BRANCH_NAME ORDER BY TOTAL_LOAN DESC LIMIT 1;
+-----------+-------------+------------+
| BRANCH_ID | BRANCH_NAME | TOTAL_LOAN |
+-----------+-------------+------------+
| B001      | MAIN BRANCH |   35000.00 |
+-----------+-------------+------------+
1 row in set (0.00 sec)

mysql> SELECT C.CUST_ID,C.CUST_NAME,COALESCE(S.TOTAL_SAVING,0)AS TOTAL_SAVING,COALESCE(L.TOTAL_LOAN,0)AS TOTAL_LOAN FROM CUSTOMER_43 C LEFT JOIN(SELECT CUST_ID,SUM(BALANCE) AS TOTAL_SAVING FROM SAVINGS_43 GROUP BY CUST_ID)S ON C.CUST_ID=S.CUST_ID LEFT JOIN(SELECT CUST_ID,SUM(BALANCE) AS TOTAL_LOAN FROM LOAN_43 GROUP BY CUST_ID)L ON L.CUST_ID=C.CUST_ID;
+---------+-----------+--------------+------------+
| CUST_ID | CUST_NAME | TOTAL_SAVING | TOTAL_LOAN |
+---------+-----------+--------------+------------+
| C001    | ALICE     |     20000.50 |    8000.00 |
| C002    | BOB       |         0.00 |   53000.00 |
| C003    | CHARLIE   |      2000.00 |   12000.00 |
| C004    | DIANA     |     15000.00 |       0.00 |
| C005    | EVA       |      5000.25 |    9000.00 |
| C006    | FRANK     |         0.00 |    5000.00 |
+---------+-----------+--------------+------------+
6 rows in set (0.00 sec)

