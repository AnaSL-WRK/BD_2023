CREATE PROC del_employee (@ssn char(9))
AS
    DELETE FROM dependent WHERE essn = @ssn;

    DELETE FROM works_on WHERE essn = @ssn;

    DELETE FROM employee WHERE ssn = @ssn;
