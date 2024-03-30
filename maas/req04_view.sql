DROP MATERIALIZED VIEW IF EXISTS memorin.outdated_devices;
CREATE MATERIALIZED VIEW memorin.outdated_devices AS
SELECT
    d.serial_number,
    v.id as version_id,
    v.released_at,
    v.eol_timestamp,
    (
    SELECT
        count(DISTINCT v2.id)
    FROM
        memorin.device_versions v2
    WHERE
        v2.released_at > v.released_at
    ) as versions_behind
FROM
    memorin.devices d
JOIN
    memorin.device_versions v
ON
    d.version_id = v.id
WHERE
    deactivated_at IS NULL AND
    v.eol_timestamp IS NOT NULL;
