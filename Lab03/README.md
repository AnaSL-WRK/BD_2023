# BD: Guião 3


## ​Problema 3.1
 
### *a)*

```
- Relações (tabelas): cliente, aluguer, balcao, veiculo, tipo_veiculo, similaridade, ligeiro, pesado
- Esquema de relação: 
        - cliente(nome, endereco, num_carta, NIF)
        - aluguer(número, duracao, data, CNIF, Bnumero, Vmatricula)
        - balcao(nome, número. endereco)
        - veiculo(matricula, ano, marca, TPcodigo)
        - tipo_veiculo(designacao, arcondicionado, codigo)
        - similaridade(TPcodigo)
        - ligeiro(TPcodigo, numlugares, portas, combustivel)
        - pesado(TPcodigo, peso, passageiros)
```


### *b)* 

```
- cliente: 
        - chaves candidatas: num_carta, NIF
        - chave primária: NIF
        - chaves estrangeira: --

- aluguer:
        - chaves candidatas: numero
        - chave primária: numero
        - chaves estrangeira: CNIF, Bnumero, Vmatricula

- balcao:
        - chaves candidatas: número, endereco
        - chave primária: número
        - chaves estrangeira: --

- veiculo:
        - chaves candidatas: matricula
        - chave primária: matricula
        - chaves estrangeira: TPcodigo

- tipo_veiculo: 
        - chaves candidatas: codigo
        - chave primária: codigo
        - chaves estrangeira: --

- similaridade: 
        - chaves candidatas: TPcodigo
        - chave primária: TPcodigo
        - chaves estrangeira: TPcodigo

- ligeiro:
        - chaves candidatas: TPcodigo
        - chave primária: TPcodigo
        - chaves estrangeira: TPcodigo

- pesado:
        - chaves candidatas: TPcodigo
        - chave primária: TPcodigo
        - chaves estrangeira: TPcodigo


```


### *c)* 

![ex_3_1c!](ex_3_1c.pdf "Diagrama_3.1")


## ​Problema 3.2

### *a)*

```
- Relações(tabelas): Airport, Flight_Leg, Airplane_Type, Flight, Airplane, Leg_Instance, Seat, Fare
- Esquema de relação: 
        - Airport(airport_code, city, state, name)
        - Flight_Leg(number_flight, leg_number, airport_code_departue, airport_code_arrival,scheduled_depart_time, scheduled_arrival_time)
        - Airplane_type(type_name, max_seats, company)
        - Flight(number_flight, airline, weekdays, airplane_type)
        - Airplane (airplane_id, total_num_of_seats)
        - Leg_instance(number_flight, leg_number, date, num_avail_seats, depart_airport, arrive_airport, depart_time, arrive_time, plane)
        - Seat(number_of_flight, leg_number, date, seat_number, costumer_name, Cphone)
        - Fare(number_flight, code, restrictions, amount)

```


### *b)* 

```
- Airport:
        - chaves candidatas: airport_code
        - chave primária: airport_code
        - chaves estrangeira: --

- Flight_Leg:
        - chaves candidatas: number_flight, leg_number
        - chave primária: number_flight, leg_number
        - chaves estrangeira: number_flight, airport_code

- Airplane_Type:
        - chaves candidatas: type_name
        - chave primária: type_name
        - chaves estrangeira: --

- Flight:
        - chaves candidatas: number_flight
        - chave primária: number_flight
        - chaves estrangeira: airplane_type

- Airplane:
        - chaves candidatas: airplane_id
        - chave primária: airplane_id
        - chaves estrangeira: codigo_tipo_veiculo

- Leg_Instance:
        - chaves candidatas: number_flight, leg_number, date
        - chave primária: number_flight, leg_number, date
        - chaves estrangeira: number_flight, leg_number, airport_code, plane

- Seat:
        - chaves candidatas: number_of_flight, leg_number, date, seat_number
        - chave primária: number_of_flight, leg_number, date, seat_number
        - chaves estrangeira: number_of_flight, leg_number, date

- Fare:
        - chaves candidatas: number_flight, code
        - chave primária: number_flight, code
        - chaves estrangeira: number_flight

```


### *c)* 

![ex_3_2c!](ex_3_2c.pdf "Diagrama_3.2")


## ​Problema 3.3


### *a)* 2.1

![ex_3_3_a!](ex_3_3a.pdf "Diagrama_3.3a")

### *b)* 2.2

![ex_3_3_b!](ex_3_3b.pdf "Diagrama_3.3b")

### *c)* 2.3

![ex_3_3_c!](ex_3_3c.pdf "Diagrama_3.3c")

### *d)* 2.4

![ex_3_3_d!](ex_3_3d.pdf "Diagrama_3.3d")