-- Consultar todos os atributos da tabela Processo, onde o atributo especieProcesso é igual a Judicial.
SELECT
  *
FROM
  `dbprf1`.`Processo`
WHERE
  especieProcesso = 'Judicial';