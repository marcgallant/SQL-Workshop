SELECT
    zone.name as zone_name,
    count(DISTINCT data_center_id) as data_center_count,
    count(data_center_id) as total_servers,
    sum(core_count) AS total_cores,
    sum(ram) AS total_ram,
    sum(storage) AS total_storage
FROM
    memorin.geographic_zones zone
JOIN
    memorin.server_hierarchy server
ON
    server.zone_id = zone.id
GROUP BY
    zone_name
ORDER BY
    data_center_count DESC,
    total_servers DESC,
    zone_name ASC;
