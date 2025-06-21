-- -----------------------------------------------------
-- Table  Pessoa 
-- -----------------------------------------------------
INSERT INTO  pessoa  ( CPF ,  Nome ,  Sexo ,  Idade ) VALUES (123, 'Rubi', 'F', 35);
INSERT INTO  pessoa  ( CPF ,  Nome ,  Sexo ,  Idade ) VALUES (456, 'Igor', 'M', 40);
INSERT INTO  pessoa  ( CPF ,  Nome ,  Sexo ,  Idade ) VALUES (789, 'Luiz', 'M', 38);
INSERT INTO  pessoa  ( CPF ,  Nome ,  Sexo ,  Idade ) VALUES (147, 'Maria', 'F', 42);
INSERT INTO  pessoa  ( CPF ,  Nome ,  Sexo ,  Idade ) VALUES (258, 'Edu', 'M', 45);

UPDATE  pessoa  SET  Gerente_CPF  = 123 WHERE ( CPF  = 147);
UPDATE  pessoa  SET  Gerente_CPF  = 123 WHERE ( CPF  = 456);
UPDATE  pessoa  SET  Gerente_CPF  = 147 WHERE ( CPF  = 258);
UPDATE  pessoa  SET  Gerente_CPF  = 456 WHERE ( CPF  = 789);

-- -----------------------------------------------------
-- Table  Projeto 
-- -----------------------------------------------------
INSERT INTO  projeto  ( Codigo ,  Descricao ) VALUES (1122, 'BI');
INSERT INTO  projeto  ( Codigo ,  Descricao ) VALUES (3344, 'GTI');
INSERT INTO  projeto  ( Codigo ,  Descricao ) VALUES (5566, 'SIG');

-- -----------------------------------------------------
-- Table  Aloca 
-- -----------------------------------------------------
INSERT INTO  aloca  ( Projeto_Codigo ,  Pessoa_CPF ) VALUES ( 1122 ,  123 );
INSERT INTO  aloca  ( Projeto_Codigo ,  Pessoa_CPF ) VALUES ( 3344 ,  123 );
INSERT INTO  aloca  ( Projeto_Codigo ,  Pessoa_CPF ) VALUES ( 5566 ,  123 );
INSERT INTO  aloca  ( Projeto_Codigo ,  Pessoa_CPF ) VALUES ( 1122 ,  456 );
INSERT INTO  aloca  ( Projeto_Codigo ,  Pessoa_CPF ) VALUES ( 5566 ,  456 );
INSERT INTO  aloca  ( Projeto_Codigo ,  Pessoa_CPF ) VALUES ( 3344 ,  789 );
INSERT INTO  aloca  ( Projeto_Codigo ,  Pessoa_CPF ) VALUES ( 3344 ,  147 );