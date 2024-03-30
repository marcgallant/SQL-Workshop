SELECT
    parent_id AS folder_id,
    count(*) AS nb_executables
FROM
    dtf.madelines_files
WHERE
    permissions ~* 'x'
GROUP BY
    parent_id
HAVING
    count(*) >= 3
ORDER BY
    folder_id ASC NULLS FIRST;
