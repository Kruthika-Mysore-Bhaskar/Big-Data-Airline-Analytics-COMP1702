-- airline_warehouse.sql
-- DDL and analytical queries for the airline warehouse

DROP TABLE IF EXISTS passengers;
DROP TABLE IF EXISTS flights;
DROP TABLE IF EXISTS bookings;

CREATE TABLE passengers (
    passenger_id INT,
    name STRING,
    email STRING,
    age INT,
    country STRING
)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ','
STORED AS TEXTFILE
TBLPROPERTIES ("skip.header.line.count"="1");

CREATE TABLE flights (
    flight_id INT,
    airline STRING,
    origin STRING,
    destination STRING,
    departure_time TIMESTAMP,
    arrival_time TIMESTAMP
)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ','
STORED AS TEXTFILE
TBLPROPERTIES ("skip.header.line.count"="1");

CREATE TABLE bookings (
    booking_id INT,
    passenger_id INT,
    flight_id INT,
    booking_date DATE,
    seat_class STRING,
    price DOUBLE
)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ','
STORED AS TEXTFILE
TBLPROPERTIES ("skip.header.line.count"="1");

-- LOAD DATA (adjust HDFS paths to your VM)
-- LOAD DATA INPATH '/data/airline/Passengers.csv' OVERWRITE INTO TABLE passengers;
-- LOAD DATA INPATH '/data/airline/Flights.csv'    OVERWRITE INTO TABLE flights;
-- LOAD DATA INPATH '/data/airline/Bookings.csv'   OVERWRITE INTO TABLE bookings;

-- Analytics examples
SELECT flight_id, COUNT(booking_id) AS total_bookings FROM bookings GROUP BY flight_id;

SELECT destination, COUNT(flight_id) AS total_flights
FROM flights
GROUP BY destination
ORDER BY total_flights DESC
LIMIT 1;

SELECT * FROM bookings ORDER BY price DESC LIMIT 1;

SELECT AVG(price) AS avg_economy_price FROM bookings WHERE seat_class = 'Economy';

SELECT p.name, p.country, b.booking_id, f.origin, f.destination
FROM passengers p
JOIN bookings b ON p.passenger_id = b.passenger_id
JOIN flights f ON b.flight_id = f.flight_id
WHERE p.country = 'USA';

SELECT *
FROM flights
WHERE departure_time >= '2024-04-01 00:00:00'
  AND departure_time <= '2024-04-01 23:59:59';

SELECT f.origin, f.destination, COUNT(b.booking_id) AS total_bookings
FROM flights f
JOIN bookings b ON f.flight_id = b.flight_id
GROUP BY f.origin, f.destination
ORDER BY total_bookings DESC
LIMIT 1;

SELECT f.flight_id, f.airline, COUNT(b.booking_id) AS total_bookings
FROM flights f
LEFT JOIN bookings b ON f.flight_id = b.flight_id
GROUP BY f.flight_id, f.airline
ORDER BY total_bookings DESC;
