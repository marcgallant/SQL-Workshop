CREATE SCHEMA IF NOT EXISTS migration;

DROP TABLE IF EXISTS migration.companies;
CREATE TABLE migration.companies
(
    LIKE companies
    INCLUDING ALL
);

DROP TABLE IF EXISTS migration.jobs;
CREATE TABLE migration.jobs
(
    LIKE jobs
    INCLUDING ALL
);

DROP TABLE IF EXISTS migration.patients_records;
CREATE TABLE migration.patients_records
(
    LIKE patients_records
    INCLUDING ALL
);

DROP TABLE IF EXISTS migration.medical_record_entries;
CREATE TABLE migration.medical_record_entries
(
    LIKE medical_record_entries
    INCLUDING ALL
);

INSERT INTO
    migration.companies
SELECT
    *
FROM
    companies;

INSERT INTO
    migration.jobs
SELECT
    *
FROM
    jobs;

INSERT INTO
    migration.patients_records
SELECT
    *
FROM
    patients_records;

INSERT INTO
    migration.medical_record_entries
SELECT
    *
FROM
    medical_record_entries;
