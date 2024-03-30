CREATE TABLE dtf.shifts_and_sales_78 AS
(
    SELECT
        sale.id AS sales_id,
        sale.product_id AS product_id,
        sale.checkout_id AS checkout_id,
        sale.sale_timestamp AS sale_timestamp,
        shift.id AS shift_id,
        shift.employee_id AS employee_id,
        shift.start_timestamp AS shift_start_timestamp,
        shift.end_timestamp AS shift_end_timestamp
    FROM
        nexus_stores.sales sale
    JOIN
        nexus_stores.cashier_shifts shift
    ON
        sale.checkout_id = shift.checkout_id
    WHERE
        sale.store_id = 78 AND
        timestamp '2059-12-01 14:47:07' BETWEEN shift.start_timestamp AND shift.end_timestamp
);
