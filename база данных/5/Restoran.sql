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
	[Value] [varchar] (10) not null
	constraint [PK_Type_Client] primary key clustered
	([ID_Type_Client] ASC) on [PRIMARY],
	constraint [UQ_Value_Type_Client] unique ([Value])
)
go

create table [dbo].[Post]
(
	[ID_Post] [int] not null identity(1,1),
	[Title] [varchar] (32) not null
	constraint [PK_Post] primary key clustered
	([ID_Post] ASC) on [PRIMARY],
	constraint [UQ_Title_Post] unique ([Title])
)
go

create table [dbo].[Menu]
(
	[ID_Menu] [int] not null identity(1,1),
	[Value] [varchar] (max) not null
	constraint [PK_Menu] primary key clustered
	([ID_Menu] ASC) on [PRIMARY]	
)
go

create table [dbo].[Component]
(
	[ID_Component] [int] not null identity(1,1),
	[Structure] [varchar] (32) not null,
	[Volume] [int] not null
	constraint [PK_Component] primary key clustered
	([ID_Component] ASC) on [PRIMARY],
	constraint [UQ_Structure_Component] unique ([Structure]),
	constraint [CH_Volume_Component] check ([Volume] > 0)
)
go

create table [dbo].[Supply]
(
	[ID_Supply] [int] not null identity(1,1),
	[Adress] [varchar] (max) not null
	constraint [PK_Supply] primary key clustered
	([ID_Supply] ASC) on [PRIMARY]
)
go

create table [dbo].[Raw]
(
	[ID_Raw] [int] not null identity(1,1),
	[Component] [varchar] (32) not null,
	[Volume] [int] not null
	constraint [PK_Raw] primary key clustered
	([ID_Raw] ASC) on [PRIMARY],
	constraint [UQ_Component_Raw] unique ([Component]),
	constraint [CH_Volume_Raw] check ([Volume] > 0)
)
go

	create table [dbo].[Material]
	(
		[ID_Material] [int] not null identity(1,1),
		[Component] [varchar] (32) not null,
		[Volume] [int] not null
		constraint [PK_Material] primary key clustered
		([ID_Material] ASC) on [PRIMARY],
		constraint [UQ_Component_Material] unique ([Component]),
		constraint [CH_Volume_Material] check ([Volume] > 0)
	)
	go

create table [dbo].[Application]
(
	[ID_Application] [int] not null identity(1,1),
	[Title] [varchar] (25) not null
	constraint [PK_Application] primary key clustered
	([ID_Application] ASC) on [PRIMARY],
	constraint [UQ_Title_Application] unique ([Title])
)
go

create table [dbo].[Employee]
(
	[ID_Employee] [int] not null identity(1,1),
	[Login] [varchar] (32) not null,
	[Password] [varchar] (32) not null
	constraint [PK_Employee] primary key clustered
	([ID_Employee] ASC) on [PRIMARY],
	constraint [UQ_Login_Employee] unique ([Login]),
	constraint [CH_Login_Employee] check (len([Login])>=8),
	constraint [CH_Password_Employee_Upper] check ([Password] like ('%[A-Z]%')),
	constraint [CH_Password_Employee_Letter_Lower] check ([Password] like ('%[a-z]%')),
	constraint [CH_Password_Employee_Symbols] check ([Password] like ('%[!@#$%^&*()]%'))
)
go

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

create table [dbo].[Rest_Area]
(
	[ID_Rest_Area] [int] not null identity(1,1),
	[Area] [varchar] (30) not null
	constraint [PK_Rest_Area] primary key clustered
	([ID_Rest_Area] ASC) on [PRIMARY],
	constraint [UQ_Area_Rest_Area] unique ([Area])
)
go

create table [dbo].[Supplier_Company]
(
	[ID_Supplier_Company] [int] not null identity(1,1),
	[Full_Organization] [varchar] (32) not null,
	[Short_Organization] [varchar] (32) not null,
	[Legal_Address] [varchar] (max) not null,
	[Physical_Address] [varchar] (max) not null,
	[ITN] [varchar] (10) not null,
	[OKPO] [varchar] (8) not null,
	[BIC] [varchar] (9) not null
	constraint [PK_Supplier_Company] primary key clustered
	([ID_Supplier_Company] ASC) on [PRIMARY],
	constraint [UQ_Full_Organization_Supplier_Company] unique ([Full_Organization]),
	constraint [CH_ITN_Supplier_Company] check ([ITN] = 10),
	constraint [CH_OKPO_Supplier_Company] check ([OKPO] = 8),
	constraint [CH_BIC_Supplier_Company] check ([BIC] = 9)
)
go
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
	[Date_Of_Receipt]	[DATE] null default(getdate()),
	[Division_Code]	[VARCHAR] (7) not null,
	[Birthday]	[DATE] null default(getdate()),
	[Issued]	[VARCHAR] (MAX) not null,
	[Address_Registrion]	[VARCHAR] (MAX) not null,
	[Number_Bank]	[VARCHAR] (16) not null,
	[Payment]	[VARCHAR] (30) not null,
	[Valid_Until]	[DATE] null default(getdate()),
	[Owner]	[VARCHAR] (MAX) not null,
	[CVC]	[VARCHAR] (3) not null,
	[Login]	[VARCHAR] (32) not null,
	[Password]	[VARCHAR] (32) not null
	constraint [PK_Client] primary key clustered
	([ID_Client] ASC) on [PRIMARY],
	constraint [UQ_Login_Client] unique ([Login]),
	constraint [UQ_Number_Bank_Client] unique ([Number_Bank]),
	constraint [CH_Login_Client] check (len([Login])>=8),
	constraint [CH_Password_Client_Upper] check ([Password] like ('%[A-Z]%')),
	constraint [CH_Password_Client_Letter_Lower] check ([Password] like ('%[a-z]%')),
	constraint [CH_Password_Client_Symbols] check ([Password] like ('%[!@#$%^&*()]%')),
	constraint [CH_CVC_Client] check ([CVC] = 3),
	constraint [CH_CVC_Client_INT] check ([CVC] like '[0-9][0-9][0-9]'),
	constraint [CH_Number_Bank_Client] check ([Number_Bank] = 16),	
	constraint [CH_Number_Bank_Client_INT] check ([Number_Bank] like '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'),
	constraint [CH_Seria_Client] check ([Seria] = 4),
	constraint [CH_Seria_Client_INT] check ([Seria] like '[0-9][0-9][0-9][0-9]'),
	constraint [CH_Division_Code_Client] check ([Division_Code] like '[0-9][0-9][0-9][-][0-9][0-9][0-9]'),
	constraint [CH_Nomber_Client] check ([Nomber] = 5),
	constraint [CH_Nomber_Client_INT] check ([Nomber] like '[0-9][0-9][0-9][0-9][0-9][0-9]'),
	constraint [FK_Type_Client] foreign key ([Type_Client_ID]) references [dbo].[Type_Client] ([ID_Type_Client]),
	constraint [UQ_Seria_Nomber_Client] unique ([Nomber], [Seria]),
	constraint [CH_Birthday_Client] check ([Birthday] < getdate()),
	constraint [CH_Date_Of_Receipt_Client] check ([Date_Of_Receipt] > getdate())
)
go


-----------------------------------------------------------------------------------------------------------------

create table [dbo].[Dish]
(
	[ID_Dish] [int] not null identity(1,1),
	[Component_ID] [int] not null,
	[Menu_ID] [int] not null,
	[Shelf_Life] [date] default (format(Getdate(),'dd-MM-yyyy')),
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
)
go

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

create table [dbo].[Contract]
(
	[ID_Contract] [int] not null identity(1,1),
	[Staff_ID] [int] not null,
	[Employee_ID] [int] not null,
	[Nomber] [VARCHAR] (10) not null,
	[Term] [int] not null
	constraint [PK_Contract] primary key clustered
	([ID_Contract] ASC) on [PRIMARY],
	constraint [FK_Staff] foreign key ([Staff_ID])
	references [dbo].[Staff] ([ID_Staff]),
	constraint [FK_Employee_Contract] foreign key ([Employee_ID])
	references [dbo].[Employee] ([ID_Employee]),
	constraint [CH_Nomber_Contract] check ([Nomber] like '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'),
	constraint [UQ_Nomber_Contract] unique ([Nomber]),
	constraint [CH_Term_Contract] check ([Term] > 0)
)
go

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
	constraint [CH_Date_Booking] check ([Date] > getdate()),
	constraint [CH_Time_Booking] check ([Time] > Convert(time, SYSDATETIME()))
)
go

create table [dbo].[Cheque]
(
	[ID_Cheque] [int] not null identity(1,1),
	[Booking_ID] [int] not null,
	[Order_Number] [int] not null,
	[Date] [date] null default(getdate()),
	[Time] [time] null default(Convert(time, SYSDATETIME()))
	constraint [PK_Cheque] primary key clustered
	([ID_Cheque] ASC) on [PRIMARY],
	constraint [FK_Booking_Cheque] foreign key ([Booking_ID])
	references [dbo].[Booking] ([ID_Booking])
)
go

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

create table [dbo].[Prop]
(
	[ID_Prop] [int] not null identity(1,1),
	[Raw_ID] [int] not null,
	[Supplier_Company_ID] [int] not null,
	[Unique_Number]	[BIGINT] not null,
	[Date] [date] null default(getdate()),
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