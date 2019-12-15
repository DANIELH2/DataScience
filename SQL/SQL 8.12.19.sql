USE [BoxOffice]
GO
SELECT [movies].movie_id
      ,[budget]
      ,[popularity]
      ,[release_date]
      ,[runtime]
      ,[revenue]
	  ,[genre_id]
	  , dbo.movie_cast.actor_id
	  ,dbo.actors_dim.gender
	  ,dbo.movie_productors.productor_id,
	MAX(CASE WHEN (genre_id = 12) THEN (1) ELSE (0) EnD) AS AdventureYes,
	max(CASE WHEN (genre_id = 14) THEN (1) ELSE (0) EnD) AS FantasyYes,
	max(CASE WHEN (genre_id = 16) THEN (1) ELSE (0) EnD) AS AnimationYes,
	max(CASE WHEN (genre_id =18 ) THEN (1) ELSE (0) EnD) AS DramaYes,
	max(CASE WHEN (genre_id = 27) THEN (1) ELSE (0) EnD) AS HorrorYes,
	max(CASE WHEN (genre_id =28 ) THEN (1) ELSE (0) EnD) AS ActionYes,
	max(CASE WHEN (genre_id =35 ) THEN (1) ELSE (0) EnD) AS ComedyYes,
	max(CASE WHEN (genre_id = 36) THEN (1) ELSE (0) EnD) AS HistoryYes,
	max(CASE WHEN (genre_id = 37) THEN (1) ELSE (0) EnD) AS WesternYes,
	max(CASE WHEN (genre_id = 53) THEN (1) ELSE (0) EnD) AS ThrillerYes,
	max(CASE WHEN (genre_id = 80) THEN (1) ELSE (0) EnD) AS CrimeYes,
	max(CASE WHEN (genre_id =99 ) THEN (1) ELSE (0) EnD) AS DocumentaryYes,
	max(CASE WHEN (genre_id = 878) THEN (1) ELSE (0) EnD) AS  Science_FictionYes,
	max(CASE WHEN (genre_id =9648 ) THEN (1) ELSE (0) EnD) AS MysteryYes,
	max(CASE WHEN (genre_id = 10402) THEN (1) ELSE (0) EnD) AS MusicYes,
	max(CASE WHEN (genre_id = 10749) THEN (1) ELSE (0) EnD)AS RomanceYes,
	max(CASE WHEN (genre_id = 10751) THEN (1) ELSE (0) EnD) AS FamilyYes,
	max(CASE WHEN (genre_id = 10752) THEN (1) ELSE (0) EnD) AS WarYes,
	max(CASE WHEN (genre_id = 10769) THEN (1) ELSE (0) EnD) AS ForeignYes,
	max(CASE WHEN (genre_id = 10770) THEN (1) ELSE (0) EnD) AS TV_MovieYes
  FROM [dbo].[movies] 
  inner join dbo.movies_genres 
  on dbo.movies.movie_id = dbo.movies_genres.movie_id
  inner join dbo.movie_cast
  on dbo.movie_cast.movie_id = dbo.movies_genres.movie_id
    inner join dbo.actors_dim
  on dbo.actors_dim.actor_id = dbo.movie_cast.actor_id
    inner join dbo.movie_productors
  on dbo.movie_productors.movie_id = dbo.movies.movie_id
	inner join dbo.movies_genres
	on dbo.movies_genres.movie_id =  [dbo].[movies].movie_id  
group by [movies].movie_id

---  SELECT [movies].movie_id,
	MAX(CASE WHEN (genre_id = 12) THEN (1) ELSE (0) EnD) AS AdventureYes,
	max(CASE WHEN (genre_id = 14) THEN (1) ELSE (0) EnD) AS FantasyYes,
	max(CASE WHEN (genre_id = 16) THEN (1) ELSE (0) EnD) AS AnimationYes,
	max(CASE WHEN (genre_id =18 ) THEN (1) ELSE (0) EnD) AS DramaYes,
	max(CASE WHEN (genre_id = 27) THEN (1) ELSE (0) EnD) AS HorrorYes,
	max(CASE WHEN (genre_id =28 ) THEN (1) ELSE (0) EnD) AS ActionYes,
	max(CASE WHEN (genre_id =35 ) THEN (1) ELSE (0) EnD) AS ComedyYes,
	max(CASE WHEN (genre_id = 36) THEN (1) ELSE (0) EnD) AS HistoryYes,
	max(CASE WHEN (genre_id = 37) THEN (1) ELSE (0) EnD) AS WesternYes,
	max(CASE WHEN (genre_id = 53) THEN (1) ELSE (0) EnD) AS ThrillerYes,
	max(CASE WHEN (genre_id = 80) THEN (1) ELSE (0) EnD) AS CrimeYes,
	max(CASE WHEN (genre_id =99 ) THEN (1) ELSE (0) EnD) AS DocumentaryYes,
	max(CASE WHEN (genre_id = 878) THEN (1) ELSE (0) EnD) AS  Science_FictionYes,
	max(CASE WHEN (genre_id =9648 ) THEN (1) ELSE (0) EnD) AS MysteryYes,
	max(CASE WHEN (genre_id = 10402) THEN (1) ELSE (0) EnD) AS MusicYes,
	max(CASE WHEN (genre_id = 10749) THEN (1) ELSE (0) EnD)AS RomanceYes,
	max(CASE WHEN (genre_id = 10751) THEN (1) ELSE (0) EnD) AS FamilyYes,
	max(CASE WHEN (genre_id = 10752) THEN (1) ELSE (0) EnD) AS WarYes,
	max(CASE WHEN (genre_id = 10769) THEN (1) ELSE (0) EnD) AS ForeignYes,
	max(CASE WHEN (genre_id = 10770) THEN (1) ELSE (0) EnD) AS TV_MovieYes
FROM dbo.movies_genres
left join dbo.movies_genres
on [dbo].[movies].movie_id = dbo.movies_genres.movie_id
group by [movies].movie_id
 ---select * from dbo.genres_dim
    
	

