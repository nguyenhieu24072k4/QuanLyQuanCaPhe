create database QuanLyQuanCaPhe
go

use QuanLyQuanCaPhe
go


create table TableFood -- bàn thức ăn
(
	id int primary key,
	name nvarchar(100) not null, 
	status nvarchar(100) not null  default N'Trống'-- trạng thái của bàn, ví dụ : bàn trống hay bàn có người
)

create table Account
(
	UserName nvarchar(100) primary key not null , 
	DisplayName nvarchar(100) not null,  -- tên hiện thị 
	Password nvarchar(1000) not null,
	Type int not null,  -- loại tài khoản
)

create table FoodCategory  -- Danh sách đồ ăn
(
	id int primary key,
	name nvarchar(100) not null
)

create table Food
(
	id int primary key,
	name nvarchar(100) not null,
	idCategory int foreign key references FoodCategory(id) not null,
	price float not null
)


create table Bill
(
	id int primary key,
	DateCheckIn date not null default getdate() ,
	DateCheckOut date,
	idTable int foreign key references TableFood(id) not null,
	status int not null default 0, -- 1 : đã thanh toán || 0 : chưa thanh toán
)



create table BillInfo
(
	id int primary key,
	idBill int foreign key references Bill(id) not null,
	idFood int foreign key references Food(id) not null,

)

