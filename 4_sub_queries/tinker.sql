--Get the total number of in complete assignment submissions for a student
-- SELECT (
--   SELECT count(assignments)
--   FROM assignments) - count(assignment_submissions) as total_incomplete
-- FROM assignment_submissions
-- JOIN students ON students.id = student_id
-- WHERE students.name = 'Ibrahim Schimmel';


--Calculate the total number of students for each cohort
-- SELECT count(students)
-- FROM students
-- JOIN cohorts ON cohorts.id = cohort_id
-- GROUP BY cohorts;

-- Get a single number for the average number of students per cohort
-- SELECT count(students) as total_students
-- FROM students
-- JOIN cohorts ON cohorts.id = cohort_id
-- GROUP BY cohorts;
-- Results look like a table with a single column total_students

-- If we treat this as a table, we essentially want to find the average of the total_students column.
-- SELECT avg(total_students) as average_students
-- FROM (
--   SELECT count(students) as total_students
--   FROM students
--   JOIN cohorts ON cohorts.id = cohort_id
--   GROUP BY cohorts
-- ) as totals_table;

-- Query to get all completed assignments for a student.
-- SELECT assignment_id
-- FROM assignment_submissions
-- JOIN students ON students.id = student_id
-- WHERE students.name = 'Ibrahim Schimmel';

-- Query to get all incompleted assignments for a student.
SELECT assignments.name
FROM assignments 
WHERE id NOT IN
(
  SELECT assignment_id
  FROM assignment_submissions
  JOIN students ON students.id = student_id
  WHERE students.name = 'Ibrahim Schimmel'
);

