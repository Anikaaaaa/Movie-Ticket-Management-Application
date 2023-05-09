
CREATE TABLE city (
	city_id INT IDENTITY (1, 1) PRIMARY KEY,
	city_name VARCHAR (255) NOT NULL
);

CREATE TABLE cinema (
	cinema_id INT IDENTITY (1, 1) PRIMARY KEY,
	cinema_name VARCHAR (255) NOT NULL,
	city_id INT NOT NULL,
	FOREIGN KEY (city_id) REFERENCES city (city_id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE weekend (
	weekend_id INT IDENTITY (1, 1) PRIMARY KEY,
	weekend_day_name VARCHAR (255) NOT NULL
);
CREATE TABLE weekend_list (
	weekend_list_id INT IDENTITY (1, 1) PRIMARY KEY,
	weekend_id INT NOT NULL,
	cinema_hall_id INT NOT NULL
);
CREATE TABLE cinema_hall (
	cinema_hall_id INT IDENTITY (1, 1) PRIMARY KEY,
	cinema_hall_name VARCHAR (255) NOT NULL,
	total_seats INT NOT NULL,
	cinema_id INT NOT NULL,
	FOREIGN KEY (cinema_id) REFERENCES cinema (cinema_id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE movie (
	movie_id INT IDENTITY (1, 1) PRIMARY KEY,
	movie_name VARCHAR (255) NOT NULL,
	duration TIME (0) NOT NULL,
	release_date DATE NOT NULL
);

CREATE TABLE show (
	show_id INT IDENTITY (1, 1) PRIMARY KEY,
	booked_seats INT NOT NULL,
	show_date DATE NOT NULL,
	start_at TIME (0) NOT NULL,
	ticket_price INT NOT NULL,
	cinema_hall_id INT NOT NULL,
	movie_id INT,
	FOREIGN KEY (cinema_hall_id) REFERENCES cinema_hall (cinema_hall_id) ON DELETE CASCADE ON UPDATE CASCADE,
)

CREATE TABLE person (
	person_id INT IDENTITY (1, 1) PRIMARY KEY,
	person_name VARCHAR (255) NOT NULL,
	city_id INT NOT NULL,
	FOREIGN KEY (city_id) REFERENCES city (city_id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE booking (
	booking_id INT IDENTITY (1, 1) PRIMARY KEY,
	number_of_seats INT NOT NULL,
	show_id INT NOT NULL,
	person_id INT NOT NULL,
	FOREIGN KEY (show_id) REFERENCES show (show_id) ON DELETE CASCADE ON UPDATE CASCADE,
);

