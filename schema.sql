/* Database schema to keep the structure of entire database. */


 create table animals(
    id int primary key,
    name varchar(32) not null,
    date_of_birth date,
    escape_attempts int,
    neutered boolean,
    weight_kg decimal
  );
  