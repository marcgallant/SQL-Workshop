SELECT
    id
FROM
    scrooge_eats_accounts
WHERE
    company_id IN
    (
        SELECT
            id
        FROM
            companies
        WHERE
            name = 'DTF'
    );
