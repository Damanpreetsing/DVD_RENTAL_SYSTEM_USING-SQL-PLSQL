/* 
1) Rentals a.
Parametrized store procedure that supports a member renting a movie (invoke two times).
*/

CREATE OR REPLACE PROCEDURE member_renting_movie (
	address_id IN INT,
	member_id IN INT,
	inventory_id IN INT
)
IS
BEGIN
	INSERT INTO queues (id, progress_id, address_id, member_id, inventory_id, created_at)
		VALUES (queue_ai.nextval, 5, address_id, member_id, inventory_id, SYSDATE);
END;
/

BEGIN
	member_renting_movie(1, 1, 5);
END;
/

BEGIN
	member_renting_movie(1, 1, 6);
END;
/

/*
1) Rentals b.
Titles of all movies they have rented that are directed by two directors.
*/

SELECT movies.title AS rented_movies
FROM (SELECT queues.member_id,
	queues.inventory_id
	FROM queues
	WHERE queues.progress_id = 9) q
JOIN members ON members.id = q.member_id
LEFT JOIN inventory ON inventory.id = q.inventory_id
LEFT JOIN movies ON movies.id = inventory.movie_id
LEFT JOIN directors ON directors.id = movies.director_id
WHERE members.id = 1 AND directors.id IN (3, 4);

/*
2) Movie Queue a.
Parametrized store procedure that supports a member adding a movie to queue (invoke one time).
*/

CREATE OR REPLACE PROCEDURE adding_movie_to_queue (
	address_id IN INT,
	member_id IN INT,
	inventory_id IN INT
)
IS
BEGIN
	INSERT INTO queues (id, progress_id, address_id, member_id, inventory_id, created_at)
		VALUES (queue_ai.nextval, 1, address_id, member_id, inventory_id, SYSDATE);
END;
/

BEGIN
	adding_movie_to_queue(2, 2, 4);
END;
/

/*
2) Movie Queue b.
List the names of the first three movies in a members queue.
*/

SELECT movies.title AS first_three_queued_movies, q.created_at AS date_queued
FROM (SELECT queues.member_id,
	queues.inventory_id,
	queues.created_at
	FROM queues
	WHERE queues.progress_id IN (1, 2, 3)) q
JOIN members ON members.id = q.member_id
LEFT JOIN inventory ON inventory.id = q.inventory_id
LEFT JOIN movies ON movies.id = inventory.movie_id
WHERE members.id = 2 AND ROWNUM <= 3
ORDER BY q.created_at DESC;

/*
3) Enrollment a.
Parametrized store procedure that supports a member enrolling in different memberships (invoke two times).
*/

CREATE OR REPLACE PROCEDURE membership_enrollment (
	member_id IN INT,
	new_membership_id IN INT
)
IS
BEGIN
	UPDATE members
	SET membership_id = new_membership_id
	WHERE id = member_id;
END;
/

BEGIN
	membership_enrollment(3, 2);
END;
/

BEGIN
	membership_enrollment(1, 3);
END;
/

/*
3) Enrollment b.
List all members enrolled in a certain plan.
*/

SELECT members.first_name || ' ' || members.last_name AS members_with_2_at_a_time_plan
FROM members
WHERE membership_id = 2;

/*
4) Inventory a.
Parametrized store procedure that supports adding inventory (invoke three times).
*/

CREATE OR REPLACE PROCEDURE adding_inventory (
	movie_id IN INT,
	condition_id IN INT DEFAULT 1,
	condition_description IN VARCHAR DEFAULT NULL
)
IS
BEGIN
	INSERT INTO inventory (id, movie_id, condition_id, condition_description, created_at)
		VALUES(inventory_ai.nextval, movie_id, condition_id, condition_description, SYSDATE);
END;
/

-- (x3)
BEGIN
	adding_inventory(7);
END;
/

-- (x2)
BEGIN
	adding_inventory(8);
END;
/

/*
4) Inventory b.
List all movies that are out of inventory.
*/

SELECT DISTINCT movies.title
FROM inventory
LEFT JOIN queues ON queues.inventory_id = inventory.id
LEFT JOIN movies ON movies.id = inventory.movie_id
WHERE queues.progress_id IN (
    SELECT progress.id
    FROM progress
    WHERE progress.state = 'Info received' OR
    progress.state = 'In transit' OR
    progress.state = 'Out for delivery' OR
    progress.state = 'Delivered' OR
    progress.state = 'Expired' OR
    progress.state = 'Pending'
);

/*
5) Ratings a.
Parametrized store procedure that supports a customer rating a movie.
*/

CREATE OR REPLACE PROCEDURE rating_a_movie (
	movie_id IN INT,
	member_id IN INT,
	stars IN INT,
	member_comment IN VARCHAR DEFAULT NULL
)
IS
BEGIN
	INSERT INTO ratings (id, movie_id, member_id, stars, member_comment, created_at)
		VALUES(rating_ai.nextval, movie_id, member_id, stars, member_comment, SYSDATE);
END;
/

BEGIN
	rating_a_movie(5, 2, 2);
END;
/

BEGIN
	rating_a_movie(6, 2, 5, 'Great storyline!');
END;
/

/*
5) Ratings b.
List all movies sorted by average ratings.
*/

SELECT DISTINCT movies.title, (ROUND(AVG(CAST(ratings.stars AS FLOAT)), 2)) AS average_rating
FROM movies
LEFT JOIN ratings ON ratings.movie_id = movies.id
GROUP BY movies.title
ORDER BY average_rating DESC;
