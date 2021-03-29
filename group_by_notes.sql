USE titanic_db;

SELECT *
FROM passengers;

DESCRIBE passengers;

SELECT
    COUNT(*) AS number_of_passengers
FROM passengers;

SELECT
    DISTINCT class
FROM passengers;

SELECT
    class
FROM passengers
GROUP BY class;

SELECT
    class
FROM passengers
GROUP BY class DESC;

SELECT
    DISTINCT sex
FROM passengers;

SELECT
    sex
FROM passengers
GROUP BY sex;

SELECT
    sex,
    class
FROM passengers
GROUP BY sex, class;

SELECT
    sex,
    COUNT(*) AS number_of_passengers
FROM passengers
GROUP BY sex;

SELECT
    sex,
    COUNT(sex) AS number_of_passengers
FROM passengers
GROUP BY sex;

SELECT 
    deck,
    COUNT(deck) AS 'non-null-values',
    COUNT(*) AS 'all_rows'
FROM passengers
GROUP BY deck;

SELECT
    sex,
    class,
    COUNT(*) AS number_of_passengers
FROM passengers
GROUP BY sex, class;

SELECT
    sex,
    ROUND(AVG(fare), 2) AS average_fare_paid,
    MIN(fare) AS minimum_fare_paid,
    ROUND(MAX(fare), 2) AS maximum_fare_paid,
    ROUND(STDDEV(fare), 2) AS standard_deviation_in_fare
FROM passengers
GROUP BY sex;

SELECT
    sex,
    class,
    ROUND(AVG(fare), 2) AS average_fare_paid,
    ROUND(MIN(fare), 2) AS minimum_fare_paid,
    ROUND(MAX(fare), 2) AS maximum_fare_paid,
    ROUND(STDDEV(fare), 2) AS standard_deviation_in_fare
FROM passengers
GROUP BY sex, class;