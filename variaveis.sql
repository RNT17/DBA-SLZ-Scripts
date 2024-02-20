/*
                
                Bem vindos ao DBA-SLZ
                
                Variáveis

                Programando em T-SQL

                ^_^

*/


--Sintaxe:
--declaração
DECLARE @variavel data-type
--Atribuição
SET @variavel='valor'
--Retornar valor
SELECT @variavel


--Exemplo
DECLARE @CanalYoutube varchar(20)
SET @CanalYoutube = 'DBA-SLZ'
SELECT @CanalYoutube 

--Dica: 
--Quando uma variável é primeiramente declarada, seu valor é definido como NULL.
--Para atribuir um valor à uma variável, use a instrução SET.

--Exemplo 2
drop table if exists #data 
create table #data (
	dt date
)
insert into #data values ('2020-01-01'), ('2021-01-01'), ('2022-01-01'), ('2023-01-01'), ('2024-01-01')

select * from #data

-- Consultando usando variável
DECLARE @data date = '2024-01-01'
select * from #data where dt = @data

-- Outra forma de atribuição. Aqui é consultado o valor dt da tabela #data e ao mesmo tempo 
-- atribuido esse valor na varável @data. Por fim, selecionamos o valor no select final.
select top 1 @data = dt from #data
select @data

