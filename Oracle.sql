CREATE TABLE artistas (
artista_id VARCHAR2(4)
nombre VARCHAR2(20) NOT NULL,                
estilo VARCHAR2(10),               
fecha_debut DATE,
CONSTRAINT pk_artistas_id PRIMARY KEY (artista_id)
);

CREATE TABLE albumes (
album_id VARCHAR2(5) NOT NULL,
artista_id VARCHAR2(4) NOT NULL,
nombre_album VARCHAR2(20) NOT NULL,
fecha_lanzamiento DATE,     
COSNTRAINT pk_albumes_albID PRIMARY KEY (album_id),
CONSTRAINT fk_albumes_artista FOREIGN KEY (artista_id) REFERENCES artistas(artista_id)
);

CREATE TABLE tours (
tour_id VARCHAR2(5) NOT NULL,     
artista_id VARCHAR2(4) NOT NULL,                                
nombre_tour VARCHAR(20) NOT NULL,           
fecha_inicio DATE,                            
fecha_fin DATE,                               
paises_visitados VARCHAR2(15),    
CONSTRAINT pk_tours_id PRIMARY KEY (tour_id),
CONSTRAINT fk_tours_artID FOREIGN KEY (artista_id) REFERENCES artistas(artista_id)
);
