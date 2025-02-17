--ORACLE

CREATE TABLE artistas (
    artista_id VARCHAR2(4),
    nombre VARCHAR2(20) NOT NULL,
    estilo VARCHAR2(10),
    fecha_debut DATE,
    CONSTRAINT pk_artistas_id PRIMARY KEY (artista_id)
);

CREATE TABLE albumes (
    album_id VARCHAR2(5),
    artista_id VARCHAR2(4) NOT NULL,
    nombre_album VARCHAR2(20) NOT NULL,
    fecha_lanzamiento DATE,
    CONSTRAINT pk_albumes_albID PRIMARY KEY (album_id),
    CONSTRAINT fk_albumes_artista FOREIGN KEY (artista_id) REFERENCES artistas(artista_id)
);

CREATE TABLE tours (
    tour_id VARCHAR2(5),
    artista_id VARCHAR2(4) NOT NULL,
    nombre_tour VARCHAR2(20) NOT NULL,
    fecha_inicio DATE,
    fecha_fin DATE,
    paises_visitados VARCHAR2(100),
    CONSTRAINT pk_tours_id PRIMARY KEY (tour_id),
    CONSTRAINT fk_tours_artista FOREIGN KEY (artista_id) REFERENCES artistas(artista_id)
);


-- Inserts en artistas
INSERT INTO artistas (artista_id, nombre, estilo, fecha_debut) VALUES ('7771', 'BTS', 'kpop', TO_DATE('2013-06-13', 'YYYY-MM-DD'));
INSERT INTO artistas (artista_id, nombre, estilo, fecha_debut) VALUES ('1372', 'Taylor Swift', 'pop', TO_DATE('2006-10-24', 'YYYY-MM-DD'));
INSERT INTO artistas (artista_id, nombre, estilo, fecha_debut) VALUES ('5623', 'BLACKPINK', 'kpop', TO_DATE('2016-08-08', 'YYYY-MM-DD'));
INSERT INTO artistas (artista_id, nombre, estilo, fecha_debut) VALUES ('5774', 'Abraham Mateo', 'pop', TO_DATE('2009-12-04', 'YYYY-MM-DD'));
INSERT INTO artistas (artista_id, nombre, estilo, fecha_debut) VALUES ('6467', 'Shawn Mendes', 'pop', TO_DATE('2014-06-26', 'YYYY-MM-DD'));
INSERT INTO artistas (artista_id, nombre, estilo, fecha_debut) VALUES ('3475', 'Olivia Rodrigo', 'pop', TO_DATE('2021-01-08', 'YYYY-MM-DD'));
INSERT INTO artistas (artista_id, nombre, estilo, fecha_debut) VALUES ('7645', 'The Weeknd', 'r&b/pop', TO_DATE('2010-12-01', 'YYYY-MM-DD'));
INSERT INTO artistas (artista_id, nombre, estilo, fecha_debut) VALUES ('3458', 'Coldplay', 'rock/alt', TO_DATE('1998-01-16', 'YYYY-MM-DD'));
INSERT INTO artistas (artista_id, nombre, estilo, fecha_debut) VALUES ('4579', 'ATEEZ', 'kpop', TO_DATE('2018-10-24', 'YYYY-MM-DD'));
INSERT INTO artistas (artista_id, nombre, estilo, fecha_debut) VALUES ('3468', 'Sabrina Carpenter', 'pop', TO_DATE('2014-03-14', 'YYYY-MM-DD'));

-- Inserts en albumes
INSERT INTO albumes (album_id, artista_id, nombre_album, fecha_lanzamiento) VALUES ('94320', '7771', 'Map of the Soul: 7', TO_DATE('2020-02-21', 'YYYY-MM-DD'));
INSERT INTO albumes (album_id, artista_id, nombre_album, fecha_lanzamiento) VALUES ('43293', '7771', 'BE', TO_DATE('2020-11-20', 'YYYY-MM-DD'));
INSERT INTO albumes (album_id, artista_id, nombre_album, fecha_lanzamiento) VALUES ('74344', '1372', '1989', TO_DATE('2014-10-27', 'YYYY-MM-DD'));
INSERT INTO albumes (album_id, artista_id, nombre_album, fecha_lanzamiento) VALUES ('73593', '1372', 'Red (Taylor''s Version)', TO_DATE('2021-11-12', 'YYYY-MM-DD'));
INSERT INTO albumes (album_id, artista_id, nombre_album, fecha_lanzamiento) VALUES ('02345', '1372', 'Midnights', TO_DATE('2022-10-21', 'YYYY-MM-DD'));
INSERT INTO albumes (album_id, artista_id, nombre_album, fecha_lanzamiento) VALUES ('63786', '5623', 'The Album', TO_DATE('2020-10-02', 'YYYY-MM-DD'));
INSERT INTO albumes (album_id, artista_id, nombre_album, fecha_lanzamiento) VALUES ('59340', '5623', 'Born Pink', TO_DATE('2022-09-16', 'YYYY-MM-DD'));
INSERT INTO albumes (album_id, artista_id, nombre_album, fecha_lanzamiento) VALUES ('40354', '5774', 'Are You Ready?', TO_DATE('2015-11-13', 'YYYY-MM-DD'));
INSERT INTO albumes (album_id, artista_id, nombre_album, fecha_lanzamiento) VALUES ('65894', '6467', 'Illuminate', TO_DATE('2016-09-23', 'YYYY-MM-DD'));

-- Inserts en tours
INSERT INTO tours (tour_id, artista_id, nombre_tour, fecha_inicio, fecha_fin, paises_visitados) VALUES ('34569', '7771', 'BTS World Tour', TO_DATE('2019-05-01', 'YYYY-MM-DD'), TO_DATE('2020-02-21', 'YYYY-MM-DD'), 'EE.UU., Japón, Corea, Europa');
INSERT INTO tours (tour_id, artista_id, nombre_tour, fecha_inicio, fecha_fin, paises_visitados) VALUES ('33470', '7771', 'Love Yourself World Tour', TO_DATE('2018-08-25', 'YYYY-MM-DD'), TO_DATE('2019-04-07', 'YYYY-MM-DD'), 'EE.UU., Canadá, Japón, Europa, Australia, Corea');
INSERT INTO tours (tour_id, artista_id, nombre_tour, fecha_inicio, fecha_fin, paises_visitados) VALUES ('43475', '1372', 'The Eras Tour', TO_DATE('2023-03-17', 'YYYY-MM-DD'), TO_DATE('2023-08-09', 'YYYY-MM-DD'), 'EE.UU., Canadá, México, Europa, Asia, Australia');
INSERT INTO tours (tour_id, artista_id, nombre_tour, fecha_inicio, fecha_fin, paises_visitados) VALUES ('34572', '1372', 'Red Tour', TO_DATE('2013-03-13', 'YYYY-MM-DD'), TO_DATE('2014-06-12', 'YYYY-MM-DD'), 'EE.UU., Canadá, Europa, Asia, Australia');
INSERT INTO tours (tour_id, artista_id, nombre_tour, fecha_inicio, fecha_fin, paises_visitados) VALUES ('79573', '1372', '1989 World Tour', TO_DATE('2015-05-05', 'YYYY-MM-DD'), TO_DATE('2015-12-12', 'YYYY-MM-DD'), 'EE.UU., Canadá, Asia, Australia');
INSERT INTO tours (tour_id, artista_id, nombre_tour, fecha_inicio, fecha_fin, paises_visitados) VALUES ('20574', '1372', 'Reputation Stadium Tour', TO_DATE('2018-05-08', 'YYYY-MM-DD'), TO_DATE('2018-11-21', 'YYYY-MM-DD'), 'EE.UU., Canadá, Reino Unido, Irlanda, Australia');
INSERT INTO tours (tour_id, artista_id, nombre_tour, fecha_inicio, fecha_fin, paises_visitados) VALUES ('15678', '5623', 'Born Pink World Tour', TO_DATE('2022-10-15', 'YYYY-MM-DD'), TO_DATE('2023-09-17', 'YYYY-MM-DD'), 'Corea, EE.UU., Canadá, Europa, Asia, Australia, México');
INSERT INTO tours (tour_id, artista_id, nombre_tour, fecha_inicio, fecha_fin, paises_visitados) VALUES ('74564', '5623', 'BLACKPINK Arena Tour', TO_DATE('2018-07-24', 'YYYY-MM-DD'), TO_DATE('2018-12-24', 'YYYY-MM-DD'), 'Japón');
INSERT INTO tours (tour_id, artista_id, nombre_tour, fecha_inicio, fecha_fin, paises_visitados) VALUES ('34539', '5774', 'Who I Am Tour', TO_DATE('2014-10-03', 'YYYY-MM-DD'), TO_DATE('2015-07-26', 'YYYY-MM-DD'), 'España, México, Argentina, Chile');
INSERT INTO tours (tour_id, artista_id, nombre_tour, fecha_inicio, fecha_fin, paises_visitados) VALUES ('75682', '6467', 'Shawn Mendes: The Tour', TO_DATE('2019-03-07', 'YYYY-MM-DD'), TO_DATE('2019-12-21', 'YYYY-MM-DD'), 'EE.UU., Canadá, Europa, Asia, Australia, América Latina');
INSERT INTO tours (tour_id, artista_id, nombre_tour, fecha_inicio, fecha_fin, paises_visitados) VALUES ('03483', '3475', 'SOUR Tour', TO_DATE('2022-04-05', 'YYYY-MM-DD'), TO_DATE('2022-07-07', 'YYYY-MM-DD'), 'EE.UU., Canadá, Europa');
INSERT INTO tours (tour_id, artista_id, nombre_tour, fecha_inicio, fecha_fin, paises_visitados) VALUES ('86745', '7645', 'After Hours Til Dawn Tour', TO_DATE('2022-07-14', 'YYYY-MM-DD'), TO_DATE('2023-10-25', 'YYYY-MM-DD'), 'EE.UU., América Latina, Asia, Australia');
INSERT INTO tours (tour_id, artista_id, nombre_tour, fecha_inicio, fecha_fin, paises_visitados) VALUES ('37566', '3458', 'A Head Full of Dreams Tour', TO_DATE('2016-03-31', 'YYYY-MM-DD'), TO_DATE('2017-11-15', 'YYYY-MM-DD'), 'EE.UU., Canadá, Europa, Asia, América Latina, Australia');
INSERT INTO tours (tour_id, artista_id, nombre_tour, fecha_inicio, fecha_fin, paises_visitados) VALUES ('94569', '4579', 'The Fellowship: Break the Wall Tour', TO_DATE('2022-10-29', 'YYYY-MM-DD'), TO_DATE('2023-05-08', 'YYYY-MM-DD'), 'EE.UU., Europa, Asia, América Latina');
INSERT INTO tours (tour_id, artista_id, nombre_tour, fecha_inicio, fecha_fin, paises_visitados) VALUES ('65470', '3468', 'Emails I Can’t Send Tour', TO_DATE('2022-09-28', 'YYYY-MM-DD'), TO_DATE('2023-06-25', 'YYYY-MM-DD'), 'EE.UU., Europa, Asia');
INSERT INTO tours (tour_id, artista_id, nombre_tour, fecha_inicio, fecha_fin, paises_visitados) VALUES ('35530', '3468', 'Evolution Tour', TO_DATE('2016-10-18', 'YYYY-MM-DD'), TO_DATE('2017-05-21', 'YYYY-MM-DD'), 'EE.UU., Canadá');
