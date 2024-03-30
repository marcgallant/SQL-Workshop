SELECT
    CAST(avg(COALESCE(NULLIF(rsa_time, 0), t.max_rsa_time)) as numeric(15, 2)) as avg_rsa_time,
    CAST(avg(COALESCE(NULLIF(hyper_pulse_time, 0), t.max_hyper_pulse_time)) as numeric(15, 2)) as avg_hyper_pulse_time,
    CAST(avg(COALESCE(NULLIF(quantum_x_time, 0), t.max_quantum_x_time)) as numeric(15, 2)) as avg_quantum_x_time,
    CAST(avg(COALESCE(NULLIF(aes_time, 0), t.max_aes_time)) as numeric(15, 2)) as avg_aes_time,
    CAST(avg(COALESCE(NULLIF(d_crypt_time, 0), t.max_d_crypt_time)) as numeric(15, 2)) as avg_d_crypt_time
FROM
    dtf.madelines_files_results,
    (
    SELECT
        max(rsa_time) as max_rsa_time,
        max(hyper_pulse_time) as max_hyper_pulse_time,
        max(quantum_x_time) as max_quantum_x_time,
        max(aes_time) as max_aes_time,
        max(d_crypt_time) as max_d_crypt_time
    FROM
        dtf.madelines_files_results
    ) t;
