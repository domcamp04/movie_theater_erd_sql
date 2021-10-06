--create customers TABLE

CREATE TABLE customers( 
    cust_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    age VARCHAR(8),
    date_created DATE DEFAULT CURRENT_DATE
);

--insert customer data
INSERT INTO customers(first_name, last_name, age) VALUES
    ('Dominick', 'Campanile', '> 18'),
    ('Kobe', 'Campanile', '> 13'),
    ('Emma', 'Sloan', '> 18'),
    ('Chris', 'Pauly', '> 65');

SELECT * FROM customers;

--create tickets TABLE
CREATE TABLE tickets(
    ticket_id SERIAL PRIMARY KEY,
    date_created DATE DEFAULT CURRENT_DATE,
    movie_title VARCHAR(250),
    theater_num INTEGER REFERENCES movies(theater_num),
    cust_id INTEGER,
    CONSTRAINT fk_customer
    FOREIGN KEY (cust_id) 
    REFERENCES customers(cust_id) 
);

ALTER TABLE tickets DROP COLUMN theater_num;
ALTER TABLE tickets ADD theater_num INTEGER REFERENCES movies(theater_num);


--create movies TABLE
CREATE TABLE movies( 
    movie_id SERIAL PRIMARY KEY,
    movie_title VARCHAR(250),
    rating VARCHAR(10),
    age_to_admit VARCHAR(8),
    run_time VARCHAR(10),
    theater_num INTEGER
);

SELECT * FROM movies;

--insert movie DATA
INSERT INTO movies (movie_title, rating, age_to_admit, run_time, theater_num) VALUES
    ('Dodgeball', 'pg-13', '> 13', '2hrs10mins', 1),
    ('Inception', 'pg-13', '> 13', '3hrs8mins', 2),
    ('A Quiet Place', 'R', '> 18', '1hr56mins', 3),
    ('Wreck It Ralph', 'G', null, '2hrs24mins', 4);

UPDATE movies
SET theater_num = 11
WHERE movie_id = 1;

UPDATE movies
SET theater_num = 12
WHERE movie_id = 2;

UPDATE movies
SET theater_num = 13
WHERE movie_id = 3;

UPDATE movies
SET theater_num = 14
WHERE movie_id = 4;

--alter tickets TABLE
ALTER TABLE tickets
ADD FOREIGN KEY(theater_num)
REFERENCES movies(theater_num);