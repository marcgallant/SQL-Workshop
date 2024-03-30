SELECT
    *
FROM
    (
    SELECT 
        count(*) AS null_employee_id_rows_count
    FROM
        nexus_stores.cashier_shifts
    WHERE
        employee_id IS NULL
    ) a
CROSS JOIN
    (
    SELECT 
        count(*) AS null_store_id_rows_count
    FROM
        nexus_stores.cashier_shifts
    WHERE
        store_id IS NULL
    ) b;
