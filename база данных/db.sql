set ansi_nulls on
go
set ansi_padding on
go
set quoted_identifier on
go
create database [Practic_DB]
go
use [Practic_DB]
go

Set DATEFORMAT 'dmy'

--должность
create table [dbo].[Post]
(
	[ID_Post] [int] not null identity(1,1),
	[Title_Post] [varchar] (30) not null
	constraint [PK_Post] primary key clustered
	([ID_Post] ASC) on [PRIMARY],
	constraint [UQ_Title_Post] unique ([Title_Post])
)
go

CREATE PROCEDURE dbo.Post_Insert
  @Title varchar (30)
AS
BEGIN
  SET NOCOUNT ON;
  INSERT into [Post] (Title_Post) values (@Title)
END
GO

exec Post_Insert 'Директор'
exec Post_Insert 'Куратор'
exec Post_Insert 'Председатель'
exec Post_Insert 'Зам. Председатель'
exec Post_Insert 'Член палаты'
exec Post_Insert 'Резервист'
exec Post_Insert 'Претендент'
exec Post_Insert 'Активист'

--заявка
create table [dbo].[Application]
(
	[ID_Application] [int] not null identity(1,1),
	[Photo_Application] [varchar] (max) not null,
	[Name] [VARCHAR] (30) not null,
	[Surname] [VARCHAR] (30) not null,
	[Middle_Name] [VARCHAR] (30) not null,
	[Educational_Institution] [varchar] (100) not null,
	[Birthday] [date] not null
	constraint [PK_Application] primary key clustered
	([ID_Application] ASC) on [PRIMARY]	
)
go

CREATE PROCEDURE dbo.Application_Insert
  @Name varchar (30),
  @Surname varchar (30),
  @Middle_Name varchar (30),
  @Educational_Institution varchar (100),
  @Birthday  date
A
BEGIN
  SET NOCOUNT ON;
  INSERT into [Application] ([Application].Name, Surname, Middle_Name,Educational_Institution,Birthday) 
  values (@Name, @Surname, @Middle_Name, @Educational_Institution, @Birthday)
END
GO

exec Application_Insert 'Антон','Огурцов','Алексеевич','МПТ РЭУ им. Плеханова','06/06/2004'

--Волонтёр
create table [dbo].[Volunteer]
(
	[ID_Volunteer] [int] not null identity(1,1),
	[Post_ID] [int] not null,
	[Application_ID] [int] not null,
	[Login_Volunteer] [VARCHAR] (32) not null,
	[Password_Volunteer] [VARCHAR] (32) not null,
	[Points] [int] default (0)
	constraint [PK_Volunteer] primary key clustered
	([ID_Volunteer] ASC) on [PRIMARY],
	constraint [FK_Post_Volunteer] foreign key ([Post_ID]) references [dbo].[Post] ([ID_Post]),
	constraint [FK_Application_Volunteer] foreign key ([Application_ID]) references [dbo].[Application] ([ID_Application]),
	constraint [CH_Login_Volunteer] check (len([Login_Volunteer])>=4),
	constraint [CH_Password_Volunteer_Upper] check ([Password_Volunteer] like ('%[A-Z]%')),
	constraint [CH_Password_Volunteer_Letter_Lower] check ([Password_Volunteer] like ('%[a-z]%')),
	constraint [CH_Password_Volunteer_Symbols] check ([Password_Volunteer] like ('%[!@#$%^&*()_-]%')),
	constraint [UQ_Login_Volunteer_Volunteer] unique ([Login_Volunteer])
)
go

CREATE PROCEDURE dbo.Volunteer_Insert
  @Post_ID int,
  @Application_ID int,
  @Login_Volunteer [VARCHAR] (32),
  @Password_Volunteer [VARCHAR] (32)
AS
BEGIN
  SET NOCOUNT ON;
  INSERT into [Volunteer] (Post_ID, Application_ID, Login_Volunteer,Password_Volunteer) 
  values (@Post_ID, @Application_ID,@Login_Volunteer,@Password_Volunteer)
END
GO

exec Volunteer_Insert 4,1,'Toni1','Aa!'

--работник
create table [dbo].[Worker]
(
	[ID_Worker] [int] not null identity(1,1),
	[Photo_Worker] [varchar] (max) not null,
	[Name] [VARCHAR] (30) not null,
	[Surname] [VARCHAR] (30) not null,
	[Middle_Name] [VARCHAR] (30) not null,
	[Educational_Institution] [varchar] (100) not null,
	[Birthday] [date] not null,
	[Post_ID] [int] not null,
	[Login_Worker] [VARCHAR] (32) not null,
	[Password_Worker] [VARCHAR] (32) not null
	constraint [PK_Worker] primary key clustered
	([ID_Worker] ASC) on [PRIMARY],
	constraint [CH_Birthday_Worker] check ([Birthday] < Getdate()),
	constraint [FK_Post_Worker] foreign key ([Post_ID]) references [dbo].[Post] ([ID_Post]),
	constraint [CH_Login_Worker] check (len([Login_Worker])>=4),
	constraint [CH_Password_Worker_Upper] check ([Password_Worker] like ('%[A-Z]%')),
	constraint [CH_Password_Worker_Letter_Lower] check ([Password_Worker] like ('%[a-z]%')),
	constraint [CH_Password_Worker_Symbols] check ([Password_Worker] like ('%[!@#$%^&*()_-+]%')),
	constraint [UQ_Login_Worker_Worker] unique ([Login_Worker])
)
go

CREATE PROCEDURE dbo.Worker_Insert
  @Name varchar (30),
  @Surname varchar (30),
  @Middle_Name varchar (30),
  @Educational_Institution varchar (100),
  @Birthday  date,
  @Post_ID int,
  @Login_Volunteer [VARCHAR] (32),
  @Password_Volunteer [VARCHAR] (32)
AS
BEGIN
  SET NOCOUNT ON;
  INSERT into [Worker] ([Worker].Name, Surname, Middle_Name,Educational_Institution,Birthday,Post_ID,Login_Worker,Password_Worker) 
  values (@Name, @Surname, @Middle_Name, @Educational_Institution, @Birthday,@Post_ID,@Login_Volunteer,@Password_Volunteer)
END
GO

exec Worker_Insert 'Ксения','Синцова','Владимировна','МГТУ','11.03.1990',2,'UAO_C','Gu_'

--палата
create table [dbo].[Ward]
(
	[ID_Ward] [int] not null identity(1,1),
	[Title_Ward] [varchar] (30) not null
	constraint [PK_Ward] primary key clustered
	([ID_Ward] ASC) on [PRIMARY],
	constraint [UQ_Title_Ward] unique ([Title_Ward])
)
go

CREATE PROCEDURE dbo.Ward_Insert
  @Title varchar (30)
AS
BEGIN
  SET NOCOUNT ON;
  INSERT into [Ward] (Title_Ward) values (@Title)
END
GO

--округ
create table [dbo].[District]
(
	[ID_District] [int] not null identity(1,1),
	[Photo_District] [varchar] (max) not null,
	[Title_District] [varchar] (30) not null
	constraint [PK_District] primary key clustered
	([ID_District] ASC) on [PRIMARY],
	constraint [UQ_Title_District] unique ([Title_District])
)
go

CREATE PROCEDURE dbo.District_Insert
  @Title varchar (30)
AS
BEGIN
  SET NOCOUNT ON;
  INSERT into [District] (Title_District) values (@Title)
END
GO

exec District_Insert 'Центральный административный округ'
exec District_Insert 'Северный  административный округ'
exec District_Insert 'Северно-Восточный  административный округ'
exec District_Insert 'Восточный  административный округ'
exec District_Insert 'Юго-Восточный  административный округ'
exec District_Insert 'Южный  административный округ'
exec District_Insert 'Юго-западный  административный округ'
exec District_Insert 'Западный  административный округ'
exec District_Insert 'Северо-Западный  административный округ'
exec District_Insert 'Зеленоградский  административный округ'
exec District_Insert 'Троицкий и Новомосковский  административный округ'

--команда
create table [dbo].[Team]
(
	[ID_Team] [int] not null identity(1,1),
	[District_ID] [int] not null,
	[Ward_ID] [int] not null
	constraint [PK_Team] primary key clustered
	([ID_Team] ASC) on [PRIMARY],
	constraint [FK_Ward_Team] foreign key ([Ward_ID]) references [dbo].[Ward] ([ID_Ward]),
	constraint [FK_District_Team] foreign key ([District_ID]) references [dbo].[District] ([ID_District])
)
go

CREATE PROCEDURE dbo.Team_Insert
  @District_ID int,
  @Ward_ID int  
AS
BEGIN
  SET NOCOUNT ON;
  INSERT into [Team] (District_ID,Ward_ID) values (@District_ID,@Ward_ID)
END
GO

--парламентарии
create table [dbo].[Parlam]
(
	[ID_Parlam] [int] not null identity(1,1),
	[Ward_ID] [int],
	[Volunteer_ID] [int]
	constraint [PK_Parlam] primary key clustered
	([ID_Parlam] ASC) on [PRIMARY],
	constraint [FK_Ward_Parlam] foreign key ([Ward_ID]) references [dbo].[Ward] ([ID_Ward]),
	constraint [FK_Volunteer_Parlam] foreign key ([Volunteer_ID]) references [dbo].[Volunteer] ([ID_Volunteer])
)
go

CREATE PROCEDURE dbo.Parlam_Insert
  @Volunteer_ID int,
  @Ward_ID int  
AS
BEGIN
  SET NOCOUNT ON;
  INSERT into [Parlam] (Ward_ID,Volunteer_ID) values (@Ward_ID,@Volunteer_ID)
END
GO

--работа
create table [dbo].[Work]
(
	[ID_Work] [int] not null identity(1,1),
	[District_ID] [int] not null,
	[Worker_ID] [int] not null
	constraint [PK_Work] primary key clustered
	([ID_Work] ASC) on [PRIMARY],
	constraint [FK_District_Work] foreign key ([District_ID]) references [dbo].[District] ([ID_District]),
	constraint [FK_Worker_Work] foreign key ([Worker_ID]) references [dbo].[Worker] ([ID_Worker])
)
go

CREATE PROCEDURE dbo.Work_Insert
  @District_ID int,
  @Worker_ID int
AS
BEGIN
  SET NOCOUNT ON;
  INSERT into [Work] (District_ID,Worker_ID) values (@District_ID,@Worker_ID)
END
GO

--новости
create table [dbo].[News]
(
	[ID_News] [int] not null identity(1,1),
	[Title] [varchar] (max) not null,
	[Text_News] [text] not null,
	[Photo] [varchar] (max) not null
	constraint [PK_News] primary key clustered
	([ID_News] ASC) on [PRIMARY]
)
go

CREATE PROCEDURE dbo.News_Insert
  @Title varchar (max),
  @Text text,
  @Photo varchar (max)  
AS
BEGIN
  SET NOCOUNT ON;
  INSERT into [News] (Title,Text_News,Photo) values (@Title,@Text,@Photo)
END
GO

--Участники
create table [dbo].[Party]
(
	[ID_Party] [int] not null identity(1,1),
	[News_ID] [int] not null,
	[Volunteer_ID] [int] not null
	constraint [PK_Party] primary key clustered
	([ID_Party] ASC) on [PRIMARY],
	constraint [FK_News_Party] foreign key ([News_ID]) references [dbo].[News] ([ID_News]),
	constraint [FK_Volunteer_Party] foreign key ([Volunteer_ID]) references [dbo].[Volunteer] ([ID_Volunteer])
)
go

CREATE PROCEDURE dbo.Party_Insert
  @News_ID int,
  @Volunteer_ID int
AS
BEGIN
  SET NOCOUNT ON;
  INSERT into [Party] (News_ID,Volunteer_ID) values (@News_ID,@Volunteer_ID)
END
GO

--проект
create table [dbo].[Project]
(
	[ID_Project] [int] not null identity(1,1),
	[Title_Project] [varchar] (max) not null,
	[Text_Project] [text] not null,
	[Photo] [varchar] (max) not null
	constraint [PK_Project] primary key clustered
	([ID_Project] ASC) on [PRIMARY]
)
go

CREATE PROCEDURE dbo.Project_Insert
  @Title varchar (max),
  @Text text,
  @Photo varchar (max)  
AS
BEGIN
  SET NOCOUNT ON;
  INSERT into [Project] (Title,Text_Project,Photo) values (@Title,@Text,@Photo)
END
GO

select * from [Post] order by [ID_Post];
select * from [Application];
select * from [Volunteer];
select * from [Worker];
select * from [Ward];
select * from [District];
select * from [Team];
