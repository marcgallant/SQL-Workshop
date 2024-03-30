SELECT
    t.id AS trial_id,
    t.case_id,
    c.classification,
    c.description
INTO TABLE
    public.definitive_trials
FROM
    justice.trials t, justice.cases c
WHERE
    t.case_id = c.id AND
    t.status = 'FINISHED';

