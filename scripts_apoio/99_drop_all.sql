BEGIN

	-- DROP TABLES
    FOR tbl IN (SELECT table_name FROM user_tables) LOOP
		EXECUTE IMMEDIATE 'DROP TABLE ' || tbl.table_name || ' CASCADE CONSTRAINTS PURGE';
	END LOOP;
	
	-- DROP VIEWS
	FOR v IN (SELECT view_name FROM user_views) LOOP
		EXECUTE IMMEDIATE 'DROP VIEW ' || v.view_name;
	END LOOP;
	
	-- DROP SEQUENCES
    FOR seq IN (SELECT sequence_name FROM user_sequences) LOOP
		EXECUTE IMMEDIATE 'DROP SEQUENCE ' || seq.sequence_name;
	END LOOP;
	
	-- DROP PROCEDURES
    FOR proc IN (SELECT object_name FROM user_objects WHERE object_type = 'PROCEDURE') LOOP
        EXECUTE IMMEDIATE 'DROP PROCEDURE ' || proc.object_name;
    END LOOP;

    -- DROP FUNCTIONS
    FOR func IN (SELECT object_name FROM user_objects WHERE object_type = 'FUNCTION') LOOP
        EXECUTE IMMEDIATE 'DROP FUNCTION ' || func.object_name;
    END LOOP;
	
	-- DROP PACKAGES
    FOR pkg IN (SELECT object_name FROM user_objects WHERE object_type = 'PACKAGE') LOOP
        EXECUTE IMMEDIATE 'DROP PACKAGE ' || pkg.object_name;
    END LOOP;
	
	-- DROP TRIGGERS
	FOR trg IN (SELECT trigger_name FROM user_triggers) LOOP
        EXECUTE IMMEDIATE 'DROP TRIGGER ' || trg.trigger_name;
    END LOOP;
	
END;
/
