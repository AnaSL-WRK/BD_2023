DBCC FREEPROCCACHE;
DBCC DROPCLEANBUFFERS;
GO
use temp
drop table mytemp;
Go

CREATE TABLE mytemp (
 rid BIGINT /*IDENTITY (1, 1)*/ NOT NULL,
 at1 INT NULL,
at2 INT NULL,
at3 INT NULL,
lixo varchar(100) NULL
);

--SET IDENTITY_INSERT mytemp ON;

ALTER TABLE mytemp ADD CONSTRAINT mytempPK PRIMARY KEY CLUSTERED (rid);
--ALTER INDEX mytempPK ON mytemp REBUILD WITH (FILLFACTOR = 65)
--ALTER INDEX mytempPK ON mytemp REBUILD WITH (FILLFACTOR = 80)
--ALTER INDEX mytempPK ON mytemp REBUILD WITH (FILLFACTOR = 90)

GO

-- Create index for each attribute
-- CREATE INDEX index_rid ON mytemp (rid);
-- CREATE INDEX index_at1 ON mytemp (at1);
-- CREATE INDEX index_at2 ON mytemp (at2);
-- CREATE INDEX index_at3 ON mytemp (at3);
-- GO

-- Record the Start Time
DECLARE @start_time DATETIME, @end_time DATETIME;
SET @start_time = GETDATE();
PRINT @start_time
-- Generate random records
DECLARE @val as int = 1;
DECLARE @nelem as int = 50000;
SET nocount ON
WHILE @val <= @nelem
BEGIN
 DBCC DROPCLEANBUFFERS; -- need to be sysadmin
 INSERT mytemp (rid, at1, at2, at3, lixo)
 SELECT cast((RAND()*@nelem*40000) as int), cast((RAND()*@nelem) as int),
 cast((RAND()*@nelem) as int), cast((RAND()*@nelem) as int),
 'lixo...lixo...lixo...lixo...lixo...lixo...lixo...lixo...lixo';
 SET @val = @val + 1;
 END
 PRINT 'Inserted ' + str(@nelem) + ' total records'
 -- Duration of Insertion Process
 SET @end_time = GETDATE();
PRINT 'Milliseconds used: ' + CONVERT(VARCHAR(20), DATEDIFF(MILLISECOND,
@start_time, @end_time));

GO



-- Get the physical statistics of the index on the table
SELECT *
FROM sys.dm_db_index_physical_stats(DB_ID('temp'), OBJECT_ID('dbo.mytemp'), NULL, NULL, 'DETAILED');
