-- Text Column Test

-- we can only choice same type column
CALL CompareAllColumns(
    'world_combined',
    'CityName,CountryCode,District,Code,CountryName,Continent'
);




DELIMITER //

CREATE PROCEDURE FindDuplicatesInColumn(
    IN table_name VARCHAR(100),
    IN column_name VARCHAR(100)
)
BEGIN

    SET @sql = CONCAT(
        'SELECT ',
        column_name,
        ', COUNT(*) AS duplicate_count ',
        'FROM ',
        table_name,
        ' GROUP BY ',
        column_name,
        ' HAVING COUNT(*) > 1'
    );

    PREPARE stmt FROM @sql;
    EXECUTE stmt;
    DEALLOCATE PREPARE stmt;

END //

DELIMITER ;





CALL FindDuplicatesInColumn('city', 'Name');

CALL FindDuplicatesInColumn('country', 'Code');


CALL FindDuplicatesInColumn('countrylanguage', 'Language');
































CREATE OR REPLACE VIEW world_clean_view AS

SELECT

    -- city table
    ci.ID,
    ci.Name AS CityName,
    ci.CountryCode AS CityCountryCode,
    ci.District,
    ci.Population AS CityPopulation,

    -- country table
    co.Code,
    co.Name AS CountryName,
    co.Continent,
    co.Region,
    co.SurfaceArea,
    co.IndepYear,
    co.Population AS CountryPopulation,
    co.LifeExpectancy,
    co.GNP,
    co.GNPOld,
    co.LocalName,
    co.GovernmentForm,
    co.HeadOfState,
    co.Capital,
    co.Code2,

    -- countrylanguage table
    cl.CountryCode AS LanguageCountryCode,
    cl.Language,
    cl.IsOfficial,
    cl.Percentage

FROM city ci

LEFT JOIN country co
ON ci.CountryCode = co.Code

LEFT JOIN countrylanguage cl
ON co.Code = cl.CountryCode;













SELECT * FROM world_clean_view;









