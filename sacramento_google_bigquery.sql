SELECT *
FROM `gdelt-bq.gdeltv2.events`
WHERE Actor1Geo_FullName LIKE "Sacramento%"
    OR Actor2Geo_FullName LIKE "Sacramento%"
    AND 2018 <= Year

