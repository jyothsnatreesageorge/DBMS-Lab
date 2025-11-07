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
		Create the following tables:   
		STUDENT(ROLLNO,NAME,CATEGORY,DISTRICT,STATE)   
		STUDENT_RANK(ROLLNO,MARK,RANK)   
		Generate queries for the following   
		1.List out the details of the students with same mark and same category.   
		2.List out the details of each student(ROLLNO,NAME,CATEGORY,DISTRICT,RANK) who secured the highest rank for each category in each state.   
		3.List out the names of studnets(ROLLNO,NAME,CATEGORY,DISTRICT,RANK) having either marks same but ranks different or ranks same but marks different together with the status (whether they belong to first category pr second category).   
		4.Find the category with the highest academic performance and the one with the lowest academic perfromance.   
		5.Find the category whose academic performance is lesser than the average academic performance.   

	EXPERIMENT 5   
		Create the following tables:   
		BOOK(ACCESSION_NUMBER,TITLE,PUBLISHER,YEAR,DATE_OF_PURCHASE,STATUS)   
		MEMBER(MEMBER_ID,NUMBER_OF_BOOKS_ISSUED)   
		BOOK_ISSUE(ACCESSION_NUMBER,MEMBER_ID,DATE_OF_ISSUE)   
		Generate SQL queries for the following.   
		1.List all the books which are due from the students.A book is considered due if it has been issued 15 days back and has not yet been returned.   
		2.List all members who cannot be issued any more books.   
		3.List the details of books which has been taken by the maximum number of members and the book which has been taken by the lease number of members.   
		4.List the details of the bookwhich has been taken by every member and the one that has not ye been issued.   

	EXPERIMENT 6
		Create the follwoing tables:   
		BRANCH(BRANCH_ID,BRANCH_NAME,BRANCH_CITY)   
		CUSTOMER(CUSTOMER_ID,CUSTOMER_NAME,CUSTOMER_CITY)   
		SAVINGS(CUSTOMER_ID,BRANCH_ID,SAVINGS_ACCNO,BALANCE)   
		LOAN(CUSTOMER_ID,BRANCH_ID,LOAN_ACCNO,BALANCE)   
		Generate queries for the following.   
		1.List the details of the customer who live in the same city as they have a savings or loan account.   
		2.List out the details of customers who live in a given branch city.   
		3.List out the customers who have an account in more than one branch.   
		4.List out the deatils of customer who have:   
			a.neither a saving but loan account.   
			b.neither a loan but a savings account.   
			c.having both loan and savings account.   
		5.List the names of customers who doesnt have saving at all but having loan in more than two branches.   
		6.For each branch produce a list of total number of customers,customer having savings only,customers having loan only and the customers having both savings and loan.   
		7.Find the details of the branch which has issued the maximum number of loans.   
		8.Find the details of the branch that hasnt issued any loan at all.   
		9.For each customer produce a list of total saving balance,loan balance for those branches where he has eitehr a loan or saving account or both.   

	EXPERIMENT 7
		A student academic system is to be maintained in an engineering college and should have the following facilities.   
		a.The system should keep   
			i.Student details(student name,rollno,utyreg no,address,uyear of admn,year of pas out,branch,class teacher,email id,phoneno).   
			ii.The details of course qualifications(total and the garde(first class,second class and distinction)).   
			iii.The details of the project work done by each student(project title,project guide(a faculty from the college),period of implementation of the project,core area).   
			iv.The faculty details(faculty name,faculty id,email id,designation.,joining date,relieved date).   
		b.The system msut have the facility to give answers to the following questions.   
			i.The names,rollno and address of the students who have completed the course under a given branch for a year.   
			ii.The names and rollnos of the students who have completed the course under a given branch for each year.   
			iii.The details of the project undertaken by studnets of a particular branch.   
			iv.The names of faculties who have guided more than a specified number of projects in each academic year.   
			v.The branch with highest academic performance chosen for each academic year.   
			vi.The details of the students who scored the highest total for each branch and for each academic year.   
			vii.The list of students who secured a given grade for a given academic year.   
			viii.The klist of projects undertaken by each department together with the project guide name and email id for each academic year under a given core area.   
			ix.The number of total grade for each branch of study and for each year of admission.   
			x.The details of students in each branch admitted in a specified academic year.   
			xi.The details of students sorted on the basis of year of admission and bracnh of study.   
			xii.The best mark,worst mark and average mark for each branch for a given academic year.   

***PLSQL EXPERIMENTS***   

	1.Write a PL/SQL code to check whether a number is even or odd.   
	2.Write a PL/SQL code to check whether a number is prime or not.   
	3.Write a PL/SQL code to find the factorial of a given number.   
	4.Write a PL/SQL code to check whether a number is perfect or not.   
	5.Write a PL/SQL code to find the first n terms of a fibonacci series.   
	6.Write a PL/SQL code to create a calculator.   
	7.Write a PL/SQL code to check whether a string is palindrome or not.   

***CURSOR EXPERIMENTS***   

	EXPERIMEMNT 1   
	Given the schema PERSON(PID,PNAME,DOB).Find the age of each person using cursor.   
	
	EXPERIMENT 2   
	Given the schema EMPLOYEE(EMPID,EMPNAME,JOINING_DATE,RELIEVING_DATE,SALARY).   
		a.FInd the service(in years) for each relieved employee.   
		b.Find the pension amount to be paid to each relieved employee.(Pension is eqaul to the years of service*salary divided by 100).   

***TRIGGER EXPERIMENTS***   

	EXPERIMENT 1   
		The following table shows the salary information of employees in a company.EMPLOYEE(EMPID,EMPNAME,DESIGNATION,DEPT,SALARY).Write a trigger that displays the total number of tuples in the relation on each insertion,updation and deletion.   

	EXPERIMENT 2   
		The following table shows the salary information of employees in a company.EMPLOYEE(EMPID,EMPNAME,SALARY).Write a trigger that causes the insertion of a new entry into the table INCREMENT(EMPID,INCR) if the difference arising in the updation of salary of an existing employee is greater than Rs.1000.   
