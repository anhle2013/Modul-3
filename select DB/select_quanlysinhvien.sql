USE quanlysinhvien;

SELECT * FROM student;
SELECT * FROM student
WHERE Status = true;

SELECT * FROM subject
WHERE Credit < 10;

SELECT 
	s.StudentId, 
    s.StudentName,
    c.ClassName
FROM student s 
JOIN class c 
ON s.ClassID = c.ClassID
WHERE c.ClassName = 'A1';

SELECT 
	s.StudentId, 
    s.StudentName,
    sub.SubName,
    m.Mark
FROM student s 
JOIN mark m 
ON s.StudentID = m.StudentID
JOIN subject sub 
ON m.SubID = sub.SubID
WHERE sub.SubName = 'CF';