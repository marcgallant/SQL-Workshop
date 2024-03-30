INSERT INTO
    scrooge_eats_basket_items
    (
        order_id,
        item_id,
        quantity
    )
SELECT
    10000,
    id,
    1
FROM
    scrooge_eats_items
WHERE
    name = 'Tacos' OR
    name = 'Coca-Cola' OR
    name = 'Kinder Bueno White';
