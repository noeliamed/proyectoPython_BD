import sys
import psycopg2
from psycopg2 import sql, OperationalError

from funciones import MariaDBmenu, MariaDB_ArtistasTours, MariaDB_AlbumesPorArtista, MariaDB_ListarAlbumesArtistasPorLetra, PostgresInsertarTour, MariaDBBorrarArtistas15, MariaDBActualizarPaises

opcion_elegida = 0
cursor = None  # Inicializar cursor como None

try:
    # Conexión a la base de datos PostgreSQL
    conn = psycopg2.connect(
        host='localhost', user='postgres', password='postgres', dbname='pconsultas'
    )

    cursor = conn.cursor()
    print("Conexión a la base de datos establecida con éxito.")

    while opcion_elegida != 6:
        opcion_elegida = MariaDBmenu()
        
        # 0. Se introduce el nombre de un artista y muestra una lista con cuántos tours ha realizado.
        if opcion_elegida == 0:
            MariaDB_ArtistasTours(cursor)
        # 1. Se introduce el nombre de un artista y se filtra todos los álbumes que ha lanzado.
        elif opcion_elegida == 1:
            MariaDB_AlbumesPorArtista(cursor)
        # 2. Se introduce una letra y lista los álbumes de los artistas cuyo nombre empiece con esa letra.
        elif opcion_elegida == 2:
            MariaDB_ListarAlbumesArtistasPorLetra(cursor)
        # 3. Se introducen los datos de un nuevo tour (nombre del tour, fechas de inicio y fin, países visitados) y se insertan en la tabla de tours.
        elif opcion_elegida == 3:
            PostgresInsertarTour(cursor)
        # 4. Se eliminan los artistas cuyo nombre tenga más de 15 caracteres.
        elif opcion_elegida == 4:
            MariaDBBorrarArtistas15(cursor)
        # 5. Introduce el nombre de un tour y actualiza el país que ha visitado el artista.
        elif opcion_elegida == 5:
            MariaDBActualizarPaises(cursor)

except OperationalError as e:
    print(f"Ocurrió un error al conectar a la base de datos: {e}")

finally:
    # Cierre del cursor y la conexión
    if cursor:
        cursor.close()
    if 'conn' in locals():  # Verifica si la conexión fue creada
        conn.close()
    print("Conexión a la base de datos cerrada.")
