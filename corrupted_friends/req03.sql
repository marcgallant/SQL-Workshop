UPDATE dtf.madelines_contacts
SET email = lower(first_name) || '.' || lower(last_name) || '@roger_roger.com';
