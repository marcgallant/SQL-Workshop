SELECT
    t.person_id,
    c.id,
    t.content,
    c.description
FROM 
    justice.cases c,
    justice.testimonies t
WHERE
    t.content LIKE '%Nexus N3%' AND
    t.case_id = c.id AND
    (
        c.description LIKE '%speeding%' OR
        c.description LIKE '%speed%' OR
        c.description LIKE '%fast%' OR
        c.description LIKE '%reckless%'
    );
