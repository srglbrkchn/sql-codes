SELECT name AS 'Band Name' FROM bands;

SELECT * FROM albums
WHERE release_year IS NOT NULL
ORDER BY release_year
LIMIT 1;


SELECT DISTINCT bands.name AS 'Band Name' FROM bands
JOIN albums ON bands.id = albums.band_id;

SELECT DISTINCT bands.name AS 'Band Name' FROM bands
LEFT JOIN albums ON bands.id = albums.band_id
WHERE band_id IS NULL;

SELECT songs.album_id, SUM(length) AS 'Duration' FROM songs
JOIN  albums.name AS'Name', albums.release_year AS 'Release Year'
ON albums.id = songs.album_id
GROUP BY album_id;

SELECT albums.name AS 'Name', albums.release_year AS 'Release Year',
SUM(songs.length) AS 'Duration' FROM albums
JOIN songs ON albums.id = songs.album_id
GROUP BY  albums.id
ORDER BY Duration DESC
LIMIT 1;

SELECT * FROM albums;

UPDATE albums
SET release_year = '1986'
WHERE id = 4;


INSERT INTO bands(name)
VALUES ('The Beatles');

INSERT INTO albums(name, release_year, band_id)
VALUES ("Sgt. Pepper's Lonely Hearts Club Band.", 1967, 8);

DELETE FROM bands
WHERE id = 8;

SELECT * FROM songs;

SELECT AVG(length) as 'Average Song Duration'
FROM songs;


SELECT albums.name AS 'Album', albums.release_year AS 'Release Year',
MAX(songs.length) AS Duration
FROM albums 
JOIN songs ON albums.id = songs.album_id
GROUP BY albums.id;
