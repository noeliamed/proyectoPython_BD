# Proyecto

Este proyecto consiste en codificar tres programas en Python que realicen operaciones DML sobre una base de datos en los SGBD relacionales (Oracle, MariaDB y PostgreSQL). 

Las tablas que voy a utilizar para el enunciado son: artistas, albumes y tours.

## Enunciado
  1. Se introduce el nombre del artista para saber cuántos tours han hecho.
  2. Se introduce el nombre del artista y se lista los álbumes que tiene.
  3. Listar el nombre del álbum que ha hecho cada artista el cual el nombre del grupo/solista empiece por una letra introducida por el usuario. 
  4. Inserta en la tabla de tours, los datos de este.
  5. Eliminar aquellos nombres de la tabla de artistas que tengan más de 15 caracteres.
  6. Actualizar todos los álbumes de los artistas.

## CREACIÓN DE TABLAS EN ORACLE

### TABLA ARTISTAS
```
CREATE TABLE artistas (
artista_id VARCHAR2(4)
nombre VARCHAR2(20) NOT NULL,                
estilo VARCHAR2(10),               
fecha_debut DATE,
CONSTRAINT pk_artistas_id PRIMARY KEY (artista_id)
);
```

### TABLA ÁLBUMES
```
CREATE TABLE albumes (
album_id VARCHAR2(5) NOT NULL,
artista_id VARCHAR2(4) NOT NULL,
nombre_album VARCHAR2(20) NOT NULL,
fecha_lanzamiento DATE,     
COSNTRAINT pk_albumes_albID PRIMARY KEY (album_id),
CONSTRAINT fk_albumes_artista FOREIGN KEY (artista_id) REFERENCES artistas(artista_id)
);
```

### TABLA TOURS
```
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
```

## CREACIÓN DE TABLAS EN POSTGRES

### TABLA ARTISTAS
``` 
CREATE TABLE artistas (
artista_id VARCHAR(4)
nombre VARCHAR(20) NOT NULL,                
estilo VARCHAR(10),               
fecha_debut DATE,
CONSTRAINT pk_artistas_id PRIMARY KEY (artista_id)
);
``` 
### TABLA ÁLBUMES
``` 
CREATE TABLE albumes (
album_id VARCHAR(5) NOT NULL,
artista_id VARCHAR(4) NOT NULL,
nombre_album VARCHAR(20) NOT NULL,
fecha_lanzamiento DATE,     
COSNTRAINT pk_albumes_albID PRIMARY KEY (album_id),
CONSTRAINT fk_albumes_artista FOREIGN KEY (artista_id) REFERENCES artistas(artista_id)
);
```   
### TABLA TOURS
```
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
```
## CREACIÓN DE TABLAS EN MARIADB
### TABLA ARTISTAS
``` 
CREATE TABLE artistas (
artista_id VARCHAR(4)
nombre VARCHAR(20) NOT NULL,                
estilo VARCHAR(10),               
fecha_debut DATE,
CONSTRAINT pk_artistas_id PRIMARY KEY (artista_id)
);
```
### TABLA ÁLBUMES
``` 
CREATE TABLE albumes (
album_id VARCHAR(5) NOT NULL,
artista_id VARCHAR(4) NOT NULL,
nombre_album VARCHAR(20) NOT NULL,
fecha_lanzamiento DATE,     
COSNTRAINT pk_albumes_albID PRIMARY KEY (album_id),
CONSTRAINT fk_albumes_artista FOREIGN KEY (artista_id) REFERENCES artistas(artista_id)
);
```
### TABLA TOURS
```
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
```



































