***SQL EXPERIMENTS***   
	EXPERIMENT 1   
		1.Create a database.   
		2.Select the current database.   
		3.Create an EMPLOYEE table with following structure:   
		EMPNO NUMBER(6),ENMAE VARCHAR(20),JOB VARCHAR(20),DEPTNO NUMBER(3)   
		Allow NULL for all columns excet ENAME and JOB.   
		4.Add a column EXPERIENCE to the EMPLOYEE tables,EXPERIENCE numeric null allowed.   
		5.Modify the column width of JOB field of EMPLOYEE table.   
		6.Create a DEPT table with following structure:   
		DEPTNO NUMBER(2),DNAME VARCHAR(20).LOC VARCHAR(20)   
		DEPTNO as the primary key.   
		7.Create the EMP! table with ENAME and ENMNO,add constraints to check the MPNO value while entering i.e EMPNO>100.   
		8.Display the structure of EMPLOYEE and DEPT table.   
		9.Truncate the EMPLOYEE table and drop the DEPT table.   
		10.List all the tables in the current database.   
		11.Drop a column EXPERINCE from the EMPLOYEE table.   
		12.Drop table EMP1.   
		13.Delete the database.   

	EXPERIMENT 2   
		Create the following two tables:   
		COLLEGE consisting of COLLEGE_CODE,COLLEGE_NAME and ADDRESS.   
		FACULTY consisting of COLLEGE_CODE,FACULTY_CODE,FACULTY_NAME,QUALIFICATION,EXPREIENCE(in number of years),DEPARTMENT,ADDRESS.
		Generate queries for the following.   
		1.List all faculty members of a specified college whose experience is greater than or equal to 10 years.   
		2.List all faculty members of a specified college who has atleast 10 years of experience but not having a MTech Degree.   
		3.List the faculty members of a specified college department wise in the non decreasing order of their seniority.   
		4.List the names of colleges having more than a specified number of faculty members.   
		5.List out the names of colleges having the least number of faculties and the most number of faculties.   

	EXPERIMENT 3
		Create the following table for a library management system.   
		BOOK consisting of ACCESSION_NO,TITLE,PUBLISHER,AUTHOR,DATE_OF_PURCHASE,DATE_OF_PUBLISHING,STATUS.   
		STATUS can be "ISSUED","PRESENT IN THE LIBRARY","REFERENCE" or "CANNOT BE ISSUED".   
		Genearate queries for the following.   
		1.List out the total number of copies of each books in the library.   
		2.List out the total number of reference copies of each book in the library.   
		3.For each book in the library,obtain a count of total number of issued copies,number of copies existing in the library and the number of reference copies.   
		4.List out the details of the books of each publisher set with status "CANNOT BE ISSUED".   
		5.List out the details of books which are new arrivals.The books which are purchased during the last 6 months are categorized as new arrivals.   
		6.List out the details of each famous book.Each famous book should be purchased within 1 year of its date of publishing and the number of total copies is more than 10.   

		EXPERIMENT 4   
		
