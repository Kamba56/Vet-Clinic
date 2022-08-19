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