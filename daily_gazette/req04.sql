CREATE TABLE IF NOT EXISTS rr_times.articles
(
    id serial UNIQUE,
    translated_article_id serial REFERENCES rr_times.translated_articles (id) ON DELETE CASCADE,
    rubric_id serial REFERENCES rr_times.rubrics (id) ON DELETE CASCADE,
    language varchar(2),
    country varchar(2),
    FOREIGN KEY
    (
        language, country
    )
    REFERENCES rr_times.locales (language_code, country_code) ON DELETE CASCADE
);
