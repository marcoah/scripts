SELECT course_lessons.student_id, categories.category_name, count(*) as cantidad FROM cursos.course_lessons 
INNER JOIN lessons ON course_lessons.lesson_id=lessons.ID 
INNER JOIN categories ON lessons.category_id=categories.ID
WHERE student_id=34 GROUP BY categories.category_name;