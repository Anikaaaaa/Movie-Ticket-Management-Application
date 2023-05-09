use Practice;

SET IDENTITY_INSERT city ON;  

INSERT INTO city(city_id,city_name) VALUES(1,'CityA')
INSERT INTO city(city_id,city_name) VALUES(2,'CityB')
INSERT INTO city(city_id,city_name) VALUES(3,'CityC')
INSERT INTO city(city_id,city_name) VALUES(4,'CityD')

SET IDENTITY_INSERT city OFF;  

SET IDENTITY_INSERT cinema ON;  

INSERT INTO cinema(cinema_id,cinema_name,number_of_halls,city_id) VALUES(1,'CinemaA',2,1)
INSERT INTO cinema(cinema_id,cinema_name,number_of_halls,city_id) VALUES(2,'CinemaB',2,2)
INSERT INTO cinema(cinema_id,cinema_name,number_of_halls,city_id) VALUES(3,'CinemaC',2,3)
INSERT INTO cinema(cinema_id,cinema_name,number_of_halls,city_id) VALUES(4,'CinemaD',2,4)

SET IDENTITY_INSERT cinema OFF;  

SET IDENTITY_INSERT cinema_hall ON;  

INSERT INTO cinema_hall(cinema_hall_id,cinema_hall_name,total_seats,weekend_id,cinema_id) VALUES(1,'Cinema_hallA1',20,1,1)
INSERT INTO cinema_hall(cinema_hall_id,cinema_hall_name,total_seats,weekend_id,cinema_id) VALUES(2,'Cinema_hallA2',30,2,1)
INSERT INTO cinema_hall(cinema_hall_id,cinema_hall_name,total_seats,weekend_id,cinema_id) VALUES(3,'Cinema_hallB1',150,3,2)
INSERT INTO cinema_hall(cinema_hall_id,cinema_hall_name,total_seats,weekend_id,cinema_id) VALUES(4,'Cinema_hallB2',200,3,2)
INSERT INTO cinema_hall(cinema_hall_id,cinema_hall_name,total_seats,weekend_id,cinema_id) VALUES(5,'Cinema_hallC1',50,4,3)
INSERT INTO cinema_hall(cinema_hall_id,cinema_hall_name,total_seats,weekend_id,cinema_id) VALUES(6,'Cinema_hallC2',60,5,3)
INSERT INTO cinema_hall(cinema_hall_id,cinema_hall_name,total_seats,weekend_id,cinema_id) VALUES(7,'Cinema_hallD1',150,6,4)
INSERT INTO cinema_hall(cinema_hall_id,cinema_hall_name,total_seats,weekend_id,cinema_id) VALUES(8,'Cinema_hallD2',200,7,4)

SET IDENTITY_INSERT cinema_hall OFF;  

SET IDENTITY_INSERT movie ON;  

INSERT INTO movie(movie_id,movie_name,duration,release_date) VALUES(1,'Movie1','03:30:00','2022-06-23')
INSERT INTO movie(movie_id,movie_name,duration,release_date) VALUES(2,'Movie2','02:30:00','2022-07-23')
INSERT INTO movie(movie_id,movie_name,duration,release_date) VALUES(3,'Movie3','04:00:00','2022-08-23')
INSERT INTO movie(movie_id,movie_name,duration,release_date) VALUES(4,'Movie4','03:00:00','2022-09-23')

SET IDENTITY_INSERT movie OFF;  

SET IDENTITY_INSERT show ON;  

INSERT INTO show(show_id,available_seats,show_date,start_at,cinema_hall_id,movie_id) VALUES(1,16,'2023-01-23','03:30:00',1,1)
INSERT INTO show(show_id,available_seats,show_date,start_at,cinema_hall_id,movie_id) VALUES(2,2,'2023-01-20','03:30:00',2,2)
INSERT INTO show(show_id,available_seats,show_date,start_at,cinema_hall_id,movie_id) VALUES(3,10,'2023-01-21','02:30:00',3,1)
INSERT INTO show(show_id,available_seats,show_date,start_at,cinema_hall_id,movie_id) VALUES(4,10,'2023-01-23','10:30:00',1,3)
INSERT INTO show(show_id,available_seats,show_date,start_at,cinema_hall_id,movie_id) VALUES(5,0,'2023-01-24','10:30:00',1,0)

SET IDENTITY_INSERT show OFF;  

SET IDENTITY_INSERT person ON;  

INSERT INTO person(person_id,person_name,city_id) VALUES(1,'person1',1)
INSERT INTO person(person_id,person_name,city_id) VALUES(2,'person2',1)
INSERT INTO person(person_id,person_name,city_id) VALUES(3,'person3',1)
INSERT INTO person(person_id,person_name,city_id) VALUES(4,'person4',2)
INSERT INTO person(person_id,person_name,city_id) VALUES(5,'person5',3)
INSERT INTO person(person_id,person_name,city_id) VALUES(6,'person6',3)
INSERT INTO person(person_id,person_name,city_id) VALUES(7,'person7',4)
INSERT INTO person(person_id,person_name,city_id) VALUES(8,'person8',4)
INSERT INTO person(person_id,person_name,city_id) VALUES(9,'person9',4)

SET IDENTITY_INSERT person OFF;  

SET IDENTITY_INSERT booking ON;  

INSERT INTO booking(booking_id,number_of_seats,show_id,person_id) VALUES(1,1,1,1)
INSERT INTO booking(booking_id,number_of_seats,show_id,person_id) VALUES(2,1,2,2)
INSERT INTO booking(booking_id,number_of_seats,show_id,person_id) VALUES(3,3,2,3)
INSERT INTO booking(booking_id,number_of_seats,show_id,person_id) VALUES(4,1,3,4)

SET IDENTITY_INSERT booking OFF;  


Select movie_name
from movie m
inner join show s on s.movie_id = m.movie_id
inner join cinema_hall h on h.cinema_hall_id = s.cinema_hall_id
inner join cinema c on c.cinema_id = h.cinema_id
where year(release_date) = 2021
group by movie_name

SET IDENTITY_INSERT show ON;  

INSERT INTO show(show_id,available_seats,show_date,start_at,cinema_hall_id,movie_id) VALUES(8,0,'2023-01-27','10:30:00',3,null)
SET IDENTITY_INSERT show OFF;  

Select h.cinema_hall_id,
s.show_date,
s.start_at,
s.show_id,
s.movie_id
from cinema_hall h
inner join show s on s.cinema_hall_id = h.cinema_hall_id
where s.movie_id is NULL

create function weekend_hall(@hall_id int)
returns int
as
begin
declare @weekend int
set @weekend = (select weekend_id from cinema_hall where cinema_hall_id = @hall_id)
return @weekend 
end

select dbo.weekend_hall(4)

select * from show

create procedure spbook_movie_ticket1
@userid int,
@no_of_tickets int,
@movie_schedule_id int,
@total_price int output
as
begin
	declare @available_seat int
	set @available_seat = ((select h.total_seats from cinema_hall h inner join show s on s.cinema_hall_id=h.cinema_hall_id 
	where s.show_id = @movie_schedule_id) - (select booked_seat from show where show_id = @movie_schedule_id))
	declare @prev_booked_seat int
	set @prev_booked_seat = (select booked_seat from show where show_id = @movie_schedule_id)
	
	if (@no_of_tickets > 4)  
		select @total_price = -2 
	else
	 begin
		if (@available_seat >= @no_of_tickets)
		begin
		 UPDATE show SET booked_seat = (@prev_booked_seat+@no_of_tickets) where show_id = @movie_schedule_id
		  
		INSERT INTO booking(number_of_seats,show_id,person_id) VALUES(@no_of_tickets,@movie_schedule_id,@userid)

		

			 select @total_price = (select ticket_price from show where show_id = @movie_schedule_id) * @no_of_tickets
		end
	else  
		select @total_price = -1
	end

	end

declare @booking_price int
execute spbook_movie_ticket1 1,5,1,@booking_price out
print @booking_price

select * from booking 
select * from show