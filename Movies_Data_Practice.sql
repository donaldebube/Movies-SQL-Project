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