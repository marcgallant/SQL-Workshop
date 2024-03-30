SELECT
    d.person_id,
    p.first_name,
    p.last_name,
    p.birth_date,
    o.created_at AS conviction_date,
    o.serving_time,
    (o.created_at + o.serving_time * interval '1 month' < timestamp '2059-12-03') AS could_be_released
INTO TABLE
    outcome_status
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
    o.outcome = 'GUILTY' AND
    c.classification = 'CRIME';
