use [Restoran_DB]
go
--------------------------------------------------------------------------------------------
select [Value_Menu] as "1111111111111", [Structure_Component] as "11111111111", [Volume_Component] as "1111111111",
[Shelf_Life] as "111111111111", [Photo] as "1111", [Price] as "1111", [Weight] as "111",
[Short_Recital]  as "111111111111111" from [dbo].[Dish]
inner join [dbo].[Menu] on [Menu_ID] = [ID_Menu]
inner join [dbo].[Component] on [Component_ID] = [ID_Component]
order by [Value_Menu] ASC
select [Type_Client_ID] as "1111111111", [Surname] as "1111111", 
[Name] as "111", [Middle_Name] as "11111111", [Login] as "11111", 
[Password] as "111111", [Seria] as "11111", [Nomber] as "11111", 
[Date_Of_Receipt] as "111111111111111111", [Division_Code] as "1111111111111111", 
[Birthday]as "111111111111", 
[Issued]as "CVC",	[Address_Registrion] as "1111111111111111", 
[Number_Bank] as "11111111111111111111", [Payment] as "111111111111111", [Valid_Until] as "111111111", [Owner] as "11111111", 
[CVC] as "CVC" from [dbo].[Client]
order by [Surname] ASC
--------------------------------------------------------------------------------------------
select Max([Price]) as "11111111111111111", MIN([Price]) as "11111111111111111" from [dbo].[Dish]
go

--------------------------------------------------------------------------------------------
select [Value_Menu] as "1111111111111"
from [dbo].[Dish]
inner join [dbo].[Menu] on [Menu_ID] = [ID_Menu]
group by [Value_Menu]
having COUNT([Value_Menu])=1
--------------------------------------------------------------------------------------------
select round(avg([Price]),2) as "11111111111111111111111111111"
from [dbo].[Dish]
go
--------------------------------------------------------------------------------------------
select sum([Price]) as "C111111111111"
from [dbo].[Dish]
go
--------------------------------------------------------------------------------------------
select top(3) ROW_NUMBER() over(order by [Surname] Desc) as "111111", CONCAT([Surname],' ',SUBSTRING([Name],1,1),'.',SUBSTRING([Middle_Name],1,1),'.') as "111"
from [dbo].[Client]
order by CONCAT([Surname],' ',SUBSTRING([Name],1,1),'.',SUBSTRING([Middle_Name],1,1),'.')
go
--------------------------------------------------------------------------------------------
select [Value_Menu] as "1111111111111", "111111111111111111" = case
when [Price] > 250 then '111111111111'
when [Price] <250 then '111111111111' 
end from [dbo].[Dish]
inner join [dbo].[Menu] on [Menu_ID] = [ID_Menu]
inner join [dbo].[Component] on [Component_ID] = [ID_Component]
go
--------------------------------------------------------------------------------------------
select STRING_AGG([Surname], ', ') as "1111111"
from [dbo].[Client]
--------------------------------------------------------------------------------------------
select distinct([Adress_Supply])  from [dbo].[Supply]
go
--------------------------------------------------------------------------------------------
select lower([Full_Organization]) as "1111111111111111111111111", UPPER([Short_Organization]) as "111111111111111111111111111111" from [dbo].[Supplier_Company]
go
--------------------------------------------------------------------------------------------
select [Surname] as "1111111", 
[Name] as "111", [Middle_Name] as "11111111", Format(DateADD(YY,datediff(YY,[Birthday],[Date_Of_Receipt]),[Birthday]),'dd.MM.yyyy') as "1111"
from [dbo].[Client]
