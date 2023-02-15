--1. What range of years for baseball games played does the provided database cover?
SELECT MIN(debut) AS earliest_game,
	MAX(finalgame) AS lastest_game
FROM people
