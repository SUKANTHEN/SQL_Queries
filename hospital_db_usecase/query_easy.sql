-- Show first name, last name, and gender of patients whose gender is 'M'.
SELECT first_name,last_name,gender FROM patients
WHERE gender == "M";


-- Show first name and last name of patients who does not have allergies. (null)
SELECT first_name,last_name FROM patients
WHERE allergies is null;


-- Show first name of patients that start with the letter 'C'
SELECT first_name FROM patients
WHERE first_name LIKE 'C%';


/*Show first name and last name of patients that 
weight within the range of 100 to 120 (inclusive) */
SELECT first_name,last_name FROM patients
WHERE weight between 100 AND 120;


/* Update the patients table for the allergies column. 
If the patient's allergies is null then replace it with 'NKA' */
UPDATE Patients
SET allergies = 'NKA'
WHERE allergies IS NULL;


-- Show first name and last name concatinated into one column to show their full name.
SELECT CONCAT(first_name, ' ', last_name) AS full_name
FROM Patients;


/* Show first name, last name, and the full province name of each patient.
Example: 'Ontario' instead of 'ON'
Table Info: patients, province_names */
SELECT patients.first_name,patients.last_name,province_names.province_name
FROM patients
INNER JOIN province_names WHERE patients.province_id = province_names.province_id;


-- Show how many patients have a birth_date with 2010 as the birth year.
select count(DISTINCT patient_id) 
FROM patients
WHERE YEAR(birth_date) = 2010;


-- Show the first_name, last_name, and height of the patient with the greatest height.
select first_name,last_name,height
from patients
where height = (SELECT MAX(height) FROM patients);


/* Show all columns for patients who have one of the following patient_ids:
1,45,534,879,1000 */
SELECT * FROM patients
WHERE patient_id IN (1, 45, 534, 879, 1000);


-- Show the total number of admissions
SELECT COUNT(*) FROM admissions;


-- Show the patient id and the total number of admissions for patient_id 579.
SELECT patient_id, COUNT(*) from admissions
WHERE patient_id = 579;


-- Based on the cities that our patients live in, show unique cities that are in province_id 'NS'?
SELECT distinct(city) FROM patients
WHERE province_id = 'NS';


/* Write a query to find the first_name, last name and birth date of patients 
who has height greater than 160 and weight greater than 70 */
SELECT first_name,last_name,birth_date from patients
WHERE height > 160 and weight > 70;


/* Write a query to find list of patients first_name, last_name, and allergies 
where allergies are not null and are from the city of 'Hamilton' */
select first_name,last_name, allergies FROM patients
WHERE allergies is not null AND city = 'Hamilton';

-- The End
