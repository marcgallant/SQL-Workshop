SELECT
    l.id,
    l.street_id,
    l.created_at,
    l.person_id
FROM
    backup.street_logs l

EXCEPT

SELECT
    id,
    street_id,
    created_at,
    person_id
FROM
    street_logs;
