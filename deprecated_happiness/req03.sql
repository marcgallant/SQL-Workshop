ALTER TABLE
    migration.companies
ADD
    growth numeric(6,2) NOT NULL DEFAULT 0 CONSTRAINT positive CHECK (growth >= 0);
