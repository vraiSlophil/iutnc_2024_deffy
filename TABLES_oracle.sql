CREATE DATABASE deefy;

CREATE TABLE users
(
    user_id       NUMBER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
    user_email    VARCHAR2(255) NOT NULL UNIQUE,
    user_password VARCHAR2(255) NOT NULL,
    permission_id NUMBER,
    CONSTRAINT fk_permission FOREIGN KEY (permission_id) REFERENCES permissions (permission_id)
);

CREATE TABLE playlists
(
    playlist_id   NUMBER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
    playlist_name VARCHAR2(255) NOT NULL
);

CREATE TABLE user_playlists
(
    user_id     NUMBER,
    playlist_id NUMBER,
    PRIMARY KEY (user_id, playlist_id),
    CONSTRAINT fk_user FOREIGN KEY (user_id) REFERENCES users (user_id),
    CONSTRAINT fk_playlist FOREIGN KEY (playlist_id) REFERENCES playlists (playlist_id)
);

CREATE TABLE podcast_tracks
(
    track_id       NUMBER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
    track_title    VARCHAR2(255) NOT NULL,
    track_genre    VARCHAR2(255),
    track_duration NUMBER,
    track_year     DATE,
    track_filename VARCHAR2(255),
    track_artist   VARCHAR2(255)
);

CREATE TABLE album_tracks
(
    track_id       NUMBER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
    track_title    VARCHAR2(255) NOT NULL,
    album_name     VARCHAR2(255),
    track_genre    VARCHAR2(255),
    track_duration NUMBER,
    track_number   NUMBER,
    track_year     DATE,
    track_filename VARCHAR2(255)
);

CREATE TABLE playlist_tracks
(
    playlist_id NUMBER,
    track_id    NUMBER,
    PRIMARY KEY (playlist_id, track_id),
    CONSTRAINT fk_playlist_track FOREIGN KEY (playlist_id) REFERENCES playlists (playlist_id),
    CONSTRAINT fk_track FOREIGN KEY (track_id) REFERENCES podcast_tracks (track_id)
);

CREATE TABLE permissions
(
    permission_id NUMBER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
    role_name     VARCHAR2(255) NOT NULL UNIQUE,
    role_level    NUMBER NOT NULL
);