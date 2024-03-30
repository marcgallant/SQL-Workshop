SELECT
    person_id,
    p.first_name as person_first_name,
    p.last_name as person_last_name,
    sub.created_at,
    sub.place,
    sub.place_id
FROM
    (
    (
        SELECT
            person_id,
            created_at,
            'metro' as place,
            station_id as place_id
        FROM
            transport.metro_usage_logs
    )
    UNION
    (
        SELECT
            person_id,
            created_at,
            'shop' as place,
            shop_id as place_id
        FROM
            shop_entrance_logs
    )
    UNION
    (
        SELECT
            person_id,
            created_at,
            'street' as place,
            street_id as place_id
        FROM
            street_logs
    )
    ) as sub
INNER JOIN
    people p
ON
    sub.person_id = p.id
WHERE
    sub.created_at BETWEEN timestamp '2059-12-03 17:00:00' AND timestamp '2059-12-03 22:00:00'
ORDER BY
    created_at ASC,
    person_id ASC;
