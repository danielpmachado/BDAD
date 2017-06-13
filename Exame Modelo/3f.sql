.mode columns
.headers on
.nullvalue NULL


DROP TRIGGER IF EXISTS vulnerableServer;

CREATE TRIGGER vulnerableServer
AFTER INSERT ON Bug
WHEN  NEW.vulnerabilidade = "sim"
BEGIN 
UPDATE Servidor 
	SET vulneravel = "sim"
	WHERE Bug.idAplicacao  = AplicacaoServidor.idAplicacao
	AND AplicacaoServidor.idServidor = Servidor.idServidor;
UPDATE Bug SET prioridade = 1
	WHERE idBug = new.idBug;
END;
























