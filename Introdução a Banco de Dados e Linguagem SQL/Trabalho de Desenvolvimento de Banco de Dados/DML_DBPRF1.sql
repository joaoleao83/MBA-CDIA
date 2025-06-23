-- Popular todas as tabelas da base de dados dbprf1, com valores concernentes, observando-se o tipo do atributo e as restrições.

USE `dbprf1`;

  -- Inserting into Pessoa table
INSERT INTO
  `dbprf1`.`Pessoa` (`id`,
    `nome`,
    `naturalidade`,
    `profissao`,
    `contato`,
    `dataNascimento`,
    `numeroDocumentoPrincipal`,
    `dataObito`,
    `nomeGenitor`,
    `nomeGenitora`,
    `modalidade`,
    `modalidadeDocumentoPrincipal`)
VALUES
  (1, "João da Silva", "Brasileiro", "Advogado", "joao.silva@email.com", "1980-05-15", "12345678900", NULL, "Pai de João", "Mãe de João", "FISICA", "CPF"),
  (2, "Maria Souza", "Brasileira", "Engenheira", "maria.souza@email.com", "1990-10-20", "98765432100", NULL, "Pai de Maria", "Mãe de Maria", "FISICA", "CPF");

  -- Inserting into ProcessoJudicial table
INSERT INTO
  `dbprf1`.`ProcessoJudicial` (`id`,
    `numero`,
    `numeroFormatado`,
    `numeroAlternativo`,
    `classeNacional`,
    `orgaoJulgador`,
    `dataHoraAjuizamento`,
    `dataHoraCitacao`,
    `dataHoraTransitoJulgado`,
    `intervencaoMP`,
    `eletronico`,
    `valorCausa`,
    `criadoEm`,
    `atualizadoEm`)
VALUES
  (1, "123456789", "1234567-89", NULL, "Ação Ordinária", "Vara Cível", "2023-02-15 10:00:00", "2023-03-01 14:00:00", "2023-03-20 17:00:00", 1, 1, 5000.00, "2023-02-15 10:00:00", "2023-03-20 17:00:00");

  -- Inserting into PessoaInteressada table
INSERT INTO
  `dbprf1`.`PessoaInteressada` (`ProcessoJudicial_id`,
    `Pessoa_id`,
    `modalidadeParte`)
VALUES
  (1, 1, "POLO ATIVO"),
  (1, 2, "POLO PASSIVO");

  -- Inserting into PessoaRepresentada table
INSERT INTO
  `dbprf1`.`PessoaRepresentada` (`Pessoa_id`,
    `ProcessoJudicial_id`,
    `modalidadeRepresentada`)
VALUES
  (1, 1, "AUTARQUIA");

 -- Inserting into Processo table
INSERT INTO
  `dbprf1`.`Processo` (`id`,
    `valorEconomico`,
    `protocoloEletronico`,
    `NUP`,
    `NUPFormatado`,
    `especieProcesso`,
    `dataHoraAbertura`,
    `dataHoraEncerramento`,
    `titulo`,
    `outroNumero`,
    `descricao`,
    `procedencia`,
    `setorAtual`,
    `setorInicial`,
    `acessoRestrito`,
    `criadoEm`,
    `atualizadoEm`,
    `ProcessoJudicial_id`)
VALUES
  (1, 1000.00, 1, "123456789", "1234567-89", "ADMINISTRATIVO", "2023-01-10 08:00:00", NULL, "Processo Administrativo", NULL, "Descrição do processo", 1, "Setor A", "Setor B", 0, "2023-01-10 08:00:00", "2023-01-10 08:00:00", NULL),
  (2, 5000.00, 1, "987654321", "9876543-21", "JUDICIAL", "2023-02-15 10:00:00", "2023-03-20 17:00:00", "Processo Judicial", NULL, "Descrição do processo judicial", 2, "Setor C", "Setor D", 1, "2023-02-15 10:00:00", "2023-03-20 17:00:00", 1);

  -- Inserting into ProcessoVinculado table
INSERT INTO
  `dbprf1`.`ProcessoVinculado` (`Processo`,
    `processoVinculado`,
    `observacao`)
VALUES
  (1, 2, "Processo vinculado");

  -- Inserting into Volume table
INSERT INTO
  `dbprf1`.`Volume` (`id`,
    `Processo_id`,
    `encerrado`,
    `numeracaoSequencial`,
    `criadoEm`,
    `atualizadoEm`)
VALUES
  (1, 1, 0, 1, "2023-01-10 08:00:00", "2023-01-10 08:00:00");

  -- Inserting into Juntada table
INSERT INTO
  `dbprf1`.`Juntada` (`id`,
    `Volume_id`,
    `numeracaoSequencial`,
    `descricao`)
VALUES
  (1, 1, 1, "Juntada inicial"),
  (2, 1, 2, "Juntada de contestação");
  
  -- Inserting into Documento table
INSERT INTO
  `dbprf1`.`Documento` (`id`,
    `Juntada_id`,
    `numeroFolhas`,
    `dataHoraProducao`,
    `assinado`,
    `semEfeito`,
    `temAnexos`,
    `autor`,
    `destinatario`,
    `tipoDocumento`,
    `descricao`,
    `observacao`,
    `setorOrigem`,
    `acessoRestrito`,
    `conteudo`)
VALUES
  (1, 1, "10", "2023-01-10 09:00:00", 1, 0, 0, "João da Silva", "Maria Souza", "Petição", "Petição inicial", "Observações", "Setor A", 0, "Conteúdo do documento"),
  (2, 2, "5", "2023-02-15 11:00:00", 1, 0, 0, "Maria Souza", "João da Silva", "Contestação", "Contestação", "Observações", "Setor C", 1, "Conteúdo do documento");