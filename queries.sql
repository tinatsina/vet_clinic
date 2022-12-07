/*Queries for Day 1.*/

select * from animals where name like '%mon';
select name from animals where '[2016-01-01,2019-12-31]'::daterange @> date_of_birth;
select name from animals where neutered is true and escape_attempts < 3;
select date_of_birth from animals where name like '%Agumon' or name like '%Pikachu';
select name, escape_attempts from animals where weight_kg > 10.5;
select * from animals where neutered is true;
select * from animals where name not like '%Gabumon';
select * from animals where weight_kg >= 10.4 and weight_kg <= 17.3;

/*Queries Day 2 */

-- Task 1
BEGIN;
update animals set species = 'unspecified';
ROLLBACK;

-- Task 2
BEGIN;
update animals set species = 'digimon' where name like '%mon';
update animals set species = 'pokemon' where species is null;
COMMIT;
select * from animals;

-- Task 3
BEGIN;
delete from animals;
ROLLBACK;
select * from animals;

-- Task 4
delete from animals where date_of_birth > '2020-01-01'::date;
savepoint first_deletion;
update animals set weight_kg = (weight_kg*-1);
rollback to savepoint first_deletion;
update animals set weight_kg = (weight_kg*-1) where weight_kg < 0;
commit;

-- Task 5

select count(*) from animals;
select count(*) from animals where escape_attempts = 0;
select avg(weight_kg) from animals;
select neutered, sum(escape_attempts) from animals group by neutered;

-- Task 6
select species, avg(escape_attempts) from animals where date_of_birth between '1990-01-01' and '2020-12-31' group by species;

