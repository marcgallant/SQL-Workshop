DROP TABLE IF EXISTS nexus_intranet.onboarding_info;
CREATE TABLE IF NOT EXISTS nexus_intranet.onboarding_info AS
WITH RECURSIVE employee_tree AS (
    SELECT
        *,
        1 AS levels_from_ceo
    FROM nexus_intranet.nexus_employees WHERE manager_id IS NULL
    UNION
    SELECT
        nexus_intranet.nexus_employees.*,
        employee_tree.levels_from_ceo + 1 AS levels_from_ceo
    FROM
        nexus_intranet.nexus_employees
    INNER JOIN
        employee_tree
    ON
        nexus_intranet.nexus_employees.manager_id = employee_tree.id
)
SELECT
    e1.manager_id,
    e1.division,
    'arch_home' AS ssh_key_name,
    'ssh-rsa SWV0OUUzcXBSSm4yRUo2cURQSVhEekx3S04ybElKOGQ4ck1zdHZpMndqRlROTHZHVjhHMVg2ZG92aVdFVnB3VkhVTz00a0RFM1NwTHhxZjZzclprY1VsQ2NYbDloPXRlZkFYQXlYQWVmZk1HR0ZNdzhkSDdmNngxUXBlTWhjK3JuWjFNUXJnbEdpRWwrSXBFQnZqU3U9a3lIelFsaD1pV1E2amU5VElacGdBVy92TjRXL0F5cFNLdGcwS216U2MvSXB5QWV5VmY1Z3cyUGE3YnhoRU80Zy85Sz1GPUpVUURGeGRwMy9qR2NqRWF3WGZBbUdXS0NzPTl4VzI1UjhBNVREQUhjZXRhaTdUaG1VYTBIZVlqZnVSTUx3TEtZR0NKcDZ5VjRVUzdVMVBQSFdFeG5zVzBweVRNcGQ9Z3lOQUx4N01acXNxUHVYeUtna0JHbmorV1VIZmVBbDBFdXA9dDBFV3BtQysxZVd5KzlKRzkxbHpr' as ssh_key_value,
    'N'
    || e1.division
    || lpad(CAST(e1.levels_from_ceo as varchar(2)), 2, '0')
    || lpad(CAST(
        (
        SELECT
             count(e1.*)
        FROM
            nexus_intranet.nexus_employees e1
        JOIN
            nexus_intranet.nexus_employees e2
        ON
            e1.manager_id = e2.id
        WHERE
            e2.first_name = 'Arthur' AND
            e2.last_name = 'Polard'
        )
        as varchar(3)), 3, '0')
    || '-'
    || substring(e2.tag from 4 for 5) as tag
FROM
    employee_tree e1
JOIN
    nexus_intranet.nexus_employees e2
ON
    e1.manager_id = e2.id
WHERE
    e2.first_name = 'Arthur' AND
    e2.last_name = 'Polard';
