create table driver_data(
	App_no int,
	Type varchar(155),
	City varchar(155),
	Status varchar(150),
	FRU_Interview_Scheduled varchar(150),
	Drug_Test varchar(150)
)

copy driver_data from 'C:\Program Files\PostgreSQL\16\Backup\driver_data.csv' DELIMITER ',' CSV Header;

select * from driver_data

create table Population_data(

	City Varchar(100),	
	Country	varchar (150),
	Population_24 int,
	Population_23 int,	
	Growth_Rate int
)

Copy population_data from 'C:\Program Files\PostgreSQL\16\Backup\population_data.csv' delimiter ',' csv header

select * from population_data

create table employee_data(
	ID	int,
	Gender varchar(20),
	Experience int,
	Position varchar(150),
	Salary int,
	City varchar(100)
)

copy employee_data from 'C:\Program Files\PostgreSQL\16\Backup\employee_data.csv' delimiter ',' csv header;

select * from employee_data

--inner join
select da.app_no,da.status,da.drug_test,ea.position,sum(ea.salary),ea.city,pa.country,pa.population_24,pa.growth_rate from driver_data as da
inner join employee_data as ea 
on da.city=ea.city
inner join population_data as pa
on da.city=pa.city
group by da.app_no,da.status,da.drug_test,ea.position,ea.city,pa.country,pa.population_24,pa.growth_rate 
having sum(ea.salary)>10000

--left join
select da.app_no,da.status,da.drug_test,ea.position,sum(ea.salary),ea.city,pa.country,pa.population_24,pa.growth_rate from driver_data as da
left join employee_data as ea 
on da.city=ea.city
left join population_data as pa
on da.city=pa.city
group by da.app_no,da.status,da.drug_test,ea.position,ea.city,pa.country,pa.population_24,pa.growth_rate 
having sum(ea.salary)<100000
limit 60


--Right join

select da.app_no,da.status,da.drug_test,ea.position,sum(ea.salary),ea.city,pa.country,pa.population_24,pa.growth_rate from driver_data as da
right join employee_data as ea 
on da.city=ea.city
right join population_data as pa
on da.city=pa.city
group by da.app_no,da.status,da.drug_test,ea.position,ea.city,pa.country,pa.population_24,pa.growth_rate 
having sum(ea.salary)<150000
limit 1000
offset 50

--full

select da.app_no,da.status,da.drug_test,ea.position,sum(ea.salary),ea.city,pa.country,pa.population_24,pa.growth_rate from driver_data as da
full join employee_data as ea 
on da.city=ea.city
full join population_data as pa
on da.city=pa.city
group by da.app_no,da.status,da.drug_test,ea.position,ea.city,pa.country,pa.population_24,pa.growth_rate 
having sum(ea.salary)<100000
limit 500
