DELIMITER done

USE world done

SELECT * FROM city done

SELECT * FROM country done

SELECT * FROM countrylanguage done

SELECT *
FROM country co
LEFT JOIN city ci
ON ci.CountryCode = co.Code



SELECT ci.Name AS City,
       co.Name AS Country,
       cl.Language
FROM city ci
RIGHT JOIN country co
ON ci.CountryCode = co.Code
LEFT JOIN countrylanguage cl
ON co.Code = cl.CountryCode;





SELECT *
FROM city ci
LEFT JOIN country co
ON ci.CountryCode = co.Code
LEFT JOIN countrylanguage cl
ON co.Code = cl.CountryCode

UNION

SELECT *
FROM city ci
RIGHT JOIN country co
ON ci.CountryCode = co.Code
RIGHT JOIN countrylanguage cl
ON co.Code = cl.CountryCode
;




-- making without duplicate rows

DELIMITER //

CREATE FUNCTION CompareColumnNames(
    col1 VARCHAR(100),
    col2 VARCHAR(100)
)
RETURNS BOOLEAN
DETERMINISTIC
BEGIN
    RETURN LOWER(col1) = LOWER(col2);
END //

DELIMITER ;



-- Function to Compare Column Values

DELIMITER //

CREATE FUNCTION CompareColumnValues(
    val1 TEXT,
    val2 TEXT
)
RETURNS BOOLEAN
DETERMINISTIC
BEGIN
    RETURN val1 <=> val2;
END //

DELIMITER ;












SELECT
    'Function 1' AS FunctionName,
    
    CompareColumnNames('CountryCode', 'Code') AS CountryCode_vs_Code,
    CompareColumnNames('Name', 'Name') AS Name_vs_Name,
    CompareColumnNames('Population', 'Population') AS Population_vs_Population

UNION 

SELECT
    'Function 2',

    CompareColumnValues(ci.CountryCode, co.Code),
    CompareColumnValues(ci.Name, co.Name),
    CompareColumnValues(ci.Population, co.Population)

FROM city ci
JOIN country co
ON ci.CountryCode = co.Code
LIMIT 1;







-- Find duplicate columns
SELECT
    COLUMN_NAME,
    COUNT(*) AS DuplicateCount
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_SCHEMA = 'world'
AND TABLE_NAME IN ('city', 'country', 'countrylanguage')
GROUP BY COLUMN_NAME
HAVING COUNT(*) > 1;







-- 		giant proceduce for comparing values
DELIMITER //

CREATE PROCEDURE CompareAllColumns(
    IN table_name VARCHAR(100),
    IN column_list TEXT
)
BEGIN

    DECLARE col1 VARCHAR(100);
    DECLARE col2 VARCHAR(100);

    DECLARE i INT DEFAULT 1;
    DECLARE j INT;

    DECLARE total_cols INT;

    SET total_cols = 1 + LENGTH(column_list)
                     - LENGTH(REPLACE(column_list, ',', ''));

    DROP TEMPORARY TABLE IF EXISTS duplicate_results;

    CREATE TEMPORARY TABLE duplicate_results (
        comparison_pair VARCHAR(255),
        duplicate_value TEXT
    );

    WHILE i <= total_cols DO

        SET col1 = TRIM(
            SUBSTRING_INDEX(
                SUBSTRING_INDEX(column_list, ',', i),
                ',',
                -1
            )
        );

        SET j = i + 1;

        WHILE j <= total_cols DO

            SET col2 = TRIM(
                SUBSTRING_INDEX(
                    SUBSTRING_INDEX(column_list, ',', j),
                    ',',
                    -1
                )
            );

            SET @sql = CONCAT(
                'INSERT INTO duplicate_results ',
                'SELECT ',
                '''', col1, ' vs ', col2, ''' AS comparison_pair, ',
                col1,
                ' AS duplicate_value ',
                'FROM ',
                table_name,
                ' WHERE ',
                col1,
                ' <=> ',
                col2
            );

            PREPARE stmt FROM @sql;
            EXECUTE stmt;
            DEALLOCATE PREPARE stmt;

            SET j = j + 1;

        END WHILE;

        SET i = i + 1;

    END WHILE;

    SELECT * FROM duplicate_results;

END //

DELIMITER ;












-- let's count number of columns
DELIMITER //

CREATE FUNCTION GetColumnCount(
    table_name_input VARCHAR(100)
)
RETURNS INT
DETERMINISTIC
READS SQL DATA
BEGIN

    DECLARE column_count INT;

    SELECT COUNT(*)
    INTO column_count
    FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_SCHEMA = DATABASE()
    AND TABLE_NAME = table_name_input;

    RETURN column_count;

END //

DELIMITER ;









SELECT GetColumnCount('city');
SELECT GetColumnCount('country');
SELECT GetColumnCount('countrylanguage');


SELECT 
    GetColumnCount('city')
    + GetColumnCount('country')
    + GetColumnCount('countrylanguage')
AS TotalColumns;

-- answer is 24 








-- NEXT IS
-- II WILL SPERATE 24 INTO 
-- 6,6,6,6

-- AND WILL RUN MY GIANT FUNCTION ON THIS TO FIND DUPLICATES
-- THEN ADDING MORE LOGIC I WILL MAKE A VIEW WITH NO DUPLICATES TABLE
