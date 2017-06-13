.mode columns
.headers on
.nullvalue NULL

DROP TRIGGER IF EXISTS vulnerableApp;

CREATE TRIGGER vulnerableApp
AFTER INSERT ON AplicacaoServidor
WHEN (SELECT COUNT (*) 
		FROM Bug, AplicacaoServidor
		WHERE AplicacaoServidor.idAplicacao = Bug.idAplicacao
		AND Bug.vulnerabilidade	= "sim"
		) > 0 
BEGIN 
UPDATE Servidor
SET vulneravel = "sim"
WHERE Servidor.idServidor = new.idServidor;
END;
























