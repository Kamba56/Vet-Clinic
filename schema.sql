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
