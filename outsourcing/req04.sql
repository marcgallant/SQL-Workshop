SELECT
    p.id AS person_id,
    p.first_name,
    p.last_name,
    o.created_at,
    o.serving_time,
    CAST
    (
        o.created_at + (o.serving_time -
        (
            SELECT COALESCE
            (
                (
                    SELECT r.amount
                    FROM
                    justice.sentence_reductions r
                    WHERE
                    r.outcome_id = o.id
                    LIMIT 1
                ),0
            )
        )) * interval '1 month'
        AS timestamp
    ) release_date
INTO TABLE
    release_dates
FROM
    justice.trials t, 
    justice.cases c,
    justice.outcomes o,
    justice.defendants d,
    people p
WHERE 
    d.person_id = p.id AND
    d.trial_id = t.id AND
    t.case_id = c.id AND
    o.trial_id = t.id AND
    o.outcome = 'GUILTY'
ORDER BY
    release_date DESC,
    o.serving_time DESC;
