SELECT
    first_name,
    last_name,
    birth_date,
    job_id,
    social_credit_balance
FROM
    people
WHERE
    social_credit_balance > 0 AND
    death_date IS NULL AND
    job_id IS NOT NULL
ORDER BY
    social_credit_balance DESC,
    birth_date ASC,
    job_id ASC
LIMIT 100
OFFSET 200;
