DROP TABLE IF EXISTS albums;
DROP TABLE IF EXISTS artists; --drop is 2nd. Create it 1st.

--create it 1st.
CREATE TABLE artists (
  id SERIAL4 PRIMARY KEY,
  artist_name VARCHAR(255)
);

CREATE TABLE albums (
  id SERIAL4 PRIMARY KEY,
  album_title VARCHAR(255),
  album_genre VARCHAR(255),
  artist_id INT4 REFERENCES
);
