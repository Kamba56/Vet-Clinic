/*Queries that provide answers to the questions from all projects.*/

SELECT * FROM animals WHERE name LIKE '%mon%';

SELECT * FROM animals WHERE date_of_birth

SELECT * FROM animals WHERE date_of_birth BETWEEN '2016-01-01' AND '2019-12-31';

SELECT date_of_birth FROM animals WHERE name IN ('Agumon', 'Pikachu');

SELECT name, escape_attempts FROM animals WHERE weight_kg > 10.5;

SELECT * FROM animals WHERE neutered = TRUE;SELECT * FROM animals WHERE neutered = TRUE;

SELECT * FROM animals WHERE weight_kg BETWEEN 10.4 AND 17.3;

BEGIN;

UPDATE animals
SET species = 'unspecified';

SELECT * from animals;
ROLLBACK;

SELECT * from animals;

BEGIN;

UPDATE animals SET species = 'digimon' WHERE name LIKE '%mon'; 

UPDATE animals SET species = 'pokemon' WHERE species IS NULL; 

SELECT * from animals;
COMMIT;

SELECT species from animals;

BEGIN;

DELETE FROM animals;
SELECT * FROM animals;

ROLLBACK;
SELECT * FROM animals;

BEGIN;

DELETE FROM animals WHERE  date_of_birth >= '2022/01/01' ;
SAVEPOINT delete_2022_animals;

UPDATE animals SET weight_kg = weight_kg * -1;

ROLLBACK TO delete_2022_animals;

UPDATE animals SET weight_kg = weight_kg * -1 WHERE weight_kg < 0; 

COMMIT;

SELECT COUNT(id) FROM animals;

SELECT COUNT(id) FROM animals
WHERE escape_attempts = 0;

SELECT AVG(weight_kg) FROM animals;

SELECT neutered, SUM(escape_attempts) FROM animals
GROUP BY neutered;

SELECT species, MIN(weight_kg), MAX(weight_kg)
FROM animals
GROUP BY species;

SELECT AVG(escape_attempts) FROM animals
WHERE date_of_birth BETWEEN '1990-01-01' AND '2000-12-31';

SELECT name FROM animals
JOIN owners ON animals.owners_id = owners.id
WHERE owners.full_name = 'Melody Pond';

SELECT animals.name FROM animals
JOIN species ON animals.species_id = species.id
WHERE species.name = 'Pokemon';

SELECT full_name, name FROM owners
LEFT JOIN animals ON owners.id = animals.owners_id;

SELECT COUNT(*) FROM animals
GROUP BY (species_id);

SELECT name FROM animals
JOIN owners ON owners.id = animals.owners_id
WHERE owners.full_name = 'Jennifer Orwell' AND animals.species_id = 2;

SELECT name FROM animals
JOIN owners on owners.id = animals.owners_id
WHERE animals.escape_attempts = 0 AND owners.full_name LIKE '%Dean%';

SELECT owners.full_name, COUNT(animals.owners_id) FROM owners
JOIN animals ON owners.id = animals.owners_id
GROUP BY owners.full_name;
