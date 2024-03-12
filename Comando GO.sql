/*
                
                Bem vindos ao DBA-SLZ
                
                O commando GO

                Programando em T-SQL

                ^_^

*/

--O comando GO sinaliza o final de um lote de instruções Transact-SQL
--Sintaxe:  GO [contador]
--[contador]
--É um número inteiro positivo. O lote que precede GO será executado pelo número de vezes especificado.

--Exemplo 01:
drop table if exists tabela
CREATE TABLE tabela (
	codigo int
)
INSERT INTO tabela values (1000)
INSERT INTO tabela values (1000)
INSERT INTO tabela values (1000)
GO

select * from tabela

--Exemplo 02:
INSERT INTO tabela values (2000)
GO 3

--Atenção:
--Uma instrução Transact-SQL não pode ocupar a mesma linha que um comando GO.

--Exemplo 03:
--Vai executar com erro
INSERT INTO tabela values (1000) GO