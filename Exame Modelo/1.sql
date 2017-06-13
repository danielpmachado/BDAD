.mode	columns
.headers	on
.nullvalue	NULL

SELECT hostname, nome
FROM Servidor, Pessoa
WHERE Servidor.vulneravel = "sim"
AND Pessoa.idPessoa = Servidor.idResponsavel;



