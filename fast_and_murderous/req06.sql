SELECT
    r.purchase_date,
    r.first_name,
    r.last_name,
    r.email,
    p.name,
    p.price,
    p.category
FROM
    nexus_stores.receipts r,
    nexus_stores.products p,
    nexus_stores.receipt_items i
WHERE
    i.product_id = p.id AND
    i.receipt_id = r.id AND
    p.name ~* 'apple' AND
    r.email SIMILAR TO 's(a|e)m[a-z]{3,6}\_w[a-z]{6}[0-9]*@roger\_[a-z]+.[a-z]{3}';
