SELECT
    p.id,
    p.first_name,
    p.last_name
FROM
    people p
WHERE
    EXISTS
    (
    SELECT
        person_id
    FROM
        transport.metro_usage_logs l
    INNER JOIN
        transport.metro_stations s
    ON
        l.station_id = s.id 
    WHERE
        name = 'Morgane Abeille' AND
        p.id = l.person_id
    );
