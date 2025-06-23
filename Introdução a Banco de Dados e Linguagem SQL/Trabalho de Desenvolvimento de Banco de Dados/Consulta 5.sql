-- Consulte os atributos da tabela Documento, onde a tabela Processo tenha o atributo especieProcesso com o valor Administrativo.
SELECT
  `Documento`.*
FROM
  `dbprf1`.`Documento`
INNER JOIN
  `dbprf1`.`Juntada` ON  `Documento`.`Juntada_id` = `Juntada`.`id`
INNER JOIN
  `dbprf1`.`Volume` ON  `Juntada`.`Volume_id` = `Volume`.`id`
INNER JOIN
  `dbprf1`.`Processo` ON  `Volume`.`Processo_id` = `Processo`.`id`
WHERE
  `Processo`.`especieProcesso` = 'Administrativo';