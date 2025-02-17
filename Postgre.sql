CREATE TABLE artistas (
    artista_id VARCHAR(4),
    nombre VARCHAR(20) NOT NULL,
    estilo VARCHAR(10),
    fecha_debut DATE,
    CONSTRAINT pk_artistas_id PRIMARY KEY (artista_id)
);

CREATE TABLE albumes (
    album_id VARCHAR(5),
    artista_id VARCHAR(4) NOT NULL,
    nombre_album VARCHAR(20) NOT NULL,
    fecha_lanzamiento DATE,
    CONSTRAINT pk_albumes_albID PRIMARY KEY (album_id),
    CONSTRAINT fk_albumes_artista FOREIGN KEY (artista_id) REFERENCES artistas(artista_id)
);

CREATE TABLE tours (
    tour_id VARCHAR(5),
    artista_id VARCHAR(4) NOT NULL,
    nombre_tour VARCHAR(20) NOT NULL,
    fecha_inicio DATE,
    fecha_fin DATE,
    paises_visitados VARCHAR(100),
    CONSTRAINT pk_tours_id PRIMARY KEY (tour_id),
    CONSTRAINT fk_tours_artista FOREIGN KEY (artista_id) REFERENCES artistas(artista_id)
);


-- Inserts en artistas
INSERT INTO artistas (artista_id, nombre, estilo, fecha_debut) VALUES ('7771', 'BTS', 'kpop', '2013-06-13');
INSERT INTO artistas (artista_id, nombre, estilo, fecha_debut) VALUES ('1372', 'Taylor Swift', 'pop', '2006-10-24');
INSERT INTO artistas (artista_id, nombre, estilo, fecha_debut) VALUES ('5623', 'BLACKPINK', 'kpop', '2016-08-08');
INSERT INTO artistas (artista_id, nombre, estilo, fecha_debut) VALUES ('5774', 'Abraham Mateo', 'pop', '2009-12-04');
INSERT INTO artistas (artista_id, nombre, estilo, fecha_debut) VALUES ('6467', 'Shawn Mendes', 'pop', '2014-06-26');
INSERT INTO artistas (artista_id, nombre, estilo, fecha_debut) VALUES ('3475', 'Olivia Rodrigo', 'pop', '2021-01-08');
INSERT INTO artistas (artista_id, nombre, estilo, fecha_debut) VALUES ('7645', 'The Weeknd', 'r&b/pop', '2010-12-01');
INSERT INTO artistas (artista_id, nombre, estilo, fecha_debut) VALUES ('3458', 'Coldplay', 'rock/alt', '1998-01-16');
INSERT INTO artistas (artista_id, nombre, estilo, fecha_debut) VALUES ('4579', 'ATEEZ', 'kpop', '2018-10-24');
INSERT INTO artistas (artista_id, nombre, estilo, fecha_debut) VALUES ('3468', 'Sabrina Carpenter', 'pop', '2014-03-14');

-- Inserts en albumes
INSERT INTO albumes (album_id, artista_id, nombre_album, fecha_lanzamiento) VALUES ('94320', '7771', 'Map of the Soul: 7', '2020-02-21');
INSERT INTO albumes (album_id, artista_id, nombre_album, fecha_lanzamiento) VALUES ('43293', '7771', 'BE', '2020-11-20');
INSERT INTO albumes (album_id, artista_id, nombre_album, fecha_lanzamiento) VALUES ('74344', '1372', '1989', '2014-10-27');
INSERT INTO albumes (album_id, artista_id, nombre_album, fecha_lanzamiento) VALUES ('73593', '1372', 'Red (Taylor''s Version)', '2021-11-12');
INSERT INTO albumes (album_id, artista_id, nombre_album, fecha_lanzamiento) VALUES ('02345', '1372', 'Midnights', '2022-10-21');
INSERT INTO albumes (album_id, artista_id, nombre_album, fecha_lanzamiento) VALUES ('63786', '5623', 'The Album', '2020-10-02');
INSERT INTO albumes (album_id, artista_id, nombre_album, fecha_lanzamiento) VALUES ('59340', '5623', 'Born Pink', '2022-09-16');
INSERT INTO albumes (album_id, artista_id, nombre_album, fecha_lanzamiento) VALUES ('40354', '5774', 'Are You Ready?', '2015-11-13');
INSERT INTO albumes (album_id, artista_id, nombre_album, fecha_lanzamiento) VALUES ('65894', '6467', 'Illuminate', '2016-09-23');

-- Inserts en tours
INSERT INTO tours (tour_id, artista_id, nombre_tour, fecha_inicio, fecha_fin, paises_visitados) VALUES ('34569', '7771', 'BTS World Tour', '2019-05-01', '2020-02-21', 'EE.UU., Japón, Corea, Europa');
INSERT INTO tours (tour_id, artista_id, nombre_tour, fecha_inicio, fecha_fin, paises_visitados) VALUES ('33470', '7771', 'Love Yourself World Tour', '2018-08-25', '2019-04-07', 'EE.UU., Canadá, Japón, Europa, Australia, Corea');
INSERT INTO tours (tour_id, artista_id, nombre_tour, fecha_inicio, fecha_fin, paises_visitados) VALUES ('43475', '1372', 'The Eras Tour', '2023-03-17', '2023-08-09', 'EE.UU., Canadá, México, Europa, Asia, Australia');
INSERT INTO tours (tour_id, artista_id, nombre_tour, fecha_inicio, fecha_fin, paises_visitados) VALUES ('34572', '1372', 'Red Tour', '2013-03-13', '2014-06-12', 'EE.UU., Canadá, Europa, Asia, Australia');
INSERT INTO tours (tour_id, artista_id, nombre_tour, fecha_inicio, fecha_fin, paises_visitados) VALUES ('79573', '1372', '1989 World Tour', '2015-05-05', '2015-12-12', 'EE.UU., Canadá, Asia, Australia');
INSERT INTO tours (tour_id, artista_id, nombre_tour, fecha_inicio, fecha_fin, paises_visitados) VALUES ('20574', '1372', 'Reputation Stadium Tour', '2018-05-08', '2018-11-21', 'EE.UU., Canadá, Reino Unido, Irlanda, Australia');
INSERT INTO tours (tour_id, artista_id, nombre_tour, fecha_inicio, fecha_fin, paises_visitados) VALUES ('15678', '5623', 'Born Pink World Tour', '2022-10-15', '2023-09-17', 'Corea, EE.UU., Canadá, Europa, Asia, Australia, México');
INSERT INTO tours (tour_id, artista_id, nombre_tour, fecha_inicio, fecha_fin, paises_visitados) VALUES ('74564', '5623', 'BLACKPINK Arena Tour', '2018-07-24', '2018-12-24', 'Japón');
INSERT INTO tours (tour_id, artista_id, nombre_tour, fecha_inicio, fecha_fin, paises_visitados) VALUES ('34539', '5774', 'Who I Am Tour', '2014-10-03', '2015-07-26', 'España, México, Argentina, Chile');
INSERT INTO tours (tour_id, artista_id, nombre_tour, fecha_inicio, fecha_fin, paises_visitados) VALUES ('75682', '6467', 'Shawn Mendes: The Tour', '2019-03-07', '2019-12-21', 'EE.UU., Canadá, Europa, Asia, Australia, América Latina');
INSERT INTO tours (tour_id, artista_id, nombre_tour, fecha_inicio, fecha_fin, paises_visitados) VALUES ('03483', '3475', 'SOUR Tour', '2022-04-05', '2022-07-07', 'EE.UU., Canadá, Europa');
INSERT INTO tours (tour_id, artista_id, nombre_tour, fecha_inicio, fecha_fin, paises_visitados) VALUES ('86745', '7645', 'After Hours Til Dawn Tour', '2022-07-14', '2023-10-25', 'EE.UU., América Latina, Asia, Australia');
INSERT INTO tours (tour_id, artista_id, nombre_tour, fecha_inicio, fecha_fin, paises_visitados) VALUES ('37566', '3458', 'A Head Full of Dreams Tour', '2016-03-31', '2017-11-15', 'EE.UU., Canadá, Europa, Asia, América Latina, Australia');
INSERT INTO tours (tour_id, artista_id, nombre_tour, fecha_inicio, fecha_fin, paises_visitados) VALUES ('94569', '4579', 'The Fellowship: Break the Wall Tour', '2022-10-29', '2023-05-08', 'EE.UU., Europa, Asia, América Latina');
INSERT INTO tours (tour_id, artista_id, nombre_tour, fecha_inicio, fecha_fin, paises_visitados) VALUES ('65470', '3468', 'Emails I Can’t Send Tour', '2022-09-28', '2023-06-25', 'EE.UU., Europa, Asia');
INSERT INTO tours (tour_id, artista_id, nombre_tour, fecha_inicio, fecha_fin, paises_visitados) VALUES ('35530', '3468', 'Evolution Tour', '2016-10-18', '2017-05-21', 'EE.UU., Canadá');
