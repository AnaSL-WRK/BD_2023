# BD: Guião 8


## ​8.1. Complete a seguinte tabela.
Complete the following table.

| #    | Query                                                                                                      | Rows  | Cost  | Pag. Reads | Time (ms) | Index used | Index Op.            | Discussion |
| :--- | :--------------------------------------------------------------------------------------------------------- | :---- | :---- | :--------- | :-------- | :--------- | :------------------- | :--------- |
| 1    | SELECT * from Production.WorkOrder                                                                         | 72591 | 0.484 | 531        | 1171      | …          | Clustered Index Scan |            |
| 2    | SELECT * from Production.WorkOrder where WorkOrderID=1234                                                  |   1   |   0.003283      |    216       |      26     |      WorkOrderID      |    Clustered Index Seek |   :-------         |
| 3.1  | SELECT * FROM Production.WorkOrder WHERE WorkOrderID between 10000 and 10010                               |    11,9979   |   0,0032976    |         216   |       24    |      WorkOrderID      |             Clustered Index Seek         |   :-------         |
| 3.2  | SELECT * FROM Production.WorkOrder WHERE WorkOrderID between 1 and 72591                                   |   72591    |   0,4880210    |       746     |      602     |    WorkOrderID        |    Clustered Index Seek                  |    :--------        |
| 4    | SELECT * FROM Production.WorkOrder WHERE StartDate = '2007-06-25'                                          |   57    |  0,5228640     |     1890       |     95      |      WorkOrderID      |            Clustered Index Scan          |    :----------        |
| 5    | SELECT * FROM Production.WorkOrder WHERE ProductID = 757                                                   |     11,4  |    0,0373590   |   66         |     13      |    ProductID        |        Nonclustered Index Scan e Clustered Key Lookup              |   :------         |
| 6.1  | SELECT WorkOrderID, StartDate FROM Production.WorkOrder WHERE ProductID = 757                              |  11,4     |    0,0032945   |      236      |      22     |      ProductID Covered (StartDate)      |        NonClustered Index Seek              |       :--------     |
| 6.2  | SELECT WorkOrderID, StartDate FROM Production.WorkOrder WHERE ProductID = 945                              |    1105   |   0,0060119    |       242     |      95     |      ProductID Covered (StartDate)      |          NonClustered Index Seek            |    :-----------------        |
| 6.3  | SELECT WorkOrderID FROM Production.WorkOrder WHERE ProductID = 945 AND StartDate = '2006-01-04'            |   1,79    |   0,0060119    |     26       |     4      |      ProductID Covered (StartDate)      |        NonClustered Index Seek              |   :-------------         |
| 7    | SELECT WorkOrderID, StartDate FROM Production.WorkOrder WHERE ProductID = 945 AND StartDate = '2006-01-04' |   1,79    |   0,0060119    |      58      |     8      |    ProductID and StartDate        |       NonClustered Index Seek && NonClustered Index Seek               |       :------------     |
| 8    | SELECT WorkOrderID, StartDate FROM Production.WorkOrder WHERE ProductID = 945 AND StartDate = '2006-01-04' |   1,01    |    0,0032831   |      24      |    2       |    Composite (ProductID, StartDate)        |         NonClustered Index Seek             |  :-----------------          |

## ​8.2.

### a)

```
ALTER TABLE mytemp ADD CONSTRAINT mytempPK PRIMARY KEY CLUSTERED (rid)
```

### b)

| **Milliseconds used:** | **avg_fragmentation_in_percent:** | **avg_page_space_used_in_percent:** |
|---|---|---|
| 75124 | 98,9051094890511 | 69,8643686681492|



### c)

**FillFactor** | **Milliseconds used:** | **avg_fragmentation_in_percent:** | **avg_page_space_used_in_percent:** |
|---|---|---|---|
65 | 73320 | 98,6682808716707 | 69,5259204348901 |
80 | 73577 | 99,2753623188406 | 69,3593155423771 |
90 | 71006 | 98,80810488677 | 68,4482579688658 |

### d)

| **Milliseconds used:** | **avg_fragmentation_in_percent:** | **avg_page_space_used_in_percent:** |
|---|---|---|
| 73487 | 98,7995198079232 | 68,9428341981715 |



### e)
Using index:

| **Milliseconds used:** |  |  
|---|---|
| With index | 76244
Without index | 75124 

It is slower using indexes since the process of inserting values has to be done in both the table as well as the indexes (repeated operations).


## ​8.3.

```
-- i)
CREATE UNIQUE CLUSTERED INDEX IxSsn ON employee (Ssn);

-- ii)
CREATE INDEX IxLnameFname ON employee (Lname, Fname);

-- iii)
CREATE INDEX IxDno ON employee (Dno);

-- iv)
CREATE CLUSTERED INDEX IxEssnPno ON works_on (Essn, Pno);

-- v)
CREATE CLUSTERED INDEX IxEssn ON dependent (Essn);

--vi)
CREATE INDEX IxDnum ON project (Dnum);
```
