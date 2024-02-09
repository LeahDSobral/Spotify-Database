SELECT *
FROM playlist_info;


INSERT INTO recommended_artists
VALUES ('SOJA',
'east coast reggae, reggae',
58,
'2vaWvC8suCFkRXejDOK7EE',
'True Love, You and Me, Rest of My Life, Everything Changes - feat. Dread Mar I, Here I Am'),

('Tribal Seeds',
'reggae rock, west coast reggae',
53,
'7jgZFR40bWjwOrRCOZFB02',
'Dawn of Time, In Your Eyes, The Garden, Ruined, Moonlight'),
('Rebelution',
'reggae rock',
58,
'2WjvvwAX0mdWwq3aFuUdtc',
'Feeling Alright, Lazy Afternoon, Count Me In, Safe and Sound, Fade Away'),
('Slightly Stoopid',
'reggae fusion, reggae rock',
60,
'6MxlVTY6PmY8Nyn16fvxtb',
'Closer to the Sun, Collie Man, World on Fire (feat. Slightly Stoopid), Way of Life (with Slightly Stoopid), 2am'),
('Iration',
'reggae rock',
54,
'0q9lPhJHW5R9J7RXIJRbTk',
'Time Bomb, Summer Nights, Falling, Wait And See, Lost And Found'),
('The Expendables',
'reggae rock',
45,
'2OpHxx1SArSMlBrIMM0aV9',
'Bowl For Two, Sacrifice, Let Her Go, Down Down Down, Drift Away'),
('Pepper',
'reggae fusion, reggae rock',
52,
'1YK8JdPbiaMSnf4hrlBkGT',
'Stone Love, Got Me On The Run (with Stick Figure and Pepper), Warning (feat. Stick Figure), Ashes, Bring Me Along'),
('Dirty Heads',
'reggae fusion, reggae rock',
59,
'6GkJh85o22LfD2vgL9DP6f',
'Vacation, Lay Me Down (feat. Rome), Stand Tall, Oxygen, Rescue Me'),
('Passafire',
'east coast reggae, reggae rock',
44,
'3Il8w8T0de4sdogo2EQEVJ',
'Waste No Time, Sleepless, Feel It, Ghost Man, Submersible'),
('Damian Marley',
'reggae, reggae fusion',
63,
'3QJzdZJYIAcoET1GcfpNGi',
'Welcome To Jamrock, Make It Bun Dem, Medication, Road To Zion, Living It Up'),
('The Movement',
'east coast reggae, reggae fusion, reggae rock',
49,
'1qwdTaVUdjYJLLoxtFmsqr',
'Habit, Sounds Of Summer (with Slightly Stoopid), Set Sail, Siren (with Stick Figure), Take Me To The Ocean'),
('Collie Buddz',
'dancehall, reggae fusion',
58,
'5Ayl2bJtN5mdCsxZoxs9n1',
'Smokin" Love (with Collie Buddz), Love & Reggae, Come Around, Chill Out, Showdown (with Collie Buddz)'),
('Stick Figure',
'reggae fusion, reggae rock',
63,
'5SXEylV07TC57eanSxxg4R',
'Smokin" Love (with Collie Buddz), World on Fire (feat. Slightly Stoopid), Paradise, Edge of the Ocean, Sound of the Sea'),
('Ziggy Marley',
'reggae, roots reggae',
52,
'0o0rlxlC3ApLWsxFkUjMXc',
'True To Myself, Beach In Hawaii, Love Is My Religion, Circle Of Peace, Exodus - Exodus 40 Mix'),
('Sublime With Rome',
'reggae rock',
49,
'3XXrhkZKSGd3CUJQFnx5tQ',
'Take It or Leave It, Goodbyes, You Better Listen, Blackout, Cool & Collected'),
('Fortunate Youth',
'reggae rock, west coast reggae',
42,
'53eTH57OzNJCKOohjcWMoB',
'Burn One, Good Times (Roll On), Trippin, So Rebel, Love Is the Most High'),
('Stephen Marley',
'reggae, roots reggae',
57,
'0CIwCGmQMqHqiblnZlFia1',
'Hey Baby, Break Us Apart, Rock Stone, Lonely Avenue, Tight Ship'),
('Trevor Hall',
'high vibe, south carolina indie',
56,
'3RMHexittaAZkf8zukkZB8',
'Green Mountain State, Akaal, The Lime Tree, Pacific Coast Highway (with Trevor Hall), A Reminder (Remix)'),
('DISPATCH',
'jam band, modern folk rock',
49,
'6v4jPZO3UIDNJIgdxRxtr9',
'Only the Wild Ones, The General, Bang Bang, Two Coins, Midnight Lorry'),
('Citizen Cope',
'[alternative rock]',
51,
'7enBrBojgBJuPPdqTq4Z5F',
'Let The Drummer Kick, Sideways, Bullet and a Target, Dfw, Son"s Gonna Rise (feat. Robert Randolph) - New Radio Mix');

SELECT *
FROM recommended_artists;

-- Artists that repeat over both tables
SELECT DISTINCT ra.artist_name
FROM recommended_artists ra
INNER JOIN playlist_info pi ON ra.artist_name = pi.artist_name;

-- Counts the Artists from Recommended List in Playlist
SELECT ra.artist_name, COUNT(pi.artist_name) AS occurrences_in_playlist
FROM recommended_artists ra
LEFT JOIN playlist_info pi ON ra.artist_name = pi.artist_name
GROUP BY ra.artist_name
ORDER BY occurrences_in_playlist DESC;

-- finding unique genres from recommended artists
SELECT DISTINCT SUBSTRING_INDEX(SUBSTRING_INDEX(artist_genre, ',', numbers.n), ',', -1) AS unique_genres
FROM (
    SELECT 1 AS n UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4 UNION ALL SELECT 5
) AS numbers
JOIN recommended_artists
WHERE LENGTH(artist_genre) - LENGTH(REPLACE(artist_genre, ',', '')) >= numbers.n - 1
ORDER BY unique_genres;

-- sort all artists by popularity
SELECT artist_name, artist_popularity
FROM (
    SELECT artist_name, artist_popularity
    FROM recommended_artists
    UNION
    SELECT artist_name, artist_popularity
    FROM playlist_info
) AS combined_artists
ORDER BY artist_popularity DESC;


-- Average Popularity by Genre and Artist Count:
SELECT artist_genre, COUNT(artist_name) AS artist_count, AVG(artist_popularity) AS avg_popularity
FROM recommended_artists
GROUP BY artist_genre
ORDER BY artist_count DESC;

