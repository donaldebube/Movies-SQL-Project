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


-- ALTER TABLE naija_movies_set
-- RENAME COLUMN index TO S/N
-- GO

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


