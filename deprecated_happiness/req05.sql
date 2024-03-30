ALTER TABLE migration.medical_record_entries
ALTER COLUMN description TYPE varchar(100)
USING
    CASE
        WHEN length(description) <= 100 THEN
            CAST (description as varchar(100))
        ELSE
            CAST(substring(description from 1 for 97) || '...' as varchar(100))
    END;
