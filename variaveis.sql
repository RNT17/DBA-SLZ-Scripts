/*
                
                Bem vindos ao DBA-SLZ
                
                Vari�veis

                Programando em T-SQL

                ^_^

*/


--Sintaxe:
--declara��o
DECLARE @variavel data-type
--Atribui��o
SET @variavel='valor'
--Retornar valor
SELECT @variavel


--Exemplo
DECLARE @CanalYoutube varchar(20)
SET @CanalYoutube = 'DBA-SLZ'
SELECT @CanalYoutube 

--Dica: 
--Quando uma vari�vel � primeiramente declarada, seu valor � definido como NULL.
--Para atribuir um valor � uma vari�vel, use a instru��o SET.

--Exemplo 2
drop table if exists #data 
create table #data (
	dt date
)
insert into #data values ('2020-01-01'), ('2021-01-01'), ('2022-01-01'), ('2023-01-01'), ('2024-01-01')

select * from #data

--fazer na hora de gravar 
--DECLARE @data date = '2024-01-01'
--select * from #data where dt = @data

--fazer na hora de gravar 
-- Outra forma de atribui��o
--select @data = dt from #data
--select @data