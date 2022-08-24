/* Populate database with sample data. */

INSERT INTO animals (id, name, date_of_birth, weight_kg, neutered, escape_attempts) VALUES (1, 'Agumon', '2020-02-03', 10.32, TRUE, 0);

INSERT INTO animals (id, name, date_of_birth, weight_kg, neutered, escape_attempts) VALUES (2, 'Gabumon', '2018-11-25', 8.0, TRUE, 2);

INSERT INTO animals (id, name, date_of_birth, weight_kg, neutered, escape_attempts) VALUES (3, 'Pikachu', '2021-01-07', 15.04, FALSE, 1);

INSERT INTO animals (id, name, date_of_birth, weight_kg, neutered, escape_attempts) VALUES (4, 'Devimon', '2017-05-12', 11, TRUE, 5);

INSERT INTO animals (id, name, date_of_birth, weight_kg, neutered, escape_attempts) VALUES (5, 'Charmander', '2020-02-02', -11, FALSE, 0);

INSERT INTO animals (id, name, date_of_birth, weight_kg, neutered, escape_attempts) VALUES (6, 'Plantmon', '2021-11-15', -5.7, TRUE, 2);

INSERT INTO animals (id, name, date_of_birth, weight_kg, neutered, escape_attempts) VALUES (8, 'Angemon', '2005-06-12', -45, TRUE, 1);

 INSERT INTO animals (id, name, date_of_birth, weight_kg, neutered, escape_attempts) VALUES (9, 'Boarmon', '2005-06-07', 20.4, TRUE, 7);

 INSERT INTO animals (id, name, date_of_birth, weight_kg, neutered, escape_attempts) VALUES (10, 'Blossom', '1998-10-13', 17, TRUE, 3);

 INSERT INTO animals (id, name, date_of_birth, weight_kg, neutered, escape_attempts) VALUES (11, 'Ditto', '2022-05-14', 22, TRUE, 4);

INSERT INTO owners (full_name, age)
VALUES ('Sam Smith', 34);

INSERT INTO owners (full_name, age)
VALUES ('Jennifer Orwell', 19);

INSERT INTO owners (full_name, age)
VALUES ('Bob', 45);

INSERT INTO owners (full_name, age)
VALUES ('Melody Pond', 77);

INSERT INTO owners (full_name, age)
VALUES ('Dean Winchester', 14);

INSERT INTO owners (full_name, age)
VALUES ('Jodie Whittaker', 38);

INSERT INTO species (name)
VALUES ('Pokemon');

INSERT INTO species (name)
VALUES ('Digimon');

UPDATE animals
SET species_id = 2
WHERE name LIKE '%mon%';

UPDATE animals
SET species_id = 1
WHERE name NOT LIKE '%mon%';

 UPDATE animals
SET owners_id = 1
WHERE name = 'Agumon';

UPDATE animals
SET owners_id = 2
WHERE name = 'Gabumon' OR name = 'Pikachu';

UPDATE animals
SET owners_id = 3
WHERE name = 'Plantmon' OR name = 'Devimon';

UPDATE animals
SET owners_id = 4
WHERE name = 'Squirtle' OR name = 'Charmander' OR 'Blossom';
ERROR:  invalid input syntax for type boolean: "Blossom"
LINE 3: WHERE name = 'Squirtle' OR name = 'Charmander' OR 'Blossom';

UPDATE animals
SET owners_id = 4
WHERE name = 'Squirtle' OR name = 'Charmander' OR name = 'Blossom';

UPDATE animals
SET owners_id = 5
WHERE name = 'Boarmon' OR name = 'Angemon';
