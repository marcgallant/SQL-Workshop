SELECT
    first_name,
    last_name,
    death_date,
    social_credit_balance
FROM
    people
ORDER BY death_date DESC NULLS LAST, social_credit_balance DESC
LIMIT 100;
