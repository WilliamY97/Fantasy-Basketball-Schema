-- Table definitions for the tournament project.
--
-- Put your SQL 'create table' statements in this file; also 'create view'
-- statements if you choose to use it.
--
-- You can write comments in this file by starting them with two dashes, like
-- these lines here.

DROP DATABASE IF EXISTS tournament;
CREATE DATABASE tournament;

\c tournament;

CREATE TABLE Players (
		  name   text,
	  		id   serial PRIMARY KEY
);

CREATE TABLE Matches (
	id SERIAL primary key,
	player int references layers(id),
	opponent int references Players(id),
	result int
);

CREATE VIEW Count AS
	SELECT Players.id, Count(Matches.opponent) AS n 
	FROM Players
	LEFT JOIN Matches
	ON Players.id = Matches.player
	GROUP BY Players.id;

CREATE VIEW Wins AS
	SELECT Players.id, COUNT(Matches.opponent) AS n 
	FROM Players
	LEFT JOIN (SELECT * FROM Matches WHERE result>0) as Matches
	ON Players.id = Matches.player
	GROUP BY Players.id;

CREATE VIEW Standings AS 
	SELECT Players.id,Players.name,Wins.n as wins,Count.n as matches 
	FROM Players,Count,Wins
	WHERE Players.id = Wins.id and Wins.id = Count.id;






