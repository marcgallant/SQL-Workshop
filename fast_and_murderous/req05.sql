SELECT
    r.receipt_id,
    p.name,
    r.quantity,
    p.price
FROM
    nexus_stores.products p,
    nexus_stores.receipt_items r
WHERE
    p.id = r.product_id AND
    p.name ~* 'apple' AND
    r.quantity > 10;
