CREATE TYPE rr_times.rubric_theme AS ENUM (
    'TECHNOLOGY',
    'ECONOMY',
    'HEALTH',
    'SPORT',
    'CULTURE',
    'POLITICS',
    'SCIENCE',
    'TRAVEL',
    'SOCIETY',
    'ENVIRONMENT',
    'EDUCATION',
    'MEDIA',
    'FASHION',
    'ARCHITECTURE',
    'BUSINESS',
    'SPACE'
);

CREATE TABLE IF NOT EXISTS rr_times.rubrics
(
    id serial UNIQUE,
    theme rr_times.rubric_theme,
    nb_columns integer,
    issue_id serial REFERENCES rr_times.issues (id) ON DELETE CASCADE,

    PRIMARY KEY (theme, issue_id)
);
