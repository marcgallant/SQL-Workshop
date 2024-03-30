SELECT
    id,
    reservation_id
FROM
    gusto_guests
WHERE
    reservation_id IN 
    (
        SELECT
            id
        FROM
            gusto_reservations
        WHERE
            reservation_date >= timestamp '2059-12-03 18:00:00' AND
            reservation_date <= timestamp '2059-12-03 21:00:00' AND
            cancelled != TRUE
    );
