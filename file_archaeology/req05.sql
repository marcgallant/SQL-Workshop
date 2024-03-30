SELECT
    owner,
    count(*) AS num_files
FROM
    dtf.madelines_files
GROUP BY
    owner
HAVING
    count(*) = 
    (SELECT
        min(t.num_files)
    FROM
    (
        SELECT
            count(*) AS num_files
        FROM
            dtf.madelines_files
        GROUP BY
            owner
    ) t
    )
ORDER BY
    owner ASC;
