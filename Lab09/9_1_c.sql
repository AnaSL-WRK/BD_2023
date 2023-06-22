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
 GO