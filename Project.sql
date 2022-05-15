create table Car_Dealership(
	Dealership_id serial primary key,
	Dealership_name varchar(150)
);
insert into Car_Dealership(Dealership_name)
values('Super Car Emporium')
values ('Rick Hendricks Chevrolet')


select * 
from Car_Dealership

create table Mechanic(
	Mechanic_id serial primary key,
	Dealership_id integer,
	foreign key(Dealership_id) references Car_Dealership(Dealership_id)
);
--Forgot to add the first and last and table and dependencies were already made
--So I used the alter table to add it in.
alter table Mechanic
add Last_name varchar(150);
add First_Name varchar(150);
insert into Mechanic(First_Name, Last_name)
values ('Jimmy', 'Jurner')
values('Timmy', 'Turner')
select *
from Mechanic


create table Salesperson(
	Salesperson_id serial primary key,
	Dealership_id integer,
	foreign key(Dealership_id) references Car_Dealership(Dealership_id),
	First_name varchar(150),
	Last_name varchar(150),
	Total_sales numeric(8,2)
);
insert into Salesperson(First_name, Last_name, Total_sales)
values ('Rick', 'Hendrick', 786958.41)
values('Tony', 'McSleezy', 319405.32)


drop table Salesperson

create table Cars(
	Serial_Number serial primary key,
	Service_History varchar(1000),
	Make varchar(50),
	Model varchar(50),
	Color varchar (50),
	year_ integer
);

insert into Cars(Service_History, Make, Model, Color, year_)
values('Transmission rework. Added M16 Attachment', 'Dodge', 'Charger', 'Black', '2020')
values ('Oil change. Tire rotation. Brakes', 'Honda', 'Accord', 'Gray', 2006)
select *
from Cars


create table Customer(
	Customer_id serial primary key,
	Serial_Number integer,
	foreign key(Serial_Number) references Cars(Serial_Number),
	First_name varchar(150),
	Last_name varchar(150)
);
insert into Customer(First_Name, Last_Name)
values ('John', 'Wayne')
values('Bruce', 'Wayne')



create table Services(
	Service_id serial,
	Service_Ticket Varchar(1000),
	Hourly_rate numeric(5,2),
	Serial_Number integer,
	foreign key(Serial_Number) references Cars(Serial_Number),
	Parts_id integer,
	Mechanic_id integer,
	foreign key(Mechanic_id) references Mechanic(Mechanic_id)
);

insert into Services(Service_Ticket, Hourly_rate, Parts_id)
values ('Today, you are getting your brakes replaced', 250.00, 17)
values ('Today, you are getting an oil change done', 50.00, 0)


create table Invoice(
	Invoice_id serial primary key,
	Serial_Number integer,
	foreign key(Serial_Number) references Cars(Serial_Number),
	Salesperson_id integer,
	foreign key(Salesperson_id) references Salesperson(Salesperson_id),
	Amount numeric(8,2),
	Date_ date
);
insert into Invoice(Amount)
values(32000.32)
values (10000.32)

