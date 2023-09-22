use [Restoran_DB]
go

----------------------------------------------------------------------------------------------------------------------------------
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
----------------------------------------------------------------------------------------------------------------------------------
create or alter  procedure [dbo].[Supply_insert] 
@Adress_Supply [varchar] (max)
as
	begin try
		insert into [dbo].[Supply] ([Adress_Supply])
		values (@Adress_Supply)
	end try
	begin catch
		throw 50001,'Данный вид поставки уже есть в таблице!',1
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
		throw 50002,'Данный вид поставки уже есть в таблице!',1
	end catch
go

create or alter  procedure [dbo].[Supply_delete]
@ID_Supply [int]
as
	declare @any_child_record [int] = (select count(*) from [dbo].[Firm]
	where [Supply_ID] = @ID_Supply)
	if (@any_child_record > 0)
		throw 50003,'Поставка не может удалён, так как в таблице "Поставка", есть связанные данные!',1
	else
	delete from [dbo].[Supply] 
		where [ID_Supply] = @ID_Supply
go
----------------------------------------------------------------------------------------------------------------------------------
exec [dbo].[Supply_delete] @ID_Supply = 11
go
exec [dbo].[Supply_update] @ID_Supply = 16, @Adress_Supply = '29 Улица'
go
exec [dbo].[Supply_insert] @Adress_Supply = 'Проспект мира сего'
go
select * from Supply
----------------------------------------------------------------------------------------------------------------------------------
insert into [dbo].[Supply] ([Adress_Supply])
values ('SSS')
go
----------------------------------------------------------------------------------------------------------------------------------

----------------------------------------------------------------------------------------------------------------------------------
create login Byers with password = 'Pa$$word'
go
create user Buer from login Byers 
go
----------------------------------------------------------------------------------------------------------------------------------
create login Waiters with password = 'Pa$$word'
go
create user Wait from login Waiters 
go
----------------------------------------------------------------------------------------------------------------------------------
create login Booking_Meneger with password = 'Pa$$word'
go
create user Book from login Booking_Meneger 
go
----------------------------------------------------------------------------------------------------------------------------------
create login Chef with password = 'Pa$$word'
go
create user Cook from login Chef 
go
----------------------------------------------------------------------------------------------------------------------------------
create login Supply_Meneger with password = 'Pa$$word'
go
create user Supp from login Supply_Meneger 
go
----------------------------------------------------------------------------------------------------------------------------------
create login Admins with password = 'Pa$$word'
go
create user AD from login Admins 
go
----------------------------------------------------------------------------------------------------------------------------------

----------------------------------------------------------------------------------------------------------------------------------
grant execute on [dbo].[Client_Insert]
to Buer
grant execute on [dbo].[Client_Update]
to Buer
grant execute on [dbo].[Client_Delete]
to Buer
grant select on [dbo].[Dish_View]
to Buer
----------------------------------------------------------------------------------------------------------------------------------
grant select on [dbo].[Check]
to Wait
----------------------------------------------------------------------------------------------------------------------------------
grant execute on [dbo].[Reservation_Insert]
to Book
grant execute on [dbo].[Reservation_Update]
to Book
grant execute on [dbo].[Reservation_Delete]
to Book
grant execute on [dbo].[Booking_Insert]
to Book
grant execute on [dbo].[Booking_Update]
to Book
grant execute on [dbo].[Booking_Delete]
to Book
grant select on [dbo].[Check]
to Book
----------------------------------------------------------------------------------------------------------------------------------
grant execute on [dbo].[Menu_Insert]
to Cook
grant execute on [dbo].[Menu_Update]
to Cook
grant execute on [dbo].[Menu_Delete]
to Cook
grant execute on [dbo].[Material_Insert]
to Cook
grant execute on [dbo].[Material_Update]
to Cook
grant execute on [dbo].[Material_Delete]
to Cook
grant execute on [dbo].[Dish_Insert]
to Cook
grant execute on [dbo].[Dish_Update]
to Cook
grant execute on [dbo].[Dish_Delete]
to Cook
----------------------------------------------------------------------------------------------------------------------------------
grant execute on [dbo].[Prop_Insert]
to Supp
grant execute on [dbo].[Prop_Update]
to Supp
grant execute on [dbo].[Prop_Delete]
to Supp
grant execute on [dbo].[Report_Insert]
to Supp
grant execute on [dbo].[Report_Update]
to Supp
grant execute on [dbo].[Report_Delete]
to Supp
grant execute on [dbo].[Supply_Insert]
to Supp
grant execute on [dbo].[Supply_Update]
to Supp
grant execute on [dbo].[Supply_Delete]
to Supp
grant execute on [dbo].[Component_Insert]
to Supp
grant execute on [dbo].[Component_Update]
to Supp
grant execute on [dbo].[Component_Delete]
to Supp
grant execute on [dbo].[Raw_Insert]
to Supp
grant execute on [dbo].[Raw_Update]
to Supp
grant execute on [dbo].[Raw_Delete]
to Supp
grant execute on [dbo].[Supplier_Company_Insert]
to Supp
grant execute on [dbo].[Supplier_Company_Update]
to Supp
grant execute on [dbo].[Supplier_Company_Delete]
to Supp
grant execute on [dbo].[Firm_Insert]
to Supp
grant execute on [dbo].[Firm_Update]
to Supp
grant execute on [dbo].[Firm_Delete]
to Supp
grant execute on [dbo].[Firm_Insert]
to Supp
grant execute on [dbo].[Firm_Update]
to Supp
grant execute on [dbo].[Firm_Delete]
to Supp
grant execute on [dbo].[Company_Insert]
to Supp
grant execute on [dbo].[Company_Update]
to Supp
grant execute on [dbo].[Company_Delete]
to Supp
grant select on [dbo].[Prop_View]
to Supp
----------------------------------------------------------------------------------------------------------------------------------

grant execute on [dbo].[Type_Client_Insert]
to AD
grant execute on [dbo].[Type_Client_Update]
to AD
grant execute on [dbo].[Type_Client_Delete]
to AD
grant execute on [dbo].[Post_Insert]
to AD
grant execute on [dbo].[Post_Update]
to AD
grant execute on [dbo].[Post_Delete]
to AD
grant execute on [dbo].[Application_Insert]
to AD
grant execute on [dbo].[Application_Update]
to AD
grant execute on [dbo].[Application_Delete]
to AD
grant execute on [dbo].[Employee_Insert]
to AD
grant execute on [dbo].[Employee_Update]
to AD
grant execute on [dbo].[Employee_Delete]
to AD
grant execute on [dbo].[Staff_Insert]
to AD
grant execute on [dbo].[Staff_Update]
to AD
grant execute on [dbo].[Staff_Delete]
to AD
grant execute on [dbo].[Rest_Area_Insert]
to AD
grant execute on [dbo].[Rest_Area_Update]
to AD
grant execute on [dbo].[Rest_Area_Delete]
to AD
grant execute on [dbo].[Food_Insert]
to AD
grant execute on [dbo].[Food_Update]
to AD
grant execute on [dbo].[Food_Delete]
to AD
grant execute on [dbo].[Contract_Insert]
to AD
grant execute on [dbo].[Contract_Update]
to AD
grant execute on [dbo].[Contract_Delete]
to AD
grant select on [dbo].[Cheque_View]
to AD
----------------------------------------------------------------------------------------------------------------------------------






