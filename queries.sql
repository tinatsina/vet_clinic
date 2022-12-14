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


-- Queries for Day 3 - Wednesday

select name from animals
inner join owners 
on animals.owner_id = owners.id
where owners.full_name like 'Melody Pond%';

select animals.name from animals
inner join species
on animals.species_id = species.id
where species_id = 2;

select full_name,animals.name from owners
left join animals
on owners.id = animals.owner_id;

select species.name, count(animals.name)
from animals inner join species on animals.species_id = species.id
group by species.name;

select animals.name from animals
inner join owners on animals.owner_id = owners.id
where escape_attempts = 0
and owners.full_name like '%Dean Winchester';

select animals.name from animals
inner join owners on animals.owner_id = owners.id
where species_id = 1
and owners.full_name like '%Jennifer Orwell';

select owners.full_name from owners
left join animals on owners.id = animals.owner_id
group by owners.full_name
order by count(owners.full_name)
desc limit 1;

-- Queries Day 4
select animals.name from animals 
inner join visits on animals.id = visits.animals_id 
where visits.vets_id = 1 
order by visits.date_of_visit 
asc limit 1;

select count(animals.name) from animals
inner join visits on animals.id = visits.animals_id 
where vets_id = 3;

SELECT vets.name, specialization.species_id FROM vets 
left join specialization on vets.id = specialization.vets_id;

select name from animals
inner join visits on animals.id = visits.animals_id 
where date_of_visit > '2020-04-01' 
and date_of_visit < '2020-08-30' 
and visits.vets_id = 3;

select animals.name from animals 
inner join visits on animals.id = visits.animals_id 
group by animals.name 
order by count(*) 
desc limit 1;

select animals.name from animals 
inner join visits on animals.id = visits.animals_id 
where visits.vets_id =2 
and visits.date_of_visit =(select min(date_of_visit) from visits where visits.vets_id = 2);

SELECT animals.name, visits.vets_id, visits.date_of_visit 
FROM animals INNER JOIN visits ON animals.id = visits.animals_id 
WHERE visits.date_of_visit = (SELECT MAX(date_of_visit) FROM visits);

select 
animals.name, 
visits.vets_id, 
visits.date_of_visit 
from animals inner join visits on animals.id = visits.animals_id 
where visits.date_of_visit = (select max(date_of_visit) from visits);

select count(visits.animals_id) from visits 
inner join vets on visits.vets_id = vets.id 
inner join animals on animals.id = visits.animals_id 
inner join specialization on specialization.species_id = vets.id 
where specialization.species_id != animals.species_id;

select animals.species_id, count (*) 
from animals inner join visits on animals.id = visits.animals_id 
where visits.vets_id = 2 
group by animals.species_id 
order by count(*) desc limit 1;
