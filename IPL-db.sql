USE ipl_db;
SELECT DATABASE();
SHOW TABLES;
SELECT * FROM matches LIMIT 5;

-- 1] Which teams have played the most IPL matches?
SELECT team,
COUNT(*) AS total_matches
FROM (
    SELECT team1 AS team FROM matches
    UNION ALL
    SELECT team2 FROM matches
) AS all_teams
GROUP BY team
ORDER BY total_matches DESC
LIMIT 3;

-- 2]Which teams have won the most matches?
SELECT winner,
COUNT(*) AS total_wins
FROM matches
WHERE winner IS NOT NULL
GROUP BY winner
ORDER BY total_wins DESC;

-- 3]Winning Percentage of Every Team

SELECT
team,
played,
wins,
ROUND((wins/played)*100,2) AS winning_percentage
FROM
(
SELECT
t.team,
COUNT(*) AS played,
SUM(CASE WHEN m.winner=t.team THEN 1 ELSE 0 END) AS wins
FROM
(
SELECT team1 AS team FROM matches
UNION
SELECT team2 FROM matches
) t
JOIN matches m
ON t.team=m.team1
OR t.team=m.team2
GROUP BY team
) x
ORDER BY winning_percentage DESC;


-- 4]Top 10 Player of the Match Winners
SELECT
player_of_match,
COUNT(*) AS awards
FROM matches
GROUP BY player_of_match
ORDER BY awards DESC
LIMIT 10;

-- 5]Which Stadium Hosted the Most Matches?
SELECT
venue,
COUNT(*) AS matches_hosted
FROM matches
GROUP BY venue
ORDER BY matches_hosted DESC;

-- 6]Toss Decision Analysis
SELECT
toss_decision,
COUNT(*) AS total
FROM matches
GROUP BY toss_decision;

-- 7]Toss Winner vs Match Winner
SELECT
CASE
WHEN toss_winner = winner THEN 'Won Match'
ELSE 'Lost Match'
END AS toss_effect,
COUNT(*) AS total
FROM matches
GROUP BY toss_effect;

-- 8]Season-wise Total Matches
SELECT
season,
COUNT(*) AS total_matches
FROM matches
GROUP BY season
ORDER BY season;

-- 9]Biggest Wins in IPL History By Runs
SELECT
winner,
team1,
team2,
win_by_runs
FROM matches
WHERE win_by_runs>0
ORDER BY win_by_runs DESC
LIMIT 10;

-- 9]Biggest Wins in IPL History By Wickets
SELECT
winner,
team1,
team2,
win_by_wickets
FROM matches
WHERE win_by_wickets>0
ORDER BY win_by_wickets DESC
LIMIT 10;

-- 10]Season-wise Champions
CREATE VIEW season_wise_champions AS
SELECT
    m.season,
    m.winner AS champion
FROM matches m
JOIN (
    SELECT season, MAX(id) AS max_id
    FROM matches
    GROUP BY season
) s
ON m.id = s.max_id;

SELECT * FROM season_wise_champions;


-- 11]Team Winning While Batting First
SELECT
winner,
COUNT(*) AS wins
FROM matches
WHERE win_by_runs>0
GROUP BY winner
ORDER BY wins DESC;

-- 11]Team Winning While Chasing
SELECT
winner,
COUNT(*) AS wins
FROM matches
WHERE win_by_wickets>0
GROUP BY winner
ORDER BY wins DESC;


SELECT VERSION();












