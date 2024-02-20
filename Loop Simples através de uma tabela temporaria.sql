/*
                
                Bem vindos ao DBA-SLZ
                
                2 - Loop Simples através de uma tabela temporaria

                Programando em T-SQL

                ^_^

*/

drop table if exists #filiais
create table #filiais (
	codigo int,
	descricao varchar(100)
);

insert into #filiais
select 1, 'filial 01' union
select 2, 'filial 02' union
select 3, 'filial 03' union
select 4, 'filial 04' union
select 5, 'filial 05' 

select * from #filiais
set nocount on

while (select count(1) from #filiais) > 0
begin
	declare @filial int;
	select top 1 @filial = codigo from #filiais order by codigo
	
	print @filial

	delete from #filiais where codigo = @filial
end
