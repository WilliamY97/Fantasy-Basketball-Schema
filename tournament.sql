-- Table definitions for the tournament project.
--
-- Put your SQL 'create table' statements in this file; also 'create view'
-- statements if you choose to use it.
--
-- You can write comments in this file by starting them with two dashes, like
-- these lines here.

CREATE DATABASE tournament;

CREATE TABLE Players(
   ID SERIAL PRIMARY KEY,
   NAME TEXT
);

CREATE TABLE Matches(
	MATCH_ID SERIAL PRIMARY KEY,
	WIN_ID INT REFERENCES Players(ID),
	LOSE_ID INT REFERENCES Players(ID)
);