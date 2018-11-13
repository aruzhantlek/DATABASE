create database lab8;

create index index1 on countries using hash (name); 

create index index2 on countries using hash (name, surname); 

create unique index index3 on employees (salary);

create index index4 on employees (substring(name from 1 to 4)); 

create index index5 on employees (department_id, salary);

create index index6 on departments (department_id, budget); 