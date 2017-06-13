.mode columns
.headers on
.nullvalue NULL

CREATE TRIGGER adicionaAplicacao
BEFORE INSERT ON AplicacaoServidor
FOR EACH ROW 
BEGIN
SELECT CASE
WHEN (SELECT Aplicacao.idAplicacao 
FROM Bug, Aplicacao
WHERE Aplicacao.idAplicacao = Bug.idAplicacao
AND Bug.vulnerabilidade = "sim")
THEN Servidor.vulneravel = "sim")
END
;