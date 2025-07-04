-- -----------------------------------------------------
-- Table   Pessoa  
-- -----------------------------------------------------
CREATE TABLE Pessoa   (
    CPF   INT NOT NULL,
    Nome   VARCHAR(45) NULL,
    Sexo   CHAR(1) NULL,
    Idade   INT NULL,
    Gerente_CPF   INT NULL,
    PRIMARY KEY (  CPF  ),
    FOREIGN KEY (  Gerente_CPF  )
    REFERENCES   Pessoa   (  CPF  ));

-- -----------------------------------------------------
-- Table   Projeto  
-- -----------------------------------------------------
CREATE TABLE Projeto   (
    Codigo   INT NOT NULL,
    Descricao   VARCHAR(45) NULL,
  PRIMARY KEY (  Codigo  ));

-- -----------------------------------------------------
-- Table   Aloca  
-- -----------------------------------------------------
CREATE TABLE Aloca   (
    Projeto_Codigo   INT NOT NULL,
    Pessoa_CPF   INT NOT NULL,
    PRIMARY KEY (  Projeto_Codigo  ,   Pessoa_CPF  ), 
    FOREIGN KEY (  Projeto_Codigo  )
    REFERENCES   Projeto   (  Codigo  ),
    FOREIGN KEY (  Pessoa_CPF  )
    REFERENCES   Pessoa   (  CPF  ));
