CREATE PROCEDURE spCreateTables
AS
BEGIN
	IF OBJECT_ID('MovieTicketBookingAssignment.dbo.city') IS NULL
		BEGIN
			CREATE TABLE city (
				city_id INT IDENTITY (1, 1) PRIMARY KEY,
				city_name VARCHAR (255) NOT NULL
			);
		END;
	ELSE
		BEGIN
			PRINT 'city table already exists'
		END;
	IF OBJECT_ID('MovieTicketBookingAssignment.dbo.cinema') IS NULL
		BEGIN
			CREATE TABLE cinema (
				cinema_id INT IDENTITY (1, 1) PRIMARY KEY,
				cinema_name VARCHAR (255) NOT NULL,
				city_id INT NOT NULL,
				FOREIGN KEY (city_id) REFERENCES city (city_id) ON DELETE CASCADE ON UPDATE CASCADE
			);
		END;
	ELSE
		BEGIN
			PRINT 'cinema table already exists'
		END;
	IF OBJECT_ID('MovieTicketBookingAssignment.dbo.weekend') IS NULL
		BEGIN
			CREATE TABLE weekend (
				weekend_id INT IDENTITY (1, 1) PRIMARY KEY,
				weekend_day_name VARCHAR (255) NOT NULL
			);
		END;
	ELSE
		BEGIN
			PRINT 'weekend table already exists'
		END;
	IF OBJECT_ID('MovieTicketBookingAssignment.dbo.weekend_list') IS NULL
		BEGIN
			CREATE TABLE weekend_list (
				weekend_list_id INT IDENTITY (1, 1) PRIMARY KEY,
				weekend_id INT NOT NULL,
				cinema_hall_id INT NOT NULL
			);
		END;
	ELSE
		BEGIN
			PRINT 'weekend_list table already exists'
		END;
	IF OBJECT_ID('MovieTicketBookingAssignment.dbo.cinema_hall') IS NULL
		BEGIN
			CREATE TABLE cinema_hall (
				cinema_hall_id INT IDENTITY (1, 1) PRIMARY KEY,
				cinema_hall_name VARCHAR (255) NOT NULL,
				total_seats INT NOT NULL,
				cinema_id INT NOT NULL,
				FOREIGN KEY (cinema_id) REFERENCES cinema (cinema_id) ON DELETE CASCADE ON UPDATE CASCADE
			);
		END;
	ELSE
		BEGIN
			PRINT 'cinema_hall table already exists'
		END;
	IF OBJECT_ID('MovieTicketBookingAssignment.dbo.movie') IS NULL
		BEGIN
			CREATE TABLE movie (
				movie_id INT IDENTITY (1, 1) PRIMARY KEY,
				movie_name VARCHAR (255) NOT NULL,
				duration TIME (0) NOT NULL,
				release_date DATE NOT NULL
			);
		END;
	ELSE
		BEGIN
			PRINT 'movie table already exists'
		END;
	IF OBJECT_ID('MovieTicketBookingAssignment.dbo.show') IS NULL
		BEGIN
			CREATE TABLE show (
				show_id INT IDENTITY (1, 1) PRIMARY KEY,
				booked_seats INT NOT NULL,
				show_date DATE NOT NULL,
				start_at TIME (0) NOT NULL,
				ticket_price INT NOT NULL,
				cinema_hall_id INT NOT NULL,
				cinema_id INT NOT NULL,
				movie_id INT,
				FOREIGN KEY (cinema_hall_id) REFERENCES cinema_hall (cinema_hall_id) ON DELETE CASCADE ON UPDATE CASCADE,
			);
		END;
	ELSE
		BEGIN
			PRINT 'show table already exists'
		END;
	IF OBJECT_ID('MovieTicketBookingAssignment.dbo.person') IS NULL
		BEGIN
			CREATE TABLE person (
				person_id INT IDENTITY (1, 1) PRIMARY KEY,
				person_name VARCHAR (255) NOT NULL,
				city_id INT NOT NULL,
				FOREIGN KEY (city_id) REFERENCES city (city_id) ON DELETE CASCADE ON UPDATE CASCADE
			);

		END;
	ELSE
		BEGIN
			PRINT 'person table already exists'
		END;
	IF OBJECT_ID('MovieTicketBookingAssignment.dbo.booking') IS NULL
		BEGIN
			CREATE TABLE booking (
				booking_id INT IDENTITY (1, 1) PRIMARY KEY,
				number_of_seats INT NOT NULL,
				show_id INT NOT NULL,
				person_id INT NOT NULL,
				FOREIGN KEY (show_id) REFERENCES show (show_id) ON DELETE CASCADE ON UPDATE CASCADE,
			);
		END;
	ELSE
		BEGIN
			PRINT 'booking table already exists'
		END;
END
GO

EXEC spCreateTables