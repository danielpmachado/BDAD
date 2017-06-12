SELECT distinct hostname, nome
FROM (SELECT nome, idPessoa, Servidor.idResponsavel, hostname, vulnerabilidade
		FROM Servidor, Pessoa, Bug
		WHERE Pessoa.idPessoa = Servidor.idResponsavel
		AND Bug.vulnerabilidade = 'sim'
		);





