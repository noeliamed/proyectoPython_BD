CREATE TABLE artistas (
    artista_id VARCHAR(4),
    nombre VARCHAR(20) NOT NULL,                
    estilo VARCHAR(10),               
    fecha_debut DATE,
    CONSTRAINT pk_artistas_id PRIMARY KEY (artista_id)
);

-- Agregar restricción de unicidad para el nombre
ALTER TABLE artistas ADD CONSTRAINT unique_nombre UNIQUE (nombre);

-- Crear la tabla albumes
CREATE TABLE albumes (
    album_id VARCHAR(5) NOT NULL,
    nombre_artista VARCHAR(20) NOT NULL,
    nombre_album VARCHAR(20) NOT NULL,
    fecha_lanzamiento DATE,     
    CONSTRAINT pk_album_id PRIMARY KEY (album_id),
    CONSTRAINT fk_nombre_artista FOREIGN KEY (nombre_artista) REFERENCES artistas(nombre)
);

-- Crear la tabla tours
CREATE TABLE tours (
    tour_id VARCHAR(5) NOT NULL,     
    nombre_artista VARCHAR(20) NOT NULL,                                
    nombre_tour VARCHAR(20) NOT NULL,           
    fecha_inicio DATE,                            
    fecha_fin DATE,                               
    paises_visitados VARCHAR(30),    
    CONSTRAINT pk_tours_id PRIMARY KEY (tour_id),
    CONSTRAINT fk_nombre_artista_tours FOREIGN KEY (nombre_artista) REFERENCES artistas(nombre)
);

-- Insertar datos en la tabla artistas
INSERT INTO artistas (artista_id, nombre, estilo, fecha_debut) VALUES 
('7771', 'BTS', 'kpop', '2013-06-13'),
('1372', 'Taylor Swift', 'pop', '2006-10-24'),
('5623', 'BLACKPINK', 'kpop', '2016-08-08'),
('5774', 'Abraham Mateo', 'pop', '2009-12-04'),
('6467', 'Shawn Mendes', 'pop', '2014-06-26'),
('3475', 'Olivia Rodrigo', 'pop', '2021-01-08'),
('7645', 'The Weeknd', 'r&b/pop', '2010-12-01'),
('3458', 'Coldplay', 'r&b', '1998-01-16'),
('4579', 'ATEEZ', 'kpop', '2018-10-24'),
('3468', 'Sabrina Carpenter', 'pop', '2014-03-14');

-- Insertar datos en la tabla albumes
INSERT INTO albumes (album_id, nombre_artista, nombre_album, fecha_lanzamiento) VALUES 
('94320', 'BTS', 'Map of the Soul: 7', '2020-02-21'),
('43293', 'BTS', 'BE', '2020-11-20'),
('74344', 'Taylor Swift', '1989', '2014-10-27'),
('73593', 'Taylor Swift', 'Red(Taylors Version)', '2021-11-12'),
('02345', 'Taylor Swift', 'Midnights', '2022-10-21'),
('63786', 'BLACKPINK', 'The Album', '2020-10-02'),
('59340', 'BLACKPINK', 'Born Pink', '2022-09-16'),
('40354', 'Abraham Mateo', 'Are You Ready?', '2015-11-13'),
('65894', 'Shawn Mendes', 'Illuminate', '2016-09-23'),
('89348', 'Shawn Mendes', 'Handwritten', '2015-04-14'),
('89234', 'Olivia Rodrigo', 'SOUR', '2021-05-21'),
('68944', 'The Weeknd', 'After Hours', '2020-03-20'),
('78346', 'The Weeknd', 'Dawn FM', '2022-01-07'),
('35845', 'The Weeknd', 'Starboy', '2016-11-25'),
('84634', 'Coldplay', 'Music of the Spheres', '2021-10-15'), 
('53446', 'ATEEZ', 'The World EP.1', '2022-07-29'),
('53454', 'Sabrina Carpenter', 'Singular Act I', '2018-11-09'),
('94594', 'Sabrina Carpenter', 'Emails I Cant Send', '2022-07-15');

-- Insertar datos en la tabla tours
INSERT INTO tours (tour_id, nombre_artista, nombre_tour, fecha_inicio, fecha_fin, paises_visitados) VALUES 

('TS001', 'Taylor Swift', 'Eras Tour', '2023-03-01', '2023-12-01', 'EE.UU, Canadá, Reino Unido'),

('TS002', 'Taylor Swift', 'Fearless Tour', '2021-06-01', '2021-11-30', 'Australia, Japón'),

('BTS01', 'BTS', 'Love Yourself Tour', '2018-08-01', '2019-02-01', 'Corea del Sur, EE.UU, México'),

('BTS02', 'BTS', 'Map of the Soul Tour', '2020-04-01', '2020-10-01', 'Japón, Alemania, España'),

('BP001', 'BLACKPINK', 'In Your Area Tour', '2018-11-01', '2019-02-28', 'EE.UU, Australia, Singapur'),

('BP002', 'BLACKPINK', 'Born Pink Tour', '2022-09-01', '2023-01-15', 'Francia, Canadá, Japón'),

('AATZ1', 'ATEEZ', 'The Fellowship Tour', '2021-10-01', '2021-11-30', 'México, EE.UU, Alemania'),

('AATZ2', 'ATEEZ', 'Infinity Tour', '2022-03-01', '2022-06-01', 'España, Italia, Brasil'),

('AM001', 'Abraham Mateo', 'Lo Nuestro Tour', '2022-07-01', '2022-12-01', 'España, Colombia, Argentina'),

('AM002', 'Abraham Mateo', 'Amor de Los Dos Tour', '2023-02-01', '2023-05-01', 'México, Chile, Ecuador'),

('OR001', 'Olivia Rodrigo', 'Sour Tour', '2022-04-01', '2022-09-01', 'Reino Unido, Canadá, EE.UU'),

('OR002', 'Olivia Rodrigo', 'Guts Tour', '2023-03-01', '2023-06-01', 'México, Japón, Australia'),

('SM001', 'Shawn Mendes', 'Wonder Tour', '2021-06-01', '2021-10-31', 'Canadá, EE.UU, Brasil'),

('SM002', 'Shawn Mendes', 'Illuminate Tour', '2017-03-01', '2017-10-01', 'Reino Unido, Francia'),

('SC001', 'Sabrina Carpenter', 'Emails I Can’t Send', '2022-06-01', '2022-12-15', 'EE.UU, Canadá, Reino Unido'),

('SC002', 'Sabrina Carpenter', 'Singularity Tour', '2023-01-01', '2023-06-30', 'Australia, Francia, México');
