ALTER TABLE migration.patients_records
ADD person_id serial NOT NULL REFERENCES people (id);

UPDATE migration.patients_records AS record
SET
    person_id = ids.person_id
FROM
    medical_confidential.patients_ids ids 
WHERE
    id = ids.patient_id;
