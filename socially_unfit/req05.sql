SELECT
    id,
    person_id,
    credits_change,
    action_description
FROM
    social_credit_history
WHERE
    date >= timestamp '2059-12-03 17:00' AND
    date <= timestamp '2059-12-03 22:00'
ORDER BY
    credits_change ASC,
    id ASC
LIMIT 10
