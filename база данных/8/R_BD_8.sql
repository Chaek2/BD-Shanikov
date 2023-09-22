use [Restoran_DB]
go
----------------------------------------------------------------------------------------------------------------------------------------------------------------------
create or alter  procedure [dbo].[Type_Client_insert] 
@Value_Type_Client [varchar] (10)
as
	begin try
	insert into [dbo].[Type_Client] ([Value_Type_Client])
	values (@Value_Type_Client)
	end try
	begin catch
		print('Данный вид клиента уже есть в таблице!')
	end catch
go

create or alter  procedure [dbo].[Type_Client_update]
@ID_Type_Client [int], @Value_Type_Client [varchar] (10)
as 
	begin try
	update [dbo].[Type_Client] set
		[Value_Type_Client] = @Value_Type_Client
		where
		[ID_Type_Client] = @ID_Type_Client
	end try
	begin catch
		print('Данный вид клиента уже есть в таблице!')
	end catch
go

create or alter  procedure [dbo].[Type_Client_delete]
@ID_Type_Client [int]
as
	declare @any_child_record [int] = (select count(*) from [dbo].[Client]
	where [Type_Client_ID] = @ID_Type_Client)
	if (@any_child_record > 0)
	print('Тип клиента не может удалён, так как в таблице "Тип клиента", есть связанные данные!');
	else
	delete from [dbo].[Type_Client] 
		where
		[ID_Type_Client] = @ID_Type_Client
go
-----------------------------------------------------------------------------------------------------------------------------------------------------
create or alter  procedure [dbo].[Supply_insert] 
@Adress_Supply [varchar] (max)
as
	begin try
		insert into [dbo].[Supply] ([Adress_Supply])
		values (@Adress_Supply)
	end try
	begin catch
		print('Данный вид поставки уже есть в таблице!')
	end catch
go

create or alter  procedure [dbo].[Supply_update]
@ID_Supply [int], @Adress_Supply [varchar] (max)
as 
	begin try
	update [dbo].[Supply] set
		[Adress_Supply] = @Adress_Supply
		where
		[ID_Supply] = @ID_Supply
	end try
	begin catch
		print('Данный вид поставки уже есть в таблице!')
	end catch
go

create or alter  procedure [dbo].[Supply_delete]
@ID_Supply [int]
as
	declare @any_child_record [int] = (select count(*) from [dbo].[Firm]
	where [Supply_ID] = @ID_Supply)
	if (@any_child_record > 0)
	print('Поставка не может удалён, так как в таблице "Тип клиента", есть связанные данные!');
	else
	delete from [dbo].[Supply] 
		where
		[ID_Supply] = @ID_Supply
go
----------------------------------------------------------------------------------------------------------------------------------------------------------------------
create or alter  procedure [dbo].[Post_insert] 
@Title_Post [varchar] (32)
as
	begin try
	insert into [dbo].[Post] ([Title_Post])
	values (@Title_Post)
	end try
	begin catch
		print('Данная должность уже есть в таблице!')
	end catch
go

create or alter  procedure [dbo].[Post_update]
@ID_Post [int], @Title_Post [varchar] (32)
as 
	begin try
	update [dbo].[Post] set
		[Title_Post] = @Title_Post
		where
		[ID_Post] = @ID_Post
	end try
	begin catch
		print('Данная должность  уже есть в таблице!')
	end catch
go

create or alter  procedure [dbo].[Post_delete]
@ID_Post [int]
as
	declare @any_child_record [int] = (select count(*) from [dbo].[Company]
	where [Post_ID] = @ID_Post)
	if (@any_child_record > 0)
	print('Должность не может быть удалена удалён, так как в таблице "Должность", есть связанные данные!');
	else
	delete from [dbo].[Post] 
		where
		[ID_Post] = @ID_Post
go
----------------------------------------------------------------------------------------------------------------------------------------------------------------------
create or alter  procedure [dbo].[Menu_insert] 
@Value_Menu [varchar] (max)
as
	begin try
	insert into [dbo].[Menu] ([Value_Menu])
	values (@Value_Menu)
	end try
	begin catch
		print('Данное название блюда уже есть в таблице!')
	end catch
go

create or alter  procedure [dbo].[Menu_update]
@ID_Menu [int], @Value_Menu [varchar] (max)
as 
	begin try
	update [dbo].[Menu] set
		[Value_Menu] = @Value_Menu
		where
		[ID_Menu] = @ID_Menu
	end try
	begin catch
		print('Данное название блюда уже есть в таблице!')
	end catch
go

create or alter  procedure [dbo].[Menu_delete]
@ID_Menu [int]
as
	declare @any_child_record [int] = (select count(*) from [dbo].[Dish]
	where [Menu_ID] = @ID_Menu)
	if (@any_child_record > 0)
	print('Название блюда не может быть удалена удалён, так как в таблице "Меню", есть связанные данные!');
	else
	delete from [dbo].[Menu] 
		where
		[ID_Menu] = @ID_Menu
go
----------------------------------------------------------------------------------------------------------------------------------------------------------------------
create or alter  procedure [dbo].[Component_insert] 
@Structure_Component [varchar] (32),@Volume_Component [int]
as
	begin try
	insert into [dbo].[Component] ([Structure_Component], [Volume_Component])
	values (@Structure_Component, @Volume_Component)
	end try
	begin catch
		print('Данный компонент уже есть в таблице!')
	end catch
go

create or alter  procedure [dbo].[Component_update]
@ID_Component [int],@Structure_Component [varchar] (32),@Volume_Component [int]
as 
	begin try
	update [dbo].[Component] set
		[Structure_Component] = @Structure_Component,
		[Volume_Component] = @Volume_Component
		where
		[ID_Component] = @ID_Component
	end try
	begin catch
		print('Данный компонент уже есть в таблице!')
	end catch
go

create or alter  procedure [dbo].[Component_delete]
@ID_Component [int]
as
	declare @any_child_record [int] = (select count(*) from [dbo].[Dish]
	where [Component_ID] = @ID_Component)
	if (@any_child_record > 0)
	print('Компонент не может быть удалена удалён, так как в таблице "Компонент", есть связанные данные!');
	else
	delete from [dbo].[Component] 
		where
		[ID_Component] = @ID_Component
go
----------------------------------------------------------------------------------------------------------------------------------------------------------------------
create or alter  procedure [dbo].[Raw_insert] 
@Component_Raw [varchar] (32),@Volume_Raw [int]
as
	begin try
	insert into [dbo].[Raw] ([Component_Raw], [Volume_Raw])
	values (@Component_Raw, @Volume_Raw)
	end try
	begin catch
		print('Данное сырьё уже есть в таблице!')
	end catch
go

create or alter  procedure [dbo].[Raw_update]
@ID_Raw [int],@Component_Raw [varchar] (32),@Volume_Raw [int]
as 
	begin try
	update [dbo].[Raw] set
		[Component_Raw] = @Component_Raw,
		[Volume_Raw] = @Volume_Raw
		where
		[ID_Raw] = @ID_Raw
	end try
	begin catch
		print('Данное сырьё уже есть в таблице!')
	end catch
go

create or alter  procedure [dbo].[Raw_delete]
@ID_Raw [int]
as
	declare @any_child_record1 [int] = (select count(*) from [dbo].[Prop]
	where [Raw_ID] = @ID_Raw)
	declare @any_child_record [int] = (select count(*) from [dbo].[Food]
	where [Raw_ID] = @ID_Raw)
	if (@any_child_record >0 or @any_child_record1 > 0)
	print('Компонент не может быть удалена удалён, так как в таблице "Компонент", есть связанные данные!');
	else
	delete from [dbo].[Raw] 
		where
		[ID_Raw] = @ID_Raw
go
----------------------------------------------------------------------------------------------------------------------------------------------------------------------
create or alter  procedure [dbo].[Material_insert] 
@Component_Material [varchar] (32),@Volume_Material [int]
as
	begin try
	insert into [dbo].[Material] ([Component_Material], [Volume_Material])
	values (@Component_Material, @Volume_Material)
	end try
	begin catch
		print('Данный материал уже есть в таблице!')
	end catch
go

create or alter  procedure [dbo].[Material_update]
@ID_Material [int],@Component_Material [varchar] (32),@Volume_Material [int]
as 
	begin try
	update [dbo].[Material] set
		[Component_Material] = @Component_Material,
		[Volume_Material] = @Volume_Material
		where
		[ID_Material] = @ID_Material
	end try
	begin catch
		print('Данный материал уже есть в таблице!')
	end catch
go

create or alter  procedure [dbo].[Material_delete]
@ID_Material [int]
as
	declare @any_child_record [int] = (select count(*) from [dbo].[Report]
	where [Material_ID] = @ID_Material)
	if (@any_child_record > 0)
	print('Материал не может быть удалена удалён, так как в таблице "Компонент", есть связанные данные!');
	else
	delete from [dbo].[Material] 
		where
		[ID_Material] = @ID_Material
go
----------------------------------------------------------------------------------------------------------------------------------------------------------------------
create or alter  procedure [dbo].[Material_insert] 
@Component_Material [varchar] (32),@Volume_Material [int]
as
	begin try
	insert into [dbo].[Material] ([Component_Material], [Volume_Material])
	values (@Component_Material, @Volume_Material)
	end try
	begin catch
		print('Данный материал уже есть в таблице!')
	end catch
go

create or alter  procedure [dbo].[Material_update]
@ID_Material [int],@Component_Material [varchar] (32),@Volume_Material [int]
as 
	begin try
	update [dbo].[Material] set
		[Component_Material] = @Component_Material,
		[Volume_Material] = @Volume_Material
		where
		[ID_Material] = @ID_Material
	end try
	begin catch
		print('Данный материал уже есть в таблице!')
	end catch
go

create or alter  procedure [dbo].[Material_delete]
@ID_Material [int]
as
	declare @any_child_record [int] = (select count(*) from [dbo].[Report]
	where [Material_ID] = @ID_Material)
	if (@any_child_record > 0)
	print('Материал не может быть удалена удалён, так как в таблице "Компонент", есть связанные данные!');
	else
	delete from [dbo].[Material] 
		where
		[ID_Material] = @ID_Material
go
----------------------------------------------------------------------------------------------------------------------------------------------------------------------
create or alter  procedure [dbo].[Application_insert] 
@Title_Application [varchar] (25)
as
	begin try
	insert into [dbo].[Application] ([Title_Application])
	values (@Title_Application)
	end try
	begin catch
		print('Данная заявка уже есть в таблице!')
	end catch
go

create or alter  procedure [dbo].[Application_update]
@ID_Application [int],@Title_Application [varchar] (25)
as 
	begin try
	update [dbo].[Application] set
		[Title_Application] = @Title_Application
		where
		[ID_Application] = @ID_Application
	end try
	begin catch
		print('Данная заявка уже есть в таблице!')
	end catch
go

create or alter  procedure [dbo].[Application_delete]
@ID_Application [int]
as
	declare @any_child_record [int] = (select count(*) from [dbo].[Booking]
	where [Application_ID] = @ID_Application)
	if (@any_child_record > 0)
	print('Заявка не может быть удалена удалён, так как в таблице "Компонент", есть связанные данные!');
	else
	delete from [dbo].[Application] 
		where
		[ID_Application] = @ID_Application
go
----------------------------------------------------------------------------------------------------------------------------------------------------------------------
create or alter  procedure [dbo].[Employee_insert] 
@Login_Employee [varchar] (32),@Password_Employee [varchar] (32)
as
	begin try
	insert into [dbo].[Employee] ([Login_Employee], [Password_Employee])
	values (@Login_Employee, @Password_Employee)
	end try
	begin catch
		print('Данный Работник уже есть в таблице!')
	end catch
go

create or alter  procedure [dbo].[Employee_update]
@ID_Employee [int],@Login_Employee [varchar] (32),@Password_Employee [varchar] (32)
as 
	begin try
	update [dbo].[Employee] set
		[Login_Employee] = @Login_Employee,
		[Password_Employee] = @Password_Employee
		where
		[ID_Employee] = @ID_Employee
	end try
	begin catch
		print('Данный Работник уже есть в таблице!')
	end catch
go

create or alter  procedure [dbo].[Employee_delete]
@ID_Employee [int]
as
	declare @any_child_record [int] = (select count(*) from [dbo].[Booking]
	where [Employee_ID] = @ID_Employee)
	declare @any_child_record1 [int] = (select count(*) from [dbo].[Contract]
	where [Employee_ID] = @ID_Employee)
	declare @any_child_record2 [int] = (select count(*) from [dbo].[Company]
	where [Employee_ID] = @ID_Employee)
	if (@any_child_record > 0 or @any_child_record1 > 0 or @any_child_record2 > 0)
	print('Работник не может быть удалён, так как в таблице "Работник", есть связанные данные!');
	else
	delete from [dbo].[Employee] 
		where
		[ID_Employee] = @ID_Employee
go
----------------------------------------------------------------------------------------------------------------------------------------------------------------------
create or alter  procedure [dbo].[Staff_insert] 
@Name_Staff [varchar] (30),@Surname_Staff [varchar] (30)
as
	begin try
	insert into [dbo].[Staff] ([Name_Staff], [Surname_Staff])
	values (@Name_Staff, @Surname_Staff)
	end try
	begin catch
		print('Данный Персонал уже есть в таблице!')
	end catch
go

create or alter  procedure [dbo].[Staff_update]
@ID_Staff [int],@Name_Staff [varchar] (32),@Surname_Staff [varchar] (32)
as 
	begin try
	update [dbo].[Staff] set
		[Name_Staff] = @Name_Staff,
		[Surname_Staff] = @Surname_Staff
		where
		[ID_Staff] = @ID_Staff
	end try
	begin catch
		print('Данный Персонал уже есть в таблице!')
	end catch
go

create or alter  procedure [dbo].[Staff_delete]
@ID_Staff [int]
as
	declare @any_child_record [int] = (select count(*) from [dbo].[Contract]
	where [Staff_ID] = @ID_Staff)
	if (@any_child_record > 0)
	print('Персонал не может быть удалён, так как в таблице "Персонал", есть связанные данные!');
	else
	delete from [dbo].[Staff] 
		where
		[ID_Staff] = @ID_Staff
go
----------------------------------------------------------------------------------------------------------------------------------------------------------------------
create or alter  procedure [dbo].[Rest_Area_insert] 
@Area [varchar] (30)
as
	begin try
	insert into [dbo].[Rest_Area] ([Area])
	values (@Area)
	end try
	begin catch
		print('Данная зона уже есть в таблице!')
	end catch
go

create or alter  procedure [dbo].[Rest_Area_update]
@ID_Rest_Area [int],@Area [varchar] (30)
as 
	begin try
	update [dbo].[Rest_Area] set
		[Area] = @Area
		where
		[ID_Rest_Area] = @ID_Rest_Area
	end try
	begin catch
		print('Данная зона уже есть в таблице!')
	end catch
go

create or alter  procedure [dbo].[Rest_Area_delete]
@ID_Rest_Area [int]
as
	declare @any_child_record [int] = (select count(*) from [dbo].[Booking]
	where [Rest_Area_ID] = @ID_Rest_Area)
	if (@any_child_record > 0)
	print('Зона не может быть удалён, так как в таблице "Персонал", есть связанные данные!');
	else
	delete from [dbo].[Rest_Area] 
		where
		[ID_Rest_Area] = @ID_Rest_Area
go
----------------------------------------------------------------------------------------------------------------------------------------------------------------------
create or alter  procedure [dbo].[Supplier_Company_insert] 
@Full_Organization [varchar] (32),@Short_Organization [varchar] (32),
@Legal_Address [varchar] (max),@Physical_Address [varchar] (max),@ITN [varchar] (12), 
@OKPO [varchar] (8),@BIC [varchar] (9)
as
	begin try
	insert into [dbo].[Supplier_Company] ([Full_Organization], [Short_Organization],[Legal_Address], [Physical_Address], [ITN], [OKPO], [BIC])
	values (@Full_Organization,@Short_Organization,@Legal_Address,@Physical_Address,@ITN,@OKPO,@BIC)
	end try
	begin catch
		print('Данная компания уже есть в таблице!')
	end catch
go

create or alter  procedure [dbo].[Supplier_Company_update]
@ID_Supplier_Company [int],@Full_Organization [varchar] (32),@Short_Organization [varchar] (32),
@Legal_Address [varchar] (max),@Physical_Address [varchar] (max),@ITN [varchar] (12), 
@OKPO [varchar] (8),@BIC [varchar] (9)
as 
	begin try
	update [dbo].[Supplier_Company] set
		[Full_Organization] = @Full_Organization,
		[Short_Organization] = @Short_Organization,
		[Legal_Address] = @Legal_Address,
		[Physical_Address] = @Physical_Address,
		[ITN] = @ITN,
		[OKPO] = @OKPO,
		[BIC] = @BIC
		where
		[ID_Supplier_Company] = @ID_Supplier_Company
	end try
	begin catch
		print('Данная компания уже есть в таблице!')
	end catch
go

create or alter  procedure [dbo].[Supplier_Company_delete]
@ID_Supplier_Company [int]
as
	declare @any_child_record [int] = (select count(*) from [dbo].[Prop]
	where [Supplier_Company_ID] = @ID_Supplier_Company)
	declare @any_child_record1 [int] = (select count(*) from [dbo].[Firm]
	where [Supplier_Company_ID] = @ID_Supplier_Company)
	if (@any_child_record > 0 or @any_child_record > 0)
	print('Компания не может быть удалён, так как в таблице "Компания", есть связанные данные!');
	else
	delete from [dbo].[Supplier_Company] 
		where
		[ID_Supplier_Company] = @ID_Supplier_Company
go
----------------------------------------------------------------------------------------------------------------------------------------------------------------------
create or alter  procedure [dbo].[Client_insert] 
@Type_Client_ID	[INT],@Name	[VARCHAR] (30),@Surname	[VARCHAR] (30),
@Middle_Name	[VARCHAR] (30),@Seria [VARCHAR] (4),@Nomber	[VARCHAR] (6),@Date_Of_Receipt	[DATE],
@Division_Code	[VARCHAR] (7),@Birthday	[DATE],@Issued	[VARCHAR] (MAX),
@Address_Registrion	[VARCHAR] (MAX),@Number_Bank	[VARCHAR] (16),@Payment	[VARCHAR] (30),
@Valid_Until	[VARCHAR] (5),@Owner	[VARCHAR] (MAX),@CVC	[VARCHAR] (3),@Login	[VARCHAR] (32),
@Password	[VARCHAR] (32)
as
	begin try
	insert into [dbo].[Client] ([Type_Client_ID], [Surname], [Name], [Middle_Name], [Login], [Password], [Seria], [Nomber], [Date_Of_Receipt], [Division_Code], [Birthday], [Issued],	[Address_Registrion], [Number_Bank], [Payment], [Valid_Until], [Owner], [CVC])
	values (@Type_Client_ID,@Name,@Surname,@Middle_Name,@Seria,@Nomber,@Date_Of_Receipt,
	@Division_Code,@Birthday,@Issued,@Address_Registrion,@Number_Bank,@Payment,@Valid_Until,
	@Owner,@CVC,@Login,@Password)
	end try
	begin catch
		print('Данный клиент уже есть в таблице!')
	end catch
go

create or alter  procedure [dbo].[Client_update]
@ID_Client [int],@Type_Client_ID	[INT],@Name	[VARCHAR] (30),@Surname	[VARCHAR] (30),
@Middle_Name	[VARCHAR] (30),@Seria [VARCHAR] (4),@Nomber	[VARCHAR] (6),@Date_Of_Receipt	[DATE],
@Division_Code	[VARCHAR] (7),@Birthday	[DATE],@Issued	[VARCHAR] (MAX),
@Address_Registrion	[VARCHAR] (MAX),@Number_Bank	[VARCHAR] (16),@Payment	[VARCHAR] (30),
@Valid_Until	[VARCHAR] (5),@Owner	[VARCHAR] (MAX),@CVC	[VARCHAR] (3),@Login	[VARCHAR] (32),
@Password	[VARCHAR] (32)
as 
	begin try
	update [dbo].[Client] set
		[Type_Client_ID] =  @Type_Client_ID,
		[Name] = @Name,
		[Surname] = @Surname,
		[Middle_Name] = @Middle_Name,
		[Seria] = @Seria,
		[Nomber] = @Nomber,
		[Date_Of_Receipt] = @Date_Of_Receipt,
		[Division_Code] = @Division_Code,
		[Birthday] = @Birthday,
		[Issued] = @Issued,
		[Address_Registrion] = @Address_Registrion,
		[Number_Bank] = @Number_Bank,
		[Payment] = @Payment,
		[Valid_Until] = @Valid_Until,
		[Owner] = @Owner,
		[CVC] = @CVC,
		[Login] = @Login,
		[Password] = @Password
		where
		[ID_Client] = @ID_Client
	end try
	begin catch
		print('Данный клиент уже есть в таблице!')
	end catch
go

create or alter  procedure [dbo].[Client_delete]
@ID_Client [int]
as
	declare @any_child_record [int] = (select count(*) from [dbo].[Booking]
	where [Client_ID] = @ID_Client)
	if (@any_child_record > 0)
	print('Зона не может быть удалён, так как в таблице "Персонал", есть связанные данные!');
	else
	delete from [dbo].[Client] 
		where
		[ID_Client] = @ID_Client
go
----------------------------------------------------------------------------------------------------------------------------------------------------------------------
create or alter  procedure [dbo].[Dish_insert] 
@Component_ID [int],	@Menu_ID [int],	@Shelf_Life [int],	@Photo [image],	@Price [int],	@Weight [int],	@Short_Recital [varchar] (max)
as
	begin try
	insert into [dbo].[Dish] ([Component_ID], [Menu_ID], [Shelf_Life], [Photo], [Price], [Weight], [Short_Recital])
	values (@Component_ID,@Menu_ID,@Shelf_Life,@Photo,@Price,@Weight,@Short_Recital)
	end try
	begin catch
		print('Данное блюдо уже есть в таблице!')
	end catch
go

create or alter  procedure [dbo].[Dish_update]
@ID_Dish [int],@Component_ID [int],	@Menu_ID [int],	@Shelf_Life [int],	@Photo [image],	@Price [int],	@Weight [int],	@Short_Recital [varchar] (max)
as 
	begin try
	update [dbo].[Dish] set
		[Component_ID] = @Component_ID,
		[Menu_ID] = @Menu_ID,
		[Shelf_Life] = @Shelf_Life,
		[Photo] = @Photo,
		[Price] = @Price,
		[Weight] = @Weight,
		[Short_Recital] = @Short_Recital
		where
		[ID_Dish] = @ID_Dish
	end try
	begin catch
		print('Данное блюдо уже есть в таблице!')
	end catch
go

create or alter  procedure [dbo].[Dish_delete]
@ID_Dish [int]
as
	declare @any_child_record [int] = (select count(*) from [dbo].[Reservation]
	where [Dish_ID] = @ID_Dish)
	declare @any_child_record1 [int] = (select count(*) from [dbo].[Food]
	where [Dish_ID] = @ID_Dish)
	if (@any_child_record > 0 or @any_child_record > 0)
	print('Блюдо не может быть удалён, так как в таблице "Блюдо", есть связанные данные!');
	else
	delete from [dbo].[Dish] 
		where
		[ID_Dish] = @ID_Dish
go
----------------------------------------------------------------------------------------------------------------------------------------------------------------------
create or alter  procedure [dbo].[Food_insert] 
@Raw_ID [int],	@Dish_ID [int]
as
	begin try
	insert into [dbo].[Food] ([Raw_ID], [Dish_ID])
	values (@Raw_ID,@Dish_ID)
	end try
	begin catch
		print('Данная еда уже есть в таблице!')
	end catch
go

create or alter  procedure [dbo].[Food_update]
@ID_Food [int],@Raw_ID [int],	@Dish_ID [int]
as 
	begin try
	update [dbo].[Food] set
		[Raw_ID] = @Raw_ID,
		[Dish_ID] = @Dish_ID
		where
		[ID_Food] = @ID_Food
	end try
	begin catch
		print('Данная еда уже есть в таблице!')
	end catch
go

create or alter  procedure [dbo].[Food_delete]
@ID_Food [int]
as
	delete from [dbo].[Food] 
		where
		[ID_Food] = @ID_Food
go
----------------------------------------------------------------------------------------------------------------------------------------------------------------------
create or alter  procedure [dbo].[Contract_insert] 
@Staff_ID [int],@Employee_ID [int],@Nomber_Contract [VARCHAR] (10),@Term_Contract [int]
as
	begin try
	insert into [dbo].[Contract] ([Staff_ID], [Employee_ID],[Nomber_Contract],[Term_Contract])
	values (@Staff_ID,@Employee_ID,@Nomber_Contract,@Term_Contract)
	end try
	begin catch
		print('Данный контракт уже есть в таблице!')
	end catch
go

create or alter  procedure [dbo].[Contract_update]
@ID_Contract [int],@Staff_ID [int],@Employee_ID [int],@Nomber_Contract [VARCHAR] (10),@Term_Contract [int]
as 
	begin try
	update [dbo].[Contract] set
		[Staff_ID] = @Staff_ID,
		[Employee_ID] = @Employee_ID,
		[Nomber_Contract] = @Nomber_Contract,
		[Term_Contract] = @Term_Contract
		where
		[ID_Contract] = @ID_Contract
	end try
	begin catch
		print('Данный контракт уже есть в таблице!')
	end catch
go

create or alter  procedure [dbo].[Contract_delete]
@ID_Contract [int]
as
	delete from [dbo].[Contract] 
		where
		[ID_Contract] = @ID_Contract
go
----------------------------------------------------------------------------------------------------------------------------------------------------------------------
create or alter  procedure [dbo].[Company_insert] 
@Employee_ID [int],@Post_ID [int]
as
	begin try
	insert into [dbo].[Company] ([Employee_ID], [Post_ID])
	values (@Employee_ID,@Post_ID)
	end try
	begin catch
		print('Данная компания уже есть в таблице!')
	end catch
go

create or alter  procedure [dbo].[Company_update]
@ID_Company [int],@Employee_ID [int],@Post_ID [int]
as 
	begin try
	update [dbo].[Company] set
		[Employee_ID] = @Employee_ID,
		[Post_ID] = @Employee_ID
		where
		[ID_Compony] = @ID_Company
	end try
	begin catch
		print('Данная компания уже есть в таблице!')
	end catch
go

create or alter  procedure [dbo].[Company_delete]
@ID_Company [int]
as
	delete from [dbo].[Company] 
		where
		[ID_Compony] = @ID_Company
go
----------------------------------------------------------------------------------------------------------------------------------------------------------------------
create or alter  procedure [dbo].[Booking_insert] 
@Employee_ID [int],@Application_ID [int],@Rest_Area_ID [int],@Client_ID [int],@Date [Date],@Time [Time]
as
	begin try
	insert into [dbo].[Booking] ([Employee_ID], [Application_ID],[Rest_Area_ID],
	[Client_ID],[Date],[Time])
	values (@Employee_ID,@Application_ID,@Rest_Area_ID,@Client_ID,@Date,@Time)
	end try
	begin catch
		print('Данная бронь уже есть в таблице!')
	end catch
go

create or alter  procedure [dbo].[Booking_update]
@ID_Booking [int],@Employee_ID [int],@Application_ID [int],@Rest_Area_ID [int],@Client_ID [int],@Date [Date],@Time [Time]
as 
	begin try
	update [dbo].[Booking] set
		[Employee_ID] = @Employee_ID,
		[Application_ID] = @Application_ID,
		[Rest_Area_ID] = @Rest_Area_ID,
		[Client_ID] = @Client_ID,
		[Date] = @Date,
		[Time] = @Time
		where
		[ID_Booking] = @ID_Booking
	end try
	begin catch
		print('Данная бронь уже есть в таблице!')
	end catch
go

create or alter  procedure [dbo].[Booking_delete]
@ID_Booking [int]
as
	declare @any_child_record [int] = (select count(*) from [dbo].[Cheque]
	where [Booking_ID] = @ID_Booking)
	declare @any_child_record1 [int] = (select count(*) from [dbo].[Reservation]
	where [Booking_ID] = @ID_Booking)
	if (@any_child_record > 0 or @any_child_record1 > 0)
	print('Бронь не может быть удалён, так как в таблице "Персонал", есть связанные данные!');
	else
	delete from [dbo].[Booking] 
		where
		[ID_Booking] = @ID_Booking
go
----------------------------------------------------------------------------------------------------------------------------------------------------------------------
create or alter  procedure [dbo].[Cheque_insert] 
@Booking_ID [int],@Order_Number [int],@Date_Cheque [Date],@Time_Cheque [Time]
as
	begin try
	insert into [dbo].[Cheque] ([Booking_ID],[Order_Number], [Date_Cheque], [Time_Cheque])
	values (@Booking_ID,@Order_Number,@Date_Cheque,@Time_Cheque)
	end try
	begin catch
		print('Данный чек уже есть в таблице!')
	end catch
go

create or alter  procedure [dbo].[Cheque_update]
@ID_Cheque [int],@Booking_ID [int],@Order_Number [int],@Date_Cheque [Date],@Time_Cheque [Time]
as 
	begin try
	update [dbo].[Cheque] set
		[Booking_ID] = @Booking_ID,			
		[Order_Number] = @Order_Number,
		[Date_Cheque] = @Date_Cheque,
		[Time_Cheque] = @Time_Cheque
		where
		[ID_Cheque] = @ID_Cheque
	end try
	begin catch
		print('Данный чек уже есть в таблице!')
	end catch
go

create or alter  procedure [dbo].[Cheque_delete]
@ID_Cheque [int]
as
	delete from [dbo].[Cheque] 
		where
		[ID_Cheque] = @ID_Cheque
go
----------------------------------------------------------------------------------------------------------------------------------------------------------------------
create or alter  procedure [dbo].[Prop_insert] 
@Raw_ID [int],@Supplier_Company_ID [int],@Unique_Number [BIGINT],@Date [Date],@Time [Time]
as
	begin try
	insert into [dbo].[Prop] ([Raw_ID],[Supplier_Company_ID],[Unique_Number],[Date],[Time])
	values (@Raw_ID,@Supplier_Company_ID,@Unique_Number,@Date,@Time)
	end try
	begin catch
		print('Данный реквизит уже есть в таблице!')
	end catch
go

create or alter  procedure [dbo].[Prop_update]
@ID_Prop [int],@Raw_ID [int],@Supplier_Company_ID [int],@Unique_Number [BIGINT],@Date [Date],@Time [Time]
as 
	begin try
	update [dbo].[Prop] set
		[Raw_ID] = @Raw_ID,			
		[Supplier_Company_ID] = @Supplier_Company_ID,
		[Unique_Number] = @Unique_Number,
		[Date] = @Date,
		[Time] = @Time
		where
		[ID_Prop] = @ID_Prop
	end try
	begin catch
		print('Данный реквизит уже есть в таблице!')
	end catch
go

create or alter  procedure [dbo].[Prop_delete]
@ID_Prop [int]
as
	delete from [dbo].[Prop] 
		where
		[ID_Prop] = @ID_Prop
go
----------------------------------------------------------------------------------------------------------------------------------------------------------------------
create or alter  procedure [dbo].[Firm_insert] 
@Supply_ID [int],@Supplier_Company_ID [int]
as
	begin try
	insert into [dbo].[Firm] ([Supply_ID],[Supplier_Company_ID])
	values (@Supply_ID,@Supplier_Company_ID)
	end try
	begin catch
		print('Данная фирма уже есть в таблице!')
	end catch
go

create or alter  procedure [dbo].[Firm_update]
@ID_Firm [int],@Supply_ID [int],@Supplier_Company_ID [int]
as 
	begin try
	update [dbo].[Firm] set
		[Supply_ID] = @Supply_ID,			
		[Supplier_Company_ID] = @Supplier_Company_ID
		where
		[ID_Firm] = @ID_Firm
	end try
	begin catch
		print('Данная фирма уже есть в таблице!')
	end catch
go

create or alter  procedure [dbo].[Firm_delete]
@ID_Firm [int]
as
	delete from [dbo].[Firm] 
		where
		[ID_Firm] = @ID_Firm
go
----------------------------------------------------------------------------------------------------------------------------------------------------------------------
create or alter  procedure [dbo].[Report_insert] 
@Prop_ID [int],@Material_ID [int]
as
	begin try
	insert into [dbo].[Report] ([Prop_ID],[Material_ID])
	values (@Prop_ID,@Material_ID)
	end try
	begin catch
		print('Данный доклад уже есть в таблице!')
	end catch
go

create or alter  procedure [dbo].[Report_update]
@ID_Report [int],@Prop_ID [int],@Material_ID [int]
as 
	begin try
	update [dbo].[Report] set
		[Prop_ID] = @Prop_ID,			
		[Material_ID] = @Material_ID
		where
		[ID_Report] = @ID_Report
	end try
	begin catch
		print('Данный доклад уже есть в таблице!')
	end catch
go

create or alter  procedure [dbo].[Report_delete]
@ID_Report[int]
as
	delete from [dbo].[Report] 
		where
		[ID_Report] = @ID_Report
go
----------------------------------------------------------------------------------------------------------------------------------------------------------------------
create or alter  procedure [dbo].[Reservation_insert] 
@Booking_ID [int],@Dish_ID [int]
as
	begin try
	insert into [dbo].[Reservation] ([Booking_ID],[Dish_ID])
	values (@Booking_ID,@Dish_ID)
	end try
	begin catch
		print('Данное бронирование уже есть в таблице!')
	end catch
go

create or alter  procedure [dbo].[Reservation_update]
@ID_Reservation [int],@Booking_ID [int],@Dish_ID [int]
as 
	begin try
	update [dbo].[Reservation] set
		[Booking_ID] = @Booking_ID,			
		[Dish_ID] = @Dish_ID
		where
		[ID_Reservation] = @ID_Reservation
	end try
	begin catch
		print('Данное бронирование уже есть в таблице!')
	end catch
go

create or alter  procedure [dbo].[Reservation_delete]
@ID_Reservation [int]
as
	delete from [dbo].[Reservation] 
		where
		[ID_Reservation] = @ID_Reservation
go
