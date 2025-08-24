SELECT course_lessons.student_id, categories.category_name, count(*) as cantidad FROM cursos.course_lessons 
INNER JOIN courses ON course_lessons.course_id=courses.ID 
INNER JOIN categories ON courses.category_id=categories.ID
WHERE student_id=34
GROUP BY categories.category_name;