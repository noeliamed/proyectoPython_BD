--Proyecto BD con Python. MariaDB

CREATE TABLE artistas (
artista_id VARCHAR(4),
nombre VARCHAR(20) NOT NULL,                
estilo VARCHAR(10),               
fecha_debut DATE,
CONSTRAINT pk_artistas_id PRIMARY KEY (artista_id)
);


CREATE TABLE albumes (
album_id VARCHAR(5) NOT NULL,
nombre_artista VARCHAR(20) NOT NULL,
nombre_album VARCHAR(20) NOT NULL,
fecha_lanzamiento DATE,     
CONSTRAINT pk_album_ID PRIMARY KEY (album_id)
);

--CONSTRAINT fk_albumes_artista FOREIGN KEY (nombre_artista) REFERENCES artistas(nombre)



CREATE TABLE tours (
tour_id VARCHAR(5) NOT NULL,     
nombre_artista VARCHAR(20) NOT NULL,                                
nombre_tour VARCHAR(20) NOT NULL,           
fecha_inicio DATE,                            
fecha_fin DATE,                               
paises_visitados VARCHAR(30),    
CONSTRAINT pk_tours_id PRIMARY KEY (tour_id)
);

INSERT INTO tours (tour_id, nombre_artista, nombre_tour, fecha_inicio, fecha_fin, paises_visitados) VALUES ('34569', 'BTS World Tour', '2019-05-01', '2020-02-21', 'Estados Unidos, Japón, Corea del Sur, Europa');


--CONSTRAINT fk_tours_artID FOREIGN KEY (nombre_artista) REFERENCES artistas(nombre)



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


--Álbumes: 
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

INSERT INTO tours (tour_id, nombre_artista, nombre_tour, fecha_inicio, fecha_fin, paises_visitados) 
VALUES 
('TS001', 'Taylor Swift', 'Eras Tour', '2023-03-01', '2023-12-01', 'EE.UU, Canadá, Reino Unido'),
('TS002', 'Taylor Swift', 'Fearless Tour', '2021-06-01', '2021-11-30', 'Australia, Japón');


INSERT INTO tours (tour_id, nombre_artista, nombre_tour, fecha_inicio, fecha_fin, paises_visitados) 
VALUES 
('BTS01', 'BTS', 'Love Yourself Tour', '2018-08-01', '2019-02-01', 'Corea del Sur, EE.UU, México'),
('BTS02', 'BTS', 'Map of the Soul Tour', '2020-04-01', '2020-10-01', 'Japón, Alemania, España');


INSERT INTO tours (tour_id, nombre_artista, nombre_tour, fecha_inicio, fecha_fin, paises_visitados) 
VALUES 
('BP001', 'Blackpink', 'In Your Area Tour', '2018-11-01', '2019-02-28', 'EE.UU, Australia, Singapur'),
('BP002', 'Blackpink', 'Born Pink Tour', '2022-09-01', '2023-01-15', 'Francia, Canadá, Japón');


INSERT INTO tours (tour_id, nombre_artista, nombre_tour, fecha_inicio, fecha_fin, paises_visitados) 
VALUES 
('AATZ1', 'Ateez', 'The Fellowship Tour', '2021-10-01', '2021-11-30', 'México, EE.UU, Alemania'),
('AATZ2', 'Ateez', 'Infinity Tour', '2022-03-01', '2022-06-01', 'España, Italia, Brasil');


INSERT INTO tours (tour_id, nombre_artista, nombre_tour, fecha_inicio, fecha_fin, paises_visitados) 
VALUES 
('AM001', 'Abraham Mateo', 'Lo Nuestro Tour', '2022-07-01', '2022-12-01', 'España, Colombia, Argentina'),
('AM002', 'Abraham Mateo', 'Amor de Los Dos Tour', '2023-02-01', '2023-05-01', 'México, Chile, Ecuador');


INSERT INTO tours (tour_id, nombre_artista, nombre_tour, fecha_inicio, fecha_fin, paises_visitados) 
VALUES 
('OR001', 'Olivia Rodrigo', 'Sour Tour', '2022-04-01', '2022-09-01', 'Reino Unido, Canadá, EE.UU'),
('OR002', 'Olivia Rodrigo', 'Guts Tour', '2023-03-01', '2023-06-01', 'México, Japón, Australia');


INSERT INTO tours (tour_id, nombre_artista, nombre_tour, fecha_inicio, fecha_fin, paises_visitados) 
VALUES 
('SM001', 'Shawn Mendes', 'Wonder Tour', '2021-06-01', '2021-10-31', 'Canadá, EE.UU, Brasil'),
('SM002', 'Shawn Mendes', 'Illuminate Tour', '2017-03-01', '2017-10-01', 'Reino Unido, Francia');


INSERT INTO tours (tour_id, nombre_artista, nombre_tour, fecha_inicio, fecha_fin, paises_visitados) 
VALUES 
('SC001', 'Sabrina Carpenter', 'Emails I Can’t Send', '2022-06-01', '2022-12-15', 'EE.UU, Canadá, Reino Unido'),
('SC002', 'Sabrina Carpenter', 'Singularity Tour', '2023-01-01', '2023-06-30', 'Australia, Francia, México');








