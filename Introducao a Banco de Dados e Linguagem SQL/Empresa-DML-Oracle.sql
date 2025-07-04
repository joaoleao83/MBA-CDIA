------------------------------------------------------------
-- Insere dados na tabela Departamento
------------------------------------------------------------
INSERT INTO Departamento (Codigo, Nome, UF)
VALUES (10, 'RH', 'RJ');
INSERT INTO Departamento (Codigo, Nome, UF)
VALUES (20, 'TI', 'RJ');
INSERT INTO Departamento (Codigo, Nome, UF)
VALUES (30, 'Logística', 'DF');
INSERT INTO Departamento (Codigo, Nome, UF)
VALUES (40, 'Financeiro', 'DF'); 
INSERT INTO Departamento (Codigo, Nome, UF)
VALUES (50, 'Venda', 'RS');       
INSERT INTO Departamento (Codigo, Nome, UF)
VALUES (60, 'Pesquisa', 'RJ');

------------------------------------------------------------            
-- Insere dados na tabela Empregado
------------------------------------------------------------
INSERT INTO Empregado(Matricula, Primeiro_Nome, Familia_Nome, Salario, Departamento_Codigo)
VALUES (123, 'Igor', 'Pereira', 100.00, 10);        
INSERT INTO Empregado(Matricula, Primeiro_Nome, Familia_Nome, Salario, Departamento_Codigo)
VALUES(159, 'Denise', 'Moreno', 440.00, 40);       
INSERT INTO Empregado(Matricula, Primeiro_Nome, Familia_Nome, Salario, Departamento_Codigo)
VALUES(369, 'Marcelo', 'Neiva', 900.00, 40);       
INSERT INTO Empregado(Matricula, Primeiro_Nome, Familia_Nome, Salario, Departamento_Codigo)
VALUES(456, 'Ana', 'Oliveira', 200.00, 20);      
INSERT INTO Empregado(Matricula, Primeiro_Nome, Familia_Nome, Salario, Departamento_Codigo)
VALUES(789, 'Clara', 'Silva', 300.00, 30);      
INSERT INTO Empregado(Matricula, Primeiro_Nome, Familia_Nome, Salario, Departamento_Codigo)
VALUES(963, 'Deyse', 'Silva', 330.00, null);
