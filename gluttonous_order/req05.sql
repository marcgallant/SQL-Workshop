INSERT INTO
    scrooge_eats_orders
    (
        id,
        account_id,
        ordered_at
    )
SELECT
    10001,
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

INSERT INTO
    scrooge_eats_basket_items
    (
        order_id,
        item_id,
        quantity
    )
SELECT
    10001,
    id,
    1
FROM
    scrooge_eats_items
WHERE
    name = 'Coca-Cola' OR
    name = 'Kinder Bueno White' OR
    name = 'Mushroom risotto';
