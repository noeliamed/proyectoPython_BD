def MariaDBmenu():
    opcion_elegida = int(input('''
    0. Introduce el nombre de un artista y muestra una lista con cuántos tours ha realizado.
    1. Introduce el nombre de un artista y filtra todos los álbumes que ha lanzado.
    2. Introduce una letra y lista los álbumes de los artistas cuyo nombre empiece con esa letra.
    3. Introduce los datos de un nuevo tour (nombre del tour, fechas de inicio y fin, países visitados) y se insertan en la tabla de tours.
    4. Elimina los artistas cuyo nombre tenga más de 15 caracteres.
    5. Introduce el nombre de un tour y actualiza los países que ha visitado el artista.
    6. Salir del menú.
    '''))

    return opcion_elegida


# 0. Muestra cuántos tours ha realizado un artista.
def MariaDB_ArtistasTours(cursor):
    nombre_artista = input("Introduce el nombre de un artista para mostrar cuántos tours ha realizado: ")
    consulta = f"""
    SELECT a.nombre, COUNT(t.tour_id) AS total_tours
    FROM artistas a
    LEFT JOIN tours t ON a.artista_id = t.nombre_artista
    WHERE a.nombre = '{nombre_artista}'
    GROUP BY a.nombre;
    """
    try:
        cursor.execute(consulta)
        for resultado in cursor:
            print(f"{resultado[0]} ha realizado {resultado[1]} tours.")
    except Exception as e:
        print("Error al realizar la consulta:", str(e))
        cursor.rollback()


# 1. Filtra todos los álbumes que ha lanzado un artista.
def MariaDB_AlbumesPorArtista(cursor):
    nombre_artista = input("Introduce el nombre de un artista para mostrar todos los álbumes que ha lanzado: ")
    consulta = f"""
    SELECT a.nombre, al.nombre_album
    FROM artistas a
    INNER JOIN albumes al ON a.artista_id = al.nombre_artista
    WHERE a.nombre = '{nombre_artista}';
    """
    try:
        cursor.execute(consulta)
        for artista, album in cursor:
            print(f"El artista {artista} ha lanzado el álbum: {album}")
    except Exception as e:
        print("Error al realizar la consulta:", str(e))
        cursor.rollback()


# 2. Lista los álbumes de los artistas cuyo nombre empiece con una letra dada.
def MariaDB_ListarAlbumesArtistasPorLetra(cursor):
    letra_a_buscar = input("Introduce una letra para mostrar los álbumes de los artistas cuyo nombre empiece por esta: ")
    consulta = f"""
    SELECT a.nombre, al.nombre_album
    FROM artistas a
    INNER JOIN albumes al ON a.artista_id = al.nombre_artista
    WHERE a.nombre LIKE '{letra_a_buscar}%' 
    ORDER BY a.nombre;
    """
    try:
        cursor.execute(consulta)
        for artista, album in cursor:
            print(f"Artista: {artista}, Álbum: {album}")
    except Exception as e:
        print("Error al realizar la consulta:", str(e))
        cursor.rollback()


# 3. Inserta un nuevo tour en la tabla de tours.
def MariaDBInsertarTour(cursor):
    nombre_artista = input("Introduce el ID del artista asociado al tour: ")
    nombre_tour = input("Introduce el nombre del tour: ")
    fecha_inicio = input("Introduce la fecha de inicio (YYYY-MM-DD): ")
    fecha_fin = input("Introduce la fecha de fin (YYYY-MM-DD): ")
    paises_visitados = input("Introduce los países visitados (separados por comas): ")

    consulta = f"""
    INSERT INTO tours (nombre_artista, nombre_tour, fecha_inicio, fecha_fin, paises_visitados)
    VALUES ('{nombre_artista}', '{nombre_tour}', '{fecha_inicio}', '{fecha_fin}', '{paises_visitados}');
    """
    try:
        cursor.execute(consulta)
        print("Se ha insertado el nuevo tour correctamente.")
    except Exception as e:
        print("Error al insertar el tour:", str(e))
        cursor.rollback()


# 4. Elimina los artistas cuyo nombre tenga más de 15 caracteres.
def MariaDBBorrarArtistas15(cursor):
    try:
        cursor.execute("DELETE FROM artistas WHERE LENGTH(nombre) > 15;")
        print("Se han eliminado", cursor.rowcount, "artistas.")
    except Exception as e:
        print("Error al eliminar:", str(e))
        cursor.rollback()


# 5. Actualiza los países visitados de un tour.
def MariaDBActualizarPaises(cursor):
    nombre_tour = input("Introduce el nombre del tour para actualizar los países visitados: ")
    nuevos_paises = input("Introduce los nuevos países visitados (separados por comas): ")

    try:
        consulta = f"UPDATE tours SET paises_visitados = '{nuevos_paises}' WHERE nombre_tour = '{nombre_tour}';"
        cursor.execute(consulta)
        print("Se han actualizado los países visitados.")
    except Exception as e:
        print("Error al actualizar los países visitados:", str(e))
        cursor.rollback()


# 6. Inserta un nuevo tour en PostgreSQL.
def PostgreSQLInsertarTour(cursor):
    nombre_artista = input("Introduce el ID del artista asociado al tour: ")
    nombre_tour = input("Introduce el nombre del tour: ")
    fecha_inicio = input("Introduce la fecha de inicio (YYYY-MM-DD): ")
    fecha_fin = input("Introduce la fecha de fin (YYYY-MM-DD): ")
    paises_visitados = input("Introduce los países visitados (separados por comas): ")

    consulta = """
    INSERT INTO tours (artista_id, nombre_tour, fecha_inicio, fecha_fin, paises_visitados)
    VALUES (
        %s, %s, %s, %s, %s
    )
    RETURNING tour_id;
    """

    try:
        cursor.execute(consulta, (nombre_artista, nombre_tour, fecha_inicio, fecha_fin, paises_visitados))
        nuevo_tour_id = cursor.fetchone()[0]
        print(f"Se ha insertado el nuevo tour correctamente con ID: {nuevo_tour_id}.")
    except Exception as e:
        print("Error al insertar el tour:", str(e))
        cursor.rollback()




# 3 Función para insertar un nuevo tour en PostgreSQL
def PostgresInsertarTour(cursor):
    try:
        # Pedir datos al usuario
        nombre_artista = input("Introduce el ID del artista asociado al tour: ")
        nombre_tour = input("Introduce el nombre del tour: ")
        fecha_inicio = input("Introduce la fecha de inicio (YYYY-MM-DD): ")
        fecha_fin = input("Introduce la fecha de fin (YYYY-MM-DD): ")
        paises_visitados = input("Introduce los países visitados (separados por comas): ")

        # Consulta SQL con parámetros
        consulta = """
        INSERT INTO tours (nombre_artista, nombre_tour, fecha_inicio, fecha_fin, paises_visitados)
        VALUES (%s, %s, %s, %s, %s);
        """

        # Ejecutar la consulta con los valores introducidos por el usuario
        cursor.execute(consulta, (nombre_artista, nombre_tour, fecha_inicio, fecha_fin, paises_visitados))

        # Confirmar los cambios
        print("Se ha insertado el nuevo tour correctamente.")
    except Exception as e:
        print("Error al insertar el tour:", str(e))
        cursor.rollback()
