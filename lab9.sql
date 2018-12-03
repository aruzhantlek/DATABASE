create database lab8;

create table salesman (
	salesman_id integer primary key,
	name varchar(256),
	city varchar(256),
	commission numeric(3, 2)
);
create table customers (
	customer_id integer primary key,
	cust_name varchar(256),
	city varchar(256),
	grade integer,
	salesman_id integer references salesman
);

create table orders (
	ord_no integer primary key,
	purch_amt real,
	ord_date date,
	customer_id integer references customers,
	salesman_id integer references salesman
);

create role junior_dev login password 'itsasecret';

create view salesman_view1 as select * from salesman where city = 'New York';

create view join_view1 as select s.name, c.cust_name from salesman as s inner join customers as c using(salesman_id);
grant all privileges on join_view1 to junior_dev;


create view customer_view1 as select * from customers order by grade desc nulls last limit 1 offset 0;
grant select on customer_view1 to junior_dev;


create view salesman_view2 as select city, count(salesman_id) from salesman group by city;

select s.name, count(*) from salesman s inner join customers c using(salesman_id) group by salesman_id having count(*) > 1;

create role intern;
reassign owned by junior_dev to intern;