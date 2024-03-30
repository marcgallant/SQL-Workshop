SELECT
    filename,
    size
FROM
    dtf.madelines_files
WHERE
    size =
    (SELECT
        max(size)
    FROM
        dtf.madelines_files
    WHERE
        created_at BETWEEN timestamp '12/04/2059' - interval '1 week' AND timestamp '12/04/2059'
    )
    AND created_at BETWEEN timestamp '12/04/2059' - interval '1 week' AND timestamp '12/04/2059'
ORDER BY
    filename ASC;
