DO $$
DECLARE
    r RECORD;
BEGIN
    FOR r IN 
        SELECT t.tablename, a.columnname
        FROM pg_tables t
        JOIN pg_attribute a ON a.attrelid = t.tablename::regclass
        WHERE a.attidentity IN ('a', 'd')
    LOOP
        EXECUTE format(
            'SELECT setval(pg_get_serial_sequence(''%I'', ''%I''), (SELECT COALESCE(MAX(%I),1) FROM %I), true);',
            r.tablename, r.columnname, r.columnname, r.tablename
        );
    END LOOP;
END $$;