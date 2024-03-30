DROP VIEW IF EXISTS memorin.server_hierarchy;
CREATE RECURSIVE VIEW memorin.server_hierarchy
(
    id,
    zone_id,
    core_count,
    ram,
    storage,
    data_center_id
)
AS
    SELECT
        id,
        zone_id,
        core_count,
        ram,
        storage,
        id as data_center_id
    FROM
        memorin.servers
    WHERE
        master_id IS NULL
    UNION
    SELECT
        server.id,
        server.zone_id,
        server.core_count,
        server.ram,
        server.storage,
        hierarchy.data_center_id AS data_center_id
    FROM
        memorin.servers server
    INNER JOIN
        server_hierarchy hierarchy
    ON
        server.master_id = hierarchy.id;
