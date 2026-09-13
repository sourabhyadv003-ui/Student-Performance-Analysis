CREATE DATABASE student_analysis;
USE student_analysis;

CREATE TABLE students( 
student_id INT PRIMARY KEY ,
student_name VARCHAR(50),
age INT,
gender VARCHAR(50),
city VARCHAR(20),
attendance_pct DECIMAL(5,2),
study_hours_per_day DECIMAL(4,1),
assignment_score INT,
exam_score INT,
grade CHAR(1)
);

DESCRIBE students;

SELECT COUNT(*) FROM students;

SELECT COUNT(*) AS total_students
FROM students;

SELECT * FROM students LIMIT 10;

SELECT AVG(exam_score) 
AS average_exam_score 
from students;

SELECT MAX(exam_score) 
AS highest_exam_score 
from students; 

SELECT MIN(exam_score) 
AS minimum_exam_score 
from students;

SELECT ROUND(AVG(attendance_pct),2)
AS average_attendance 
from students;

SELECT student_id,student_name,
exam_score,grade
FROM students
ORDER BY exam_score DESC
LIMIT 5;

SELECT gender,
	COUNT(*) AS total_students,
	ROUND(AVG(exam_score),2) AS average_score
FROM students
GROUP BY gender;

SELECT city,
	COUNT(*) AS total_students,
	ROUND(AVG(exam_score),2) AS average_score
FROM students
GROUP BY city;

SELECT grade,
	COUNT(*) AS total_students
FROM students
GROUP BY grade
ORDER BY total_students DESC;

SELECT student_id, student_name,attendance_pct ,exam_score ,grade
FROM students
WHERE attendance_pct < 60
ORDER BY attendance_pct;

SELECT grade ,
	COUNT(*) AS total_students,
    ROUND(AVG(exam_score),2) AS average_exam_score
FROM students
GROUP BY grade
ORDER BY average_exam_score DESC;


SELECT student_id, student_name,attendance_pct ,exam_score ,grade
FROM students
WHERE attendance_pct >=90
ORDER BY exam_score DESC;


SELECT student_id, student_name,attendance_pct ,exam_score ,grade
FROM students
WHERE attendance_pct >=90
ORDER BY exam_score DESC
LIMIT 5;





SELECT 
	CASE
		WHEN study_hours_per_day < 3
THEN 'LOW'
		WHEN study_hours_per_day < 6
THEN 'MEDIUM'
		ELSE 'HIGH'
	END AS study_category,
    COUNT(*) AS total_students,
    ROUND(AVG(exam_score),2) AS average_exam_score 
    FROM students
    GROUP BY study_category
    ORDER BY average_exam_score DESC;
    
    DESCRIBE students;
    USE student_analysis;
    SHOW TABLES;
    
    
    SELECT student_id ,student_name , assignment_score, exam_score,
    (exam_score - assignment_score) AS score_difference
    FROM students
    ORDER BY score_difference DESC 
    LIMIT 10;

SELECT city,
		COUNT(*) AS total_students,
        ROUND(AVG(exam_score),2) AS average_exam_score
FROM students
GROUP BY city
HAVING AVG(exam_score) >= 60
ORDER BY average_exam_score DESC;


SELECT 
	ROUND(AVG(study_hours_per_day),2) AS avg_study_hours,
    ROUND(AVG(exam_score),2) AS avg_exam_score
FROM students;


SELECT  student_id,
		student_name
        study_hours_per_day,
        attendance_pct,
        exam_score,
        grade
FROM students
WHERE exam_score>=80
ORDER BY exam_score DESC;

SELECT  student_id,
		student_name
        study_hours_per_day,
        attendance_pct,
        exam_score,
        grade
FROM students
WHERE exam_score<= 40
ORDER BY exam_score DESC;
        
     SELECT  student_id,
		student_name
        study_hours_per_day,
        attendance_pct,
        exam_score,
        grade
FROM students
WHERE attendance_pct >= 80
AND study_hours_per_day >= 5
ORDER BY exam_score DESC;   

SELECT 
	CASE
		WHEN attendance_pct <60 
	THEN 'LOW ATTENDANCE'
		WHEN attendance_pct <80 
	THEN 'medium attendance'
    ELSE  'High attendance'
END AS attendance_category,
COUNT(*) AS total_students,
ROUND(AVG(exam_score),2) AS avg_exam_score
FROM students
GROUP BY attendance_category
ORDER BY avg_exam_score DESC;

SELECT 
	gender,
    COUNT(*) AS total_students,
    ROUND(AVG(exam_score),2) AS avg_exam_score,
    ROUND(AVG(attendance_pct),2) AS avg_attendance_pct
FROM students
GROUP BY gender
ORDER BY avg_exam_score DESC;

SELECT * FROM students
ORDER BY exam_score DESC
LIMIT 5;

SELECT 
	student_id,
    student_name,
    assignment_score,
    exam_score,
    grade
FROM students
WHERE assignment_score >= 80
AND exam_score < 50
ORDER BY assignment_score DESC;

-- OVERALL PERFOMANCE SUMMARY

SELECT
	COUNT(*) AS Total_Sstudents,
    ROUND(AVG(attendance_pct),2) AS Avg_Attendance_Pct,
    ROUND(AVG(study_hours_per_day),2) AS Avg_Study_Hours,
    ROUND(AVG(assignment_score),2) AS Avg_Assignment_Score,
    ROUND(AVG(exam_score),2) AS Avg_Exam_Score,
    MAX(exam_score) AS Highest_Exam_Score,
    MIN(exam_score) AS Lowest_Exam_Score
FROM students;








