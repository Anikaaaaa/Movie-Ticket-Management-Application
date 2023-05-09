CREATE PROCEDURE spInsertValues
AS
BEGIN

SET IDENTITY_INSERT city ON;  

INSERT INTO city(city_id,city_name) VALUES(1,'CityA')
INSERT INTO city(city_id,city_name) VALUES(2,'CityB')
INSERT INTO city(city_id,city_name) VALUES(3,'CityC')
INSERT INTO city(city_id,city_name) VALUES(4,'CityD')

SET IDENTITY_INSERT city OFF;  

SET IDENTITY_INSERT cinema ON;  

INSERT INTO cinema(cinema_id,cinema_name,city_id) VALUES(1,'CinemaA',1)
INSERT INTO cinema(cinema_id,cinema_name,city_id) VALUES(2,'CinemaB',2)
INSERT INTO cinema(cinema_id,cinema_name,city_id) VALUES(3,'CinemaC',3)
INSERT INTO cinema(cinema_id,cinema_name,city_id) VALUES(4,'CinemaD',4)
INSERT INTO cinema(cinema_id,cinema_name,city_id) VALUES(5,'CinemaE',1)
INSERT INTO cinema(cinema_id,cinema_name,city_id) VALUES(6,'CinemaF',2)
INSERT INTO cinema(cinema_id,cinema_name,city_id) VALUES(7,'CinemaG',3)
INSERT INTO cinema(cinema_id,cinema_name,city_id) VALUES(8,'CinemaH',4)

SET IDENTITY_INSERT cinema OFF;  

SET IDENTITY_INSERT weekend ON;  

INSERT INTO weekend(weekend_id,weekend_day_name) VALUES(1,'Sunday')
INSERT INTO weekend(weekend_id,weekend_day_name) VALUES(2,'Monday')
INSERT INTO weekend(weekend_id,weekend_day_name) VALUES(3,'Tuesday')
INSERT INTO weekend(weekend_id,weekend_day_name) VALUES(4,'Wednesday')
INSERT INTO weekend(weekend_id,weekend_day_name) VALUES(5,'Thursday')
INSERT INTO weekend(weekend_id,weekend_day_name) VALUES(6,'Friday')
INSERT INTO weekend(weekend_id,weekend_day_name) VALUES(7,'Saturday')

SET IDENTITY_INSERT weekend OFF;  

SET IDENTITY_INSERT weekend_list ON;  

INSERT INTO weekend_list(weekend_list_id,weekend_id,cinema_hall_id) VALUES(1,1,1)
INSERT INTO weekend_list(weekend_list_id,weekend_id,cinema_hall_id) VALUES(2,2,1)
INSERT INTO weekend_list(weekend_list_id,weekend_id,cinema_hall_id) VALUES(3,1,2)
INSERT INTO weekend_list(weekend_list_id,weekend_id,cinema_hall_id) VALUES(4,3,4)
INSERT INTO weekend_list(weekend_list_id,weekend_id,cinema_hall_id) VALUES(5,4,5)
INSERT INTO weekend_list(weekend_list_id,weekend_id,cinema_hall_id) VALUES(6,1,6)
INSERT INTO weekend_list(weekend_list_id,weekend_id,cinema_hall_id) VALUES(7,6,3)
INSERT INTO weekend_list(weekend_list_id,weekend_id,cinema_hall_id) VALUES(8,1,7)
INSERT INTO weekend_list(weekend_list_id,weekend_id,cinema_hall_id) VALUES(9,1,8)
SET IDENTITY_INSERT weekend_list OFF;  

SET IDENTITY_INSERT cinema_hall ON;  

INSERT INTO cinema_hall(cinema_hall_id,cinema_hall_name,total_seats,cinema_id) VALUES(1,'Cinema_hallA1',20,1)
INSERT INTO cinema_hall(cinema_hall_id,cinema_hall_name,total_seats,cinema_id) VALUES(2,'Cinema_hallA2',30,1)
INSERT INTO cinema_hall(cinema_hall_id,cinema_hall_name,total_seats,cinema_id) VALUES(3,'Cinema_hallB1',150,2)
INSERT INTO cinema_hall(cinema_hall_id,cinema_hall_name,total_seats,cinema_id) VALUES(4,'Cinema_hallB2',200,2)
INSERT INTO cinema_hall(cinema_hall_id,cinema_hall_name,total_seats,cinema_id) VALUES(5,'Cinema_hallC1',50,3)
INSERT INTO cinema_hall(cinema_hall_id,cinema_hall_name,total_seats,cinema_id) VALUES(6,'Cinema_hallC2',60,3)
INSERT INTO cinema_hall(cinema_hall_id,cinema_hall_name,total_seats,cinema_id) VALUES(7,'Cinema_hallD1',150,4)
INSERT INTO cinema_hall(cinema_hall_id,cinema_hall_name,total_seats,cinema_id) VALUES(8,'Cinema_hallD2',200,4)

SET IDENTITY_INSERT cinema_hall OFF;  

SET IDENTITY_INSERT movie ON;  

INSERT INTO movie(movie_id,movie_name,duration,release_date) VALUES(1,'Movie1','03:30:00','2022-06-23')
INSERT INTO movie(movie_id,movie_name,duration,release_date) VALUES(2,'Movie2','02:30:00','2022-07-23')
INSERT INTO movie(movie_id,movie_name,duration,release_date) VALUES(3,'Movie3','04:00:00','2022-08-23')
INSERT INTO movie(movie_id,movie_name,duration,release_date) VALUES(4,'Movie4','03:00:00','2022-09-23')
INSERT INTO movie(movie_id,movie_name,duration,release_date) VALUES(5,'Movie5','03:30:00','2023-01-23')
INSERT INTO movie(movie_id,movie_name,duration,release_date) VALUES(6,'Movie6','02:30:00','2023-01-23')
INSERT INTO movie(movie_id,movie_name,duration,release_date) VALUES(7,'Movie7','04:00:00','2022-12-23')
INSERT INTO movie(movie_id,movie_name,duration,release_date) VALUES(8,'Movie8','03:00:00','2023-02-23')

SET IDENTITY_INSERT movie OFF;  

SET IDENTITY_INSERT show ON;  

INSERT INTO show(show_id,booked_seats,show_date,start_at,ticket_price,cinema_hall_id,cinema_id,movie_id) VALUES(1,16,'2023-01-23','03:30:00',150,1,1,1)
INSERT INTO show(show_id,booked_seats,show_date,start_at,ticket_price,cinema_hall_id,cinema_id,movie_id) VALUES(2,2,'2023-01-20','03:30:00',200,2,1,2)
INSERT INTO show(show_id,booked_seats,show_date,start_at,ticket_price,cinema_hall_id,cinema_id,movie_id) VALUES(3,10,'2023-01-21','02:30:00',300,3,2,1)
INSERT INTO show(show_id,booked_seats,show_date,start_at,ticket_price,cinema_hall_id,cinema_id,movie_id) VALUES(4,10,'2023-01-23','10:30:00',400,1,1,3)
INSERT INTO show(show_id,booked_seats,show_date,start_at,ticket_price,cinema_hall_id,cinema_id,movie_id) VALUES(5,0,'2023-01-01','10:30:00',0,1,1,null)
INSERT INTO show(show_id,booked_seats,show_date,start_at,ticket_price,cinema_hall_id,cinema_id,movie_id) VALUES(6,2,'2023-01-02','03:30:00',200,2,1,5)
INSERT INTO show(show_id,booked_seats,show_date,start_at,ticket_price,cinema_hall_id,cinema_id,movie_id) VALUES(7,10,'2023-01-03','02:30:00',300,1,1,6)
INSERT INTO show(show_id,booked_seats,show_date,start_at,ticket_price,cinema_hall_id,cinema_id,movie_id) VALUES(8,10,'2023-01-04','10:30:00',400,1,1,8)
INSERT INTO show(show_id,booked_seats,show_date,start_at,ticket_price,cinema_hall_id,cinema_id,movie_id) VALUES(9,0,'2023-01-05','10:30:00',0,1,1,7)

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

END
GO

EXEC spInsertValues