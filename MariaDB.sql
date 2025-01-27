CREATE TABLE artistas (
artista_id VARCHAR(4)
nombre VARCHAR(20) NOT NULL,                
estilo VARCHAR(10),               
fecha_debut DATE,
CONSTRAINT pk_artistas_id PRIMARY KEY (artista_id)
);


CREATE TABLE albumes (
album_id VARCHAR(5) NOT NULL,
artista_id VARCHAR(4) NOT NULL,
nombre_album VARCHAR(20) NOT NULL,
fecha_lanzamiento DATE,     
COSNTRAINT pk_albumes_albID PRIMARY KEY (album_id),
CONSTRAINT fk_albumes_artista FOREIGN KEY (artista_id) REFERENCES artistas(artista_id)
);

CREATE TABLE tours (
tour_id VARCHAR(5) NOT NULL,     
artista_id VARCHAR(4) NOT NULL,                                
nombre_tour VARCHAR(20) NOT NULL,           
fecha_inicio DATE,                            
fecha_fin DATE,                               
paises_visitados VARCHAR2(15),    
CONSTRAINT pk_tours_id PRIMARY KEY (tour_id),
CONSTRAINT fk_tours_artID FOREIGN KEY (artista_id) REFERENCES artistas(artista_id)
);

--Artistas: 
INSERT INTO artistas (artista_id, nombre, estilo, fecha_debut) VALUES ('7771', 'BTS', 'kpop', '2013-06-13');
INSERT INTO artistas (artista_id, nombre, estilo, fecha_debut) VALUES ('1372', 'Taylor Swift', 'pop', '2006-10-24');
INSERT INTO artistas (artista_id, nombre, estilo, fecha_debut) VALUES ('5623', 'BLACKPINK', 'kpop', '2016-08-08');
INSERT INTO artistas (artista_id, nombre, estilo, fecha_debut) VALUES ('5774', 'Abraham Mateo', 'pop', '2009-12-04');
INSERT INTO artistas (artista_id, nombre, estilo, fecha_debut) VALUES ('6467', 'Shawn Mendes', 'pop', '2014-06-26');
INSERT INTO artistas (artista_id, nombre, estilo, fecha_debut) VALUES ('3475', 'Olivia Rodrigo', 'pop', '2021-01-08');
INSERT INTO artistas (artista_id, nombre, estilo, fecha_debut) VALUES ('7645', 'The Weeknd', 'r&b/pop', '2010-12-01');
INSERT INTO artistas (artista_id, nombre, estilo, fecha_debut) VALUES ('3458', 'Coldplay', 'rock/alternative', '1998-01-16');
INSERT INTO artistas (artista_id, nombre, estilo, fecha_debut) VALUES ('4579', 'ATEEZ', 'kpop', '2018-10-24');
INSERT INTO artistas (artista_id, nombre, estilo, fecha_debut) VALUES ('3468', 'Sabrina Carpenter', 'pop', '2014-03-14');

--Álbumes
INSERT INTO albumes (album_id, nombre_artista, nombre_album, fecha_lanzamiento) VALUES ('94320', 'BTS', 'Map of the Soul: 7', '2020-02-21');
INSERT INTO albumes (album_id, nombre_artista, nombre_album, fecha_lanzamiento) VALUES ('43293', 'BTS', 'BE', '2020-11-20');
INSERT INTO albumes (album_id, nombre_artista, nombre_album, fecha_lanzamiento) VALUES ('74344', 'Taylor Swift', '1989', '2014-10-27');
INSERT INTO albumes (album_id, nombre_artista, nombre_album, fecha_lanzamiento) VALUES ('73593', 'Taylor Swift', 'Red (Taylors Version)', '2021-11-12');
INSERT INTO albumes (album_id, nombre_artista, nombre_album, fecha_lanzamiento) VALUES ('02345', 'Taylor Swift', 'Midnights', '2022-10-21');
INSERT INTO albumes (album_id, nombre_artista, nombre_album, fecha_lanzamiento) VALUES ('63786', 'BLACKPINK', 'The Album', '2020-10-02');
INSERT INTO albumes (album_id, nombre_artista, nombre_album, fecha_lanzamiento) VALUES ('59340', 'BLACKPINK', 'Born Pink', '2022-09-16');
INSERT INTO albumes (album_id, nombre_artista, nombre_album, fecha_lanzamiento) VALUES ('40354', 'Abraham Mateo', 'Are You Ready?', '2015-11-13');
INSERT INTO albumes (album_id, nombre_artista, nombre_album, fecha_lanzamiento) VALUES ('65894', 'Shawn Mendes', 'Illuminate', '2016-09-23');
INSERT INTO albumes (album_id, nombre_artista, nombre_album, fecha_lanzamiento) VALUES ('89348', 'Shawn Mendes', 'Handwritten', '2015-04-14');
INSERT INTO albumes (album_id, nombre_artista, nombre_album, fecha_lanzamiento) VALUES ('89234', 'Olivia Rodrigo', 'SOUR', '2021-05-21');
INSERT INTO albumes (album_id, nombre_artista, nombre_album, fecha_lanzamiento) VALUES ('68944', 'The Weeknd', 'After Hours', '2020-03-20');
INSERT INTO albumes (album_id, nombre_artista, nombre_album, fecha_lanzamiento) VALUES ('78346', 'The Weeknd', 'Dawn FM', '2022-01-07');
INSERT INTO albumes (album_id, nombre_artista, nombre_album, fecha_lanzamiento) VALUES ('35845', 'The Weeknd', 'Starboy', '2016-11-25');
INSERT INTO albumes (album_id, nombre_artista, nombre_album, fecha_lanzamiento) VALUES ('56839', 'Coldplay', 'A Rush of Blood to the Head', '2002-08-26');
INSERT INTO albumes (album_id, nombre_artista, nombre_album, fecha_lanzamiento) VALUES ('84634', 'Coldplay', 'Music of the Spheres', '2021-10-15'); 
INSERT INTO albumes (album_id, nombre_artista, nombre_album, fecha_lanzamiento) VALUES ('53446', 'ATEEZ', 'The World EP.1: Movement', '2022-07-29');
INSERT INTO albumes (album_id, nombre_artista, nombre_album, fecha_lanzamiento) VALUES ('53454', 'Sabrina Carpenter', 'Singular Act I', '2018-11-09');
INSERT INTO albumes (album_id, nombre_artista, nombre_album, fecha_lanzamiento) VALUES ('94594', 'Sabrina Carpenter', 'Emails I Can’t Send', '2022-07-15');

--Tours
INSERT INTO tours (tour_id, nombre_artista, nombre_tour, fecha_inicio, fecha_fin, paises_visitados) VALUES ('34569', 'BTS World Tour', '2019-05-01', '2020-02-21', 'Estados Unidos, Japón, Corea del Sur, Europa');
INSERT INTO tours (tour_id, nombre_artista, nombre_tour, fecha_inicio, fecha_fin, paises_visitados) VALUES ('33470', 'BTS World Tour', 'Love Yourself World Tour', '2018-08-25', '2019-04-07', 'Estados Unidos, Canadá, Japón, Europa, Australia, Corea del Sur');
INSERT INTO tours (tour_id, nombre_artista, nombre_tour, fecha_inicio, fecha_fin, paises_visitados) VALUES ('43475', 'Taylor Swift', 'The Eras Tour', '2023-03-17', '2023-08-09', 'Estados Unidos, Canadá, México, Europa, Asia, Australia');
INSERT INTO tours (tour_id, nombre_artista, nombre_tour, fecha_inicio, fecha_fin, paises_visitados) VALUES ('34572', 'Taylor Swift', 'Red Tour', '2013-03-13', '2014-06-12', 'Estados Unidos, Canadá, Europa, Asia, Australia');
INSERT INTO tours (tour_id, nombre_artista, nombre_tour, fecha_inicio, fecha_fin, paises_visitados) VALUES ('79573', 'Taylor Swift', '1989 World Tour', '2015-05-05', '2015-12-12', 'Estados Unidos, Canadá, Asia, Australia');
INSERT INTO tours (tour_id, nombre_artista, nombre_tour, fecha_inicio, fecha_fin, paises_visitados) VALUES ('20574', 'Taylor Swift', 'Reputation Stadium Tour', '2018-05-08', '2018-11-21', 'Estados Unidos, Canadá, Reino Unido, Irlanda, Australia');
INSERT INTO tours (tour_id, nombre_artista, nombre_tour, fecha_inicio, fecha_fin, paises_visitados) VALUES ('15678', 'BLACKPINK', 'Born Pink World Tour', '2022-10-15', '2023-09-17', 'Corea del Sur, Estados Unidos, Canadá, Europa, Asia, Australia, México');
INSERT INTO tours (tour_id, nombre_artista, nombre_tour, fecha_inicio, fecha_fin, paises_visitados) VALUES ('74564', 'BLACKPINK', 'BLACKPINK Arena Tour', '2018-07-24', '2018-12-24', 'Japón');
INSERT INTO tours (tour_id, nombre_artista, nombre_tour, fecha_inicio, fecha_fin, paises_visitados) VALUES ('34539', 'Abraham Mateo', 'Who I Am Tour', '2014-10-03', '2015-07-26', 'España, México, Argentina, Chile');
INSERT INTO tours (tour_id, nombre_artista, nombre_tour, fecha_inicio, fecha_fin, paises_visitados) VALUES ('75682', 'Shawn Mendes', 'Shawn Mendes: The Tour', '2019-03-07', '2019-12-21', 'Estados Unidos, Canadá, Europa, Asia, Australia, América Latina');
INSERT INTO tours (tour_id, nombre_artista, nombre_tour, fecha_inicio, fecha_fin, paises_visitados) VALUES ('03483', 'Olivia Rodrigo', 'SOUR Tour', '2022-04-05', '2022-07-07', 'Estados Unidos, Canadá, Europa');
INSERT INTO tours (tour_id, nombre_artista, nombre_tour, fecha_inicio, fecha_fin, paises_visitados) VALUES ('86745', 'The Weeknd', 'After Hours Til Dawn Tour', '2022-07-14', '2023-10-25', 'Estados Unidos, América Latina, Asia, Australia');
INSERT INTO tours (tour_id, nombre_artista, nombre_tour, fecha_inicio, fecha_fin, paises_visitados) VALUES ('37566', 'Coldplay', 'A Head Full of Dreams Tour', '2016-03-31', '2017-11-15', 'Estados Unidos, Canadá, Europa, Asia, América Latina, Australia');
INSERT INTO tours (tour_id, nombre_artista, nombre_tour, fecha_inicio, fecha_fin, paises_visitados) VALUES ('94569', 'ATEEZ', 'The Fellowship: Break the Wall Tour', '2022-10-29', '2023-05-08', 'Estados Unidos, Europa, Asia, América Latina');
INSERT INTO tours (tour_id, nombre_artista, nombre_tour, fecha_inicio, fecha_fin, paises_visitados) VALUES ('65470', 'Sabrina Carpenter', 'Emails I Can’t Send Tour', '2022-09-28', '2023-06-25', 'Estados Unidos, Europa, Asia');
INSERT INTO tours (tour_id, nombre_artista, nombre_tour, fecha_inicio, fecha_fin, paises_visitados) VALUES ('35530', 'Sabrina Carpenter', 'Evolution Tour', '2016-10-18', '2017-05-21', 'Estados Unidos, Canadá');








