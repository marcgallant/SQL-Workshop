DROP VIEW IF EXISTS memorin.zoned_devices_logs;
CREATE VIEW memorin.zoned_devices_logs AS
SELECT
    logs.device_serial,
    logs.version_id,
    logs.zone_id,
    logs.latitude as lat,
    logs.longitude as long,
    logs.temperature as temp,
    logs.battery_percentage as battery,
    logs.signal_strength
FROM
    memorin.device_logs logs
WHERE
    logs.temperature BETWEEN 34 AND 45 AND
    logs.signal_strength BETWEEN 0 AND 5 AND
    logs.battery_percentage BETWEEN 0 AND 100 AND
    EXISTS(
    SELECT
        *
    FROM
        memorin.geographic_zones zones
    WHERE
        logs.zone_id = zones.id AND
        logs.latitude BETWEEN zones.min_latitude AND zones.max_latitude AND
        logs.longitude BETWEEN zones.min_longitude AND zones.max_longitude
    ) AND
    logs.device_serial IN
    (
        SELECT
            serial_number
        FROM
            memorin.devices
        WHERE
            deactivated_at IS NULL
    ) AND
    logs.version_id IN
    (
        SELECT
            id
        FROM
            memorin.device_versions
    )
WITH CHECK OPTION;
