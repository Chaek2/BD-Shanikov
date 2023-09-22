use [Restoran_DB]
go


select count(name) as "Колличество таблиц в БД" from sys.tables
go
select sys.tables.name as "Название таблицы", count(sys.columns.name) as "Кол-во столбцов" from sys.tables
inner join sys.columns on sys.columns.object_id = sys.tables.object_id
group by sys.tables.name
go
select count(name) as "Количество хранимых процедур" from sys.procedures
go
select count(name) as "Количестов представлений" from sys.views
go
select count(name) as "Количество функций" from sys.objects where type in ('FN', 'IF', 'TF')
go
select sys.tables.name as "Название таблицы", count(sys.triggers.name) as "Кол-во триггеров"  from sys.tables
inner join sys.triggers on sys.triggers.parent_id = sys.tables.object_id
group by sys.tables.name
go

drop database [Restoran_DB]
go