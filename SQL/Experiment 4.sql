mysql> SELECT * FROM STUDENT_43;
+---------+--------+----------+--------------+--------+
| ROLL_NO | NAME   | CATEGORY | DISTRICT     | STATE  |
+---------+--------+----------+--------------+--------+
|     101 | ANU    | GEN      | KOTTAYAM     | KERALA |
|     102 | RAVI   | OBC      | ALAPPUZHA    | KERALA |
|     103 | MEERA  | GEN      | THRISSUR     | KERALA |
|     104 | RAJAN  | SC       | KOLLAM       | KERALA |
|     105 | SITA   | OBC      | KOLLAM       | KERALA |
|     106 | HARI   | GEN      | CHENNAI      | TN     |
|     107 | DIVYA  | SC       | MADURAI      | TN     |
|     108 | ARJUN  | ST       | ERNAKULAM    | KERALA |
|     109 | NEHA   | OBC      | KOTTAYAM     | KERALA |
|     110 | KIRAN  | GEN      | THRISSUR     | KERALA |
|     111 | LATHA  | SC       | CHENNAI      | TN     |
|     112 | AMIT   | ST       | THIRUNALVELI | TN     |
|     113 | SNEHA  | OBC      | THRISSUR     | KERALA |
|     114 | VIKRAM | GEN      | PALAKKAD     | KERALA |
|     115 | RESHMA | SC       | ALAPPUZHA    | KERALA |
+---------+--------+----------+--------------+--------+
15 rows in set (0.00 sec)

mysql> SELECT * FROM STUDENT_RANK_43;
+---------+-------+------+
| ROLL_NO | MARK  | RANK |
+---------+-------+------+
|     101 | 98.00 |    1 |
|     102 | 85.00 |    3 |
|     103 | 98.00 |    1 |
|     104 | 78.00 |    5 |
|     105 | 85.00 |    2 |
|     106 | 92.00 |    2 |
|     107 | 78.00 |    5 |
|     108 | 88.00 |    4 |
|     109 | 85.00 |    3 |
|     110 | 92.00 |    2 |
|     111 | 68.00 |    6 |
|     112 | 88.00 |    4 |
|     113 | 85.00 |    3 |
|     114 | 92.00 |    2 |
|     115 | 78.00 |    5 |
+---------+-------+------+
15 rows in set (0.00 sec)

mysql>  SELECT * FROM STUDENT_43 S1 JOIN STUDENT_RANK_43 SR1 ON S1.ROLL_NO=SR1.ROLL_NO WHERE EXISTS(SELECT 1 FROM STUDENT_43 S2 JOIN STUDENT_RANK_43 SR2 ON S2.ROLL_NO=SR2.ROLL_NO WHERE S1.ROLL_NO<>S2.ROLL_NO AND S1.CATEGORY=S2.CATEGORY AND SR1.RANK=SR2.RANK) ORDER BY `RANK`;
+---------+--------+----------+--------------+--------+---------+-------+------+
| ROLL_NO | NAME   | CATEGORY | DISTRICT     | STATE  | ROLL_NO | MARK  | RANK |
+---------+--------+----------+--------------+--------+---------+-------+------+
|     101 | ANU    | GEN      | KOTTAYAM     | KERALA |     101 | 98.00 |    1 |
|     103 | MEERA  | GEN      | THRISSUR     | KERALA |     103 | 98.00 |    1 |
|     106 | HARI   | GEN      | CHENNAI      | TN     |     106 | 92.00 |    2 |
|     110 | KIRAN  | GEN      | THRISSUR     | KERALA |     110 | 92.00 |    2 |
|     114 | VIKRAM | GEN      | PALAKKAD     | KERALA |     114 | 92.00 |    2 |
|     102 | RAVI   | OBC      | ALAPPUZHA    | KERALA |     102 | 85.00 |    3 |
|     109 | NEHA   | OBC      | KOTTAYAM     | KERALA |     109 | 85.00 |    3 |
|     113 | SNEHA  | OBC      | THRISSUR     | KERALA |     113 | 85.00 |    3 |
|     108 | ARJUN  | ST       | ERNAKULAM    | KERALA |     108 | 88.00 |    4 |
|     112 | AMIT   | ST       | THIRUNALVELI | TN     |     112 | 88.00 |    4 |
|     104 | RAJAN  | SC       | KOLLAM       | KERALA |     104 | 78.00 |    5 |
|     107 | DIVYA  | SC       | MADURAI      | TN     |     107 | 78.00 |    5 |
|     115 | RESHMA | SC       | ALAPPUZHA    | KERALA |     115 | 78.00 |    5 |
+---------+--------+----------+--------------+--------+---------+-------+------+
13 rows in set (0.01 sec)

mysql> SELECT S.ROLL_NO,S.NAME,S.CATEGORY,S.DISTRICT,S.STATE,SR.RANK FROM STUDENT_43 S JOIN STUDENT_RANK_43 SR ON S.ROLL_NO=SR.ROLL_NO WHERE(S.CATEGORY,S.STATE,SR.RANK) IN (SELECT S2.CATEGORY,S2.STATE,MIN(SR2.RANK)FROM STUDENT_43 S2 JOIN STUDENT_RANK_43 SR2 ON S2.ROLL_NO=SR2.ROLL_NO GROUP BY S2.CATEGORY,S2.STATE);
+---------+--------+----------+--------------+--------+------+
| ROLL_NO | NAME   | CATEGORY | DISTRICT     | STATE  | RANK |
+---------+--------+----------+--------------+--------+------+
|     101 | ANU    | GEN      | KOTTAYAM     | KERALA |    1 |
|     103 | MEERA  | GEN      | THRISSUR     | KERALA |    1 |
|     104 | RAJAN  | SC       | KOLLAM       | KERALA |    5 |
|     105 | SITA   | OBC      | KOLLAM       | KERALA |    2 |
|     106 | HARI   | GEN      | CHENNAI      | TN     |    2 |
|     107 | DIVYA  | SC       | MADURAI      | TN     |    5 |
|     108 | ARJUN  | ST       | ERNAKULAM    | KERALA |    4 |
|     112 | AMIT   | ST       | THIRUNALVELI | TN     |    4 |
|     115 | RESHMA | SC       | ALAPPUZHA    | KERALA |    5 |
+---------+--------+----------+--------------+--------+------+
9 rows in set (0.00 sec)

mysql> SELECT S.ROLL_NO,S.NAME,S.CATEGORY,S.DISTRICT,SR.MARK,SR.RANK,CASE WHEN S.CATEGORY='GEN' THEN 'FIRST CATEGORY' WHEN S.CATEGORY='OBC' THEN 'SECOND CATEGORY' ELSE 'OTHER' END AS STATUS FROM STUDENT_43 S JOIN STUDENT_RANK_43 SR ON S.ROLL_NO=SR.ROLL_NO WHERE SR.MARK IN (SELECT MARK FROM STUDENT_RANK_43 GROUP BY MARK HAVING COUNT(DISTINCT `RANK`)>1) OR SR.RANK IN (SELECT `RANK` FROM STUDENT_RANK_43 GROUP BY `RANK` HAVING COUNT(DISTINCT MARK)>1);
+---------+--------+----------+-----------+-------+------+-----------------+
| ROLL_NO | NAME   | CATEGORY | DISTRICT  | MARK  | RANK | STATUS          |
+---------+--------+----------+-----------+-------+------+-----------------+
|     102 | RAVI   | OBC      | ALAPPUZHA | 85.00 |    3 | SECOND CATEGORY |
|     105 | SITA   | OBC      | KOLLAM    | 85.00 |    2 | SECOND CATEGORY |
|     106 | HARI   | GEN      | CHENNAI   | 92.00 |    2 | FIRST CATEGORY  |
|     109 | NEHA   | OBC      | KOTTAYAM  | 85.00 |    3 | SECOND CATEGORY |
|     110 | KIRAN  | GEN      | THRISSUR  | 92.00 |    2 | FIRST CATEGORY  |
|     113 | SNEHA  | OBC      | THRISSUR  | 85.00 |    3 | SECOND CATEGORY |
|     114 | VIKRAM | GEN      | PALAKKAD  | 92.00 |    2 | FIRST CATEGORY  |
+---------+--------+----------+-----------+-------+------+-----------------+
7 rows in set (0.00 sec)

mysql> (SELECT CATEGORY,AVG(MARK) AS TOTAL_MARKS FROM STUDENT_43 S JOIN STUDENT_RANK_43 SR ON S.ROLL_NO=SR.ROLL_NO GROUP BY CATEGORY ORDER BY (AVG(MARK)) DESC LIMIT 1) UNION (SELECT CATEGORY,AVG(MARK) FROM STUDENT_43 S JOIN STUDENT_RANK_43 SR ON S.ROLL_NO=SR.ROLL_NO GROUP BY CATEGORY ORDER BY (AVG(MARK)) ASC LIMIT 1);
+----------+-------------+
| CATEGORY | TOTAL_MARKS |
+----------+-------------+
| GEN      |   94.400000 |
| SC       |   75.500000 |
+----------+-------------+
2 rows in set (0.00 sec)

mysql> SELECT CATEGORY,AVG(SR.MARK) AS AVG_MARK FROM STUDENT_43 S JOIN STUDENT_RANK_43 SR ON S.ROLL_NO=SR.ROLL_NO GROUP BY CATEGORY HAVING AVG_MARK < (SELECT AVG(AVG_MARK) FROM (SELECT CATEGORY,AVG(SR.MARK) AS AVG_MARK FROM STUDENT_43 S JOIN STUDENT_RANK_43 SR ON S.ROLL_NO=SR.ROLL_NO GROUP BY CATEGORY) AS OVERALL_AVG);
+----------+-----------+
| CATEGORY | AVG_MARK  |
+----------+-----------+
| OBC      | 85.000000 |
| SC       | 75.500000 |
+----------+-----------+
2 rows in set (0.00 sec)

