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

  
  
  -- For Movie Title column
    -- Drop movie_title column
    ALTER TABLE naija_movies_set
    DROP COLUMN movie_title
  GO

  
  -- For Title Column
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
    /*
    SELECT COUNT(*)
    FROM naija_movies_set
    WHERE [year] = 'I'
    GO
    */

    -- Update 
    UPDATE naija_movies_set
    SET [year] = REPLACE(year, 'I', 'Not Provided')
    WHERE [year] = 'I'
    GO

    -- Update 
    UPDATE naija_movies_set
    SET [year] = REPLACE(year, 'V', 'Not Provided')
    WHERE [year] = 'V'
    GO

    -- Update 
    UPDATE naija_movies_set
    SET [year] = REPLACE(year, 'II', 'Not Provided')
    WHERE [year] = 'II'
    GO

    -- Update 
    UPDATE naija_movies_set
    SET [year] = REPLACE(year, 'IX', 'Not Provided')
    WHERE [year] = 'IX'
    GO

    -- Update 
    UPDATE naija_movies_set
    SET [year] = REPLACE(year, 'deo', 'Not Provided')
    WHERE [year] = 'deo'
    GO

    -- Update 
    UPDATE naija_movies_set
    SET [year] = REPLACE(year, '', 'Not Provided')
    WHERE [year] = ' %'
    GO

    -- Update 
    UPDATE naija_movies_set
    SET [year] = REPLACE(year, 'VI', '')
    WHERE [year] LIKE 'VI%'
    GO

    -- Update 
    UPDATE naija_movies_set
    SET [year] = REPLACE(year, 'III', '')
    WHERE [year] LIKE 'III%'
    GO

    -- Update 
    UPDATE naija_movies_set
    SET [year] = REPLACE(year, 'II', '')
    WHERE [year] LIKE 'II%'
    GO

    -- Update 
    UPDATE naija_movies_set
    SET [year] = REPLACE(year, 'II ', '')
    WHERE [year] LIKE 'II%'
    GO

    -- Update 
    UPDATE naija_movies_set
    SET [year] = REPLACE(year, 'I', '')
    WHERE [year] LIKE 'I%'
    GO

    -- Update 
    UPDATE naija_movies_set
    SET [year] = REPLACE(year, 'X', '')
    WHERE [year] LIKE 'X%'
    GO

    -- Update 
    UPDATE naija_movies_set
    SET [year] = REPLACE(year, '-', '!')
    WHERE [year] LIKE '%-%'
    GO

    -- Update 
    UPDATE naija_movies_set
    SET [year] = REPLACE(year, '2011-', '2011')
    WHERE [year] LIKE '2011-%'
    GO

    -- Verify
    SELECT *
    FROM naija_movies_set
    WHERE year LIKE 'VI%'
    GO

    -- Verify
    SELECT *
    FROM naija_movies_set
    WHERE year LIKE 'VI%'
    GO

    -- Verify
    SELECT *
    FROM naija_movies_set
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

    UPDATE naija_movies_set
    SET [year] = CONCAT([year], 'Present')
    WHERE [year] LIKE '%-%';

    SELECT DISTINCT [year]
    FROM naija_movies_set
    GO


    -- To remove the empty spaces in the column
    UPDATE naija_movies_set
    SET [year] = RTRIM([year])
    WHERE [year] LIKE '% '
    GO

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
  GO
  
  -- For Certificate
    -- Drop CERTIFICATE column
    ALTER TABLE naija_movies_set
    DROP COLUMN certificate
  GO

  -- For Rating
    SELECT *
    FROM naija_movies_set
    WHERE Rating IS NULL
    -- GROUP BY Rating
    GO

    -- Drop Rating column
    ALTER TABLE naija_movies_set
    DROP COLUMN Rating
    GO
  GO

  -- For Synopsis
    SELECT Synopsis, COUNT(*) AS [Number of Synopsis], Title
    FROM naija_movies_set
    --WHERE Synopsis IS NULL
    GROUP BY  Synopsis, Title
    ORDER BY [Number of Synopsis] DESC
    GO

    SELECT COUNT(Synopsis)
    FROM naija_movies_set
    GO

    SELECT COUNT(Synopsis)
    FROM naija_movies_set
    WHERE Synopsis LIKE '%Add a Plot'
    GO
    -- Drop Synopsis Column
    ALTER TABLE naija_movies_set
    DROP COLUMN Synopsis
    GO
  GO

  -- For Cast
    SELECT DISTINCT COUNT([Cast]), [Cast]
    FROM naija_movies_set
    GROUP BY [Cast]
    GO

    -- Pull out the rows that are empty
    SELECT *
    FROM naija_movies_set
    WHERE [Cast] = ''
    GO

    -- Replace empty columns with 'Not Provided'
    UPDATE naija_movies_set
    SET [Cast] = 'Not Provided'
    WHERE [Cast] = ''
    GO
  GO

  -- For Genre
    SELECT Genre, COUNT(Genre) AS [Number]
    FROM naija_movies_set
    GROUP BY Genre
    ORDER BY Genre DESC
  GO
  
  -- For Directors
  SELECT *
  FROM 



-- GO

-- Analysis Proper

-- Get the year that released the most movies
SELECT DISTINCT YEAR, 
  COUNT(*) AS [Number of Movies Released]
FROM naija_movies_set
GROUP BY YEAR
ORDER BY [Number of Movies Released] DESC
GO

  SELECT *
  FROM naija_movies_set
  GO


