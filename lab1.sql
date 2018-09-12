create database lab1;
  create table users(
    id SERIAL constraint users_pkey PRIMARY KEY,
    firstname varchar(50),
    lastname varchar(50)
  );
SELECT * FROM users;
ALTER TABLE users ADD COLUMN isadmin INT;
ALTER TABLE users ALTER COLUMN isadmin DROP DEFAULT ;
ALTER TABLE users ALTER COLUMN isadmin TYPE bool using users.isadmin::boolean;
ALTER TABLE users ALTER COLUMN isadmin SET DEFAULT FALSE ;
INSERT INTO users (firstname, lastname) VALUES ('Sam', 'Smith');
INSERT INTO users (firstname, lastname,isadmin) VALUES ('Sam', 'Smith',FALSE );

create TABLE tasks(
  id SERIAL,
  name varchar(50),
  user_id INTEGER
);
  SELECT * FROM tasks;
  DROP TABLE tasks;
  DROP DATABASE lab1;