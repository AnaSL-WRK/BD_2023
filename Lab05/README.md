# BD: Guião 5


## ​Problema 5.1
 
### *a)*

```
π Pname, Pnumber, Fname , Minit, Lname, Ssn (project ⨝ Pnumber = Pno (employee ⨝ Ssn = Essn works_on))
```


### *b)* 

```
π Fname, Minit, Lname, Super_ssn (
employee ⨝ employee.Super_ssn = s_ssn.Ssn
	(ρ s_ssn
		(π Ssn
			(σ Fname = 'Carlos' ∧ Minit = 'D' ∧ Lname = 'Gomes' (employee)))))
```


### *c)* 

```
γ Pname; sum(Hours)->total_hours (project ⨝ Pnumber = Pno works_on)
```


### *d)* 

```
π Fname, Lname, Pname, Dno, Hours
	(σ works_on.Hours > 20
		(employee ⨝ Ssn = works_on.Essn
			((σ Pname = 'Aveiro Digital' project ) ⨝ Pnumber = Pno works_on)))
```


### *e)* 

```
π Fname, Minit, Lname employee - π Fname, Minit, Lname (employee ⨝ Ssn = Essn σ Essn ≠ null works_on)
```


### *f)* 

```
γ Dname; avg(employee.Salary) -> average_female_salary
 	(σ employee.Sex = 'F' 
 		(department ⨝ Dnumber = Dno employee))
```


### *g)* 

```
σ num_Dependents > 2
	(γ Fname, Minit, Lname; count(Essn)-> num_Dependents
		(employee ⨝ Ssn = Essn dependent))
```


### *h)* 

```
π Fname, Minit, Lname (employee ⨝ Ssn = Mgr_ssn  department) - π Fname, Minit, Lname ((employee ⨝ Ssn = Mgr_ssn  department) ⨝ Ssn = Essn dependent)
```


### *i)* 

```
π Fname, Minit, Lname, Address
	-- Pessoas que trabalham em pelo menos um proj em Aveiro
	((employee ⨝ Ssn = Essn
		(π Pname, Pnumber, Plocation, Essn (σ project.Plocation	= 'Aveiro' project ⨝ works_on)))
		 
		 ⨝ employee.Dno = department.Dnumber	
			
			-- Departamentos sem localização em aveiro
			(department - π department.Dname, department.Dnumber,department.Mgr_ssn,department.Mgr_start_date
				(σ dept_location.Dlocation = 'Aveiro' (department ⨝ dept_location))))
```


## ​Problema 5.2

### *a)*

```
π nif (fornecedor) -
π encomenda.fornecedor
(encomenda ⨝ (nif = fornecedor) fornecedor)

```

### *b)* 

```
γ produto.nome; avg(item.unidades) -> unidades
π item.numEnc, produto.codigo, produto.nome, item.unidades
(produto ⨝ codProd = codigo item)
```


### *c)* 

```
γ avg(num_produtos) -> media_num_prod_por_encomenda
γ item.numEnc; count(produto.codigo) -> num_produtos
(item ⨝ codProd = codigo produto)

```


### *d)* 

```
π fornecedor.nif, fornecedor.nome, produto.codigo, produto.nome, item.unidades
(produto ⨝ item.codProd = codigo (fornecedor ⨝ encomenda.fornecedor = nif (item ⨝ numero = numEnc encomenda)))

```


## ​Problema 5.3

### *a)*

```
π paciente.numUtente, paciente.nome (σ prescricao.numUtente = null (paciente ⟕ (paciente.numUtente = prescricao.numUtente) prescricao))
```

### *b)* 

```
γ medico.especialidade; count(medico.especialidade) -> num_prescricoes (σ farmacia ≠ null (medico ⨝ (numSNS = numMedico) prescricao))

```


### *c)* 

```
σ farmacia ≠ null (γ prescricao.farmacia; count(prescricao.farmacia) -> num_prescricoes prescricao)
```


### *d)* 

```
σ numPresc = null (σ numRegFarm = 906 (farmaco) ⟕ nome = nomeFarmaco σ numRegFarm = 906 (presc_farmaco))
```

### *e)* 

```
π farmacia.nome, farmaceutica.nome, num_farmacos_vendidos (farmaceutica ⨝ presc_farmaco.numRegNacional = farmaceutica.numReg (γ farmacia.nome, presc_farmaco.numRegNacional; count(presc_farmaco.nomeFarmaco) -> num_farmacos_vendidos (presc_farmaco ⨝ presc_farmaco.numPresc = prescricao.numPresc (π farmacia.nome,numPresc (farmacia ⨝ farmacia.nome = prescricao.farmacia prescricao)))))
```

### *f)* 

```
σ num_medicos > 1 (γ paciente.nome; count(prescricao.numMedico) -> num_medicos (paciente ⨝ paciente.numUtente = prescricao.numUtente prescricao))
```
