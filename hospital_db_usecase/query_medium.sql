
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

/* Show patient_id and first_name from patients where their first_name start and 
ends with 's' and is at least 6 characters long.*/
SELECT patient_id, first_name FROM patients
WHERE first_name LIKE 's____%s';

/* Show patient_id, first_name, last_name from patients whos diagnosis is 'Dementia'.
Primary diagnosis is stored in the admissions table. */

SELECT p.patient_id, p.first_name, p.last_name
FROM patients p
JOIN admissions a ON p.patient_id = a.patient_id
WHERE a.diagnosis = 'Dementia';

-- SELECT patient_id, first_name, last_name
-- FROM patients
-- WHERE patient_id IN (
--     SELECT patient_id
--     FROM admissions
--     WHERE diagnosis = 'Dementia'
--   );


/* Display every patient's first_name.
Order the list by the length of each name and then by alphabetically. */
SELECT first_name from patients
order by LEN(first_name),first_name;


/*Show the total amount of male patients and the total amount of female patients in the patients table.
Display the two results in the same row. */
SELECT
    (SELECT COUNT(*) FROM patients WHERE gender = 'M') AS total_male_patients,
    (SELECT COUNT(*) FROM patients WHERE gender = 'F') AS total_female_patients;


/* Show first and last name, allergies from patients which have allergies to either 'Penicillin' or 'Morphine'. 
Show results ordered ascending by allergies then by first_name then by last_name. */
SELECT first_name, last_name, allergies FROM patients
WHERE allergies IN ('Penicillin', 'Morphine')
ORDER BY allergies, first_name, last_name;

-- SELECT
--   first_name,
--   last_name,
--   allergies
-- FROM
--   patients
-- WHERE
--   allergies = 'Penicillin'
--   OR allergies = 'Morphine'
-- ORDER BY
--   allergies ASC,
--   first_name ASC,
--   last_name ASC;


/* Show patient_id, diagnosis from admissions. Find patients admitted multiple times for the same diagnosis. */
SELECT patient_id, diagnosis
FROM admissions
GROUP BY patient_id, diagnosis
HAVING COUNT(*) > 1;


/* Show the city and the total number of patients in the city.
Order from most to least patients and then by city name ascending. */
SELECT city, COUNT(*) AS total_patients
FROM patients
GROUP BY city
ORDER BY total_patients DESC, city ASC;


/* Show first name, last name and role of every person that is either patient or doctor.
The roles are either "Patient" or "Doctor" */
SELECT first_name, last_name, 'Patient' as role FROM patients
    UNION ALL
SELECT first_name, last_name, 'Doctor' from doctors;


/* Show all allergies ordered by popularity. Remove NULL values from query. */
SELECT allergies, COUNT(*) AS allergy_count
FROM patients
WHERE allergies IS NOT NULL
GROUP BY allergies
ORDER BY allergy_count DESC;
