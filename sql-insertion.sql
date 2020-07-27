-- Create necessary memberships
INSERT INTO memberships
	VALUES (membership_ai.nextval, 'Pay-per-time', 'Pay as you go, every movie is the same price', 1, NULL, '4.99', 
	SYSDATE, NULL);
INSERT INTO memberships
	VALUES (membership_ai.nextval, '2-at-a-time', 'You can rent 2 DVDs at a time with a limit of 4 DVDs per month', 2,
	4, '11.99', SYSDATE, NULL);
INSERT INTO memberships
	VALUES (membership_ai.nextval, '3-at-a-time', 'Our most popular program: you can rent as many DVDs as you want.
	You keep a revolving library of up to 3 DVDs at a time and can exchange them for new available DVDs as often as you
	like.', 3, NULL, '17.99', SYSDATE, NULL);

-- Create necessary members
INSERT INTO members VALUES (member_ai.nextval, 'Alex', 'Stevens', 'alex96@bu.edu', '1111', 2, SYSDATE, NULL, NULL);
INSERT INTO members VALUES (member_ai.nextval, 'George', 'Maiewski', 'maiewski@bu.edu', '1234', 3, SYSDATE, NULL, NULL);
INSERT INTO members VALUES (member_ai.nextval, 'John', 'Doe', 'johndoe@gmail.com', 'john1234', 1, SYSDATE, NULL, NULL);

-- Create necessary addresses
INSERT INTO countries VALUES (country_ai.nextval, 'United States');
INSERT INTO states VALUES (state_ai.nextval, 'Massachusetts', 1);
INSERT INTO cities VALUES (city_ai.nextval, 'Boston', 1);
INSERT INTO zipcodes VALUES (zipcode_ai.nextval, '02215', 1);
INSERT INTO addresses VALUES (address_ai.nextval, 1, 'Common 157', 1, SYSDATE);
INSERT INTO addresses VALUES (address_ai.nextval, 2, 'Boylston 22', 1, SYSDATE);
INSERT INTO addresses VALUES (address_ai.nextval, 3, 'Essex 10', 1, SYSDATE);

-- Create necessary progress states
INSERT INTO progress VALUES (progress_ai.nextval, 'Info received', SYSDATE);
INSERT INTO progress VALUES (progress_ai.nextval, 'In transit', SYSDATE);
INSERT INTO progress VALUES (progress_ai.nextval, 'Out for delivery', SYSDATE);
INSERT INTO progress VALUES (progress_ai.nextval, 'Failed attempt', SYSDATE);
INSERT INTO progress VALUES (progress_ai.nextval, 'Delivered', SYSDATE);
INSERT INTO progress VALUES (progress_ai.nextval, 'Exception', SYSDATE);
INSERT INTO progress VALUES (progress_ai.nextval, 'Expired', SYSDATE);
INSERT INTO progress VALUES (progress_ai.nextval, 'Pending', SYSDATE);
INSERT INTO progress VALUES (progress_ai.nextval, 'Returned', SYSDATE);

-- Create necessary conditions
INSERT INTO conditions VALUES (condition_ai.nextval, 'Brand new');
INSERT INTO conditions VALUES (condition_ai.nextval, 'Like new');
INSERT INTO conditions VALUES (condition_ai.nextval, 'Very good');
INSERT INTO conditions VALUES (condition_ai.nextval, 'Good');
INSERT INTO conditions VALUES (condition_ai.nextval, 'Acceptable');
INSERT INTO conditions VALUES (condition_ai.nextval, 'Unacceptable');

-- Create necessary nationalities
INSERT INTO nationalities VALUES (nationality_ai.nextval, 'United States');
INSERT INTO nationalities VALUES (nationality_ai.nextval, 'New Zealand');
INSERT INTO nationalities VALUES (nationality_ai.nextval, 'United Kingdom');
INSERT INTO nationalities VALUES (nationality_ai.nextval, 'Australia');
INSERT INTO nationalities VALUES (nationality_ai.nextval, 'Canada');
INSERT INTO nationalities VALUES (nationality_ai.nextval, 'Israel');
INSERT INTO nationalities VALUES (nationality_ai.nextval, 'Hong Kong');
INSERT INTO nationalities VALUES (nationality_ai.nextval, 'Bermuda');

-- Create necessary directors
INSERT INTO directors VALUES (director_ai.nextval, 'Bryan', 'Singer', 1);
INSERT INTO directors VALUES (director_ai.nextval, 'Clay', 'Kaytis', 1);
INSERT INTO directors VALUES (director_ai.nextval, 'George', 'Lucas', 1);
INSERT INTO directors VALUES (director_ai.nextval, 'Rich', 'Christiano', 1);
INSERT INTO directors VALUES (director_ai.nextval, 'Martin', 'Campbell', 2);
INSERT INTO directors VALUES (director_ai.nextval, 'Jeffrey', 'Abrams', 1);
INSERT INTO directors VALUES (director_ai.nextval, 'Pete', 'Travis', 3);

-- Create necessary actors
INSERT INTO actors VALUES (actor_ai.nextval, 'Patrick', 'Stewart', 3);
INSERT INTO actors VALUES (actor_ai.nextval, 'Ian', 'McKellen', 3);
INSERT INTO actors VALUES (actor_ai.nextval, 'Hugh', 'Jackman', 4);
INSERT INTO actors VALUES (actor_ai.nextval, 'Jason', 'Sudeikis', 1);
INSERT INTO actors VALUES (actor_ai.nextval, 'Josh', 'Gad', 1);
INSERT INTO actors VALUES (actor_ai.nextval, 'Danny', 'McBride', 1);
INSERT INTO actors VALUES (actor_ai.nextval, 'Hayden', 'Christensen', 5);
INSERT INTO actors VALUES (actor_ai.nextval, 'Natalie', 'Portman', 6);
INSERT INTO actors VALUES (actor_ai.nextval, 'Ewan', 'McGregor', 3);
INSERT INTO actors VALUES (actor_ai.nextval, 'David', 'Morin', 1);
INSERT INTO actors VALUES (actor_ai.nextval, 'Gavin', 'MacLeod', 1);
INSERT INTO actors VALUES (actor_ai.nextval, 'Hal', 'Linden', 1);
INSERT INTO actors VALUES (actor_ai.nextval, 'Katie', 'Leung', 3);
INSERT INTO actors VALUES (actor_ai.nextval, 'Jackie', 'Chan', 7);
INSERT INTO actors VALUES (actor_ai.nextval, 'Rufus', 'Jones', 3);
INSERT INTO actors VALUES (actor_ai.nextval, 'Chris', 'Pine', 1);
INSERT INTO actors VALUES (actor_ai.nextval, 'Zachary', 'Quinto', 1);
INSERT INTO actors VALUES (actor_ai.nextval, 'Zoe', 'Saldana', 1);
INSERT INTO actors VALUES (actor_ai.nextval, 'Karl', 'Urban', 2);
INSERT INTO actors VALUES (actor_ai.nextval, 'Olivia', 'Thirlby', 1);
INSERT INTO actors VALUES (actor_ai.nextval, 'Lena', 'Headey', 8);

-- Create necessary genres
INSERT INTO genres VALUES (genre_ai.nextval, 'Action');
INSERT INTO genres VALUES (genre_ai.nextval, 'Adventure');
INSERT INTO genres VALUES (genre_ai.nextval, 'Sci-Fi');
INSERT INTO genres VALUES (genre_ai.nextval, 'Animation');
INSERT INTO genres VALUES (genre_ai.nextval, 'Fantasy');
INSERT INTO genres VALUES (genre_ai.nextval, 'Drama');
INSERT INTO genres VALUES (genre_ai.nextval, 'Thriller');
INSERT INTO genres VALUES (genre_ai.nextval, 'Crime');

-- Create necessary movies
INSERT INTO movies
	VALUES (movie_ai.nextval, 'X-Men: Days of Future Past', 'The X-Men send Wolverine to the past in
	a desperate effort to change history and prevent an event that results in doom
	for both humans and mutants.', 1, '23-MAY-14', SYSDATE, NULL);
INSERT INTO movies
	VALUES (movie_ai.nextval, 'The Angry Birds Movie', 'Find out why the birds are so angry. When an
	island populated by happy, flightless birds is visited by mysterious green
	piggies, it''s up to three unlikely outcasts - Red, Chuck and Bomb - to figure out
	what the pigs are up to.', 2, '20-MAY-16', SYSDATE, NULL);
INSERT INTO movies
	VALUES (movie_ai.nextval, 'Star Wars: Episode III – Revenge of the Sith', 'Three years into the
	Clone Wars, the Jedi rescue Palpatine from Count Dooku. As Obi-Wan pursues a new threat, Anakin
	acts as a double agent between the Jedi Council and Palpatine and is lured into a sinister plan
	to rule the galaxy.', 3, '19-MAY-05', SYSDATE, NULL);
INSERT INTO movies
	VALUES (movie_ai.nextval, 'Time Changer', 'A Bible professor from 1890 comes forward in time to
	the present via a time machine and cannot believe the things that he sees!', 4, '29-DEC-16',
	SYSDATE, NULL);
INSERT INTO movies
	VALUES (movie_ai.nextval, 'Star Wars: Episode II - Attack of the Clones', 'Ten years after
	initially meeting, Anakin Skywalker shares a forbidden romance with Padmé, while Obi-Wan
	investigates an assassination attempt on the Senator and discovers a secret clone army crafted
	for the Jedi.', 3, '16-MAY-02', SYSDATE, NULL);
INSERT INTO movies
	VALUES (movie_ai.nextval, 'The Foreigner', 'A humble businessman with a buried past seeks
	justice when his daughter is killed in an act of terrorism. A cat-and-mouse conflict ensues with
	a government official, whose past may hold clues to the killers'' identities.', 5, '13-OCT-17',
	SYSDATE, NULL);
INSERT INTO movies
	VALUES (movie_ai.nextval, 'Star Trek: Into Darkness', 'After the crew of the Enterprise find an
	unstoppable force of terror from within their own organization, Captain Kirk leads a manhunt to
	a war-zone world to capture a one-man weapon of mass destruction.', 6, '16-MAY-13', SYSDATE,
	NULL);
INSERT INTO movies
	VALUES (movie_ai.nextval, 'Dredd', 'In a violent, futuristic city where the police have the
	authority to act as judge, jury and executioner, a cop teams with a trainee to take down a gang
	that deals the reality-altering drug, SLO-MO.', 7, '21-SEP-12', SYSDATE, NULL);
	
-- Create necessary ratings
INSERT INTO ratings VALUES (rating_ai.nextval, 5, 'Excellent movie!', 1, 1, SYSDATE);
INSERT INTO ratings VALUES (rating_ai.nextval, 4, 'Really enjoyed that movie', 2, 1, SYSDATE);
INSERT INTO ratings VALUES (rating_ai.nextval, 4, 'Was pretty good.', 4, 1, SYSDATE);
INSERT INTO ratings VALUES (rating_ai.nextval, 4, NULL, 5, 1, SYSDATE);
INSERT INTO ratings VALUES (rating_ai.nextval, 5, 'This movie was awesome', 7, 1, SYSDATE);
INSERT INTO ratings VALUES (rating_ai.nextval, 4, 'Decent storyline', 1, 2, SYSDATE);
INSERT INTO ratings VALUES (rating_ai.nextval, 3, 'Good movie, bad ending', 2, 2, SYSDATE);
INSERT INTO ratings VALUES (rating_ai.nextval, 4, NULL, 3, 2, SYSDATE);
INSERT INTO ratings VALUES (rating_ai.nextval, 3, 'Good movie experience', 7, 2, SYSDATE);
INSERT INTO ratings VALUES (rating_ai.nextval, 3, '', 2, 3, SYSDATE);
INSERT INTO ratings VALUES (rating_ai.nextval, 2, 'Bad acting', 3, 3, SYSDATE);
INSERT INTO ratings VALUES (rating_ai.nextval, 4, 'This is one of the better movies out there', 5, 3, SYSDATE);
INSERT INTO ratings VALUES (rating_ai.nextval, 2, 'Dont watch this.', 6, 3, SYSDATE);
INSERT INTO ratings VALUES (rating_ai.nextval, 3, 'Ok movie...', 7, 3, SYSDATE);
INSERT INTO ratings VALUES (rating_ai.nextval, 1, 'This was terrible', 8, 3, SYSDATE);

-- Link the genres to the movies
INSERT INTO movie_genres VALUES (1, 1);
INSERT INTO movie_genres VALUES (1, 2);
INSERT INTO movie_genres VALUES (1, 3);
INSERT INTO movie_genres VALUES (2, 1);
INSERT INTO movie_genres VALUES (2, 2);
INSERT INTO movie_genres VALUES (2, 4);
INSERT INTO movie_genres VALUES (3, 1);
INSERT INTO movie_genres VALUES (3, 2);
INSERT INTO movie_genres VALUES (3, 5);
INSERT INTO movie_genres VALUES (4, 3);
INSERT INTO movie_genres VALUES (4, 5);
INSERT INTO movie_genres VALUES (4, 6);
INSERT INTO movie_genres VALUES (5, 1);
INSERT INTO movie_genres VALUES (5, 2);
INSERT INTO movie_genres VALUES (5, 5);
INSERT INTO movie_genres VALUES (6, 1);
INSERT INTO movie_genres VALUES (6, 7);
INSERT INTO movie_genres VALUES (7, 1);
INSERT INTO movie_genres VALUES (7, 2);
INSERT INTO movie_genres VALUES (7, 3);
INSERT INTO movie_genres VALUES (8, 1);
INSERT INTO movie_genres VALUES (8, 8);
INSERT INTO movie_genres VALUES (8, 3);

-- Link the actors to the movies
INSERT INTO movie_actors VALUES (1, 1);
INSERT INTO movie_actors VALUES (1, 2);
INSERT INTO movie_actors VALUES (1, 3);
INSERT INTO movie_actors VALUES (2, 4);
INSERT INTO movie_actors VALUES (2, 5);
INSERT INTO movie_actors VALUES (2, 6);
INSERT INTO movie_actors VALUES (3, 7);
INSERT INTO movie_actors VALUES (3, 8);
INSERT INTO movie_actors VALUES (3, 9);
INSERT INTO movie_actors VALUES (4, 10);
INSERT INTO movie_actors VALUES (4, 11);
INSERT INTO movie_actors VALUES (4, 12);
INSERT INTO movie_actors VALUES (5, 7);
INSERT INTO movie_actors VALUES (5, 8);
INSERT INTO movie_actors VALUES (5, 9);
INSERT INTO movie_actors VALUES (6, 13);
INSERT INTO movie_actors VALUES (6, 14);
INSERT INTO movie_actors VALUES (6, 15);
INSERT INTO movie_actors VALUES (7, 16);
INSERT INTO movie_actors VALUES (7, 17);
INSERT INTO movie_actors VALUES (7, 18);
INSERT INTO movie_actors VALUES (8, 19);
INSERT INTO movie_actors VALUES (8, 20);
INSERT INTO movie_actors VALUES (8, 21);

-- Create necessary inventory of movies
INSERT INTO inventory VALUES (inventory_ai.nextval, 1, 1, NULL, SYSDATE, NULL);
INSERT INTO inventory VALUES (inventory_ai.nextval, 2, 1, NULL, SYSDATE, NULL);
INSERT INTO inventory VALUES (inventory_ai.nextval, 3, 1, NULL, SYSDATE, NULL);
INSERT INTO inventory VALUES (inventory_ai.nextval, 4, 1, NULL, SYSDATE, NULL);
INSERT INTO inventory VALUES (inventory_ai.nextval, 5, 1, NULL, SYSDATE, NULL);
INSERT INTO inventory VALUES (inventory_ai.nextval, 6, 1, NULL, SYSDATE, NULL);

-- Create necessary queues
INSERT INTO queues VALUES (queue_ai.nextval, 9, 1, 1, 1, SYSDATE, SYSDATE);
INSERT INTO queues VALUES (queue_ai.nextval, 9, 1, 1, 2, SYSDATE, SYSDATE);
INSERT INTO queues VALUES (queue_ai.nextval, 9, 1, 1, 3, SYSDATE, SYSDATE);
INSERT INTO queues VALUES (queue_ai.nextval, 9, 1, 1, 4, SYSDATE, SYSDATE);
INSERT INTO queues VALUES (queue_ai.nextval, 1, 2, 2, 1, SYSDATE, NULL);
INSERT INTO queues VALUES (queue_ai.nextval, 1, 2, 2, 2, SYSDATE, NULL);
INSERT INTO queues VALUES (queue_ai.nextval, 1, 2, 2, 3, SYSDATE, NULL);
