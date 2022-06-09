USE quanlysinhvien;

SELECT * FROM subject
WHERE Credit = (
	SELECT 
		MAX(Credit) AS 'Credit max'
	FROM subject);
    
SELECT
	sub.SubID,
    sub.SubName,
    sub.Credit,
    m.Mark AS 'Max Mark'
FROM subject sub
JOIN mark m
ON sub.SubID = m.SubID
WHERE m.Mark = (
	SELECT 
		MAX(Mark)
	FROM mark);
    
SELECT
	stu.StudentID,
    stu.StudentName,
    stu.ClassID,
    AVG(m.Mark) AS 'DTB'
FROM student stu
JOIN mark m
ON stu.StudentID = m.StudentID
GROUP BY StudentID
ORDER BY AVG(m.Mark) DESC;