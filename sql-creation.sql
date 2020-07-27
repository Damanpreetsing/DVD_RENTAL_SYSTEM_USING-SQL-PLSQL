-- Drop all tables
DROP TABLE queues;
DROP TABLE inventory;
DROP TABLE movie_actors;
DROP TABLE movie_genres;
DROP TABLE ratings;
DROP TABLE movies;
DROP TABLE genres;
DROP TABLE actors;
DROP TABLE directors;
DROP TABLE nationalities;
DROP TABLE conditions;
DROP TABLE progress;
DROP TABLE addresses;
DROP TABLE zipcodes;
DROP TABLE cities;
DROP TABLE states;
DROP TABLE countries;
DROP TABLE members;
DROP TABLE memberships;

-- Drop all auto increments
DROP SEQUENCE membership_ai;
DROP SEQUENCE member_ai;
DROP SEQUENCE country_ai;
DROP SEQUENCE state_ai;
DROP SEQUENCE city_ai;
DROP SEQUENCE zipcode_ai;
DROP SEQUENCE address_ai;
DROP SEQUENCE progress_ai;
DROP SEQUENCE condition_ai;
DROP SEQUENCE nationality_ai;
DROP SEQUENCE director_ai;
DROP SEQUENCE actor_ai;
DROP SEQUENCE genre_ai;
DROP SEQUENCE movie_ai;
DROP SEQUENCE rating_ai;
DROP SEQUENCE inventory_ai;
DROP SEQUENCE queue_ai;

-- Create memberships table
CREATE TABLE memberships (
    id INT NOT NULL,
    name VARCHAR(255) NOT NULL,
    description VARCHAR(255),
    movies_per_go INT,
    movies_per_month INT,
    price DECIMAL(12,2),
    created_at DATE NOT NULL,
    updated_at DATE,
    CONSTRAINT membership_pk PRIMARY KEY(id)
);

-- Create memberships auto increment
CREATE SEQUENCE membership_ai
MINVALUE 1
START WITH 1
INCREMENT BY 1
CACHE 10;

-- Create members table
CREATE TABLE members (
    id INT NOT NULL,
    first_name VARCHAR(255),
    last_name VARCHAR(255),
    email VARCHAR(255) NOT NULL,
    password VARCHAR(255) NOT NULL,
    membership_id INT NOT NULL,
    created_at DATE NOT NULL,
    updated_at DATE,
    deleted_at DATE,
    CONSTRAINT member_pk PRIMARY KEY(id),
    CONSTRAINT member_membership_fk FOREIGN KEY(membership_id) REFERENCES memberships(id)
);

-- Create unique email index
CREATE UNIQUE INDEX unique_email
ON members (email);

-- Create members auto increment
CREATE SEQUENCE member_ai
MINVALUE 1
START WITH 1
INCREMENT BY 1
CACHE 10;

-- Create countries table
CREATE TABLE countries (
    id INT NOT NULL,
    name VARCHAR(255) NOT NULL,
    CONSTRAINT country_pk PRIMARY KEY(id)
);

-- Create countries auto increment
CREATE SEQUENCE country_ai
MINVALUE 1
START WITH 1
INCREMENT BY 1
CACHE 10;

-- Create states table
CREATE TABLE states (
    id INT NOT NULL,
    name VARCHAR(255),
    country_id INT NOT NULL,
    CONSTRAINT state_pk PRIMARY KEY(id),
    CONSTRAINT state_country_fk FOREIGN KEY(country_id) REFERENCES countries(id)
);

-- Create states auto increment
CREATE SEQUENCE state_ai
MINVALUE 1
START WITH 1
INCREMENT BY 1
CACHE 10;

-- Create cities table
CREATE TABLE cities (
    id INT NOT NULL,
    name VARCHAR(255) NOT NULL,
    state_id INT NOT NULL,
    CONSTRAINT city_pk PRIMARY KEY(id),
    CONSTRAINT city_state_fk FOREIGN KEY(state_id) REFERENCES states(id)
);

-- Create cities auto increment
CREATE SEQUENCE city_ai
MINVALUE 1
START WITH 1
INCREMENT BY 1
CACHE 10;

-- Create zipcodes table
CREATE TABLE zipcodes (
    id INT NOT NULL,
    code VARCHAR(255) NOT NULL,
    city_id INT NOT NULL,
    CONSTRAINT zipcode_pk PRIMARY KEY(id),
    CONSTRAINT zipcode_city_fk FOREIGN KEY(city_id) REFERENCES cities(id)
);

-- Create zipcodes auto increment
CREATE SEQUENCE zipcode_ai
MINVALUE 1
START WITH 1
INCREMENT BY 1
CACHE 10;

-- Create addresses table
CREATE TABLE addresses (
    id INT NOT NULL,
    member_id INT NOT NULL,
    street VARCHAR(255) NOT NULL,
    zipcode_id INT NOT NULL,
    created_at DATE NOT NULL,
    CONSTRAINT address_pk PRIMARY KEY(id),
    CONSTRAINT address_member_fk FOREIGN KEY(member_id) REFERENCES members(id),
    CONSTRAINT address_zipcode_fk FOREIGN KEY(zipcode_id) REFERENCES zipcodes(id)
);

-- Create addresses auto increment
CREATE SEQUENCE address_ai
MINVALUE 1
START WITH 1
INCREMENT BY 1
CACHE 10;

-- Create progress table
CREATE TABLE progress (
    id INT NOT NULL,
    state VARCHAR(255) NOT NULL,
    created_at DATE NOT NULL,
    CONSTRAINT progress_pk PRIMARY KEY(id)
);

-- Create progress auto increment
CREATE SEQUENCE progress_ai
MINVALUE 1
START WITH 1
INCREMENT BY 1
CACHE 10;

-- Create conditions table
CREATE TABLE conditions (
    id INT NOT NULL,
    name VARCHAR(255) NOT NULL,
    CONSTRAINT condition_pk PRIMARY KEY(id)
);

-- Create conditions auto increment
CREATE SEQUENCE condition_ai
MINVALUE 1
START WITH 1
INCREMENT BY 1
CACHE 10;

-- Create nationalities table
CREATE TABLE nationalities (
	id INT NOT NULL,
	country VARCHAR(255) NOT NULL,
	CONSTRAINT nationality_pk PRIMARY KEY(id)
);

-- Create nationalities auto increment
CREATE SEQUENCE nationality_ai
MINVALUE 1
START WITH 1
INCREMENT BY 1
CACHE 10;

-- Create directors table
CREATE TABLE directors (
    id INT NOT NULL,
    first_name VARCHAR(255) NOT NULL,
    last_name VARCHAR(255) NOT NULL,
    nationality_id INT NOT NULL,
    CONSTRAINT director_pk PRIMARY KEY(id),
    CONSTRAINT director_nationality_fk FOREIGN KEY(nationality_id) REFERENCES nationalities(id)
);

-- Create directors auto increment
CREATE SEQUENCE director_ai
MINVALUE 1
START WITH 1
INCREMENT BY 1
CACHE 10;

-- Create actors table
CREATE TABLE actors (
    id INT NOT NULL,
    first_name VARCHAR(255) NOT NULL,
    last_name VARCHAR(255) NOT NULL,
    nationality_id INT NOT NULL,
    CONSTRAINT actor_pk PRIMARY KEY(id),
    CONSTRAINT actor_nationality_fk FOREIGN KEY(nationality_id) REFERENCES nationalities(id)
);

-- Create actors auto increment
CREATE SEQUENCE actor_ai
MINVALUE 1
START WITH 1
INCREMENT BY 1
CACHE 10;

-- Create genres table
CREATE TABLE genres (
    id INT NOT NULL,
    name VARCHAR(255) NOT NULL,
    CONSTRAINT genre_pk PRIMARY KEY(id)
);

-- Create genres auto increment
CREATE SEQUENCE genre_ai
MINVALUE 1
START WITH 1
INCREMENT BY 1
CACHE 10;

-- Create movies table
CREATE TABLE movies (
    id INT NOT NULL,
    title VARCHAR(255) NOT NULL,
    description VARCHAR(255),
    director_id INT NOT NULL,
    release_date DATE NOT NULL,
    created_at DATE NOT NULL,
    deleted_at DATE,
    CONSTRAINT movie_pk PRIMARY KEY(id),
    CONSTRAINT movie_director_fk FOREIGN KEY(director_id) REFERENCES directors(id)
);

-- Create movies auto increment
CREATE SEQUENCE movie_ai
MINVALUE 1
START WITH 1
INCREMENT BY 1
CACHE 10;

-- Create ratings table
CREATE TABLE ratings (
    id INT NOT NULL,
    stars INT NOT NULL,
    member_comment VARCHAR(255),
    movie_id INT NOT NULL,
    member_id INT NOT NULL,
    created_at DATE NOT NULL,
    CONSTRAINT rating_pk PRIMARY KEY(id),
    CONSTRAINT star_range_chk CHECK(stars BETWEEN 1 AND 5),
    CONSTRAINT rating_movie_fk FOREIGN KEY(movie_id) REFERENCES movies(id),
    CONSTRAINT rating_member_fk FOREIGN KEY(member_id) REFERENCES members(id)
);

-- Create ratings auto increment
CREATE SEQUENCE rating_ai
MINVALUE 1
START WITH 1
INCREMENT BY 1
CACHE 10;

-- Create movie_genres table
CREATE TABLE movie_genres (
    movie_id INT NOT NULL,
    genre_id INT NOT NULL,
    CONSTRAINT movie_genre_movie_fk FOREIGN KEY(movie_id) REFERENCES movies(id),
    CONSTRAINT movie_genre_genre_fk FOREIGN KEY(genre_id) REFERENCES genres(id)
);

-- Create movie_actors table
CREATE TABLE movie_actors (
    movie_id INT NOT NULL,
    actor_id INT NOT NULL,
    CONSTRAINT movie_actor_movie_fk FOREIGN KEY(movie_id) REFERENCES movies(id),
    CONSTRAINT movie_actor_actor_fk FOREIGN KEY(actor_id) REFERENCES actors(id)
);

-- Create inventory table
CREATE TABLE inventory (
    id INT NOT NULL,
    movie_id INT NOT NULL,
    condition_id INT NOT NULL,
    condition_description VARCHAR(255),
    created_at DATE NOT NULL,
    deleted_at DATE,
    CONSTRAINT inventory_pk PRIMARY KEY(id),
    CONSTRAINT inventory_movie_fk FOREIGN KEY(movie_id) REFERENCES movies(id),
    CONSTRAINT inventory_condition_fk FOREIGN KEY(condition_id) REFERENCES conditions(id)
);

-- Create inventory auto increment
CREATE SEQUENCE inventory_ai
MINVALUE 1
START WITH 1
INCREMENT BY 1
CACHE 10;

-- Create queues table
CREATE TABLE queues (
    id INT NOT NULL,
    progress_id INT NOT NULL,
    address_id INT NOT NULL,
    member_id INT NOT NULL,
    inventory_id INT NOT NULL,
    created_at DATE NOT NULL,
    updated_at DATE,
    CONSTRAINT queue_pk PRIMARY KEY(id),
    CONSTRAINT queue_progress_fk FOREIGN KEY(progress_id) REFERENCES progress(id),
    CONSTRAINT queue_address_fk FOREIGN KEY(address_id) REFERENCES addresses(id),
    CONSTRAINT queue_member_fk FOREIGN KEY(member_id) REFERENCES members(id),
    CONSTRAINT queue_inventory_fk FOREIGN KEY(inventory_id) REFERENCES inventory(id)
);

-- Create queues auto increment
CREATE SEQUENCE queue_ai
MINVALUE 1
START WITH 1
INCREMENT BY 1
CACHE 10;
