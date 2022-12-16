/* Database schema to keep the structure of entire database. */


 create table animals(
    id int primary key,
    name varchar(32) not null,
    date_of_birth date,
    escape_attempts int,
    neutered boolean,
    weight_kg decimal
  );
  
  -- Wednesday Daily Tasks

 create table owners (
  id SERIAL,
  full_name varchar(32),
  age int,
  PRIMARY KEY (id)
);

create table species (
	id SERIAL,
	name varchar(32),
	PRIMARY KEY (id)
);

alter table animals
add column species_id int references species(id)
on delete cascade;
select * from animals;

alter table animals
add column owner_id int references owners(id)
on delete cascade;
select * from animals;

-- Thursday Daily Tasks
create table vets (
  id serial,
  name varchar(32),
  age int,date_of_graduation date,
  primary key(id)
  );

create table specialization(
  id serial,
  species_id int references species(id) on delete cascade,
  vets_id int references vets(id) on delete cascade,
  primary key(id)
  );

  create table visits (
    id serial,
    date_of_visit date,
    animals_id int references animals(id) on delete cascade,
    vets_id int references vets(id) on delete cascade,
    primary key (id)
  );
