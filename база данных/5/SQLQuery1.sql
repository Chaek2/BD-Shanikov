set ansi_nulls on
go
set ansi_padding on
go
set quoted_identifier on
go
create database [Restoran_Database]
go
use [Restoran_Database]
go

create database [Restoran_prosedure]
go



create table [dbo].[Recreation_area]
(
	[ID_Recreation_area] [int] not null identity(1,1),
	[Area_Type] [varchar] (25)not null
	constraint [PK_Recreation_area] primary key clustered
	([ID_Recreation_area] ASC) on [PRIMARY]
)
go
insert into [dbo].[Recreation_area] ([Area_Type])
values  ('группы больше 5-и человек'), ('общая'),('игровая')
go