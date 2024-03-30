DROP VIEW IF EXISTS devices_metrics;
CREATE TEMPORARY VIEW devices_metrics AS
SELECT
    e2.device_serial,
    e2.version_id,
    e2.id AS log_id,
    e2.latitude AS lat,
    e2.longitude AS long,
    e2.temperature AS temp,
    e2.battery_percentage AS battery,
    e2.signal_strength AS signal_strength
FROM
    memorin.devices e1
JOIN
    memorin.device_logs e2
ON
    e1.serial_number = e2.device_serial
JOIN
    memorin.device_versions v
ON
    v.id = e2.version_id
WHERE
    e1.deactivated_at IS NULL
ORDER BY
    device_serial ASC,
    released_at DESC,
    log_id ASC;
