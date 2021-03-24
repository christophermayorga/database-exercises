USE albums_db;

DESCRIBE albums;

-- question 3
-- a 31
-- b 23
-- c id
-- d oldest is 1967; most recent is 2011

SELECT *
FROM albums;

SELECT DISTINCT artist
FROM albums;

SELECT release_date
FROM albums;

SELECT *
FROM albums
WHERE release_date > 2000;

SELECT *
FROM albums
WHERE release_date < 1970;

-- question 4
-- a The Dark Side of the Moon, The Wall
-- b 1967
-- c Grunge, Alternative rock
-- d The Bodyguard; Jagged Little Pill; Come On Over; Falling into You; Let's Talk About Love; Dangerous; 
--   The Immaculate Collection; Titanic: Music from the Motion Picture; Metallica; Nevermind; Supernatural
-- e Grease: The Original Soundtrack from the Motion Picture; Bad; Sgt. Pepper's Lonely Hearts Club Band;
--   Dirty Dancing; Let's Talk About Love; Dangerous; The Immaculate Collection; Abbey Road; Born in the U.S.A;
--   Brothers in Arms; Titanic: Music from the Motion Picture; Nevermind; The Wall
-- f Sgt. Pepper's Lonely Hearts Club Band; 1; Abbey Road; Born in the U.S.A.; Supernatural
--   If you wanted the albums with a genre of hard rock or progressive rock you'd have to include those in the 
--   'where' statement.

SELECT *
FROM albums
WHERE artist = "Pink Floyd";

SELECT *
FROM albums
WHERE name = "Sgt. Pepper's Lonely Hearts Club Band";

SELECT *
FROM albums
WHERE name = "Nevermind";

SELECT *
FROM albums
WHERE release_date BETWEEN 1990 and 1999;

SELECT *
FROM albums
WHERE sales < 20;

SELECT *
FROM albums
WHERE genre = "Rock";