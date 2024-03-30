CREATE TEMPORARY TABLE trimmed
(
    id serial,
    full_name text,
    phone text,
    email text,
    favorite text,
    created_at text
);

INSERT INTO
    trimmed
SELECT
    id,
    regexp_replace(regexp_replace(full_name, '[^[:ascii:]]', '', 'g'), '[[:digit:]]', '', 'g'),
    regexp_replace(regexp_replace(phone, '[^[0-9.-]', '', 'g'), '-', '.', 'g'),
    regexp_replace(email, '[^[:ascii:]]', '', 'g'),
    favorite,
    created_at
FROM
    dtf.madelines_contacts_corrupted;

INSERT INTO 
    dtf.madelines_contacts
    (
        id,
        title,
        first_name,
        last_name,
        phone,
        email,
        favorite,
        created_at
    )
SELECT
    id,
    CAST(upper(split_part(full_name, ' ', 1)) AS prefix),
    initcap(lower(split_part(full_name, ' ', 2))),
    initcap(lower(split_part(full_name, ' ', 3))),
    lpad(split_part(phone, '.', 1), 3, '0') || '.' ||
    lpad(split_part(phone, '.', 2), 3, '0') || '.' ||
    lpad(split_part(phone, '.', 3), 3, '0'),
    email,
    CASE
        WHEN favorite = '1' THEN true
        ELSE false
    END,
    CAST (created_at AS timestamp)
FROM
    trimmed;
