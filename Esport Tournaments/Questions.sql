set search_path = esport_tournaments;

select * from matches;
select * from players;
select * from teams;

-- 1. What are the names of the players whose salary is greater than 100,000?

select player_name
from players
where salary >  100000;

-- 2. What is the team name of the player with player_id = 3?

select team_name
from teams
join players on teams.team_id = players.team_id and player_id = 3;

-- 3. What is the total number of players in each team?

select team_name, count(players.player_id)
from teams
join players on teams.team_id = players.team_id
group by team_name;

-- 4. What is the team name and captain name of the team with team_id = 2?

select team_name, player_name
from teams 
join players on teams.captain_id = players.player_id and teams.team_id = 2;

-- 5. What are the player names and their roles in the team with team_id = 1?

select player_name, role
from teams
join players on teams.team_id = players.team_id and teams.team_id = 1;

-- 6. What are the team names and the number of matches they have won?

select team_name, count(winner_id) total_wins
from teams 
join matches on teams.team_id = matches.winner_id
group by team_name
order by total_wins desc;

-- 7. What is the average salary of players in the teams with country 'USA'?

select round(avg(salary),2) avg_salary
from teams
join players on teams.team_id = players.team_id and country = 'USA';

-- 8. Which team won the most matches?

select team_name, count(winner_id) total_wins
from teams
join matches on teams.team_id = matches.winner_id
group by team_name
order by total_wins desc
limit 1;

-- 9. What are the team names and the number of players in each team whose salary is greater than 100,000?

select team_name, count(players.player_id) total_players 
from teams
join players on teams.team_id = players.team_id and salary > 100000
group by team_name

-- 10. What is the date and the score of the match with match_id = 3?

select match_date, score_team1, score_team2
from matches
where match_id = 3;