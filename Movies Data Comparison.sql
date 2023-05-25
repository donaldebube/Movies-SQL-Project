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