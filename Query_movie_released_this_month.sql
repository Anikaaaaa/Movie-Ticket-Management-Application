WITH cte_movies_released_in_hall (name_of_movie, date_of_release,cinema_id) as(
	SELECT 
		movie_name,
		release_date,
		s.cinema_id
	FROM movie m
	INNER JOIN show s on s.movie_id = m.movie_id
)

SELECT DISTINCT
	name_of_movie
FROM
	cte_movies_released_in_hall
WHERE 
	YEAR(date_of_release) = YEAR(GETDATE()) AND MONTH(date_of_release)= MONTH(GETDATE()) AND cinema_id = 1
		
