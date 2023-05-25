-- Dataset for international movies 
SELECT *
FROM Hydra_Movie_Scrape_1
GO

SELECT DISTINCT Title
FROM Hydra_Movie_Scrape_1
GO

SELECT COUNT(*)
FROM Hydra_Movie_Scrape_1
GO

SELECT movie_title, rating
FROM naija_movies
ORDER BY rating DESC
GO

SELECT *
FROM naija_movies
GO

SELECT *
FROM Hydra_Movie_Scrape_1
ORDER BY [Year] DESC
GO

SELECT DISTINCT [Year]
FROM Hydra_Movie_Scrape_1
GO

SELECT DISTINCT [year]
FROM naija_movies
ORDER BY [year] DESC
GO

SELECT *
FROM naija_movies
GO

SELECT *
FROM Hydra_Movie_Scrape_1
GO
