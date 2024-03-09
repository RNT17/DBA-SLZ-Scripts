/*
                
                Bem vindos ao DBA-SLZ
                
                Brincando com Datas

                Programando em T-SQL

                ^_^

*/

declare @date date = '2024-01-01'
declare @dateTime datetime = '2024-01-01 23:59'

select @date as date, @dateTime as datetime

-- Fun��es uteis
select getdate() as getdate

select DATEADD(day,1, getdate()) as adddays -- year, month, week, day, hour, minute, second, millisecond

select DATEFROMPARTS(2024,1,30) as datefromparts

select datediff(day, '2023-01-01', '2024-01-01') as [Diferen�a em dias] -- second, minute, day, week, month, year

select datepart(year, '2024-12-01 23:58:21') as datepart

-- Manipula��es de datas uteis
select DATEADD(month,DATEDIFF(month,0,getdate()),0) as [first day (datetime) of actual month]

select convert(date,DATEADD(month,datediff(month,0,getdate()),0)) as [first day (date) of actual month]

select DATEADD(MILLISECOND, -3, DATEADD(month, 1, convert(datetime, DateAdd(mm, DateDiff(mm,0,getdate()), 0)))) as [last day (datetime) of actual month]

select DATEADD(month,-1,convert(date, DateAdd(mm, DateDiff(mm,0,dateadd(day,-1,getdate())), 0))) as [first day (date) of past month]

select DATEADD(MILLISECOND, -3, DATEADD(MONTH, DATEDIFF(MONTH, 0, getdate()), 0)) as [last day (datetime) of past month]

-- Formatar datas no sql
-- Cr�ditos: DBA-PRO
select
    getdate() padrao_internacional,
    -- Ano com 2 digitos
    convert(varchar, getdate(),   0) ' 0: mmm dd aaaa hh:mm XX',
    convert(varchar, getdate(),   1) ' 1: mm/dd/aa',
    convert(varchar, getdate(),   2) ' 2: aa.mm.dd',
    convert(varchar, getdate(),   3) ' 3: dd/mm/aa - Brasil 2 dig',
    convert(varchar, getdate(),   4) ' 4: dd.mm.aa',
    convert(varchar, getdate(),   5) ' 5: dd-mm-aa',
    convert(varchar, getdate(),   6) ' 6: dd mmm aa',
    convert(varchar, getdate(),   7) ' 7: mmm dd, aa',
    convert(varchar, getdate(),   8) ' 8: hh:mm:ss',
    convert(varchar, getdate(),   9) ' 9: mmm dd aaaa hh:mm:ss:mi XX',
    convert(varchar, getdate(),  10) '10: mm-dd-aa',
    convert(varchar, getdate(),  11) '11: aa/mm/dd',
    convert(varchar, getdate(),  12) '12: aammdd',
    convert(varchar, getdate(),  13) '13: dd mmm aaaa hh:mm:ss:mi',
    convert(varchar, getdate(),  14) '14: hh:mm:ss:mi',
    -- Ano com 4 digitos
    convert(varchar, getdate(), 100) '100 = 0',
    convert(varchar, getdate(), 101) '101: dd-mm-aaaa',
    convert(varchar, getdate(), 102) '102: aaa.mm.dd',
    convert(varchar, getdate(), 103) '103: dd/mm/aaaa - Brasil 4 dig',
    convert(varchar, getdate(), 104) '104: dd.mm.aaaa',
    convert(varchar, getdate(), 105) '105: dd-mm-aaaa',
    convert(varchar, getdate(), 106) '106: dd mmm aaaa',
    convert(varchar, getdate(), 107) '107: mmm dd, aaaa',
    convert(varchar, getdate(), 108) '108: hh:mm:ss',
    convert(varchar, getdate(), 109) '109 = 09',
    convert(varchar, getdate(), 110) '110: mm-dd-aaaa',
    convert(varchar, getdate(), 111) '111: aaaa-mm-dd',
    convert(varchar, getdate(), 112) '112: aaaammdd',
    convert(varchar, getdate(), 113) '113 = 13',
    convert(varchar, getdate(), 114) '114 = 14'

-- Personalizando o formato: SQL2012+ (Format: https://docs.microsoft.com/en-us/sql/t-sql/functions/format-transact-sql)
select
    getdate() getdate_padrao,
    format (getdate(), 'd', 'pt-br') getdate_BR_1,
    format (getdate(), 'd', 'en-us') getdate_US_1,
    format (getdate(), 'D', 'pt-br') getdate_BR_2,
    format (getdate(), 'D', 'en-us') getdate_US_2,
    format (getdate(), 'dd-MM-yy') getdate_custom_1,
    format (getdate(), 'dd/MM/yyyy | HH:mm:ss') getdate_custom_2 -- HH = hora 24 horas; hh = hora 12 horas
 
 -- Personalizando o formato: SQL2012- (o c�u � o limite, aqui v�o 3 exemplos)
select
    replace(convert(varchar, getdate(),   3), '/', '#') 'Modo 3 substituindo / por #',
    convert(varchar, month(getdate())) + '/' + convert(varchar, year(getdate())) 'mes/ano',
    cast(datepart(hour, getdate()) as varchar) + ' horas ' + cast(datepart(minute, getdate()) as varchar) + ' minutos' 'hh horas mm minutos'
