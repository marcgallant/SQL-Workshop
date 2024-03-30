SELECT
    id,
    size as stored_size,
    decrypted,
    CASE
        WHEN size IS NULL AND decrypted THEN
            avg_decrypted_size
        WHEN size IS NULL AND NOT decrypted THEN
            avg_encrypted_size
        ELSE
            size
    END as calculated_size
FROM
    (
    SELECT
        *
    FROM
        dtf.madelines_files_results 
    WHERE
        parent_id IS NOT NULL
    ) regular_file,
    (
    SELECT
        CAST (avg(size) as bigint) as avg_decrypted_size
    FROM
        dtf.madelines_files_results 
    WHERE
        parent_id IS NOT NULL AND
        decrypted
    ) t1,
    (
    SELECT
        CAST (avg(size) as bigint) as avg_encrypted_size
    FROM
        dtf.madelines_files_results 
    WHERE
        parent_id IS NOT NULL AND
        NOT decrypted
    ) t2
ORDER BY
    id ASC;
