use [Restoran_DB]
go
------------------------------------------------------------------------------------------------------------------------------------------------------------
create or alter view [dbo].[Dish_View] ("Название блюда", "Состав блюда", "Количество", "Срок годности", "Фото", "Цена", "Вес в граммах","Краткое описание")
as
	select [Value_Menu], [Structure_Component], [Volume_Component], [Shelf_Life], [Photo], [Price], [Weight],
	[Short_Recital] from [dbo].[Dish]
	inner join [dbo].[Menu] on [Menu_ID] = [ID_Menu]
	inner join [dbo].[Component] on [Component_ID] = [ID_Component]
go
select * from [dbo].[Dish_View]



------------------------------------------------------------------------------------------------------------------------------------------------------------

create or alter view [dbo].[Dish_View] ("Название блюда", "Состав блюда", "Количество", "Срок годности", "Фото", "Цена", "Вес в граммах","Краткое описание")
as
	select [Value_Menu], [Structure_Component], [Volume_Component], [Shelf_Life], [Photo], [Price], [Weight],
	[Short_Recital] from [dbo].[Dish]
	inner join [dbo].[Menu] on [Menu_ID] = [ID_Menu]
	inner join [dbo].[Component] on [Component_ID] = [ID_Component]
go
select * from [dbo].[Dish_View]

------------------------------------------------------------------------------------------------------------------------------------------------------------

create or alter view [dbo].[Prop_View] ("Уникальный номер","Дата","Время","Полное название огранизации","Сокращённое название организации","Юридический адрес","Физический адрес","ИНН","ОКПО","БИК","Название сырья","Количество сырья")
as
	select [Unique_Number],[Date],[Time],
[Full_Organization] ,[Short_Organization],
[Legal_Address],[Physical_Address] ,[ITN] , [OKPO],[BIC],
[Component_Raw],[Volume_Raw]
from [dbo].[Prop]
inner join [dbo].[Supplier_Company] on [Supplier_Company_ID] = [ID_Supplier_Company]
inner join [dbo].[Raw] on [Raw_ID] = [ID_Raw]
go
select * from [dbo].[Prop_View]

------------------------------------------------------------------------------------------------------------------------------------------------------------

create or alter view [dbo].[Cheque_View] ("Номер заказа","Дата прибытия", "Дата отбытия", "Время прибытия", "Время отбытия", "Зона","Логин сотрудника","Пароль сотрудника","Тип клиента", "ФИО","Логин","Пароль","Серия и Номер","Дата выдачи паспорта","Код подразделения","День рождения","Кем выдано", "Адрес регистрации","Номер банковской карты","Платёжная система","Срок карты","Владелец","CVC","Заявка")
as
	select [Order_Number], [Date], [Date_Cheque],[Time], [Time_Cheque],[Area],[Login_Employee], [Password_Employee],[Value_Type_Client], [Surname]+' '+[Name]+' '+[Middle_Name], [Login] ,
	[Password], [Seria]+' '+[Nomber], [Date_Of_Receipt], [Division_Code], [Birthday],[Issued],	[Address_Registrion], [Number_Bank], [Payment], [Valid_Until] , [Owner] ,[CVC],[Title_Application] from [dbo].[Cheque]
	inner join [dbo].[Booking] on [Booking_ID] = [ID_Booking]
	inner join [dbo].[Client] on [Client_ID] = [ID_Client]
	inner join [dbo].[Employee] on [Employee_ID] = [ID_Employee]
	inner join [dbo].[Application] on [Application_ID] = [ID_Application]
	inner join [dbo].[Rest_Area] on [Rest_Area_ID] = [ID_Rest_Area]
	inner join [dbo].[Type_Client] on [Type_Client_ID] = [ID_Type_Client]
go

select * from [dbo].[Cheque_View]

------------------------------------------------------------------------------------------------------------------------------------------------------------



------------------------------------------------------------------------------------------------------------------------------------------------------------



------------------------------------------------------------------------------------------------------------------------------------------------------------



------------------------------------------------------------------------------------------------------------------------------------------------------------

