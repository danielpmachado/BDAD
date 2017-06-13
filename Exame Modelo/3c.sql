.mode 

columns
.headers on
.nullvalue NULL

SELECT hostname 
FROM Servidor, Pessoa, Bug
WHERE Pessoa.mail = "joao.almeida@cica.pt"
AND Servidor.idResponsavel = Pessoa.idPessoa
AND hostname LIKE "alu%"
AND Bug.idResponsavel = Pessoa.idPessoa
;