SELECT
	h.cinema_hall_id,
	s.show_date,
	s.start_at,
	s.show_id,
	s.movie_id
from 
	cinema_hall h
inner join show s on s.cinema_hall_id = h.cinema_hall_id
where	
	s.movie_id is NULL
