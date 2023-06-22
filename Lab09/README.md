# BD: Guião 9


## ​9.1
 
### *a)*

```
CREATE PROC del_employee (@ssn char(9))
AS
    DELETE FROM dependent WHERE essn = @ssn;

    DELETE FROM works_on WHERE essn = @ssn;

    DELETE FROM employee WHERE ssn = @ssn;
```
If you delete an employee you should also check:  
    - if he was a department manager (using mgr_ssn), changing it to NULL if so.  
    - if his ssn was a Super_ssn linked to another employee's ssn, chaging it to NULL if so.

### *b)* 

```
CREATE PROC dbo.topMgr
AS
	BEGIN
		SET NOCOUNT ON;
    
        SELECT e.ssn, e.fname, e.lname, d.dname, DATEDIFF(YEAR, d.Mgr_start_date, GETDATE()) AS years_as_manager
        FROM employee e, department d
        WHERE e.ssn = d.Mgr_ssn
        ORDER BY d.dname;


        SELECT TOP 1 e.ssn, e.fname, e.lname, d.dname, DATEDIFF(YEAR, d.Mgr_start_date, GETDATE()) AS years_as_manager
        FROM employee e, department d
        WHERE e.ssn = d.Mgr_ssn
        ORDER BY years_as_manager DESC;
    END
```

### *c)* 

```
CREATE Trigger noMultGest ON Business.dbo.DEPARTMENT 
AFTER INSERT, UPDATE
AS
	SET NOCOUNT ON;
	DECLARE @mSSN CHAR(9);
	SELECT @mSSN=Mgr_ssn FROM inserted;

	IF EXISTS( SELECT Mgr_ssn FROM Business.dbo.DEPARTMENT WHERE Mgr_ssn=@mSSN )
	BEGIN
		RAISERROR ('Operation unsuccessful, employee is already manager of a department ', 16,1);
		ROLLBACK TRAN;
	END

```

### *d)* 

```
CREATE TRIGGER salaryCheck on Business.dbo.EMPLOYEE
AFTER INSERT, UPDATE
AS
	BEGIN
		SET NOCOUNT ON;

		DECLARE @Msalary DECIMAL(6,2)
		DECLARE @Dno INT
		DECLARE @ssn CHAR(9)
		DECLARE @Esalary DECIMAL(6,2)
		SELECT @Dno=Dno, @Esalary=Salary, @ssn=Ssn FROM inserted;

		SELECT @Msalary=Salary
		FROM Business.dbo.DEPARTMENT JOIN Business.dbo.EMPLOYEE ON Mgr_ssn=Ssn
		WHERE Dnumber=@Dno

		IF (@Esalary > @Msalary)
		BEGIN
			UPDATE Business.dbo.EMPLOYEE
			SET Salary=@Msalary - 1
			WHERE Ssn=@ssn
		END
	END
```

### *e)* 

```
CREATE FUNCTION projEmp (@ssn CHAR(9)) RETURNS TABLE
AS
RETURN (SELECT Pname, Plocation FROM ((Business.dbo.EMPLOYEE JOIN Business.dbo.WORKS_ON ON Ssn = Essn) JOIN Business.dbo.PROJECT ON Pno = Pnumber) WHERE Ssn = @ssn)
```

### *f)* 

```
CREATE FUNCTION Dnov (@dno INT) RETURNS TABLE
AS
	BEGIN
		DECLARE @avgSalary DECIMAL(10,2);
		SET @avgSalary = (SELECT AVG(Salary) FROM Business.dbo.EMPLOYEE WHERE Dno=@dno);
		RETURN (SELECT Fname, Lname, Ssn FROM Business.dbo.EMPLOYEE WHERE Dno=@dno AND Salary > @avgSalary);
	END
```

### *g)* 

```
CREATE FUNCTION employeeDeptHighAverage(@dno int) RETURNS @projtable TABLE (pname varchar(15), number int, plocation varchar(15), dnum int, budget decimal(10,2), totalbudget decimal(10,2))
AS
BEGIN

	DECLARE @pname as varchar(15), @number as int, @plocation as varchar(15), @dnum as int, @budget as decimal(10,2), @totalbudget as decimal(10,2);

	DECLARE C CURSOR FAST_FORWARD
	FOR SELECT Pname, Pnumber, Plocation, Dnumber, Sum(Salary*[Hours]/(40*4))
		FROM	Business.dbo.DEPARTMENT 
				JOIN Business.dbo.PROJECT ON Dnumber=Dnum
				JOIN Business.dbo.Works_on ON Pnumber=Pno
				JOIN Business.dbo.EMPLOYEE ON Essn=Ssn
		WHERE Dnumber=@dno
		GROUP BY Pname, Pnumber, Plocation, Dnumber;

	OPEN C;

	FETCH C INTO @pname, @number, @plocation, @dnum, @budget;
	SELECT @totalbudget = 0;

	WHILE @@FETCH_STATUS = 0
	BEGIN
		SET @totalbudget += @budget;
		INSERT INTO @projtable VALUES (@pname, @number, @plocation, @dnum, @budget, @totalbudget)
		FETCH C INTO @pname, @number, @plocation, @dnum, @budget;
	END

	CLOSE C;

	DEALLOCATE C;

	return;
END
```

### *h)* 
TRIGGER - AFTER
```
CREATE TRIGGER delDeptAfter ON Business.dbo.DEPARTMENT
AFTER DELETE
AS
		BEGIN
			DECLARE @Dname VARCHAR(30);
			DECLARE @Dnumber int;
			DECLARE @Mgr_ssn int;
			DECLARE @Mgr_start_date date;

			SELECT @Dname = Dname FROM deleted;
			SELECT @Dnumber = Dnumber FROM deleted;
			SELECT @Mgr_ssn = Mgr_ssn FROM deleted;
			SELECT @Mgr_start_date = Mgr_start_date FROM deleted;

			IF (NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES
				WHERE TABLE_SCHEMA = 'Business.dbo' AND TABLE_NAME = 'DEPARTMENT_DELETED'))
				CREATE TABLE Business.dbo.DEPARTMENT_DELETED (Dname VARCHAR(30), Dnumber int, Mgr_ssn int NULL, Mgr_start_date date NULL);
			INSERT INTO Business.dbo.DEPARTMENT_DELETED VALUES (@Dname, @Dnumber, @Mgr_ssn, @Mgr_start_date);
		END				
```



TRIGGER - INSTEAD OF 
```
CREATE TRIGGER delDept ON Business.dbo.DEPARTMENT
INSTEAD OF DELETE
AS
		BEGIN
			DECLARE @Dname VARCHAR(30);
			DECLARE @Dnumber int;
			DECLARE @Mgr_ssn int;
			DECLARE @Mgr_start_date date;

			SELECT @Dname = Dname FROM deleted;
			SELECT @Dnumber = Dnumber FROM deleted;
			SELECT @Mgr_ssn = Mgr_ssn FROM deleted;
			SELECT @Mgr_start_date = Mgr_start_date FROM deleted;

			IF (NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES
				WHERE TABLE_SCHEMA = 'Business.dbo' AND TABLE_NAME = 'DEPARTMENT_DELETED'))
				CREATE TABLE Business.dbo.DEPARTMENT_DELETED (Dname VARCHAR(30), Dnumber int, Mgr_ssn int NULL, Mgr_start_date date NULL);
			INSERT INTO Business.dbo.DEPARTMENT_DELETED VALUES (@Dname, @Dnumber, @Mgr_ssn, @Mgr_start_date);
			DELETE FROM Business.dbo.DEPARTMENT WHERE Dnumber = @Dnumber; 
		END		
```

### *i)* 

```
Stored Procedures:

    Extensibility: Using stored procedures is the best means of abstracting, or decoupling, the database
    Performance: A well-written stored procedure is the fastest possible SQL Server code,
    Usability: It’s easier for application programmers to make a stored procedure call and consume the result than it is to write ad hoc SQL.
    Data Integrity: A stored procedure developed by the database developer is less likely to contain data integrity errors, and easier to unit test, than ad hoc SQL code.
    Security: Locking down the tables and providing access only through stored procedures is a standard best practice for database development.



Example of situations where stored procedures should be used:
    When you need to perform a series of complex operations on the database that require multiple SQL statements.
    When you need to improve performance by minimizing repetitive code and reducing network traffic.
    When you need to control access to data by granting permissions to the stored procedure instead of individual tables.


User-Defined Functions (UDFs):

    Can accept input parameters and return a scalar value or a table
    Can be used to encapsulate complex business logic and data manipulation in a single function
    Can be used to improve code organization and maintainability
    Can be used in computed columns, WHERE clauses, and JOIN conditions

Example of situations where UDFs should be used:
    When you need to encapsulate complex business logic and data manipulation in a single function to improve code organization and maintainability.
    When you need to use a function in computed columns, WHERE clauses, and JOIN conditions to simplify queries and improve performance.
```
