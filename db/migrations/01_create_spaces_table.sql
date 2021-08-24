CREATE DATABASE spaces;
CREATE TABLE spaces(id serial PRIMARY KEY,
 name VARCHAR(100), description VARCHAR(500), price INTEGER);

 for testing environment
 CREATE DATABASE spaces_test;
 CREATE TABLE spaces(id serial PRIMARY KEY,
  name VARCHAR(100), description VARCHAR(500), price INTEGER);