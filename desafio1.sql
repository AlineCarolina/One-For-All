DROP DATABASE IF EXISTS SpotifyClone;

CREATE DATABASE SpotifyClone;

USE SpotifyClone;

CREATE TABLE users(
    user_id INT AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL,
    age INT NOT NULL,
    id_plan INT NOT NULL,
    signature_date DATE NOT NULL,
    PRIMARY KEY (user_id),
    FOREIGN KEY (id_plan) REFERENCES plans(id_plan),
) engine = InnoDB;

CREATE TABLE plans(
    id_plan INT AUTO_INCREMENT,
    plan VARCHAR(50) NOT NULL,
    plan_price DECIMAL(3,2) NOT NULL,
    PRIMARY KEY (id_plan),
) engine = InnoDB;

CREATE TABLE artists(
    artist_id INT AUTO_INCREMENT,
    artist VARCHAR(100) NOT NULL,
    PRIMARY KEY (artist_id),
) engine = InnoDB;

CREATE TABLE albuns(
    album_id INT AUTO_INCREMENT,
    album VARCHAR(100) NOT NULL,
    artist_id INT NOT NULL,
    launch INT NOT NULL,
    PRIMARY KEY (album_id),
    FOREIGN KEY (artist_id) REFERENCES artists(artist_id),
) engine = InnoDB;

CREATE TABLE musics(
    music_id INT AUTO_INCREMENT,
    music VARCHAR(100) NOT NULL,
    album_id INT NOT NULL,
    time INT NOT NULL,
    PRIMARY KEY (music_id),
    FOREIGN KEY (album_id) REFERENCES albuns(album_id),
) engine = InnoDB;

CREATE TABLE following(
    artist_id INT,
    user_id INT
    PRIMARY KEY (artist_id, user_id),
    FOREIGN KEY (artist_id) REFERENCES artists(artist_id),
    FOREIGN KEY (user_id) REFERENCES users(user_id),
) engine = InnoDB;

CREATE TABLE history(
    user_id INT NOT NULL,
    music_id INT NOT NULL,
    reprodution_date DATETIME NOT NULL,
    FOREIGN KEY (user_id) REFERENCES users(user_id),
    FOREIGN KEY (music_id) REFERENCES musics(music_id),
) engine = InnoDB;

INSERT INTO users (name, age, id_plan, signature_date)
VALUES
  ("Thati", 23, 1, 2019-10-20),
  ("Cintia", 35, 2, 2017-12-30),
  ("Bill", 20, 3, 2019-06-05),
  ("Roger", 45, 4, 2020-05-13),
  ("Norman", 58, 4, 2017-02-17),
  ("Patrick", 33, 2, 2017-01-06),
  ("Vivian", 26, 3, 2018-01-05),
  ("Carol", 19, 3, 2018-02-14),
  ("Angelina", 42, 2, 2018-04-29),
  ("Paul", 46, 2, 2017-01-17);

INSERT INTO plans (plan, plan_price)
VALUES
  ("gratuito", 0.00),
  ("familiar", 7.99),
  ("universitario", 5.99),
  ("pessoal", 6.99);

INSERT INTO artists (artist)
VALUES
  ("Walter Phoenix"),
  ("Lance Day"),
  ("Peter Strong"),
  ("Freedie Shannon"),
  ("Tyler Isle"),
  ("Fog");

INSERT INTO following (artist_id, user_id)
VALUES
  (1, 1),
  (1, 2),
  (1, 3),
  (1, 6),
  (1, 8),
  (2, 1),
  (2, 2),
  (2, 6),
  (2, 9),
  (3, 3),
  (3, 7),
  (3, 10),
  (4, 1),
  (4, 4),
  (4, 9),
  (5, 5),
  (5, 7),
  (5, 8),
  (6, 5),
  (6, 6),
  (6, 9),
  (6, 10),

INSERT INTO albuns (album, artist_id, launch)
VALUES
  ("Envious", 1, 1990),
  ("Exuberant", 1, 1993),
  ("Hallowed Steam", 3, 1995),
  ("Incandescent", 2, 1998),
  ("Temporary Culture", 4, 2001),
  ("Library of liberty", 4, 2003),
  ("Chained Down", 5, 2007),
  ("Cabinet of fools", 5, 2012),
  ("No guarantees", 5, 2015),
  ("Apparatus", 6, 2015);

INSERT INTO history (user_id, music_id, reprodution_date)
VALUES
  (1, 10, "2020-02-28 10:45:55"),
  (1, 28, "2020-05-02 05:30:35"),
  (1, 27, "2020-03-06 11:22:33"),
  (1, 20, "2020-08-05 08:05:17"),
  (1, 21, "2020-09-14 16:32:22"),
  (2, 35, "2020-01-02 07:40:33"),
  (2, 7, "2020-05-16 06:16:22"),
  (2, 25, "2020-10-09 12:27:48"),
  (2, 39, "2020-09-21 13:14:46"),
  (3, 3, "2020-11-13 16:55:13"),
  (3, 12, "2020-12-05 18:38:30"),
  (3, 29, "2020-07-30 10:00:00"),
  (4, 11, "2021-08-15 17:10:10"),
  (4, 36, "2021-07-10 15:20:30"),
  (4, 30, "2021-01-09 01:44:33"),
  (5, 14, "2020-07-03 19:33:28"),
  (5, 18, "2017-02-24 21:14:22"),
  (5, 20, "2020-08-06 15:23:43"),
  (5, 1, "2020-11-10 13:52:27"),
  (6, 38, "2019-02-07 20:33:48"),
  (6, 31, "2017-01-24 00:31:17"),
  (6, 32, "2017-10-12 12:35:20"),
  (6, 26, "2018-05-29 14:56:41"),
  (7, 13, "2018-05-09 22:30:49"),
  (7, 2, "2020-07-27 12:52:58"),
  (7, 17, "2018-01-16 18:40:43"),
  (8, 39, "2018-03-21 16:56:40"),
  (8, 40, "2020-10-18 13:38:05"),
  (8, 9, "2019-05-25 08:14:03"),
  (8, 34, "2021-08-15 21:37:09"),
  (9, 5, "2021-05-24 17:23:45"),
  (9, 22, "2018-12-07 22:48:52"),
  (9, 15, "2021-03-14 06:14:26"),
  (9, 16, "2020-04-01 03:36:00"),
  (10, 24, "2017-02-06 08:21:34"),
  (10, 25, "2017-12-04 05:33:43"),
  (10, 18, "2017-07-27 05:24:49"),
  (10, 19, "2017-12-25 01:03:57");

INSERT INTO musics (music, album_id,  time)
VALUES
  ("Soul For Us", 1, 200),
  ("Troubles Of My Inner Fire", 2, 203),
  ("Magic Circus", 3, 105),
  ("Fantasy For Me", 4, 100),
  ("Thang Of Thunder", 5, 240),
  ("Finding My Traditions", 7, 179),
  ("She Thinks I Won't Stay Tonight", 8, 166),
  ("He's Walking Away", 9, 159),
  ("Honey", 10, 79),
  ("Reflections Of Magic", 1, 163),
  ("Dance With Her Own", 1, 116),
  ("Time Fireworks", 2, 152),
  ("Honey, So Do I", 3, 207),
  ("Sweetie, Let's Go Wild", 3, 139),
  ("She Knows", 3, 244),
  ("Celebration Of More", 4, 146),
  ("Rock His Everything", 4, 223),
  ("Home Forever", 4, 231),
  ("Diamond Power", 4, 241),
  ("Let's Be Silly", 4, 132),
  ("Words Of Her Life", 5, 185),
  ("Without My Streets", 5, 176),
  ("History Of My Roses", 6, 222),
  ("Without My Love", 6, 111),
  ("Walking And Game", 6, 123),
  ("Young And Father", 6, 197),
  ("Walking And Man", 7, 229),
  ("Hard And Time", 7, 135),
  ("Honey, I'm A Lone Wolf", 7, 150),
  ("He Heard You're Bad For Me", 8, 154),
  ("He Hopes We Can't Stay", 8, 210),
  ("I Know I Know", 8, 117),
  ("He's Trouble", 9, 138),
  ("I Heard I Want To Bo Alone", 9, 120),
  ("Ride Alone", 9, 151),
  ("You Cheated On Me", 10, 95),
  ("Wouldn't It Be Nice", 10, 213),
  ("Baby", 10, 136),
  ("You Make Me Feel So", 10, 83);