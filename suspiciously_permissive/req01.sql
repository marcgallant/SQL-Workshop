SELECT
    e1.first_name || ' ' || e1.last_name AS employee_name,
    e2.first_name || ' ' || e2.last_name AS manager_name
FROM
    nexus_intranet.nexus_employees e1
JOIN
    nexus_intranet.nexus_employees e2
ON
    e2.id = e1.manager_id;
