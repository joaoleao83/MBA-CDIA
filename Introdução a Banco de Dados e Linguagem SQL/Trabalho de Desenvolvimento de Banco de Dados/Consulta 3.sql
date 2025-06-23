-- Consulte a quantidade de registros da tabela Juntada relacionada a tabela Processo onde o atributo procedência da tabela Processo seja a tabela Pessoa
-- que tenha o atributo nome "João da Silva".
SELECT
  COUNT(DISTINCT `Juntada`.`id`)
FROM
  `dbprf1`.`Juntada`
JOIN
  `dbprf1`.`Volume`
ON
  `Juntada`.`Volume_id` = `Volume`.`id`
JOIN
  `dbprf1`.`Processo`
ON
  `Volume`.`Processo_id` = `Processo`.`id`
WHERE
  `Processo`.`procedencia` IN (  SELECT    `Pessoa`.`id`  FROM    `dbprf1`.`Pessoa`  WHERE    `Pessoa`.`nome` = 'João da Silva' );