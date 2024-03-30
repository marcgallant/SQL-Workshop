SELECT
    shift.id,
    checkout.id AS checkout_id,
    shift.employee_id,
    checkout.store_id AS checkout_store_id,
    shift.store_id AS shift_store_id,
    shift.start_timestamp,
    shift.end_timestamp
FROM
    nexus_stores.cashier_shifts shift
LEFT JOIN
    nexus_stores.checkouts checkout
ON
    shift.checkout_id = checkout.id;
