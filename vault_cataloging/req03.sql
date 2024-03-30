SELECT
    filename,
    least(rsa_time, hyper_pulse_time, quantum_x_time, aes_time, d_crypt_time) as best_time,
    greatest(rsa_time, hyper_pulse_time, quantum_x_time, aes_time, d_crypt_time) as worst_time
FROM
    dtf.madelines_files_results t
ORDER BY
    filename ASC;
    

/*SELECT
    filename,
    CASE
        WHEN 
            decrypted OR (SELECT decrypted FROM dtf.madelines_files_results WHERE id = t.parent_id)
        THEN
            least(rsa_time, hyper_pulse_time, quantum_x_time, aes_time, d_crypt_time)
        ELSE
            NULL
    END as best_time,
    CASE
        WHEN
            decrypted OR (SELECT decrypted FROM dtf.madelines_files_results WHERE id = t.parent_id)
        THEN
            greatest(rsa_time, hyper_pulse_time, quantum_x_time, aes_time, d_crypt_time)
        ELSE
            NULL
    END as worst_time
FROM
    dtf.madelines_files_results t
ORDER BY
    filename ASC;*/
