use [Restoran_DB]
go
--------------------------------------------------------------------------------------------
select [Value_Menu] as "Название блюда", [Structure_Component] as "Состав блюда", [Volume_Component] as "Количество",
[Shelf_Life] as "Срок годности", [Photo] as "Фото", [Price] as "Цена", [Weight] as "Вес",
[Short_Recital]  as "Краткое описание" from [dbo].[Dish]
inner join [dbo].[Menu] on [Menu_ID] = [ID_Menu]
inner join [dbo].[Component] on [Component_ID] = [ID_Component]
order by [Value_Menu] ASC
select [Type_Client_ID] as "тип клиента", [Surname] as "Фамилия", 
[Name] as "Имя", [Middle_Name] as "Отчество", [Login] as "Логин", 
[Password] as "Пароль", [Seria] as "Серия", [Nomber] as "Номер", 
[Date_Of_Receipt] as "Дата выдачи паспорта", [Division_Code] as "Код подразделения", 
[Birthday]as "День рождения", 
[Issued]as "CVC",	[Address_Registrion] as "Адрес регистрации", 
[Number_Bank] as "Номер банковской карты", [Payment] as "Платёжная система", [Valid_Until] as "Срок карты", [Owner] as "Владелец", 
[CVC] as "CVC" from [dbo].[Client]
order by [Surname] ASC
--------------------------------------------------------------------------------------------
select Max([Price]) as "Самое дорогое блюдо", MIN([Price]) as "Самое дешёвое блюдо" from [dbo].[Dish]
go

--------------------------------------------------------------------------------------------
select [Value_Menu] as "Название блюда"
from [dbo].[Dish]
inner join [dbo].[Menu] on [Menu_ID] = [ID_Menu]
group by [Value_Menu]
having COUNT([Value_Menu])=1
--------------------------------------------------------------------------------------------
select round(avg([Price]),2) as "Среднее арифметическая цена блюд"
from [dbo].[Dish]
go
--------------------------------------------------------------------------------------------
select sum([Price]) as "Cумма всех блюд"
from [dbo].[Dish]
go
--------------------------------------------------------------------------------------------
select top(3) ROW_NUMBER() over(order by [Surname] Desc) as "№ сроки", CONCAT([Surname],' ',SUBSTRING([Name],1,1),'.',SUBSTRING([Middle_Name],1,1),'.') as "ФИО"
from [dbo].[Client]
order by CONCAT([Surname],' ',SUBSTRING([Name],1,1),'.',SUBSTRING([Middle_Name],1,1),'.')
go
--------------------------------------------------------------------------------------------
select [Value_Menu] as "Название блюда", "Степень дороговизны" = case
when [Price] > 250 then 'Дешёвое товар'
when [Price] <250 then 'Дорогое товар' 
end from [dbo].[Dish]
inner join [dbo].[Menu] on [Menu_ID] = [ID_Menu]
inner join [dbo].[Component] on [Component_ID] = [ID_Component]
go
--------------------------------------------------------------------------------------------
select STRING_AGG([Surname], ', ') as "Фамилии"
from [dbo].[Client]
--------------------------------------------------------------------------------------------
select distinct([Adress_Supply])  from [dbo].[Supply]
go
--------------------------------------------------------------------------------------------
select lower([Full_Organization]) as "Полное название огранизаций", UPPER([Short_Organization]) as "Сокращённое название организации" from [dbo].[Supplier_Company]
go
--------------------------------------------------------------------------------------------
select [Surname] as "Фамилия", 
[Name] as "Имя", [Middle_Name] as "Отчество", Format(DateADD(YY,datediff(YY,[Birthday],[Date_Of_Receipt]),[Birthday]),'dd.MM.yyyy') as "Дата"
from [dbo].[Client]

--------------------------------------------------------------------------------------------
create or alter function [dbo].[Raw_tab] (@Volume_Raw [int]) 
returns table
as	
		return(select [Component_Raw] as "Компонент", [Volume_Raw] as "Количество"  from [dbo].[Raw]			
		where [Volume_Raw] = @Volume_Raw)	
go
select * from [dbo].[Raw_tab] ('3')
go
--------------------------------------------------------------------------------------------
create or alter function [dbo].[Client_Date] (@Name [varchar] (30)) 
returns [int]
with execute as caller
as
	begin
		return(select DATEPART(YEAR,[Birthday]) from [dbo].[Client]			
		where [Name] = @Name)
	end
go
select [dbo].[Client_Date]('Галина')
go
