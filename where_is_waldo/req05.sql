SELECT DISTINCT
    e.id AS employee_id,
    e.person_id,
    p.first_name,
    p.last_name
FROM
    nexus_stores.employees e
LEFT JOIN
    nexus_stores.cashier_shifts s
ON
    s.employee_id = e.id AND
    s.start_timestamp BETWEEN
    timestamp '2059-12-01 08:00:00' AND
    timestamp '2059-12-01 19:00:00'
INNER JOIN
    people p
ON
    e.person_id = p.id
WHERE
    e.store_id = 78 AND
    e.position = 'CASHIER'

EXCEPT

SELECT DISTINCT
    e.id AS employee_id,
    e.person_id,
    p.first_name,
    p.last_name
FROM
    nexus_stores.employees e
INNER JOIN
    nexus_stores.cashier_shifts s
ON
    s.employee_id = e.id
INNER JOIN
    people p
ON
    e.person_id = p.id
WHERE
    e.store_id = 78 AND
    e.position = 'CASHIER' AND
    s.start_timestamp = timestamp '2059-12-01 13:00:00';
