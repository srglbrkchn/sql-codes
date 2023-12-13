SELECT * FROM bands;
SELECT * FROM albums;
SELECT * FROM songs;

SELECT bands.name AS 'BAND', COUNT(songs.id) AS 'Number of Songs'
FROM bands 
JOIN albums ON bands.id = albums.band_id
JOIN songs ON albums.id = songs.album_id
GROUP BY bands.id
;
