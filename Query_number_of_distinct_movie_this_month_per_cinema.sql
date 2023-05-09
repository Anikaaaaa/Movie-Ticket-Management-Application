WITH cte_movies_released_in_hall (name_of_movie, date_of_release,cinema_id) as(
	SELECT 
		movie_name,
		release_date,
		c.cinema_id
	FROM movie m
	INNER JOIN show s on s.movie_id = m.movie_id
	INNER JOIN cinema_hall h on h.cinema_hall_id = s.cinema_hall_id
	INNER JOIN cinema c on c.cinema_id = h.cinema_id
)

SELECT 
	cinema_id,
	COUNT(DISTINCT name_of_movie)
FROM
	cte_movies_released_in_hall
WHERE 
	YEAR(date_of_release) = YEAR(GETDATE()) AND MONTH(date_of_release)= MONTH(GETDATE()) 
GROUP BY
	cinema_id