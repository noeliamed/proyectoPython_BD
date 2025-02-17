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

-- Inserts en tours
INSERT INTO tours (tour_id, artista_id, nombre_tour, fecha_inicio, fecha_fin, paises_visitados) VALUES ('34569', '7771', 'BTS World Tour', TO_DATE('2019-05-01', 'YYYY-MM-DD'), TO_DATE('2020-02-21', 'YYYY-MM-DD'), 'EE.UU., Japón, Corea, Europa');
INSERT INTO tours (tour_id, artista_id, nombre_tour, fecha_inicio, fecha_fin, paises_visitados) VALUES ('33470', '7771', 'Love Yourself World Tour', TO_DATE('2018-08-25', 'YYYY-MM-DD'), TO_DATE('2019-04-07', 'YYYY-MM-DD'), 'EE.UU., Canadá, Japón, Europa, Australia, Corea');
INSERT INTO tours (tour_id, artista_id, nombre_tour, fecha_inicio, fecha_fin, paises_visitados) VALUES ('43475', '1372', 'The Eras Tour', TO_DATE('2023-03-17', 'YYYY-MM-DD'), TO_DATE('2023-08-09', 'YYYY-MM-DD'), 'EE.UU., Canadá, México, Europa, Asia, Australia');
COMMIT;
