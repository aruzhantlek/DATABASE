create database lab2;

  create table countries(
    country_id SERIAL constraint countries_pkey PRIMARY KEY,
    country_name varchar(50),
    region_id INTEGER,
    population INTEGER
  );
select * from countries;
INSERT INTO countries values ('23','Italy', 150, 4560000);
INSERT INTO countries(country_id,country_name) values ('24', 'France');
INSERT INTO countries(region_id) values (NULL);
INSERT INTO countries(country_name,region_id,population) values
                                                                 ('China',120,3489900),
                                                                 ('USA',178,69090900),
                                                                 ('Spain',120,312679);
ALTER TABLE countries ALTER column country_name SET DEFAULT 'Kazakhstan';

INSERT INTO countries (country_name,region_id,population) VALUES (default ,5,189090909);
INSERT INTO countries DEFAULT VALUES ;

CREATE TABLE countries_new (
  LIKE countries
);

INSERT INTO countries_new
select * FROM countries ;

UPDATE countries SET region_id=1 WHERE region_id is NULL ;

UPDATE countries
SET population= (population * 0,1) +population
RETURNING country_name, population AS "New Population";

DELETE FROM countries
where population >100000;

DELETE FROM countries_new as cn USING countries as c
where cn.country_id=c.country_id
returning *;

DELETE FROM countries
RETURNING *;