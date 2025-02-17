def MariaDBmenu():
    opcion_elegida=int(input('''
    0. Se introduce el nombre de un artista y muestra una lista con cuántos tours ha realizado.
    1. Se introduce el nombre de un artista y se filtra todos los álbumes que ha lanzado.
    2. Se introduce una letra y lista los álbumes de los artistas cuyo nombre empiece con esa letra.
    3. Se introducen los datos de un nuevo tour (id del tour, nombre del artista, nombre del tour, fechas de inicio y fin, países visitados) y se insertan en la tabla de tours.
    4. Se eliminan los artistas cuyo nombre tenga más de 15 caracteres.
    5. Introduce el nntroduce el nombre de un tour y actualiza el país que ha visitado el artista.
    6. Salir del menú.
    '''))

    return opcion_elegida

# 0. Se introduce el nombre de un artista y muestra una lista con cuántos tours ha realizado.
def MariaDB_ArtistasTours(cursor):
    nombreArtista = input("Introduce el nombre de un artista para mostrar cuántos tours ha realizado: ")
    consulta = f"SELECT a.nombre, COUNT(t.tour_id) AS total_tours
    FROM artistas a
    LEFT JOIN tours t ON a.artista_id = t.nombre_artista
    WHERE a.nombre = '{nombreArtista}'
    GROUP BY a.nombre;"
    try:
        cursor.execute(consulta)
        for resultado in cursor:
            print(f"{resultado[0]} ha realizado {resultado[1]} tours.")
    except:
        print("Error al realizar la consulta")
        cursor.rollback()
        
# 1. Se introduce el nombre de un artista y se filtra todos los álbumes que ha lanzado.
def MariaDB_AlbumesPorArtista(cursor):
    nombreArtista = input("Introduce el nombre de un artista para mostrar todos los álbumes que ha lanzado: ")
    consulta = f"SELECT a.nombre, al.nombre_album
    FROM artistas a
    INNER JOIN albumes al ON a.artista_id = al.nombre_artista
    WHERE a.nombre = '{nombreArtista}';"
    try:
        cursor.execute(consulta)
        for artista, album in cursor:
            print(f"El artista {artista} ha lanzado el álbum: {album}")
    except:
        print("Error al realizar la consulta")
        cursor.rollback()

# 2. Se introduce una letra y lista los álbumes de los artistas cuyo nombre empiece con esa letra.
def MariaDB_ListarAlbumesArtistasPorLetra(cursor):
    letraABuscar = input("Introduce una letra para mostrar los álbumes de los artistas cuyo nombre empiece por esta: ")
    consulta = f"SELECT a.nombre, al.nombre_album
    FROM artistas a
    INNER JOIN albumes al ON a.artista_id = al.nombre_artista
    WHERE a.nombre LIKE '{letraABuscar}%' 
    ORDER BY a.nombre;"
    try:
        cursor.execute(consulta)
        for artista, album in cursor:
            print(f"Artista: {artista}, Álbum: {album}")
    except:
        print("Error al realizar la consulta")
        cursor.rollback()

# 3. Se introducen los datos de un nuevo tour (nombre del tour, fechas de inicio y fin, países visitados) y se insertan en la tabla de tours.
def MariaDBInsertarTour(cursor):
    tour_id = input("Introduce el ID del tour: ")
    nombre_artista = input("Introduce el ID del artista asociado al tour: ")
    nombre_tour = input("Introduce el nombre del tour: ")
    fecha_inicio = input("Introduce la fecha de inicio (YYYY-MM-DD): ")
    fecha_fin = input("Introduce la fecha de fin (YYYY-MM-DD): ")
    paises_isitados = input("Introduce los países visitados (separados por comas): ")


    consulta = f"INSERT INTO tours (tour_id, nombre_artista, nombre_tour, fecha_inicio, fecha_fin, paises_visitados)
    SELECT CONCAT('T', LPAD(COUNT(*) + 1, 4, '0')), '{nombreArtista}', '{nombreTour}', '{fechaInicio}', '{fechaFin}', '{paisesVisitados}'
    FROM tours;"
    try:
        cursor.execute(consulta)
        print("Se ha insertado el nuevo tour correctamente.")
    except:
        print("Error al insertar el tour.")
        cursor.rollback()

# 4. Se eliminan los artistas cuyo nombre tenga más de 15 caracteres.
def MariaDBBorrarArtistas15(cursor):
    try:
        cursor.execute("DELETE FROM artistas WHERE LENGTH(nombre) > 15;")
        print("Se han eliminado", cursor.rowcount, "artistas.")
    except:
        print("Error al eliminar")
        cursor.rollback()

# 5. Introduce el nntroduce el nombre de un tour y actualiza el país que ha visitado el artista.
def MariaDBActualizarPaises(cursor):
    nombreTour = input("Introduce el nombre del tour para actualizar los países visitados: ")
    nuevosPaises = input("Introduce los nuevos países visitados (separados por comas): ")

    try:
        consulta = f"UPDATE tours SET paises_visitados = '{nuevosPaises}' WHERE nombre_tour = '{nombreTour}';"
        cursor.execute(consulta)
        print("Se han actualizado", cursor.rowcount, "tours.")
    except:
        print("Error al actualizar los países visitados.")
        cursor.rollback()


# 3 en Postgres: 
def PostgreSQLInsertarTour(cursor):
    tour_id = input("Introduce el ID del tour: ")
    nombre_artista = input("Introduce el ID del artista asociado al tour: ")
    nombre_tour = input("Introduce el nombre del tour: ")
    fecha_inicio = input("Introduce la fecha de inicio (YYYY-MM-DD): ")
    fecha_fin = input("Introduce la fecha de fin (YYYY-MM-DD): ")
    paises_visitados = input("Introduce los países visitados (separados por comas): ")

    consulta = """
    INSERT INTO tours (tour_id, artista_id, nombre_tour, fecha_inicio, fecha_fin, paises_visitados)
    VALUES (
        CONCAT('T', LPAD(COALESCE((SELECT COUNT(*) FROM tours), 0) + 1, 4, '0')),
        %s, %s, %s, %s, %s
    )
    RETURNING tour_id;
    """

    try:
        cursor.execute(consulta, (nombre_artista, nombre_tour, fecha_inicio, fecha_fin, paises_visitados))
        
        nuevo_tour_id = cursor.fetchone()[0]
        print(f"Se ha insertado el nuevo tour correctamente con ID: {nuevo_tour_id}.")
    except Exception as e:
        print("Error al insertar el tour.")
        print(str(e))
        cursor.rollback()
