-- exercicio 1
CREATE PROCEDURE student_grade_points
	@grade VARCHAR(2)
AS
BEGIN 
	SELECT 
			s.name AS StudentName,
			s.dept_name AS StudentDepartment,
			c.title AS CourseTitle,
			c.dept_name AS CourseDepartment,
			t.semester,
			t.year,
			t.grade AS AlphaGrade,
			gp.points As NumericGrade
			
		FROM 
			student s
			JOIN takes t ON s.ID = t.ID
			JOIN course c ON t.course_id = c.course_id
			JOIN grade_points gp ON t.grade = gp.grade
			
		WHERE
				t.grade = @grade;
				
		END;			
			
			
-- exercicio 2

CREATE FUNCTION return_instructor_location 
(
		@InstructorName VARCHAR(50)
)
RETURNS TABLE
AS 
RETURN
(
	SELECT
			i.name AS InstructorName,
			c.title AS CourseTitle,
			sec.semester,
			sec.year,
			sec.building,
			sec.room_number
			
	FROM
			instructor i
			JOIN teaches t ON i.ID = t.ID
			JOIN section sec ON t.course_id= sec.course_id AND t.sec_id = sec.sec_id
													AND t.semester = sec.semester AND t.year = sec.year
			JOIN course c ON sec.course_id = c.course_id
			
	WHERE 
			i.name = @InstructorName						
		