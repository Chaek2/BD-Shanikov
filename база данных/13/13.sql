use [Restoran_DB]
go


select count(name) as "����������� ������ � ��" from sys.tables
go
select sys.tables.name as "�������� �������", count(sys.columns.name) as "���-�� ��������" from sys.tables
inner join sys.columns on sys.columns.object_id = sys.tables.object_id
group by sys.tables.name
go
select count(name) as "���������� �������� ��������" from sys.procedures
go
select count(name) as "���������� �������������" from sys.views
go
select count(name) as "���������� �������" from sys.objects where type in ('FN', 'IF', 'TF')
go
select sys.tables.name as "�������� �������", count(sys.triggers.name) as "���-�� ���������"  from sys.tables
inner join sys.triggers on sys.triggers.parent_id = sys.tables.object_id
group by sys.tables.name
go

drop database [Restoran_DB]
go