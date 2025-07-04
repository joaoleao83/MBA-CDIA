------------------------------------------------------------------------------------------------------------
-- Liste os dados das Pessoas do sexo feminino (‘F’).
------------------------------------------------------------------------------------------------------------
Select *
From Pessoa
WHERE sexo = 'F';

------------------------------------------------------------------------------------------------------------
-- Liste o nome, o sexo e a idade das Pessoas com idade entre 37 e 43 anos (intervalo fechado).
------------------------------------------------------------------------------------------------------------
Select nome, sexo, idade
From Pessoa
WHERE idade BETWEEN 37 AND 43;
-- WHERE idade >= 37 AND idade <= 43;

------------------------------------------------------------------------------------------------------------
-- Liste o nome, o sexo e a idade das Pessoas do sexo masculino com idade superior a 40 anos.
------------------------------------------------------------------------------------------------------------
Select nome, sexo, idade
From Pessoa
WHERE sexo = 'M'
AND idade > 40;

------------------------------------------------------------------------------------------------------------
-- Liste os dados das Pessoas cujo nome inicia pela letra ‘E’ ou ‘R’.
------------------------------------------------------------------------------------------------------------
Select *
From Pessoa
WHERE nome LIKE 'E%' OR nome LIKE 'R%';
-- WHERE nome LIKE '[ER]%'

------------------------------------------------------------------------------------------------------------
-- Liste os dados das Pessoas cuja idade seja um número par.
------------------------------------------------------------------------------------------------------------
Select *
From Pessoa
WHERE MOD(idade,2) = 0;
-- WHERE idade % 2 = 0;

------------------------------------------------------------------------------------------------------------
-- Liste a quantidade de Pessoas cadastrada na tabela Pessoa, idade mínima, máxima e a média das idades das Pessoas.
------------------------------------------------------------------------------------------------------------
Select COUNT(*) as Quantidade, MIN(idade) as Menor_Idade, MAX(idade) as Maior_Idade, AVG(idade) as Idade_media
From Pessoa;
