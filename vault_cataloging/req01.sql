SELECT
    t.id,
    t.filename,
    CASE
        WHEN t.decrypted
        THEN 'File was successfully decrypted.'
        WHEN
            (
            SELECT
                decrypted
            FROM
                dtf.madelines_files_results
            WHERE
                id = t.parent_id
            )
        THEN 'File was successfully decrypted because its containing folder was successfully decrypted.'
        ELSE 'File remains encrypted.'
    END AS decryption_status
FROM
    dtf.madelines_files_results t
ORDER BY
    id ASC;
