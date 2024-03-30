CREATE SCHEMA IF NOT EXISTS rr_times;

CREATE TABLE IF NOT EXISTS rr_times.locales
(
    language_code varchar(2) CONSTRAINT iso_639 CHECK (language_code SIMILAR TO '[a-z]{2}'),
    country_code varchar(2) CONSTRAINT iso_3166 CHECK (country_code SIMILAR TO '[A-Z]{2}'),
    
    name varchar(50) UNIQUE NOT NULL,

    UNIQUE (language_code, country_code)
);

CREATE TABLE IF NOT EXISTS rr_times.translated_articles
(
    id serial,
    title text NOT NULL,
    body text NOT NULL,
    
    PRIMARY KEY (id)
);
