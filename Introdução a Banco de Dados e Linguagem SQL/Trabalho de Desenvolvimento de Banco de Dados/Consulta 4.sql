-- Consulte todos os atributos da tabela processo, onde haja registro na tabela ProcessoVinculado, tanto no atributo Processo quanto no atributo ProcessoVinculado.
SELECT
  `dbprf1`.`Processo`.*
FROM
  `dbprf1`.`Processo`
WHERE
  `dbprf1`.`Processo`.`id` IN (
  SELECT
    `dbprf1`.`ProcessoVinculado`.`Processo`
  FROM
    `dbprf1`.`ProcessoVinculado` )
  OR `dbprf1`.`Processo`.`id` IN (
  SELECT
    `dbprf1`.`ProcessoVinculado`.`processoVinculado`
  FROM
    `dbprf1`.`ProcessoVinculado` );