SELECT * FROM Grade;

SELECT * FROM Emotion;

SELECT * FROM PoemEmotion;

SELECT
	COUNT(Id) as NumofPoem
FROM Poem;

SELECT Id, Name AS 'Author Name'
FROM Author 
WHERE Id < 77
ORDER BY Name;

SELECT a.Name AS 'Author Name', g.Name AS 'Grade'
FROM Author a
JOIN Grade g ON a.GradeId = g.Id
WHERE a.Id < 77
ORDER BY a.Name;

SELECT a.Name AS 'Author Name', g.Name AS 'Grade', ge.Name AS 'Gender'
FROM Author a
JOIN Grade g ON a.GradeId = g.Id
JOIN Gender ge ON a.GenderId = ge.Id
WHERE a.Id < 77
ORDER BY a.Name;

SELECT
	SUM(WordCount) SumOfPoemWord
FROM Poem;

SELECT Title, CharCount 
FROM Poem
WHERE CharCount = (
	SELECT
		MIN(CharCount)
	FROM Poem)

SELECT 
	COUNT(Id) AS NumOfAuthor
FROM Author
WHERE GradeId = 3;

SELECT 
	COUNT(Id) AS NumOfAuthor
FROM Author
WHERE GradeId <= 3;

SELECT
	COUNT(p.Id) as NumOfPoems
FROM Poem p
JOIN Author a ON p.AuthorId = a.Id
WHERE a.GradeId = 4;

SELECT g.Name, COUNT(p.Id) AS '# of Poems'
FROM Grade g
JOIN Author a on g.Id = a.GradeId
JOIN Poem p on a.Id = p.AuthorId
GROUP BY g.Name ;

SELECT g.Name, COUNT(a.Id) AS '# of Author'
FROM Grade g
JOIN Author a on g.Id = a.GradeId
GROUP BY g.Name ;

SELECT Title
FROM Poem 
WHERE WordCount = (
	SELECT 
		MAX(WordCount)
	FROM Poem);

SELECT TOP 1 a.Name, COUNT(p.AuthorId) AS '# of Peoms'
FROM Author a
JOIN Poem p ON a.Id = p.AuthorId
GROUP BY a.Name
ORDER BY COUNT(p.AuthorId) DESC;

SELECT 
	COUNT(PoemId) as NumOfSadPoems
FROM PoemEmotion
WHERE EmotionId = 3;

SELECT 
	COUNT(PoemId) as NumOfNOEMOTIONPoems
FROM PoemEmotion
WHERE EmotionId = NULL;

SELECT TOP 1 e.Name AS 'Emotion'
FROM Emotion e
JOIN PoemEmotion pe ON e.Id = pe.EmotionId
GROUP BY e.Name
ORDER BY COUNT(pe.EmotionId);

SELECT TOP 1 g.Name, COUNT(pe.EmotionId)
FROM Grade g 
JOIN Author a ON g.Id = a.GradeId
JOIN Poem p ON a.Id = p.AuthorId
JOIN PoemEmotion pe ON p.Id = pe.PoemId
GROUP BY g.Name, pe.EmotionId
HAVING pe.EmotionId = 4
ORDER BY COUNT(pe.EmotionId) DESC;

SELECT TOP 1 ge.Name, COUNT(pe.EmotionId)
FROM Gender ge 
JOIN Author a ON ge.Id = a.GenderId
JOIN Poem p ON a.Id = p.AuthorId
JOIN PoemEmotion pe ON p.Id = pe.PoemId
GROUP BY ge.Name, pe.EmotionId
HAVING pe.EmotionId = 2
ORDER BY COUNT(pe.EmotionId);
