CREATE PROCEDURE spbook_movie_ticket
@userid INT,
@no_of_tickets INT,
@movie_schedule_id INT,
@total_price INT OUTPUT
AS
BEGIN
	DECLARE @available_seat INT
	SET @available_seat = ((SELECT h.total_seats FROM cinema_hall h INNER JOIN show s ON s.cinema_hall_id=h.cinema_hall_id 
	WHERE s.show_id = @movie_schedule_id) - (SELECT booked_seats FROM show WHERE show_id = @movie_schedule_id))
	DECLARE @prev_booked_seat INT
	SET @prev_booked_seat = (SELECT booked_seats FROM show WHERE show_id = @movie_schedule_id)
	
	IF (@no_of_tickets > 4)  
		SELECT @total_price = -2 
	ELSE
		BEGIN
			IF (@available_seat >= @no_of_tickets)
				BEGIN
					UPDATE show SET booked_seats = (@prev_booked_seat+@no_of_tickets) WHERE show_id = @movie_schedule_id
					INSERT INTO booking(number_of_seats,show_id,person_id) VALUES(@no_of_tickets,@movie_schedule_id,@userid)
					SELECT @total_price = (SELECT ticket_price FROM show WHERE show_id = @movie_schedule_id) * @no_of_tickets
				END
			ELSE  
				SELECT @total_price = -1
		END
END
GO

DECLARE @booking_price INT
EXECUTE spbook_movie_ticket 1,2,2,@booking_price OUT
PRINT @booking_price

SELECT * FROM booking 
SELECT * FROM show