
-- Show unique birth years from patients and order them by ascending.
SELECT DISTINCT YEAR(birth_date) AS birth_year
FROM patients
ORDER BY birth_year ASC;


/* Show unique first names from the patients table which only occurs once in the list.
For example, if two or more people are named 'John' in the first_name column then 
don't include their name in the output list. If only 1 person is named 'Leo' then
include them in the output. */
SELECT DISTINCT first_name
FROM patients
WHERE first_name NOT IN (
    SELECT first_name
    FROM patients
    GROUP BY first_name
    HAVING COUNT(*) > 1
);

