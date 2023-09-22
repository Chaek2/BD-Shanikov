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

-----------------------------------------------------------------------
create table [dbo].[Dish]
(
	[ID_Dish] [int] not null identity(1,1),
	[Volume] [varchar] (25) not null,
	[Shelf_Life] [int] not null
	constraint [PK_ Dish] primary key clustered
    ([ID_Dish] ASC) on [PRIMARY]
)
go
insert into [dbo].[Dish]
values ('мясо',2),
('крыса',2),
('Свинина',3)
go
----------------------------------------------------------------------
create table [dbo].[Post]
(
	[ID_Post] [int] not null identity(1,1),
	[Title] [varchar] (32) not null
	constraint [PK_Post] primary key clustered
	([ID_Post] ASC) on [PRIMARY]--,
	--constraint [CH_Title] check ([Title] in ('Админ','Менеджер по бронированию'))
)
go
--------------------------------------------------------------------------
create table [dbo].[Cheque]
(
	[ID_Cheque] [int] not null identity(1,1),
	[Date_Cheque] [date] null default (format(Getdate(),'dd.MM.yyyy')),
	[Time_Cheque] [time] null default (format(Getdate(),'hh:mm:ss'))
	constraint [PK_ Cheque] primary key clustered
	([ID_Cheque] ASC) on [PRIMARY]
)
go
---------------------------------------------------------------------------
create table [dbo].[Client]
(
	[ID_Client] [int] not null identity(1,1),
	[Series] [int] not null,
	[Number] [int] not null,
	[Name] [varchar] (30) not null,
	[Surname] [varchar] (30) not null,
	[Patronymic] [varchar] (30) null default '-',
	[Date_Of_Receipt] [date] default (format(Getdate(),'dd.MM.yyyy')),
	[Division_Code] [varchar] (7) not null,--
	[Birth_Date] [date] default (format(Getdate(),'dd.MM.yyyy')),
	[Passport_Issued] [varchar] (max) not null,
	[Registration_Address] [varchar] (max) not null,
	[Bank_Card_Number] [bigint] not null,
    [Payment_System] [varchar]  (50) not null,
	[Valid_Until] [varchar]  (5) not null,
	[Owner] [varchar] (max) not null,
	[CVC] [int] not null,
	[Login] [varchar] (32) not null,
	[Password] [varchar] (32) not null,
	[Personal_Data_ID] [int] not null
	constraint [PK_Client] primary key clustered
	([ID_Client] ASC) on [PRIMARY],
	constraint [UQ_Login1] unique ([Login]),
	constraint [FK_Personal_Data] foreign key ([Personal_Data_ID])
	references [dbo].[Personal_Data] ([ID_Personal_Data]),
	constraint [CH_Login1] check ([Login] like '%[a-zA-Z0-9]%' and [Login] like '%[!@#$%^&*()_]%' and (len([Login])>=8)),
	constraint [CH_Password1] check ([Password] like '%[a-zA-Z0-9]%' and [Password] like '%[!@#$%^&*()]%'),
	constraint [CH_Password_Login] check ([Login] <> [Password]),
	constraint [UQ_Series_Number] unique ([Number], [Series]),
	constraint [UQ_Bank_Card_Number] unique ([Bank_Card_Number]),
	constraint [CH_CVC] check ([CVC] like '[0-9][0-9][0-9]'),
	constraint [CH_Series] check ([Series] like '[0-9][0-9][0-9][0-9]'),
	constraint [CH_Number] check ([Number] like '[0-9][0-9][0-9][0-9][0-9][0-9]'),
	constraint [CH_Bank_Card_Number] check ([Bank_Card_Number] like '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'),
	constraint [CH_Valid_Until] check ([Valid_Until] like '[0-1][0-9][/][0-9][0-9]'),
	constraint [CH_Division_Code] check ([Division_Code] like '[0-9][0-9][0-9][-][0-9][0-9][0-9]')
)
go
insert into [dbo].[Client] ([Login], [Password], [Personal_Data_ID])
values ('LOGIN_777_', 'Pa$$Word','1')
go
-----------------------------------------------------------------------------
create table [dbo].[Menu]
(
	[ID_Menu] [int] not null identity(1,1),
	[Dish_ID] [int] not null
	constraint [PK_Menu] primary key clustered
	([ID_Menu] ASC) on [PRIMARY],
	constraint [FK_Dish] foreign key ([Dish_ID])
	references [dbo].[Dish] ([ID_Dish])
)
go
----------------------------------------
create table [dbo].[Application]
(
	[ID_Application] [int] not null identity(1,1),
	[Value] [varchar] (25) not null
	constraint [PK_Application] primary key clustered
	([ID_Application] ASC) on [PRIMARY]
)
go
------------------------------------------------------------------------
create table [dbo].[Reservation]
(
	[ID_Reservation] [int] not null identity(1,1),
	[Date_Reservation] [date] default (format(Getdate(),'dd.MM.yyyy')),
	[Time_Reservation] [time] default (format(Getdate(),'hh:mm:ss')),
	[Application_ID] [int] not null,
	[Menu_ID] [int] null default '-',
	[Client_ID] [int] not null,
	[Recreation_area_ID] [int] not null,
	[Visitors_ID] [int] null default '-'
	constraint [PK_Reservation] primary key clustered
	([ID_Reservation] ASC) on [PRIMARY],
	constraint [FK_Menu] foreign key ([Menu_ID])
	references [dbo].[Menu] ([ID_Menu]),
	constraint [FK_Client] foreign key ([Client_ID])
	references [dbo].[Client] ([ID_Client]),
	constraint [FK_Recreation_area] foreign key ([Recreation_area_ID])
	references [dbo].[Recreation_area] ([ID_Recreation_area]),
	constraint [FK_Visitors] foreign key ([Visitors_ID])
	references [dbo].[Visitors] ([ID_Visitors]),
	constraint [FK_Application] foreign key ([Application_ID])
	references [dbo].[Application] ([ID_Application])
)
go
--------------------------------------------------------------------------
create table [dbo].[Employee]
(
	[ID_Employee] [int] not null identity(1,1),
	[Login] [varchar] (32) not null,
	[Password] [varchar] (32) not null,
	constraint [PK_Employee] primary key clustered
	([ID_Employee] ASC) on [PRIMARY]
)
go