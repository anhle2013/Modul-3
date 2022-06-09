USE quanlysinhvien;

SELECT * FROM student
WHERE StudentName like 'H%';

SELECT * FROM class
WHERE MONTH(StarDate) = 12;

SELECT * FROM subject
WHERE Credit BETWEEN 3 AND 5;

UPDATE student
SET ClassID = 2
WHERE StudentID = 1;

SELECT
	student.StudentName,
    subject.SubName,
    mark.Mark
FROM student
JOIN mark
ON student.StudentID = mark.StudentID
JOIN subject
ON mark.SubID = subject.SubID
ORDER BY mark.Mark DESC, student.StudentName;