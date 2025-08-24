-- Crear procedimiento almacenado para copiar todas las tablas
DELIMITER //

CREATE PROCEDURE CopyDatabase()
BEGIN
    DECLARE done INT DEFAULT FALSE;
    DECLARE tableName VARCHAR(256);
    DECLARE tableCursor CURSOR FOR SELECT table_name FROM information_schema.tables WHERE table_schema = 'cursos';
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

    OPEN tableCursor;

    read_loop: LOOP
        FETCH tableCursor INTO tableName;
        IF done THEN
            LEAVE read_loop;
        END IF;

        -- Crear y copiar cada tabla
        SET @createTable = CONCAT('CREATE TABLE cursos_bk.', tableName, ' LIKE cursos.', tableName);
        SET @copyData = CONCAT('INSERT INTO cursos_bk.', tableName, ' SELECT * FROM cursos.', tableName);

        PREPARE stmt FROM @createTable;
        EXECUTE stmt;
        DEALLOCATE PREPARE stmt;

        PREPARE stmt FROM @copyData;
        EXECUTE stmt;
        DEALLOCATE PREPARE stmt;
    END LOOP;

    CLOSE tableCursor;
END //

DELIMITER ;


