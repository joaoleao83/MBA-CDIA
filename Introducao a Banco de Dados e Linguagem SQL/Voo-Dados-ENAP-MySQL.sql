DROP TABLE TELEFONE;
DROP TABLE RESERVA;
DROP TABLE VOO;
DROP TABLE PASSAGEIRO;
DROP TABLE PILOTO;
DROP TABLE PESSOA;
--------------------------------------

Tabela Pessoa:
==============
Insert  Into Pessoa(CPF, Nome, Sexo)
Values(111, 'Ana', 'F' );
Insert  Into Pessoa(CPF, Nome, Sexo)
Values(222, 'Beto', 'F' );
Insert  Into Pessoa(CPF, Nome, Sexo)
Values(333, 'Caio', 'F' );
Insert  Into Pessoa(CPF, Nome, Sexo)
Values(444, 'Igor', 'F' );
Insert  Into Pessoa(CPF, Nome, Sexo)
Values(555, 'Edu', 'F' );
------------------------------------

Tabela Piloto:
==============
Insert  Into Piloto(P_CPF, Licenca)
Values(222, 'LC01' );
Insert  Into Piloto(P_CPF, Licenca)
Values(555, 'LC02' );
------------------------------------

Tabela Passageiro:
==================
Insert  Into Passageiro(P_CPF, Categoria)
Values(333, 'Ouro' );
Insert  Into Passageiro(P_CPF, Categoria)
Values(444, 'Normal' );
------------------------------------

Tabela Telefone:
================
Insert  Into Telefone(Numero, Pas_P_CPF)
Values(999555, 333 );
Insert  Into Telefone(Numero, Pas_P_CPF)
Values(222444, 444 );
Insert  Into Telefone(Numero, Pas_P_CPF)
Values(888555, 333 );
------------------------------------

Tabela Voo:
===========
Insert  Into Voo(Numero, Data_Voo, Pi_P_CPF)
Values(101, '2010-10-10', 222 );
Insert  Into Voo(Numero, Data_Voo, Pi_P_CPF)
Values(202, '2011-11-11', 555 );
Insert  Into Voo(Numero, Data_Voo, Pi_P_CPF)
Values(303, '2012-12-12', 555 );
Insert  Into Voo(Numero, Data_Voo, Pi_P_CPF)
Values(404, '2013-01-13', 555 );


Tabela Reserva:
===============
Insert  Into Reserva(Pas_P_CPF, V_Numero)
Values(333, 101 );
Insert  Into Reserva(Pas_P_CPF, V_Numero)
Values(444, 101 );
Insert  Into Reserva(Pas_P_CPF, V_Numero)
Values(333, 202 );
Insert  Into Reserva(Pas_P_CPF, V_Numero)
Values(333, 404 );
------------------------------------
