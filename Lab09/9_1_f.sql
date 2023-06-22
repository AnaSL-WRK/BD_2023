CREATE FUNCTION Dnov (@dno INT) RETURNS TABLE
AS
	BEGIN
		DECLARE @avgSalary DECIMAL(10,2);
		SET @avgSalary = (SELECT AVG(Salary) FROM Business.dbo.EMPLOYEE WHERE Dno=@dno);
		RETURN (SELECT Fname, Lname, Ssn FROM Business.dbo.EMPLOYEE WHERE Dno=@dno AND Salary > @avgSalary);
	END