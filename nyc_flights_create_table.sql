-- !preview conn=con_nycflights

-- Table for data on different airlines
DROP TABLE IF EXISTS airlines CASCADE;
CREATE TABLE airlines (
    carrier VARCHAR(255) PRIMARY KEY,
    name VARCHAR(255)
);
COPY airlines
FROM '/docker-entrypoint-initdb.d/airlines.csv'
CSV HEADER;

-- Table for data on different airports
DROP TABLE IF EXISTS airports CASCADE;
CREATE TABLE airports (
    faa CHAR(3) PRIMARY KEY,
    name VARCHAR(255),
    lat Double Precision,
    lon Double Precision,
    alt INT,
    tz INT,
    dst CHAR(1),
    tzone VARCHAR(255)
);
COPY airports
FROM '/docker-entrypoint-initdb.d/airports.csv'
CSV HEADER;

-- Table for data for different flights
DROP TABLE IF EXISTS flights CASCADE;
CREATE TABLE flights (
    year INT,
    month INT,
    day INT,
    dep_time INT,
    sched_dep_time INT,
    dep_delay INT,
    arr_time INT,
    sched_arr_time INT,
    arr_delay INT,
    carrier VARCHAR(255),
    flight INT,
    tailnum VARCHAR(255),
    origin CHAR(3),
    dest CHAR(3),
    air_time INT,
    distance INT,
    hour INT,
    minute INT,
    time_hour TIMESTAMP
);
COPY flights
FROM '/docker-entrypoint-initdb.d/flights.csv'
CSV HEADER;

-- Table for data on different planes
DROP TABLE IF EXISTS planes CASCADE;
CREATE TABLE planes (
    tailnum VARCHAR(255) PRIMARY KEY,
    year INT,
    type VARCHAR(255),
    manufacturer VARCHAR(255),
    model VARCHAR(255),
    engines INT,
    seats INT,
    speed INT,
    engine VARCHAR(255)
);
COPY planes
FROM '/docker-entrypoint-initdb.d/planes.csv'
CSV HEADER;

-- Table for data on different weather conditions allow NULL
DROP TABLE IF EXISTS weather CASCADE;
CREATE TABLE weather (
    origin CHAR(3),
    year INT,
    month INT,
    day INT,
    hour DOUBLE PRECISION,
    temp DOUBLE PRECISION,
    dewp DOUBLE PRECISION,
    humid DOUBLE PRECISION,
    wind_dir INT,
    wind_speed DOUBLE PRECISION,
    wind_gust DOUBLE PRECISION,
    precip DOUBLE PRECISION,
    pressure DOUBLE PRECISION,
    visib DOUBLE PRECISION,
    time_hour TIMESTAMP
);
COPY weather
FROM '/docker-entrypoint-initdb.d/weather.csv'
CSV HEADER;