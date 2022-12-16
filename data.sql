/* Populate database with sample data. */

insert into animals(id,name,date_of_birth,escape_attempts,neutered,weight_kg) values (0,'Agumon','2020-02-03',0,true,10.23);
insert into animals(id,name,date_of_birth,escape_attempts,neutered,weight_kg) values (1,'Gabumon','2018-11-15',2,true,8);
insert into animals(id,name,date_of_birth,escape_attempts,neutered,weight_kg) values (2,'Pikachu','2021-01-07',1,false,15.04);
insert into animals(id,name,date_of_birth,escape_attempts,neutered,weight_kg) values (3,'Devimon','2017-05-12',5,true,11);
insert into animals(id,name,date_of_birth,escape_attempts,neutered,weight_kg) values (4,'Charmander','2020-02-08',0,false,-11);
insert into animals(id,name,date_of_birth,escape_attempts,neutered,weight_kg) values (5,'Plantom','2021-11-15',2,true,-5.7);
insert into animals(id,name,date_of_birth,escape_attempts,neutered,weight_kg) values (6,'Squirtle','1993-04-02',3,false,-12.3);
insert into animals(id,name,date_of_birth,escape_attempts,neutered,weight_kg) values (7,'Angemon','2005-06-12',1,true,-45);
insert into animals(id,name,date_of_birth,escape_attempts,neutered,weight_kg) values (8,'Boarmon','2005-06-07',7,true,20.4);
insert into animals(id,name,date_of_birth,escape_attempts,neutered,weight_kg) values (9,'Blossom','1998-10-13',3,true,3);
insert into animals(id,name,date_of_birth,escape_attempts,neutered,weight_kg) values (10,'Ditto','2022-05-14',4,true,22);

-- Day 3 Data Files
insert into owners (full_name,age) values ('Sam Smith',34);
insert into owners (full_name,age) values ('Jeniffer Orwell',19);
insert into owners (full_name,age) values ('Bob',45);
insert into owners (full_name,age) values ('Melody Pond',77);
insert into owners (full_name,age) values ('Dean Winchester',14);
insert into owners (full_name,age) values ('Jodie Whittaker',38);

update animals
set species_id = 1 where name like '%mon';
select * from animals;

update animals
set species_id = 2 where species_id is null;
select * from animals;

update animals
set owner_id = 1 where name like 'Agumon%';
select * from animals;

update animals
set owner_id = 2 where name like 'Charmander%' or name like 'Squirtle%' or name like 'Blossom%';
select * from animals;

update animals
set owner_id = 3 where name like 'Devimon%' or name like 'Plantom%';
select * from animals;

update animals
set owner_id = 4 where name like 'Charmander%' or name like 'Squirtle%' or name like 'Blossom%';
select * from animals;

update animals
set owner_id = 5 where name like 'Angemon%' or name like 'Boarmon%';
select * from animals;

-- Day 4 Thursday Data Queris

insert into vets(name,age,date_of_graduation) values ('William Tatcher',45,'2000-04-23');
insert into vets(name,age,date_of_graduation) values ('Maisy Smith',26,'2019-01-17');
insert into vets(name,age,date_of_graduation) values ('Stephanie Mendez',64,'1981-05-04');
insert into vets(name,age,date_of_graduation) values ('Jack Harness',38,'2008-06-08');

insert into specialization (vets_id,species_id) values (1,2);
insert into specialization (vets_id,species_id) values (3,1);
insert into specialization (vets_id,species_id) values (3,2);
insert into specialization (vets_id,species_id) values (4,1);

insert into visits (animals_id,vets_id,date_of_visit) values (0,1,'2020-05-24');
insert into visits (animals_id,vets_id,date_of_visit) values (0,3,'2020-07-22');
insert into visits (animals_id,vets_id,date_of_visit) values (1,4,'2021-02-02');
insert into visits (animals_id,vets_id,date_of_visit) values (2,2,'2020-01-05');
insert into visits (animals_id,vets_id,date_of_visit) values (2,2,'2020-03-08');
insert into visits (animals_id,vets_id,date_of_visit) values (2,2,'2020-05-14');
insert into visits (animals_id,vets_id,date_of_visit) values (3,3,'2021-05-04');
insert into visits (animals_id,vets_id,date_of_visit) values (4,4,'2021-02-24');
insert into visits (animals_id,vets_id,date_of_visit) values (5,2,'2019-12-21');
insert into visits (animals_id,vets_id,date_of_visit) values (5,1,'2020-08-10');
insert into visits (animals_id,vets_id,date_of_visit) values (5,2,'2021-04-07');
insert into visits (animals_id,vets_id,date_of_visit) values (6,3,'2019-09-29');
insert into visits (animals_id,vets_id,date_of_visit) values (7,4,'2020-10-03');
insert into visits (animals_id,vets_id,date_of_visit) values (7,4,'2020-11-04');
insert into visits (animals_id,vets_id,date_of_visit) values (8,2,'2019-01-24');
insert into visits (animals_id,vets_id,date_of_visit) values (8,2,'2019-05-15');
insert into visits (animals_id,vets_id,date_of_visit) values (8,2,'2020-02-27');
insert into visits (animals_id,vets_id,date_of_visit) values (8,2,'2020-08-03');
insert into visits (animals_id,vets_id,date_of_visit) values (9,3,'2020-05-24');
insert into visits (animals_id,vets_id,date_of_visit) values (9,1,'2021-02-11');