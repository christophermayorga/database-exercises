USE employees;

-- 2. 7 positions

SELECT DISTINCT
      title
FROM titles
ORDER BY
      title
;

-- 3.

SELECT
      last_name
FROM employees
WHERE
      last_name LIKE 'e%e'
GROUP BY
      last_name
;

-- 4.

SELECT
      first_name,
      last_name
FROM employees
WHERE
      last_name LIKE 'e%e'
GROUP BY
      last_name,
      first_name
;

-- 5. Chleq, Lindqvist, Qiwen

SELECT
      last_name
FROM employees
WHERE
      last_name LIKE '%q%' AND
      last_name NOT LIKE '%qu%'
GROUP BY
      last_name
;

-- 6.

SELECT
      last_name,
      COUNT(last_name) AS total
FROM employees
WHERE
      last_name LIKE '%q%' AND
      last_name NOT LIKE '%qu%'
GROUP BY
      last_name
ORDER BY
      COUNT(last_name)
;

-- 7.

SELECT
      first_name,
      gender,
      COUNT(first_name) AS total
FROM employees
WHERE
      first_name IN ('Irena', 'Vidya', 'Maya')
GROUP BY
      first_name, gender
;

-- 8. creating a user name of first initial, first four of last name, underscore, birth month, two-digit birth year
--    285,872 total username combinations
--    13,251 total usernames that are not unique
--    27,403 employees have a username that is shared with at least one other employee and as many as six

SELECT
      CONCAT(
            LOWER(SUBSTR(first_name, 1, 1)),
            LOWER(SUBSTR(last_name, 1, 4)), '_',
            SUBSTR(birth_date, 6, 2),
            SUBSTR(birth_date, 3, 2)
      ) AS username,
      COUNT(*) AS user_count
FROM employees
GROUP BY
      username
ORDER BY
      user_count DESC
;

SELECT
      CONCAT(
            LOWER(SUBSTR(first_name, 1, 1)),
            LOWER(SUBSTR(last_name, 1, 4)), '_',
            SUBSTR(birth_date, 6, 2),
            SUBSTR(birth_date, 3, 2)
      ) AS username,
      COUNT(*) AS user_count
FROM employees
GROUP BY
      username
HAVING
      user_count > 1
ORDER BY
      user_count DESC
;

SELECT
      SUM(user_count)
FROM
-- sub query
      (
      SELECT
            CONCAT(
                  LOWER(SUBSTR(first_name, 1, 1)),
                  LOWER(SUBSTR(last_name, 1, 4)), '_',
                  SUBSTR(birth_date, 6, 2),
                  SUBSTR(birth_date, 3, 2)
            ) AS username,
            COUNT(*) AS user_count
      FROM employees
      GROUP BY
            username
      HAVING
            user_count > 1
      ) AS countcountcountcount
-- end sub query
;