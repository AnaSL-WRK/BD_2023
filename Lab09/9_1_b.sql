
CREATE PROC dbo.topMgr
AS
	BEGIN
		  SET NOCOUNT ON;
    
    -- Selecionar os funcionários gestores e o número de anos como gestor
    SELECT e.ssn, e.fname, e.lname, d.dname, DATEDIFF(YEAR, d.Mgr_start_date, GETDATE()) AS years_as_manager
    FROM employee e, department d
	WHERE e.ssn = d.Mgr_ssn
    ORDER BY d.dname;

    -- Selecionar o funcionário mais antigo em termos de anos como gestor
	SELECT TOP 1 e.ssn, e.fname, e.lname, d.dname, DATEDIFF(YEAR, d.Mgr_start_date, GETDATE()) AS years_as_manager
    FROM employee e, department d
	WHERE e.ssn = d.Mgr_ssn
    ORDER BY years_as_manager DESC;
END;