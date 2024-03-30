CREATE TYPE prefix AS ENUM
(
    'MRS',
    'MS',
    'MR',
    'DR'
);

CREATE TABLE IF NOT EXISTS dtf.madelines_contacts
(
    id serial PRIMARY KEY,
    title prefix,
    first_name text,
    last_name text,
    phone text,
    email text,
    favorite boolean,
    created_at timestamp
);
