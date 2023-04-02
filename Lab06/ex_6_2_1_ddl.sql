USE MASTER
GO
--ALTER DATABASE Business SET SINGLE_USER WITH ROLLBACK IMMEDIATE
--DROP DATABASE Business
--GO
CREATE DATABASE Business
GO
USE Business

CREATE TABLE DEPARTMENT (
Dname		VARCHAR(15)		NOT NULL	UNIQUE,
Dnumber		INT				NOT NULL	PRIMARY KEY,
Mgr_ssn		CHAR(9)			NOT NULL,
Mgr_start_date DATE			NOT NULL,

);

CREATE TABLE  EMPLOYEE (
Fname		VARCHAR(15)		NOT NULL,
Minit		CHAR,
Lname		VARCHAR(15)		NOT NULL,
Ssn			CHAR(9)			NOT NULL		PRIMARY KEY,
Bdate		DATE,
Address		VARCHAR(30),
Sex			CHAR,
Salary		DECIMAL(10,2)	NOT NULL,
Super_ssn	CHAR(9)							FOREIGN KEY REFERENCES EMPLOYEE(Ssn),
Dno			INT				NOT NULL		FOREIGN KEY REFERENCES DEPARTMENT(Dnumber),

);



CREATE TABLE DEPT_LOCATIONS (
Dnumber		INT				NOT NULL	FOREIGN KEY REFERENCES DEPARTMENT(Dnumber),
Dlocation	VARCHAR(15)		NOT NULL,

PRIMARY KEY (Dnumber, Dlocation), 
);

CREATE TABLE PROJECT (
Pname		VARCHAR(15)		NOT NULL,
Pnumber		INT				NOT NULL	PRIMARY KEY,
Plocation	VARCHAR(15),
Dnum		INT				NOT NULL	FOREIGN KEY REFERENCES DEPARTMENT(Dnumber),
);

CREATE TABLE WORKS_ON (
Essn		CHAR(9)			NOT NULL	FOREIGN KEY REFERENCES EMPLOYEE(Ssn),
Pno			INT				NOT NULL	FOREIGN KEY REFERENCES PROJECT(Pnumber),
Hours		DECIMAL(3,1)	NOT NULL,

PRIMARY	KEY (Essn, Pno),
);

CREATE TABLE DEPENDENT (
Essn			CHAR(9)		NOT NULL	FOREIGN KEY REFERENCES EMPLOYEE(Ssn),
Dependent_name	VARCHAR(15) NOT NULL,
Sex				CHAR,
Bdate			DATE,
Relationship	VARCHAR(8),

PRIMARY KEY (Essn, Dependent_name),
);