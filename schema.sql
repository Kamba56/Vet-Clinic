/* Database schema to keep the structure of entire database. */
CREATE DATABASE vet_clinic;

-- We will use an artificial PK
CREATE TABLE animals(
  id INT,
  name VARCHAR(200),
  date_of_birth DATE,
  escape_attempts INT,
  neutered BOOLEAN,
  weight_kg DECIMAL,
  PRIMARY KEY(id)
);

ALTER TABLE animals
ADD species CHAR(200);

CREATE TABLE owners (
  id INT GENERATE ALWAYS AS IDENTITY,
  full_name CHAR(200),
  age INT,
  PRIMARY KEY(id)
);

CREATE TABLE species (
 id INT GENERATED ALWAYS AS IDENTITY,
 name CHAR(200),
 PRIMARY KEY(id)
);

ALTER TABLE animals
ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY;

ALTER TABLE animals
DROP COLUMN species;

ALTER TABLE animals
ADD COLUMN species_id INT REFERENCES species(id);

ALTER TABLE animals
ADD COLUMN owners_id INT REFERENCES owners(id);

CREATE TABLE vets (
  id INT GENERATED ALWAYS AS IDENTITY,
  name CHAR(200),
  age INT,
  date_of_graduation DATE,
  PRIMARY KEY (id)
);

CREATE TABLE specializations (
  vet_id INT REFERENCES vets(id),
  species_id INT REFERENCES species(id),
  PRIMARY KEY (vet_id, species_id)
);

CREATE TABLE visits (
  animal_id INT REFERENCES animals(id),
  vet_id INT REFERENCES vets(id),
  date_of_visit DATE,
  PRIMARY KEY (animal_id, vet_id, date_of_visit)
);
