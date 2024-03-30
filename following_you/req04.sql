(
SELECT
    'metro' as place_type,
    count(DISTINCT person_id) as entries,
    station_id as place_id
FROM
    transport.metro_usage_logs
GROUP BY
    station_id
)
UNION
(
SELECT
    'shop' as place_type,
    count(DISTINCT person_id) as entries,
    shop_id as place_id
FROM
    shop_entrance_logs
GROUP BY
    shop_id
)
ORDER BY
    entries DESC,
    place_id ASC,
    place_type DESC;
