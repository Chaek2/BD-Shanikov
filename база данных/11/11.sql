use [Restoran_DB]
go

create table [dbo].[Check](
	[ID_Check] [uniqueidentifier] not null,
	[Check_info] [varchar] (max) not null,
	[DateTime_Check] [datetime] not null
	constraint [PK_Check] primary key clustered
	([ID_Check] ASC) on [PRIMARY]
)

create or alter trigger [dbo].[Check_Update]
on [dbo].[Supply] after update
as
	begin
		declare @ID_Supply [int] = (select [ID_Supply] from [dbo].[Supply])
		begin 
		update [dbo].[Check] set
		[Check_info] = (select [Adress_Supply] from [dbo].[Supply] where [ID_Supply] = @ID_Supply), 
		[DateTime_Check] = getdate()
		where [Check_info] = (select [Adress_Supply] from [dbo].[Supply] where [ID_Supply] = @ID_Supply)
	print('Insert Record Complete!')
		end
	end
go

create or alter trigger [dbo].[Check_Insert]
on [dbo].[Supply] after insert
as
	declare @ID_Supply [int] = (select [ID_Supply] from [inserted])
	begin 
		insert into [dbo].[Check] ([ID_Check], [Check_info], [DateTime_Check])
		values (NEWID(),
		(select [Adress_Supply] from [dbo].[Supply] where [ID_Supply] = @ID_Supply),
		getdate())
	print('Insert Record Complete!')
	end
go

create or alter trigger [dbo].[Check_Delete]
on [dbo].[Supply] after delete
as
	declare @ID_Supply [int] = (select distinct([ID_Supply]) from [dbo].[Supply])	
	declare @Adress_Supply [varchar] (max) = (select [Adress_Supply] from [dbo].[Supply] where [ID_Supply] = @ID_Supply)		
	begin
		delete from [dbo].[Check]
			where [Check_info] = (select [ID_Supply] from [dbo].[Supply])
		print ('Delete Record Complete!')
	end
go

select * from [dbo].[Check]
select * from [dbo].[Supply]


exec [dbo].[Supply_insert] @Adress_Supply = '1 переулок'
go 
exec [dbo].[Supply_insert] @Adress_Supply = '2 переулок'
go 
exec [dbo].[Supply_insert] @Adress_Supply = '3 переулок'
go 
exec [dbo].[Supply_insert] @Adress_Supply = '4 переулок'
go 
exec [dbo].[Supply_insert] @Adress_Supply = '5 переулок'
go 


exec [dbo].[Supply_update] @ID_Supply = 11, @Adress_Supply = '1 переулок'
go 
exec [dbo].[Supply_update] @ID_Supply = '12', @Adress_Supply = '12 переулок'
go 
exec [dbo].[Supply_update] @ID_Supply = '13', @Adress_Supply = '13 переулок'
go 
exec [dbo].[Supply_update] @ID_Supply = '14', @Adress_Supply = '14 переулок'
go 
exec [dbo].[Supply_update] @ID_Supply = '15', @Adress_Supply = '15 переулок'
go 

create or alter function [dbo].[Check_See] (@Date [date]) 
returns table
as	
		return(select [Check_info] as "Информация", [DateTime_Check] as "Дата"  from [dbo].[Check]			
		where [DateTime_Check] > @Date)	
go
select * from [dbo].[Check_See] (GETDATE())
go

