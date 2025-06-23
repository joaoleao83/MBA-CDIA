-- Consultar os atributos da tabela ProcessoJudicial onde na tabela PessoaInteressada a tabela Pessoa tenha o atributo nome "João da Silva".
SELECT
  *
FROM
  `dbprf1`.`ProcessoJudicial`
INNER JOIN
  `dbprf1`.`PessoaInteressada`
ON
  `ProcessoJudicial`.`id` = `PessoaInteressada`.`ProcessoJudicial_id`
INNER JOIN
  `dbprf1`.`Pessoa`
ON
  `PessoaInteressada`.`Pessoa_id` = `Pessoa`.`id`
WHERE
  `Pessoa`.`nome` = 'João da Silva';