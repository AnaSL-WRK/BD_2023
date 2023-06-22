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
				WHERE TABLE_SCHEMA = 'Empresa' AND TABLE_NAME = 'DEPARTMENT_DELETED'))
				CREATE TABLE Business.dbo.DEPARTMENT_DELETED (Dname VARCHAR(30), Dnumber int, Mgr_ssn int NULL, Mgr_start_date date NULL);
			INSERT INTO Business.dbo.DEPARTMENT_DELETED VALUES (@Dname, @Dnumber, @Mgr_ssn, @Mgr_start_date);
		END		