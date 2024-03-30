INSERT INTO
    scrooge_eats_orders
    (
        id,
        account_id,
        ordered_at
    )
SELECT
    10000,
    id,
    now()
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
