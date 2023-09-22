use [Restoran_prosedure]
go

create or alter procedure [dbo].[Recreation_area_update]
@ID_Recreation_area [int],@Area_Type [varchar] (25)
as
	update [dbo].[Recreation_area] set
	[Area_Type] = @Area_Type
	where
	[ID_Recreation_area] = @ID_Recreation_area

go
create or alter procedure [dbo].[Recreation_area_insert]
	@Area_Type [varchar] (25)
as
	insert into [dbo].[Recreation_area] ([Area_Type])
		values(@Area_Type)

go
create or alter procedure [dbo].[Recreation_area_delete]
	@ID_Recreation_area [int]
as
	delete from [dbo].[Recreation_area] 
		where
		[ID_Recreation_area] = @ID_Recreation_area
go