/*Queries that provide answers to the questions from all projects.*/

/*Queries that provide answers to the questions from all projects.*/

select * from animals where name like '%mon';
select name from animals where '[2016-01-01,2019-12-31]'::daterange @> date_of_birth;
select name from animals where neutered is true and escape_attempts < 3;
select date_of_birth from animals where name like '%Agumon' or name like '%Pikachu';
select name, escape_attempts from animals where weight_kg > 10.5;
select * from animals where neutered is true;
select * from animals where name not like '%Gabumon';
select * from animals where weight_kg >= 10.4 and weight_kg <= 17.3;

