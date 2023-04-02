USE MASTER 
GO 
USE Prescricao_Meds

INSERT INTO MEDICO(numSNS,nome,especialidade) VALUES (101,'Joao Pires Lima','Cardiologia');
INSERT INTO MEDICO(numSNS,nome,especialidade) VALUES (102,'Manuel Jose Rosa','Cardiologia');
INSERT INTO MEDICO(numSNS,nome,especialidade) VALUES (103,'Rui Luis Caraca','Pneumologia');
INSERT INTO MEDICO(numSNS,nome,especialidade) VALUES (104,'Sofia Sousa Silva','Radiologia');
INSERT INTO MEDICO(numSNS,nome,especialidade) VALUES (105,'Ana Barbosa', 'Neurologia');
			
INSERT INTO PACIENTE(numUtente,nome,dataNasc,endereco) VALUES (1,'Renato Manuel Cavaco','1980-01-03','Rua Nova do Pilar 35');
INSERT INTO PACIENTE(numUtente,nome,dataNasc,endereco) VALUES (2,'Paula Vasco Silva','1972-10-30','Rua Direita 43');
INSERT INTO PACIENTE(numUtente,nome,dataNasc,endereco) VALUES (3,'Ines Couto Souto','1985-05-12','Rua de Cima 144');
INSERT INTO PACIENTE(numUtente,nome,dataNasc,endereco) VALUES (4,'Rui Moreira Porto','1970-12-12','Rua Zig Zag 235');
INSERT INTO PACIENTE(numUtente,nome,dataNasc,endereco) VALUES (5,'Manuel Zeferico Polaco','1990-06-05','Rua da Baira Rio 1135');
		
INSERT INTO FARMACIA(nome,telefone,endereco) VALUES ('FARMACIA BelaVista',221234567,'Avenida Principal 973');
INSERT INTO FARMACIA(nome,telefone,endereco) VALUES ('FARMACIA Central',234370500,'Avenida da Liberdade 33');
INSERT INTO FARMACIA(nome,telefone,endereco) VALUES ('FARMACIA Peixoto',234375111,'Largo da Vila 523');
INSERT INTO FARMACIA(nome,telefone,endereco) VALUES ('FARMACIA Vitalis',229876543,'Rua Visconde Salgado 263');

INSERT INTO FARMACEUTICA(numReg,nome,endereco) VALUES (905,'Roche','Estrada Nacional 249');
INSERT INTO FARMACEUTICA(numReg,nome,endereco) VALUES (906,'Bayer','Rua da Quinta do Pinheiro 5');
INSERT INTO FARMACEUTICA(numReg,nome,endereco) VALUES (907,'Pfizer','Empreendimento Lagoas Park - Edificio 7');
INSERT INTO FARMACEUTICA(numReg,nome,endereco) VALUES (908,'Merck', 'Alameda Fern�o Lopes 12');
			
INSERT INTO FARMACO(numRegFarm,nome,formula) VALUES (905,'Boa Saude em 3 Dias','XZT9');
INSERT INTO FARMACO(numRegFarm,nome,formula) VALUES (906,'Voltaren Spray','PLTZ32');
INSERT INTO FARMACO(numRegFarm,nome,formula) VALUES (906,'Xelopironi 350','FRR-34');
INSERT INTO FARMACO(numRegFarm,nome,formula) VALUES (906,'Gucolan 1000','VFR-750');
INSERT INTO FARMACO(numRegFarm,nome,formula) VALUES (907,'GEROaero Rapid','DDFS-XEN9');
INSERT INTO FARMACO(numRegFarm,nome,formula) VALUES (908,'Aspirina 1000','BIOZZ02');

INSERT INTO PRESCRICAO(numPresc,numUtente,numMedico,nome_farmacia,dataProc) VALUES (10001,1,105,'Farmacia Central','2015-03-03');
INSERT INTO PRESCRICAO(numPresc,numUtente,numMedico,nome_farmacia,dataProc) VALUES (10002,1,105,NULL,NULL);
INSERT INTO PRESCRICAO(numPresc,numUtente,numMedico,nome_farmacia,dataProc) VALUES (10003,3,102,'Farmacia Central','2015-01-17');
INSERT INTO PRESCRICAO(numPresc,numUtente,numMedico,nome_farmacia,dataProc) VALUES (10004,3,101,'Farmacia BelaVista','2015-02-09');
INSERT INTO PRESCRICAO(numPresc,numUtente,numMedico,nome_farmacia,dataProc) VALUES (10005,3,102,'Farmacia Central','2015-01-17');
INSERT INTO PRESCRICAO(numPresc,numUtente,numMedico,nome_farmacia,dataProc) VALUES (10006,4,102,'Farmacia Vitalis','2015-02-22');
INSERT INTO PRESCRICAO(numPresc,numUtente,numMedico,nome_farmacia,dataProc) VALUES (10007,5,103,NULL,NULL);
INSERT INTO PRESCRICAO(numPresc,numUtente,numMedico,nome_farmacia,dataProc) VALUES (10008,1,103,'Farmacia Central','2015-01-02');
INSERT INTO PRESCRICAO(numPresc,numUtente,numMedico,nome_farmacia,dataProc) VALUES (10009,3,102,'Farmacia Peixoto','2015-02-02');

INSERT INTO PRESC_FARMACO(numPresc,numRegFarm,nomeFarmaco) VALUES (10001,905,'Boa Saude em 3 Dias');
INSERT INTO PRESC_FARMACO(numPresc,numRegFarm,nomeFarmaco) VALUES (10002,907,'GEROaero Rapid');
INSERT INTO PRESC_FARMACO(numPresc,numRegFarm,nomeFarmaco) VALUES (10003,906,'Voltaren Spray');
INSERT INTO PRESC_FARMACO(numPresc,numRegFarm,nomeFarmaco) VALUES (10003,906,'Xelopironi 350');
INSERT INTO PRESC_FARMACO(numPresc,numRegFarm,nomeFarmaco) VALUES (10003,908,'Aspirina 1000');
INSERT INTO PRESC_FARMACO(numPresc,numRegFarm,nomeFarmaco) VALUES (10004,905,'Boa Saude em 3 Dias');
INSERT INTO PRESC_FARMACO(numPresc,numRegFarm,nomeFarmaco) VALUES (10004,908,'Aspirina 1000');
INSERT INTO PRESC_FARMACO(numPresc,numRegFarm,nomeFarmaco) VALUES (10005,906,'Voltaren Spray');
INSERT INTO PRESC_FARMACO(numPresc,numRegFarm,nomeFarmaco) VALUES (10006,905,'Boa Saude em 3 Dias');
INSERT INTO PRESC_FARMACO(numPresc,numRegFarm,nomeFarmaco) VALUES (10006,906,'Voltaren Spray');
INSERT INTO PRESC_FARMACO(numPresc,numRegFarm,nomeFarmaco) VALUES (10006,906,'Xelopironi 350');
INSERT INTO PRESC_FARMACO(numPresc,numRegFarm,nomeFarmaco) VALUES (10006,908,'Aspirina 1000');
INSERT INTO PRESC_FARMACO(numPresc,numRegFarm,nomeFarmaco) VALUES (10007,906,'Voltaren Spray');
INSERT INTO PRESC_FARMACO(numPresc,numRegFarm,nomeFarmaco) VALUES (10008,905,'Boa Saude em 3 Dias');
INSERT INTO PRESC_FARMACO(numPresc,numRegFarm,nomeFarmaco) VALUES (10008,908,'Aspirina 1000');
INSERT INTO PRESC_FARMACO(numPresc,numRegFarm,nomeFarmaco) VALUES (10009,905,'Boa Saude em 3 Dias');
INSERT INTO PRESC_FARMACO(numPresc,numRegFarm,nomeFarmaco) VALUES (10009,906,'Voltaren Spray');
INSERT INTO PRESC_FARMACO(numPresc,numRegFarm,nomeFarmaco) VALUES (10009,908,'Aspirina 1000');