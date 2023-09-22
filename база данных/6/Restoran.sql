set ansi_nulls on
go
set ansi_padding on
go
set quoted_identifier on
go
create database [Restoran_DB]
go
use [Restoran_DB]
go

create table [dbo].[Type_Client]
(
	[ID_Type_Client] [int] not null identity(1,1),
	[Value_Type_Client] [varchar] (10) not null
	constraint [PK_Type_Client] primary key clustered
	([ID_Type_Client] ASC) on [PRIMARY],
	constraint [UQ_Value_Type_Client_Type_Client] unique ([Value_Type_Client])
)
go

insert into [dbo].[Type_Client] ([Value_Type_Client])
values ('Взрослый'),
('Ребёнок')
go

update [dbo].[Type_Client] set
	[Value_Type_Client] = 'Подросток'
		where
		[ID_Type_Client] = 2;
		go

delete from [dbo].[Type_Client]
	where [ID_Type_Client] = 1
	go


select [Value_Type_Client] as "Название типа клиента" from [dbo].[Type_Client]
order by [Value_Type_Client] ASC
--------------------------------------------------------------------------------------------------------------
create table [dbo].[Post]
(
	[ID_Post] [int] not null identity(1,1),
	[Title_Post] [varchar] (32) not null
	constraint [PK_Post] primary key clustered
	([ID_Post] ASC) on [PRIMARY],
	constraint [UQ_Title_Post_Post] unique ([Title_Post])
)
go

insert into [dbo].[Post] ([Title_Post])
values ('Официант'),
('Менеджер по поставкам'),
('Менеджер по бронированию'),
('Повар')
go

update [dbo].[Post] set
	[Title_Post] = 'Директор'
		where
		[ID_Post] = 4;
		go

delete from [dbo].[Post]
	where [ID_Post] = 1
	go

select [Title_Post] as "Название должности" from [dbo].[Post]
order by [Title_Post] ASC

--------------------------------------------------------------------------------------------------------------
create table [dbo].[Menu]
(
	[ID_Menu] [int] not null identity(1,1),
	[Value_Menu] [varchar] (max) not null
	constraint [PK_Menu] primary key clustered
	([ID_Menu] ASC) on [PRIMARY]	
)
go

insert into [dbo].[Menu] ([Value_Menu])
values ('Крабовый салат'),
('Морской бриз'),
('Красное море')
go

update [dbo].[Menu] set
	[Value_Menu] = 'Крабовый остров'
		where
		[ID_Menu] = 1;
		go

delete from [dbo].[Menu]
	where [ID_Menu] = 1
	go

select [Value_Menu] as "Название блюд меню" from [dbo].[Menu]
order by [Value_Menu] ASC

select [Value_Menu] as "Название блюд меню" from [dbo].[Menu]
where [ID_Menu] in (2,3)
order by [Value_Menu] ASC

--------------------------------------------------------------------------------------------------------------
create table [dbo].[Component]
(
	[ID_Component] [int] not null identity(1,1),
	[Structure_Component] [varchar] (32) not null,
	[Volume_Component] [int] not null
	constraint [PK_Component] primary key clustered
	([ID_Component] ASC) on [PRIMARY],
	constraint [UQ_Structure_Component_Component] unique ([Structure_Component]),
	constraint [CH_Volume_Component_Component] check ([Volume_Component] > 0)
)
go

insert into [dbo].[Component] ([Structure_Component], [Volume_Component])
values ('Крабовые палочки', 1),
('Кукуруза', 1),
('Яйцо', 1),
('Лук', 1),
('Зелень', 2),
('Рис', 1)
go

update [dbo].[Component] set
	[Volume_Component] = 2
		where
		[ID_Component] = 1;
		go

delete from [dbo].[Component]
	where [ID_Component] = 1
	go

select [Structure_Component] as "Название ингредиента", [Volume_Component] as "Количество ингредиента " from [dbo].[Component]
order by [Structure_Component] ASC

alter table [dbo].[Component] drop constraint [CH_Volume_Component_Component]
go
alter table [dbo].[Component] alter column  [Structure_Component] [varchar] (32) not null
go

--------------------------------------------------------------------------------------------------------------
create table [dbo].[Supply]
(
	[ID_Supply] [int] not null identity(1,1),
	[Adress_Supply] [varchar] (max) not null
	constraint [PK_Supply] primary key clustered
	([ID_Supply] ASC) on [PRIMARY]
)
go

insert into [dbo].[Supply] ([Adress_Supply])
values ('Россия, г. Москва, 125310, Пятницкое шоссе, д.42, стр 7.')
go

update [dbo].[Supply] set
	[Adress_Supply] = 'Россия, г. Москва, 125310, Пятницкое шоссе, д.2, стр 1.'
		where
		[ID_Supply] = 1;
		go

delete from [dbo].[Supply]
	where [ID_Supply] = 1
	go

select [Adress_Supply] as "Адрес" from [dbo].[Supply]
order by [Adress_Supply] ASC

select [Adress_Supply] as "Адрес" from [dbo].[Supply]
where [ID_Supply] in (1)
order by [Adress_Supply] ASC

--------------------------------------------------------------------------------------------------------------
create table [dbo].[Raw]
(
	[ID_Raw] [int] not null identity(1,1),
	[Component_Raw] [varchar] (32) not null,
	[Volume_Raw] [int] not null
	constraint [PK_Raw] primary key clustered
	([ID_Raw] ASC) on [PRIMARY],
	constraint [UQ_Component_Raw_Raw] unique ([Component_Raw]),
	constraint [CH_Volume_Raw_Raw] check ([Volume_Raw] > 0)
)
go

insert into [dbo].[Raw] ([Component_Raw], [Volume_Raw])
values ('Крабовые палочки', 1),
('Кукуруза', 1),
('Яйцо', 1),
('Лук', 1),
('Зелень', 1),
('Рис', 1)
go


select [Component_Raw] as "Название сырья", [Volume_Raw] as "Количество сырья" from [dbo].[Raw]
order by [Component_Raw] ASC

alter table [dbo].[Raw] drop constraint [CH_Volume_Raw_Raw]
go
alter table [dbo].[Raw] alter column  [Component_Raw] [varchar] (32) not null
go
--------------------------------------------------------------------------------------------------------------
create table [dbo].[Material]
(
	[ID_Material] [int] not null identity(1,1),
	[Component_Material] [varchar] (32) not null,
	[Volume_Material] [int] not null
	constraint [PK_Material] primary key clustered
	([ID_Material] ASC) on [PRIMARY],
	constraint [UQ_Component_Material_Material] unique ([Component_Material]),
	constraint [CH_Volume_Material_Material] check ([Volume_Material] > 0)
)
go

insert into [dbo].[Material] ([Component_Material], [Volume_Material])
values ('яйцо',	28),
('лук',	35),
('зелень',	50),
('Крабовые палочки',	33),
('Кукуруза',	40),
('Рис',	14)
go

select [Component_Material] as "Название материала", [Volume_Material] as "Количество материала" from [dbo].[Material]
order by [Component_Material] ASC

alter table [dbo].[Material] drop constraint [CH_Volume_Material_Material]
go
alter table [dbo].[Material] alter column  [Component_Material] [varchar] (32) not null
go
--------------------------------------------------------------------------------------------------------------
create table [dbo].[Application]
(
	[ID_Application] [int] not null identity(1,1),
	[Title_Application] [varchar] (25) not null
	constraint [PK_Application] primary key clustered
	([ID_Application] ASC) on [PRIMARY],
	constraint [UQ_Title_Application_Application] unique ([Title_Application])
)
go

insert into [dbo].[Application] ([Title_Application])
values ('готовы к приёму'),
('Обработка'),
('Отказано(нехватка мест)')
go

select [Title_Application] as "Название заявки" from [dbo].[Application]
order by [Title_Application] ASC
--------------------------------------------------------------------------------------------------------------
create table [dbo].[Employee]
(
	[ID_Employee] [int] not null identity(1,1),
	[Login_Employee] [varchar] (32) not null,
	[Password_Employee] [varchar] (32) not null
	constraint [PK_Employee] primary key clustered
	([ID_Employee] ASC) on [PRIMARY],
	constraint [UQ_Login_Employee_Employee] unique ([Login_Employee]),
	constraint [CH_Login_Employee_Employee] check (len([Login_Employee])>=8),
	constraint [CH_Password_Employee_Employee_Upper] check ([Password_Employee] like ('%[A-Z]%')),
	constraint [CH_Password_Employee_Employee_Letter_Lower] check ([Password_Employee] like ('%[a-z]%')),
	constraint [CH_Password_Employee_Employee_Symbols] check ([Password_Employee] like ('%[!@#$%^&*()]%'))
)
go

insert into [dbo].[Employee] ([Login_Employee], [Password_Employee])
values ('p.komissarov','YqMa%&4z'),
('Ndolpha5','#hIct)R1'),
('Comforev1','#hIct)R1'),
('StiffAnt727','2s50h&)R'),
('QuietPot821','#p0j(9ta')
go

select [Login_Employee] as "Логин", [Password_Employee] as "Пароль" from [dbo].[Employee]
order by [Login_Employee] ASC

alter table [dbo].[Employee] drop constraint [CH_Login_Employee_Employee]
go
alter table [dbo].[Employee] drop constraint [CH_Password_Employee_Employee_Upper]
go
alter table [dbo].[Employee] drop constraint [CH_Password_Employee_Employee_Letter_Lower]
go
alter table [dbo].[Employee] drop constraint [CH_Password_Employee_Employee_Symbols]
go
--------------------------------------------------------------------------------------------------------------
create table [dbo].[Staff]
(
	[ID_Staff] [int] not null identity(1,1),
	[Name_Staff] [varchar] (30) not null,
	[Surname_Staff] [varchar] (30) not null,
	[Middle_Name_Staff] [varchar] (30) not null
	constraint [PK_Staff] primary key clustered
	([ID_Staff] ASC) on [PRIMARY]
)
go

insert into [dbo].[Staff] ([Surname_Staff],[Name_Staff],[Middle_Name_Staff])
values ('Комиссаров','Павел','Георгиевич'),
('Завражин','Петр','Геннадьевич'),
('Булкин','Лев','Ильич'),
('Шуста','Алена','Валерьевна'),
('Макеева','Василиса','Артемова')
go

select [Name_Staff] as "Имя сотрудника", [Surname_Staff] as "Фамилия сотрудника",[Middle_Name_Staff]  as "Отчество сотрудника" from [dbo].[Staff]
order by [Surname_Staff] ASC

--------------------------------------------------------------------------------------------------------------
create table [dbo].[Rest_Area]
(
	[ID_Rest_Area] [int] not null identity(1,1),
	[Area] [varchar] (30) not null
	constraint [PK_Rest_Area] primary key clustered
	([ID_Rest_Area] ASC) on [PRIMARY],
	constraint [UQ_Area_Rest_Area] unique ([Area])
)
go


insert into [dbo].[Rest_Area] ([Area])
values ('общая'),
('группа больше 5 человек'),
('игровая')
go

select [Area] as "Название зоны" from [dbo].[Rest_Area]
order by [Area] ASC
--------------------------------------------------------------------------------------------------------------
create table [dbo].[Supplier_Company]
(
	[ID_Supplier_Company] [int] not null identity(1,1),
	[Full_Organization] [varchar] (32) not null,
	[Short_Organization] [varchar] (32) not null,
	[Legal_Address] [varchar] (max) not null,
	[Physical_Address] [varchar] (max) not null,
	[ITN] [varchar] (12) not null,
	[OKPO] [varchar] (8) not null,
	[BIC] [varchar] (9) not null
	constraint [PK_Supplier_Company] primary key clustered
	([ID_Supplier_Company] ASC) on [PRIMARY],
	constraint [UQ_Full_Organization_Supplier_Company] unique ([Full_Organization]),
	constraint [CH_ITN_Supplier_Company] check ([ITN] like ('[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]')),
	constraint [CH_OKPO_Supplier_Company] check ([OKPO] like ('[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]')),
	constraint [CH_BIC_Supplier_Company] check ([BIC] like ('[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'))	
)
go

alter table [dbo].[Supplier_Company] drop constraint [CH_ITN_Supplier_Company]
go
alter table [dbo].[Supplier_Company] drop constraint [CH_OKPO_Supplier_Company]
go
alter table [dbo].[Supplier_Company] drop constraint [CH_BIC_Supplier_Company]
go


insert into [dbo].[Supplier_Company] ([Full_Organization], [Short_Organization],[Legal_Address], [Physical_Address], [ITN], [OKPO], [BIC])
values 
('OOO "ТриумфДоставка"','OOO "ТД"','Россия, г. Березники, Заречная ул., 6','Россия, г. Березники, Заречная ул., 7 ','452161702254','50235599','044525593'),
('OOO "ДосПром"','OOO "ДПром"','Россия,Пензенская область, город Павловский Посад, пр. Будапештсткая, 37','Россия,Пензенская область, город Павловский Посад, пр. Будапештсткая, 38','421026160452','23250426','042202824'),
('OOO "Ума"','OOO "Ума"','Россия,Ростовская область, город Раменское, бульвар Славы, 73','Россия,Ростовская область, город Раменское, бульвар Славы, 74','796312897305','58235135','043002801'),
('OOO "ГосГамма"','OOO "ГосГа"','Россия, Липецкая область, город Истра, ул. Гоголя, 01','Россия, Липецкая область, город Истра, ул. Гоголя, 01','248343582663','36977048','044525659'),
('OOO "ПриорететДо"','OOO "ПДо"','Россия,Тульская область, город Сергиев Посад, въезд Ленина, 59','Россия,Тульская область, город Сергиев Посад, въезд Ленина, 60','466777158677','49026771','040349536')
go


select [Full_Organization] as "Полное название огранизации", [Short_Organization] as "Сокращённое название организации",[Legal_Address] as "Юридический адрес", [Physical_Address] as "Физический адрес", [ITN] as "ИНН", [OKPO] as "ОКПО", [BIC] as "БИК" from [dbo].[Supplier_Company]
order by [Full_Organization] ASC

-------------------------------------------------------------------------------

create table [dbo].[Client]
(
	[ID_Client] [int] not null identity(1,1),
	[Type_Client_ID]	[INT] not null,
	[Name]	[VARCHAR] (30) not null,
	[Surname]	[VARCHAR] (30) not null,
	[Middle_Name]	[VARCHAR] (30) not null,
	[Seria] [VARCHAR] (4) not null,
	[Nomber]	[VARCHAR] (6) not null,
	[Date_Of_Receipt]	[DATE] not null,
	[Division_Code]	[VARCHAR] (7) not null,
	[Birthday]	[DATE] not null,
	[Issued]	[VARCHAR] (MAX) not null,
	[Address_Registrion]	[VARCHAR] (MAX) not null,
	[Number_Bank]	[VARCHAR] (16) not null,
	[Payment]	[VARCHAR] (30) not null,
	[Valid_Until]	[VARCHAR] (5) not null,
	[Owner]	[VARCHAR] (MAX) not null,
	[CVC]	[VARCHAR] (3) not null,
	[Login]	[VARCHAR] (32) not null,
	[Password]	[VARCHAR] (32) not null
	constraint [PK_Client] primary key clustered
	([ID_Client] ASC) on [PRIMARY],
	constraint [UQ_Login_Client] unique ([Login]),
	constraint [UQ_Number_Bank_Client] unique ([Number_Bank]),
	constraint [CH_Valid_Until_Client] check ([Valid_Until] like '[0-9][0-9][/][0-9][0-9]'),
	constraint [CH_Login_Client] check (len([Login])>=8),
	constraint [CH_Password_Client_Upper] check ([Password] like ('%[A-Z]%')),
	constraint [CH_Password_Client_Letter_Lower] check ([Password] like ('%[a-z]%')),
	constraint [CH_Password_Client_Symbols] check ([Password] like ('%[!@#$%^&*()_-]%')),
	constraint [CH_CVC_Client_INT] check ([CVC] like '[0-9][0-9][0-9]'),
	constraint [CH_Number_Bank_Client_INT] check ([Number_Bank] like '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'),	
	constraint [CH_Seria_Client_INT] check ([Seria] like '[0-9][0-9][0-9][0-9]'),
	constraint [CH_Division_Code_Client] check ([Division_Code] like '[0-9][0-9][0-9][-][0-9][0-9][0-9]'),
	constraint [CH_Nomber_Client_INT] check ([Nomber] like '[0-9][0-9][0-9][0-9][0-9][0-9]'),
	constraint [FK_Type_Client] foreign key ([Type_Client_ID]) references [dbo].[Type_Client] ([ID_Type_Client]),
	constraint [UQ_Seria_Nomber_Client] unique ([Nomber], [Seria]),
	constraint [CH_Birthday_Client] check ([Birthday] < Getdate())	
)
go

insert into [dbo].[Client] ([Type_Client_ID], [Surname], [Name], [Middle_Name], [Login], [Password], [Seria], [Nomber], [Date_Of_Receipt], [Division_Code], [Birthday], [Issued],	[Address_Registrion], [Number_Bank], [Payment], [Valid_Until], [Owner], [CVC])
values (1,'Терентьева','Галина','Ефимовна','Beccalh2_','1he0-K@wd','4166','887678','10.05.2012','170-222','14.10.1975','Управление внутренних дел по г. Курск','Россия, г. Курск, Мира ул., д. 2 кв.27 ','4781179786814920','VISA','11/23','Terenteva Galina Efimova','746'),
(1,'Былинкин','Виктор','Петрович','53Josiah_','kPkvF#8-H','4610','557837','09.07.2014','340-696',' 16.03.1960','Отделом УФМС России по г. Пенза','Россия, г. Пенза, Пролетарская ул., д. 13 кв.51','5733910345157100','MasterCard','06/24','Bylikin Viktor Petrovich','614'),
(1,'Путинова','Виктория','Максимовна','Law23sonor','_%g5arFhb','4287','490653','28.10.2014','110-778','15.07.1980','ОУФМС России по г. Черкесск','Россия, г. Черкесск, Березовая ул., д. 23 кв.49 ','4696119769814000','Visa','01/25','Putinova Viktoriya Maksimovna','173'),
(1,'Яковлев','Степан','Маркович','Ckinea_do1','_y8QN^r3l','4221','397174','05.12.2018','590-630','18.12.1967','Управление внутренних дел по г. Елец','Россия, г. Елец, Дорожная ул., д. 6 кв.5','5189248725374620','MasterCard','12/22','Ikavlev Stepan Markovich','150'),
(1,'Ящук','Александр','Артёмович','Zo_2dysius4','9Ok*uy3E-_k','4218','938046','01.07.2022','890-739','20.03.1980','Отделением УФМС России по г. Кызыл','Россия, г. Кызыл, 17 Сентября ул., д. 16 кв.177','4199134247651410','VISA','03/23','Iashchuk Aleksandr Artemovich','327')
go


select [Type_Client_ID] as "тип клиента", [Surname] as "Фамилия", [Name] as "Имя", [Middle_Name] as "Отчество", [Login] as "Логин", 
[Password] as "Пароль", [Seria] as "Серия", [Nomber] as "Номер", [Date_Of_Receipt] as "Дата выдачи паспорта", [Division_Code] as "Код подразделения", [Birthday]as "День рождения", 
[Issued]as "CVC",	[Address_Registrion] as "Адрес регистрации", [Number_Bank] as "Номер банковской карты", [Payment] as "Платёжная система", [Valid_Until] as "Срок карты", [Owner] as "Владелец", 
[CVC] as "CVC" from [dbo].[Client]
order by [Surname] ASC

-----------------------------------------------------------------------------------------------------------------

create table [dbo].[Dish]
(
	[ID_Dish] [int] not null identity(1,1),
	[Component_ID] [int] not null,
	[Menu_ID] [int] not null,
	[Shelf_Life] [int]  not null,
	[Photo] [image] not null,
	[Price] [int] not null,
	[Weight] [int] not null,
	[Short_Recital] [varchar] (max) not null
	constraint [PK_Dish] primary key clustered
	([ID_Dish] ASC) on [PRIMARY],
	constraint [FK_Component] foreign key ([Component_ID])
	references [dbo].[Component] ([ID_Component]),
	constraint [FK_Menu] foreign key ([Menu_ID])
	references [dbo].[Menu] ([ID_Menu]),
	constraint [CH_Shelf_Life_Dish] check ([Shelf_Life] > 0)
)
go

insert into [dbo].[Dish] ([Component_ID], [Menu_ID], [Shelf_Life], [Photo], [Price], [Weight], [Short_Recital])
values (1,1, 48,'https://cookpad.com/ru/recipe/images/93ad1a63ee692329','202','250','Салат из крабовых палочек наряду с оливье стал нашим любимцем. Для многих салат крабовый - рецепт классический. Салат с крабовыми палочками вроде бы ещё не деликатес, но уже нечто более изысканное, чем многие наши будничные салаты. '),
(2,2, 48,'https://cookpad.com/ru/recipe/images/b676f879bac3be2c','217','135','Салат, переносящий нас на берег моря…'),
(3,3, 72,'https://cookpad.com/ru/recipe/images/68c1fe1937d458ea','360','330','Слата, раскрывающий нам всю красоту моря, откуда были привезены крабы.'),
(4,2, 48,'https://cookpad.com/ru/recipe/images/b676f879bac3be2c','217','135','Салат, переносящий нас на берег моря…'),
(5,3, 72,'https://cookpad.com/ru/recipe/images/68c1fe1937d458ea','360','330','Слата, раскрывающий нам всю красоту моря, откуда были привезены крабы. ')
go


select [Value_Menu] as "Название блюда", [Structure_Component] as "Состав блюда", [Volume_Component] as "Количество", [Shelf_Life] as "Срок годности", [Photo] as "Фото", [Price] as "Цена", [Weight] as "Вес",
[Short_Recital]  as "Краткое описание" from [dbo].[Dish]
inner join [dbo].[Menu] on [Menu_ID] = [ID_Menu]
inner join [dbo].[Component] on [Component_ID] = [ID_Component]
order by [Value_Menu] ASC
--------------------------------------------------------------------------------------------------------------
create table [dbo].[Food]
(
	[ID_Food] [int] not null identity(1,1),
	[Raw_ID] [int] not null,
	[Dish_ID] [int] not null
	constraint [PK_Food] primary key clustered
	([ID_Food] ASC) on [PRIMARY],
	constraint [FK_Raw] foreign key ([Raw_ID])
	references [dbo].[Raw] ([ID_Raw]),
	constraint [FK_Dish] foreign key ([Dish_ID])
	references [dbo].[Dish] ([ID_Dish])
)
go

insert into [dbo].[Food] ([Raw_ID], [Dish_ID])
values 
(1,1),
(1,2),
(1,3),
(1,4),
(1,5)
go

select [Value_Menu] as "Название блюда", [Structure_Component] as "Состав блюда", [Volume_Component] as "Количество", 
[Shelf_Life] as "Срок годности",  [Photo] as "Фото", [Price] as "Цена", [Weight] as "Вес",[Short_Recital]  as "Краткое описание" 
from [dbo].[Food]
inner join [dbo].[Raw] on [Raw_ID] = [ID_Raw]
inner join [dbo].[Dish] on [Dish_ID] = [ID_Dish]
inner join [dbo].[Component] on [Component_ID] = [ID_Component]
inner join [dbo].[Menu] on [Menu_ID] = [ID_Menu]
order by [Value_Menu] ASC
--------------------------------------------------------------------------------------------------------------
create table [dbo].[Contract]
(
	[ID_Contract] [int] not null identity(1,1),
	[Staff_ID] [int] not null,
	[Employee_ID] [int] not null,
	[Nomber_Contract] [VARCHAR] (10) not null,
	[Term_Contract] [int] not null
	constraint [PK_Contract] primary key clustered
	([ID_Contract] ASC) on [PRIMARY],
	constraint [FK_Staff] foreign key ([Staff_ID])
	references [dbo].[Staff] ([ID_Staff]),
	constraint [FK_Employee_Contract] foreign key ([Employee_ID])
	references [dbo].[Employee] ([ID_Employee]),
	constraint [CH_Nomber_Contract] check ([Nomber_Contract] like '[0-9][0-9][0-9][0-9][0-9][0-9][-][С][Г][П]'),
	constraint [UQ_Nomber_Contract] unique ([Nomber_Contract]),
	constraint [CH_Term_Contract] check ([Term_Contract] > 0)
)
go

insert into [dbo].[Contract] ([Staff_ID], [Employee_ID],[Nomber_Contract],[Term_Contract])
values
(1,1,'000011-СГП',24),
(2,2,'000045-СГП',12),
(3,3,'000022-СГП',5),
(4,4,'000013-СГП',60),
(5,5,'000004-СГП',4)
go

select [Surname_Staff]+' '+[Name_Staff]+' '+[Middle_Name_Staff] as "ФИО", [Login_Employee] as "Логин",[Password_Employee] as "Пароль",
[Nomber_Contract] as "Номер договора",
[Term_Contract] as "Срок договора"
from [dbo].[Contract]
inner join [dbo].[Staff] on [Staff_ID] = [ID_Staff]
inner join [dbo].[Employee] on [Employee_ID] = [ID_Employee]
order by [Surname_Staff] ASC
--------------------------------------------------------------------------------------------------------------
create table [dbo].[Company]
(
	[ID_Compony] [int] not null identity(1,1),
	[Employee_ID] [int] not null,
	[Post_ID] [int] not null
	constraint [PK_Company] primary key clustered
	([ID_Compony] ASC) on [PRIMARY],
	constraint [FK_Post] foreign key ([Post_ID])
	references [dbo].[Post] ([ID_Post]),
	constraint [FK_Employee_Company] foreign key ([Employee_ID])
	references [dbo].[Employee] ([ID_Employee]),
)
go

insert into [dbo].[Company] ([Employee_ID], [Post_ID])
values(1,1),
(2,1),
(3,2),
(4,3),
(5,4)
go

select [Login_Employee]as "Логин", [Password_Employee] as "Пароль",
[Title_Post] as "Должность"
from [dbo].[Company]
inner join [dbo].[Post] on [Post_ID] = [ID_Post]
inner join [dbo].[Employee] on [Employee_ID] = [ID_Employee]
order by [Title_Post] ASC

select [Login_Employee]as "Логин", [Password_Employee] as "Пароль",
[Title_Post] as "Должность"
from [dbo].[Company]
inner join [dbo].[Post] on [Post_ID] = [ID_Post]
inner join [dbo].[Employee] on [Employee_ID] = [ID_Employee]
where [Post_ID]in (1)
order by [Title_Post] ASC


--------------------------------------------------------------------------------------------------------------
create table [dbo].[Booking]
(
	[ID_Booking] [int] not null identity(1,1),
	[Employee_ID] [int] not null,
	[Application_ID] [int] not null,
	[Rest_Area_ID] [int] not null,
	[Client_ID] [int] not null,
	[Date] [date] not null,
	[Time] [time] not null
	constraint [PK_Booking] primary key clustered
	([ID_Booking] ASC) on [PRIMARY],
	constraint [FK_Employee_Booking] foreign key ([Employee_ID])
	references [dbo].[Employee] ([ID_Employee]),
	constraint [FK_Application_Booking] foreign key ([Application_ID])
	references [dbo].[Application] ([ID_Application]),
	constraint [FK_Rest_Area_Booking] foreign key ([Rest_Area_ID])
	references [dbo].[Rest_Area] ([ID_Rest_Area]),
	constraint [FK_Client_Booking] foreign key ([Client_ID])
	references [dbo].[Client] ([ID_Client]),
	constraint [CH_Date_Booking] check ([Date] > getdate())
)
go

insert into [dbo].[Booking] ([Date], [Time], [Rest_Area_ID], [Employee_ID], [Client_ID], [Application_ID])
values('06/11/2022','17:30',1,4,1,1),
('18/12/2022','12:10',1,4,2,1),
('06/11/2022','10:47',1,4,3,1),
('16/01/2023','15:15',1,4,4,1),
('22/09/2022','17:50',1,4,5,1)
go

select [Date] as "Дата", [Time] as "Время",
[Area] as "Зона", 
[Login_Employee] as "Логин сотрудника", [Password_Employee] as "Пароль сотрудника",
[Value_Type_Client] as "Тип клиента", [Surname] as "Фамилия", [Name] as "Имя", [Middle_Name] as "Отчество", [Login] as "Логин", 
[Password] as "Пароль", [Seria] as "Серия", [Nomber] as "Номер", [Date_Of_Receipt] as "Дата выдачи паспорта", [Division_Code] as "Код подразделения", [Birthday]as "День рождения", 
[Issued]as "Кем выдано",	[Address_Registrion] as "Адрес регистрации", [Number_Bank] as "Номер банковской карты", [Payment] as "Платёжная система", [Valid_Until] as "Срок карты", [Owner] as "Владелец", 
[CVC] as "CVC", 
[Title_Application] as "Заявка"
from [dbo].[Booking]
inner join [dbo].[Client] on [Client_ID] = [ID_Client]
inner join [dbo].[Employee] on [Employee_ID] = [ID_Employee]
inner join [dbo].[Application] on [Application_ID] = [ID_Application]
inner join [dbo].[Rest_Area] on [Rest_Area_ID] = [ID_Rest_Area]
inner join [dbo].[Type_Client] on [Type_Client_ID] = [ID_Type_Client]
order by [Surname] ASC
--------------------------------------------------------------------------------------------------------------
create table [dbo].[Cheque]
(
	[ID_Cheque] [int] not null identity(1,1),
	[Booking_ID] [int] not null,
	[Order_Number] [int] not null,
	[Date_Cheque] [date] not null,
	[Time_Cheque] [time] not null
	constraint [PK_Cheque] primary key clustered
	([ID_Cheque] ASC) on [PRIMARY],
	constraint [FK_Booking_Cheque] foreign key ([Booking_ID])
	references [dbo].[Booking] ([ID_Booking]),
	constraint [UQ_Order_Number_Cheque] unique ([Order_Number])
)
go

insert into [dbo].[Cheque] ([Order_Number], [Date_Cheque], [Time_Cheque], [Booking_ID])
values
('1775','06/11/2022','18:30',1),
('328','18/12/2022','13:10',2),
('127','06/11/2022','11:47',3),
('1458','16/01/2023','16:15',4),
('1826','22/09/2022','18:50',5)
go

select [Date] as "Дата прибытия", [Date_Cheque] as "Дата отбытия",
[Time] as "Время прибытия", [Time_Cheque] as "Время отбытия",
[Area] as "Зона", 
[Login_Employee] as "Логин сотрудника", [Password_Employee] as "Пароль сотрудника",
[Value_Type_Client] as "Тип клиента", [Surname] as "Фамилия", [Name] as "Имя", [Middle_Name] as "Отчество", [Login] as "Логин", 
[Password] as "Пароль", [Seria] as "Серия", [Nomber] as "Номер", [Date_Of_Receipt] as "Дата выдачи паспорта", [Division_Code] as "Код подразделения", [Birthday]as "День рождения", 
[Issued]as "Кем выдано",	[Address_Registrion] as "Адрес регистрации", [Number_Bank] as "Номер банковской карты", [Payment] as "Платёжная система", [Valid_Until] as "Срок карты", [Owner] as "Владелец", 
[CVC] as "CVC", 
[Title_Application] as "Заявка"
from [dbo].[Cheque]
inner join [dbo].[Booking] on [Booking_ID] = [ID_Booking]
inner join [dbo].[Client] on [Client_ID] = [ID_Client]
inner join [dbo].[Employee] on [Employee_ID] = [ID_Employee]
inner join [dbo].[Application] on [Application_ID] = [ID_Application]
inner join [dbo].[Rest_Area] on [Rest_Area_ID] = [ID_Rest_Area]
inner join [dbo].[Type_Client] on [Type_Client_ID] = [ID_Type_Client]
order by [Date] ASC
--------------------------------------------------------------------------------------------------------------
create table [dbo].[Reservation]
(
	[ID_Reservation] [int] not null identity(1,1),
	[Booking_ID] [int] not null,
	[Dish_ID] [int] not null
	constraint [PK_Reservation] primary key clustered
	([ID_Reservation] ASC) on [PRIMARY],
	constraint [FK_Booking_Reservation] foreign key ([Booking_ID])
	references [dbo].[Booking] ([ID_Booking]),
	constraint [FK_Dish_Reservation] foreign key ([Dish_ID])
	references [dbo].[Dish] ([ID_Dish])
)
go

insert into [dbo].[Reservation] ([Booking_ID], [Dish_ID])
values
(1,1),
(2,2),
(3,3),
(4,4),
(5,5)
go

select [Date] as "Дата", [Time] as "Время",
[Area] as "Зона", 
[Login_Employee] as "Логин сотрудника", [Password_Employee] as "Пароль сотрудника",
[Value_Type_Client] as "Тип клиента", [Surname] as "Фамилия", [Name] as "Имя", [Middle_Name] as "Отчество", [Login] as "Логин", 
[Password] as "Пароль", [Seria] as "Серия", [Nomber] as "Номер", [Date_Of_Receipt] as "Дата выдачи паспорта", [Division_Code] as "Код подразделения", [Birthday]as "День рождения", 
[Issued]as "Кем выдано",	[Address_Registrion] as "Адрес регистрации", [Number_Bank] as "Номер банковской карты", [Payment] as "Платёжная система", [Valid_Until] as "Срок карты", [Owner] as "Владелец", 
[CVC] as "CVC", [Title_Application] as "Заявка",
[Value_Menu] as "Название блюда", [Structure_Component] as "Состав блюда", [Volume_Component] as "Количество", [Shelf_Life] as "Срок годности", [Photo] as "Фото", [Price] as "Цена", [Weight] as "Вес",
[Short_Recital]  as "Краткое описание"
from [dbo].[Reservation]
inner join [dbo].[Booking] on [Booking_ID] = [ID_Booking]
inner join [dbo].[Dish] on [Dish_ID] = [ID_Dish]
inner join [dbo].[Menu] on [Menu_ID] = [ID_Menu]
inner join [dbo].[Component] on [Component_ID] = [ID_Component]
inner join [dbo].[Client] on [Client_ID] = [ID_Client]
inner join [dbo].[Employee] on [Employee_ID] = [ID_Employee]
inner join [dbo].[Application] on [Application_ID] = [ID_Application]
inner join [dbo].[Rest_Area] on [Rest_Area_ID] = [ID_Rest_Area]
inner join [dbo].[Type_Client] on [Type_Client_ID] = [ID_Type_Client]
order by [Surname] ASC

--------------------------------------------------------------------------------------------------------------
create table [dbo].[Prop]
(
	[ID_Prop] [int] not null identity(1,1),
	[Raw_ID] [int] not null,
	[Supplier_Company_ID] [int] not null,
	[Unique_Number]	[BIGINT] not null,
	[Date] [date] not null,
	[Time] [time] null default(Convert(time, SYSDATETIME()))
	constraint [PK_Prop] primary key clustered
	([ID_Prop] ASC) on [PRIMARY],
	constraint [FK_Raw_Prop] foreign key ([Raw_ID])
	references [dbo].[Raw] ([ID_Raw]),
	constraint [FK_Supplier_Company_Prop] foreign key ([Supplier_Company_ID])
	references [dbo].[Supplier_Company] ([ID_Supplier_Company]),
	constraint [CH_Unique_Number_Prop] check ([Unique_Number] > 0)
)
go

insert into [dbo].[Prop] ([Unique_Number],[Date],[Time],[Supplier_Company_ID],[Raw_ID])
values
(287327042745,'06.11.2021','23:00',1,1),
(287327042745,'06.11.2021','23:00',1,5),
(287327042745,'06.11.2021','23:00',1,4),
(521042175716,'18.12.2021','23:00',2,1),
(521042175716,'18.12.2021','23:00',2,6),
(521042175716,'18.12.2021','23:00',2,3),
(672250381177,'06.11.2021','23:00',3,1),
(672250381177,'06.11.2021','23:00',3,5),
(672250381177,'06.11.2021','23:00',3,2),
(270390003043,'16.01.2022','23:00',4,1),
(270390003043,'16.01.2022','23:00',4,6),
(270390003043,'16.01.2022','23:00',4,3),
(420737523479,'22.09.2021','23:00',5,1),
(420737523479,'22.09.2021','23:00',5,5),
(420737523479,'22.09.2021','23:00',5,2)
go

select [Unique_Number] as "Уникальный номер",[Date] as "Дата",[Time] as "Время",
[Full_Organization] as "Полное название огранизации", [Short_Organization] as "Сокращённое название организации",[Legal_Address] as "Юридический адрес", [Physical_Address] as "Физический адрес", [ITN] as "ИНН", [OKPO] as "ОКПО", [BIC] as "БИК",
[Component_Raw] as "Название сырья", [Volume_Raw] as "Количество сырья"
from [dbo].[Prop]
inner join [dbo].[Supplier_Company] on [Supplier_Company_ID] = [ID_Supplier_Company]
inner join [dbo].[Raw] on [Raw_ID] = [ID_Raw]
order by [Unique_Number] ASC, [Component_Raw] ASC

--------------------------------------------------------------------------------------------------------------
create table [dbo].[Firm]
(
	[ID_Firm] [int] not null identity(1,1),
	[Supply_ID] [int] not null,
	[Supplier_Company_ID] [int] not null
	constraint [PK_Firm] primary key clustered
	([ID_Firm] ASC) on [PRIMARY],
	constraint [FK_Supply_Firm] foreign key ([Supply_ID])
	references [dbo].[Supply] ([ID_Supply]),
	constraint [FK_Supplier_Company_Firm] foreign key ([Supplier_Company_ID])
	references [dbo].[Supplier_Company] ([ID_Supplier_Company])
)
go

insert into [dbo].[Firm] ([Supply_ID],[Supplier_Company_ID])
values
(1,1),
(1,2),
(1,3),
(1,4),
(1,5)
go

select [Adress_Supply] as "Адрес",
[Full_Organization] as "Полное название огранизации", [Short_Organization] as "Сокращённое название организации",
[Legal_Address] as "Юридический адрес", [Physical_Address] as "Физический адрес", [ITN] as "ИНН", [OKPO] as "ОКПО", [BIC] as "БИК"
from [dbo].[Firm]
inner join [dbo].[Supply] on [Supply_ID] = [ID_Supply]
inner join [dbo].[Supplier_Company] on [Supplier_Company_ID] = [ID_Supplier_Company]
order by [Full_Organization] ASC
--------------------------------------------------------------------------------------------------------------
create table [dbo].[Report]
(
	[ID_Report] [int] not null identity(1,1),
	[Prop_ID] [int] not null,
	[Material_ID] [int] not null
	constraint [PK_Report] primary key clustered
	([ID_Report] ASC) on [PRIMARY],
	constraint [FK_Prop_Report] foreign key ([Prop_ID])
	references [dbo].[Prop] ([ID_Prop]),
	constraint [FK_Material_Report] foreign key ([Material_ID])
	references [dbo].[Material] ([ID_Material])
)
go

insert into [dbo].[Report] ([Prop_ID],[Material_ID])
values
(1,1),
(2,1),
(3,1),
(4,2),
(5,2),
(6,2),
(7,3),
(8,3),
(9,3),
(10,4),
(11,4),
(12,4),
(13,5),
(14,5),
(15,5)
go

select [Unique_Number] as "Уникальный номер",[Date] as "Дата",[Time] as "Время",
[Full_Organization] as "Полное название огранизации", [Short_Organization] as "Сокращённое название организации",[Legal_Address] as "Юридический адрес", [Physical_Address] as "Физический адрес", [ITN] as "ИНН", [OKPO] as "ОКПО", [BIC] as "БИК",
[Component_Raw] as "Название сырья", [Volume_Raw] as "Количество сырья",
[Component_Material] as "Название материала", [Volume_Material] as "Количество материала"
from [dbo].[Report]
inner join [dbo].[Prop] on [Prop_ID] = [ID_Prop]
inner join [dbo].[Material] on [Material_ID] = [ID_Material]
inner join [dbo].[Supplier_Company] on [Supplier_Company_ID] = [ID_Supplier_Company]
inner join [dbo].[Raw] on [Raw_ID] = [ID_Raw]
order by [Unique_Number] ASC, [Component_Raw] ASC