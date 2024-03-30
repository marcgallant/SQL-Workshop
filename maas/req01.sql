DROP VIEW IF EXISTS memorin.devices_summary;
CREATE VIEW memorin.devices_summary AS
SELECT    
    count(*) as total_devices,
    count(*) FILTER (WHERE deactivated_at IS NULL) active_devices,
    count(*) FILTER (WHERE deactivated_at IS NOT NULL) as inactive_devices
FROM
    memorin.devices;
