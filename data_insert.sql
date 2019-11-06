SELECT * FROM generate_series('2010-10-05 00:00'::timestamp,
                                CURRENT_TIMESTAMP,
                                '8 days 15 hours 12min');