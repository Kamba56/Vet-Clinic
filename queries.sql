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

SELECT animals.name, date_of_visit
FROM visits
JOIN animals ON animals.id = visits.animal_id
JOIN vets ON vets.id = visits.vet_id
WHERE vets.name = 'William Tatcher'
ORDER BY date_of_visit DESC
LIMIT 1;

SELECT animals.name FROM visits
JOIN animals ON animals.id = visits.animal_id
JOIN vets ON vets.id = visits.vet_id
WHERE vets.name = 'Stephanie Mendez'
GROUP BY animals.name;

SELECT vets.name, species.name from specializations s
FULL JOIN vets ON s.vet_id = vets.id
FULL JOIN species ON species.id = s.species_id;

SELECT animals.name, date_of_visit from visits
JOIN vets ON vets.id = visits.vet_id
JOIN animals ON animals.id = visits.animal_id
WHERE vets.name = 'Stephanie Mendez' AND date_of_visit BETWEEN '2020-04-01' AND '2020-08-30';

SELECT animals.name, COUNT(animals.name) FROM visits
JOIN animals ON animals.id = visits.animal_id
GROUP BY animals.name
ORDER BY COUNT(animals.name) DESC
LIMIT 1;

SELECT animals.name, date_of_visit FROM visits
JOIN animals ON animals.id = visits.animal_id
JOIN vets ON vets.id = visits.vet_id
WHERE vets.name = 'Maisy Smith'
ORDER BY date_of_visit ASC
LIMIT 1;

SELECT vets.*, animals.*, date_of_visit FROM visits
JOIN animals ON animals.id = visits.animal_id
JOIN vets ON vets.id = visits.vet_id
ORDER BY date_of_visit DESC
LIMIT 1;

SELECT COUNT(*) FROM visits
JOIN animals ON animals.id = visits.animal_id
JOIN vets ON vets.id = visits.vet_id
WHERE animals.species_id NOT IN (
  SELECT species_id FROM specializations
  WHERE vet_id = vets.id
);

SELECT species.name, COUNT(*) FROM visits
JOIN vets ON vets.id = visits.vet_id
JOIN animals ON animals.id = visits.animal_id
JOIN species ON species.id = animals.species_id
WHERE vets.name = 'Maisy Smith'
GROUP BY species.name;
