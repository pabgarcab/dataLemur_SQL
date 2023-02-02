-- Write a query to determine the top 5 artists whose songs appear in the Top 10 of the global_song_rank table the highest number of times. From now on, we'll refer to this ranking number as "song appearances".
-- Output the top 5 artist names in ascending order along with their song appearances ranking (not the number of song appearances, but the rank of who has the most appearances). The order of the rank should take precedence.

with tabla1 as(
SELECT a.artist_id, artist_name, s.song_id, day, rank
FROM artists as a
INNER JOIN songs as s ON s.artist_id = a.artist_id
INNER JOIN global_song_rank AS g ON s.song_id = g.song_id
where rank <= 10), 

tabla2 as (
select artist_name, count(artist_name) as veces
from tabla1
GROUP BY artist_name
order by veces DESC)

SELECT artist_name, dense_rank() OVER(ORDER BY veces DESC) as artist_rank
from tabla2
LIMIT 6;
