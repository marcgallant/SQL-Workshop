CREATE TABLE IF NOT EXISTS rr_times.translated_headlines
(
    id serial,
    title text NOT NULL,
    subtitle text,

    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS rr_times.issues
(
    id serial PRIMARY KEY,
    issued_at date NOT NULL,

    language varchar(2),
    country varchar(2),
    
    translated_headline_id serial REFERENCES rr_times.translated_headlines (id) ON DELETE RESTRICT,

    UNIQUE (issued_at, language, country),
    
    FOREIGN KEY
    (
        language, country
    )
    REFERENCES rr_times.locales (language_code, country_code) ON DELETE SET NULL
);
