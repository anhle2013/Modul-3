USE quanlysinhvien;

SELECT 
	Address,
    COUNT(StudentID) AS 'SoLuongSV'
FROM student
GROUP BY Address;

SELECT 
	s.StudentID,
    s.StudentName,
    AVG(m.Mark) AS 'DiemTB'
FROM student s
JOIN mark m
ON s.StudentID = m.StudentID
GROUP BY s.StudentID
HAVING AVG(m.Mark) > 15;

SELECT 
	s.StudentID,
    s.StudentName,
    AVG(m.Mark) AS 'DiemTB'
FROM student s
JOIN mark m
ON s.StudentID = m.StudentID
GROUP BY s.StudentID
HAVING AVG(m.Mark) >= ALL (
	SELECT AVG(m.Mark) 
    FROM mark m
    GROUP BY m.StudentId
    );
