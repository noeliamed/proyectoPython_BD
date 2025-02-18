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
    
    # Usar parámetros para evitar inyección SQL
    consulta = """
    SELECT a.nombre, COUNT(t.tour_id) AS total_tours
    FROM artistas a
    LEFT JOIN tours t ON a.nombre = t.nombre_artista
    WHERE a.nombre = %s
    GROUP BY a.nombre;
    """
    
    try:
        cursor.execute(consulta, (nombre_artista,))
        resultados = cursor.fetchall()  # Obtener todos los resultados de una vez
        if resultados:
            for resultado in resultados:
                print(f"{resultado[0]} ha realizado {resultado[1]} tours.")
        else:
            print(f"No se encontraron tours para el artista '{nombre_artista}'.")
    except Exception as e:
        print("Error al realizar la consulta:", str(e))


# 1. Filtra todos los álbumes que ha lanzado un artista.
def MariaDB_AlbumesPorArtista(cursor):
    nombre_artista = input("Introduce el nombre de un artista para mostrar todos los álbumes que ha lanzado: ")
    
    # Usar parámetros para evitar inyección SQL
    consulta = """
    SELECT a.nombre, al.nombre_album
    FROM artistas a
    INNER JOIN albumes al ON a.nombre = al.nombre_artista
    WHERE a.nombre = %s;
    """
    
    try:
        cursor.execute(consulta, (nombre_artista,))
        resultados = cursor.fetchall()  # Obtener todos los resultados de una vez
        if resultados:
            for artista, album in resultados:
                print(f"El artista {artista} ha lanzado el álbum: {album}")
        else:
            print(f"No se encontraron álbumes para el artista '{nombre_artista}'.")
    except Exception as e:
        print("Error al realizar la consulta:", str(e))


# 2. Lista los álbumes de los artistas cuyo nombre empiece con una letra dada.
def MariaDB_ListarAlbumesArtistasPorLetra(cursor):
    letra_a_buscar = input("Introduce una letra para mostrar los álbumes de los artistas cuyo nombre empiece por esta: ")
    
    # Usar parámetros para evitar inyección SQL
    consulta = """
    SELECT a.nombre, al.nombre_album
    FROM artistas a
    INNER JOIN albumes al ON a.nombre = al.nombre_artista
    WHERE a.nombre LIKE %s 
    ORDER BY a.nombre;
    """
    
    try:
        # Agregar el símbolo de porcentaje para la búsqueda
        cursor.execute(consulta, (letra_a_buscar + '%',))
        resultados = cursor.fetchall()  # Obtener todos los resultados de una vez
        if resultados:
            for artista, album in resultados:
                print(f"Artista: {artista}, Álbum: {album}")
        else:
            print(f"No se encontraron álbumes para artistas que comiencen con la letra '{letra_a_buscar}'.")
    except Exception as e:
        print("Error al realizar la consulta:", str(e))


# 3. Inserta un nuevo tour en la tabla de tours.
def MariaDBInsertarTour(connection, cursor):
    nombre_artista = input("Introduce el ID del artista asociado al tour: ")
    nombre_tour = input("Introduce el nombre del tour: ")
    fecha_inicio = input("Introduce la fecha de inicio (YYYY-MM-DD): ")
    fecha_fin = input("Introduce la fecha de fin (YYYY-MM-DD): ")
    paises_visitados = input("Introduce los países visitados (separados por comas): ")

    # Validar que las fechas tengan el formato correcto
    from datetime import datetime

    try:
        datetime.strptime(fecha_inicio, '%Y-%m-%d')
        datetime.strptime(fecha_fin, '%Y-%m-%d')
    except ValueError:
        print("Error: Las fechas deben estar en el formato YYYY-MM-DD.")
        return

    # Usar parámetros para evitar inyección SQL
    consulta = """
    INSERT INTO tours (nombre_artista, nombre_tour, fecha_inicio, fecha_fin, paises_visitados)
    VALUES (%s, %s, %s, %s, %s);
    """
    
    try:
        cursor.execute(consulta, (nombre_artista, nombre_tour, fecha_inicio, fecha_fin, paises_visitados))
        connection.commit()  # Asegúrate de confirmar los cambios
        print("Se ha insertado el nuevo tour correctamente.")
    except Exception as e:
        print("Error al insertar el tour:", str(e))
        connection.rollback()  # Llama a rollback en el objeto de conexión

# 4. Elimina los artistas cuyo nombre tenga más de 15 caracteres.
def MariaDBBorrarArtistas15(cursor):
    # Confirmar la eliminación
    confirmacion = input("¿Estás seguro de que deseas eliminar todos los artistas con nombres mayores a 15 caracteres? (s/n): ")
    if confirmacion.lower() != 's':
        print("Operación cancelada.")
        return

    try:
        # Primero, eliminar los tours asociados
        cursor.execute("DELETE FROM tours WHERE nombre_artista IN (SELECT nombre FROM artistas WHERE LENGTH(nombre) > 15);")
        
        # Luego, eliminar los álbumes asociados
        cursor.execute("DELETE FROM albumes WHERE nombre_artista IN (SELECT nombre FROM artistas WHERE LENGTH(nombre) > 15);")
        
        # Finalmente, eliminar los artistas
        cursor.execute("DELETE FROM artistas WHERE LENGTH(nombre) > 15;")
        print("Se han eliminado", cursor.rowcount, "artistas.")
    except Exception as e:
        print("Error al eliminar:", str(e))
        cursor.connection.rollback()

# 5. Actualiza los países visitados de un tour.
def MariaDBActualizarPaises(cursor):
    nombre_tour = input("Introduce el nombre del tour para actualizar los países visitados: ")
    nuevos_paises = input("Introduce los nuevos países visitados (separados por comas): ")

    # Usar parámetros para evitar inyección SQL
    consulta = """
    UPDATE tours 
    SET paises_visitados = %s 
    WHERE nombre_tour = %s;
    """
    
    try:
        cursor.execute(consulta, (nuevos_paises, nombre_tour))
        if cursor.rowcount > 0:
            print("Se han actualizado los países visitados.")
        else:
            print("No se encontró ningún tour con ese nombre.")
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

    # Validar que las fechas tengan el formato correcto
    from datetime import datetime

    try:
        datetime.strptime(fecha_inicio, '%Y-%m-%d')
        datetime.strptime(fecha_fin, '%Y-%m-%d')
    except ValueError:
        print("Error: Las fechas deben estar en el formato YYYY-MM-DD.")
        return

    consulta = """
    INSERT INTO tours (artista_id, nombre_tour, fecha_inicio, fecha_fin, paises_visitados)
    VALUES (%s, %s, %s, %s, %s)
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

        # Validar que las fechas tengan el formato correcto
        from datetime import datetime

        try:
            datetime.strptime(fecha_inicio, '%Y-%m-%d')
            datetime.strptime(fecha_fin, '%Y-%m-%d')
        except ValueError:
            print("Error: Las fechas deben estar en el formato YYYY-MM-DD.")
            return

        # Consulta SQL con parámetros
        consulta = """
        INSERT INTO tours (nombre_artista, nombre_tour, fecha_inicio, fecha_fin, paises_visitados)
        VALUES (%s, %s, %s, %s, %s)
        RETURNING tour_id;
        """

        # Ejecutar la consulta con los valores introducidos por el usuario
        cursor.execute(consulta, (nombre_artista, nombre_tour, fecha_inicio, fecha_fin, paises_visitados))

        # Obtener el ID del nuevo tour insertado
        nuevo_tour_id = cursor.fetchone()[0]
        print(f"Se ha insertado el nuevo tour correctamente con ID: {nuevo_tour_id}.")
    except Exception as e:
        print("Error al insertar el tour:", str(e))
        cursor.rollback()
