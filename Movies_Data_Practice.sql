-- Exploring Film Industry Dynamics: A Case Study of Nigerian Local Movies vs. Hollywood Movies
-- Initial investigation of different tables

SELECT TOP (1000) [Title]
      ,[Year]
      ,[Summary]
      ,[Short Summary]
      ,[IMDB ID]
      ,[Runtime]
      ,[YouTube Trailer]
      ,[Rating]
      ,[Movie Poster]
      ,[Director]
      ,[Writers]
      ,[Cast]
  FROM [Movies Database].[dbo].[foreign_movies_set]
GO

SELECT DISTINCT title
FROM naija_movies_set
GO

SELECT COUNT(*) AS [Nigerian Movies]
FROM naija_movies_set
GO

SELECT COUNT(*) AS [Foereign Movies]
FROM foreign_movies_set
GO

SELECT *
FROM naija_movies_set
GO


-- Cleaning the Nigerian Local Dataset

-- Change of column names
-- For index column
EXEC sp_rename 'naija_movies_set.index', 'S/N', 'COLUMN'
GO

-- For title column
EXEC sp_rename 'naija_movies_set.title', 'Title', 'COLUMN'
GO

-- For year column
EXEC sp_rename 'naija_movies_set.year', 'Year', 'COLUMN'
GO

-- For genre column
EXEC sp_rename 'naija_movies_set.genre', 'Genre', 'COLUMN'
GO

-- For certificate column
EXEC sp_rename 'naija_movies_set.certificate', 'Certificate', 'COLUMN'
GO

-- For rating column
EXEC sp_rename 'naija_movies_set.rating', 'Rating', 'COLUMN'
GO

-- For directors column
EXEC sp_rename 'naija_movies_set.directors', 'Directors', 'COLUMN'
GO

-- For synopsis column
EXEC sp_rename 'naija_movies_set.synopsis', 'Synopsis', 'COLUMN'
GO

-- For cast column
EXEC sp_rename 'naija_movies_set.cast', 'Cast', 'COLUMN'
GO

-- Drop movie_title column
ALTER TABLE naija_movies_set
DROP COLUMN movie_title
GO

-- Check for NULL valiues in the different columns
-- Cleaning the title column
SELECT DISTINCT title
FROM naija_movies_set
WHERE Title LIKE '%D'
GO

-- For Year

-- Checking the different unique values in the Year column
SELECT DISTINCT YEAR
FROM naija_movies_set
GO

-- For rows with empty column (COUNT)
SELECT DISTINCT [year], COUNT([year])
FROM naija_movies_set
WHERE [year] = ''
GROUP BY [year]
GO

-- For rows with empty column
SELECT [year], title
FROM naija_movies_set
WHERE [year] = ''
GROUP BY [year], title
GO

-- For rows with 'Video' at the end of the row 
SELECT [year], title
FROM naija_movies_set
WHERE [year] LIKE '%Video'
GROUP BY [year], title
GO

-- For rows with 'Video' at the end of the row (COUNT)
SELECT COUNT(*)
FROM naija_movies_set
WHERE [year] LIKE '%Video'
GO

-- Replace the empty columns with Not Provided
UPDATE naija_movies_set
SET [year] = 'Not Provided'
WHERE year = ''
GO

-- Replace the columns that have video at the end with an empty space
UPDATE naija_movies_set
SET [year] = REPLACE(year, ' Video', '')
WHERE [year] LIKE '% Video';
GO

-- Replace the columns that have TV Movie at the end with an empty space
UPDATE naija_movies_set
SET [year] = REPLACE(year, ' TV Movie', '')
WHERE [year] LIKE '% TV Movie';
GO

-- Replace the columns that have TV Special at the end with an empty space
UPDATE naija_movies_set
SET [year] = REPLACE(year, ' TV Special', '')
WHERE [year] LIKE '% TV Special';
GO

-- Replace the columns that have TV Short at the end with an empty space
UPDATE naija_movies_set
SET [year] = REPLACE(year, ' TV Short', '')
WHERE [year] LIKE '% TV Short';
GO

-- Replace the columns that have Music at the end with an empty space
UPDATE naija_movies_set
SET [year] = REPLACE(year, ' Music', '')
WHERE [year] LIKE '% Music';
GO

-- Check I COLUMN
SELECT COUNT(*)
FROM naija_movies_set
WHERE [year] = 'I'
GO

UPDATE naija_movies_set
SET [year] = REPLACE(year, 'I', 'Not Provided')
WHERE [year] = 'I'
GO

UPDATE naija_movies_set
SET [year] = REPLACE(year, 'V', 'Not Provided')
WHERE [year] = 'V'
GO

UPDATE naija_movies_set
SET [year] = REPLACE(year, 'II', 'Not Provided')
WHERE [year] = 'II'
GO

UPDATE naija_movies_set
SET [year] = REPLACE(year, 'IX', 'Not Provided')
WHERE [year] = 'IX'
GO

UPDATE naija_movies_set
SET [year] = REPLACE(year, 'deo', 'Not Provided')
WHERE [year] = 'deo'
GO

UPDATE naija_movies_set
SET [year] = REPLACE(year, '', 'Not Provided')
WHERE [year] = ' %'
GO

UPDATE naija_movies_set
SET [year] = REPLACE(year, 'VI', '')
WHERE [year] LIKE 'VI%'
GO

UPDATE naija_movies_set
SET [year] = REPLACE(year, 'III', '')
WHERE [year] LIKE 'III%'
GO

UPDATE naija_movies_set
SET [year] = REPLACE(year, 'II', '')
WHERE [year] LIKE 'II%'
GO

UPDATE naija_movies_set
SET [year] = REPLACE(year, 'II ', '')
WHERE [year] LIKE 'II%'
GO

UPDATE naija_movies_set
SET [year] = REPLACE(year, 'I', '')
WHERE [year] LIKE 'I%'
GO

UPDATE naija_movies_set
SET [year] = REPLACE(year, 'X', '')
WHERE [year] LIKE 'X%'
GO

UPDATE naija_movies_set
SET [year] = REPLACE(year, 'V ', '')
WHERE [year] LIKE 'V%'
GO

UPDATE naija_movies_set
SET [year] = REPLACE(year, '2011-', '2011')
WHERE [year] LIKE '2011-%'
GO

SELECT *
FROM naija_movies_set
WHERE year LIKE 'VI%'
GO

SELECT *
FROM naija_movies_set
WHERE year LIKE 'VI%'
GO


SELECT *
FROM naija_movies_set
GO

SELECT DISTINCT YEAR
FROM naija_movies_set
ORDER BY YEAR
GO

-- 425
SELECT COUNT(*)
FROM naija_movies_set
WHERE YEAR = 'deo'
GO

SELECT *
FROM naija_movies_set
WHERE [year] = 'deo'
GO

-- To remove the empty spaces in the column
-- UPDATE naija_movies_set
-- SET [year] = LTRIM([year])
-- WHERE [year] LIKE ' %'
-- GO

-- UPDATE naija_movies_set
-- SET [year] = TRIM(REPLACE([year], '-', ''))
-- WHERE [year] LIKE '%-%'
-- GO

-- UPDATE naija_movies_set
-- SET [year] = CASE
--     WHEN RIGHT([year], 1) = '-' THEN LEFT([year], LEN([year]) - 1)
--     ELSE [year]
-- END
-- WHERE [year] LIKE '%-'

SELECT DISTINCT certificate, 
  COUNT(certificate) AS [Number of Certificates]
FROM naija_movies_set
GROUP BY certificate
GO

SELECT *
FROM naija_movies_set
WHERE certificate = 'Not Rated'
GO

-- Drop CERTIFICATE column
ALTER TABLE naija_movies_set
DROP COLUMN certificate
GO

SELECT *
FROM naija_movies_set
GO
