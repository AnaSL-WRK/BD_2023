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