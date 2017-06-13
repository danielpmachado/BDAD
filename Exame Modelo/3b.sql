.mode	columns
.headers	on
.nullvalue	NULL

/*
SELECT hostname, descricao, nome
FROM (SELECT hostname, vulnerabilidade, descricao, nome
		FROM Servidor, Bug, Pessoa
		WHERE Bug.vulnerabilidade = "sim"
		--AND Pessoa.idPessoa = Servidor.idResponsavel
		AND Bug.idResponsavel = Pessoa.idPessoa
		--AND Bug.idResponsavel = Servidor.idResponsavel
) ORDER BY hostname
;*/


SELECT distinct hostname, Bug.descricao, nome
FROM Servidor, Bug, Pessoa, AplicacaoServidor
WHERE AplicacaoServidor.idAplicacao = Bug.idAplicacao
AND Servidor.idServidor = AplicacaoServidor.idServidor
AND Bug.vulnerabilidade = "sim"
AND Pessoa.idPessoa = Servidor.idResponsavel
ORDER BY hostname
;
