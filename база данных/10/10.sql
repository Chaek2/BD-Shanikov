use [Restoran_DB]
go
--------------------------------------------------------------------------------------------
select [Value_Menu] as "�������� �����", [Structure_Component] as "������ �����", [Volume_Component] as "����������",
[Shelf_Life] as "���� ��������", [Photo] as "����", [Price] as "����", [Weight] as "���",
[Short_Recital]  as "������� ��������" from [dbo].[Dish]
inner join [dbo].[Menu] on [Menu_ID] = [ID_Menu]
inner join [dbo].[Component] on [Component_ID] = [ID_Component]
order by [Value_Menu] ASC
select [Type_Client_ID] as "��� �������", [Surname] as "�������", 
[Name] as "���", [Middle_Name] as "��������", [Login] as "�����", 
[Password] as "������", [Seria] as "�����", [Nomber] as "�����", 
[Date_Of_Receipt] as "���� ������ ��������", [Division_Code] as "��� �������������", 
[Birthday]as "���� ��������", 
[Issued]as "CVC",	[Address_Registrion] as "����� �����������", 
[Number_Bank] as "����� ���������� �����", [Payment] as "�������� �������", [Valid_Until] as "���� �����", [Owner] as "��������", 
[CVC] as "CVC" from [dbo].[Client]
order by [Surname] ASC
--------------------------------------------------------------------------------------------
select Max([Price]) as "����� ������� �����", MIN([Price]) as "����� ������� �����" from [dbo].[Dish]
go

--------------------------------------------------------------------------------------------
select [Value_Menu] as "�������� �����"
from [dbo].[Dish]
inner join [dbo].[Menu] on [Menu_ID] = [ID_Menu]
group by [Value_Menu]
having COUNT([Value_Menu])=1
--------------------------------------------------------------------------------------------
select round(avg([Price]),2) as "������� �������������� ���� ����"
from [dbo].[Dish]
go
--------------------------------------------------------------------------------------------
select sum([Price]) as "C���� ���� ����"
from [dbo].[Dish]
go
--------------------------------------------------------------------------------------------
select top(3) ROW_NUMBER() over(order by [Surname] Desc) as "� �����", CONCAT([Surname],' ',SUBSTRING([Name],1,1),'.',SUBSTRING([Middle_Name],1,1),'.') as "���"
from [dbo].[Client]
order by CONCAT([Surname],' ',SUBSTRING([Name],1,1),'.',SUBSTRING([Middle_Name],1,1),'.')
go
--------------------------------------------------------------------------------------------
select [Value_Menu] as "�������� �����", "������� �����������" = case
when [Price] > 250 then '������� �����'
when [Price] <250 then '������� �����' 
end from [dbo].[Dish]
inner join [dbo].[Menu] on [Menu_ID] = [ID_Menu]
inner join [dbo].[Component] on [Component_ID] = [ID_Component]
go
--------------------------------------------------------------------------------------------
select STRING_AGG([Surname], ', ') as "�������"
from [dbo].[Client]
--------------------------------------------------------------------------------------------
select distinct([Adress_Supply])  from [dbo].[Supply]
go
--------------------------------------------------------------------------------------------
select lower([Full_Organization]) as "������ �������� �����������", UPPER([Short_Organization]) as "����������� �������� �����������" from [dbo].[Supplier_Company]
go
--------------------------------------------------------------------------------------------
select [Surname] as "�������", 
[Name] as "���", [Middle_Name] as "��������", Format(DateADD(YY,datediff(YY,[Birthday],[Date_Of_Receipt]),[Birthday]),'dd.MM.yyyy') as "����"
from [dbo].[Client]

--------------------------------------------------------------------------------------------
create or alter function [dbo].[Raw_tab] (@Volume_Raw [int]) 
returns table
as	
		return(select [Component_Raw] as "���������", [Volume_Raw] as "����������"  from [dbo].[Raw]			
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
select [dbo].[Client_Date]('������')
go
