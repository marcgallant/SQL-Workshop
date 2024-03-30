SELECT
    d.person_id,
    p.first_name,
    p.last_name,
    p.birth_date,
    c.classification,
    c.description
INTO TEMPORARY TABLE
    not_guilty
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
    o.outcome = 'NOT_GUILTY';
