CREATE FUNCTION projEmp (@ssn CHAR(9)) RETURNS TABLE
AS
RETURN (SELECT Pname, Plocation FROM ((Business.dbo.EMPLOYEE JOIN Business.dbo.WORKS_ON ON Ssn = Essn) JOIN Business.dbo.PROJECT ON Pno = Pnumber) WHERE Ssn = @ssn)