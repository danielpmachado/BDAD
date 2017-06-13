.mode columns
.headers on
.nullvalue NULL

SELECT Aplicacao.nome
	FROM Aplicacao, Bug
	WHERE Bug.idAplicacao = Aplicacao.idAplicacao 
GROUP BY Aplicacao.nome
ORDER BY COUNT(*) desc
LIMIT 1
;