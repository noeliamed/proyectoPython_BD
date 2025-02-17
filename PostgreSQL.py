from funciones import MariaDBmenu,MariaDB_ArtistasTours,MariaDB_AlbumesPorArtista,MariaDB_ListarAlbumesArtistasPorLetra,MariaDBInsertarTour,MariaDBBorrarArtistas15,MariaDBActualizarPaises
import psycopg2

opcion_elegida=0
conn = psycopg2.connect(user="noelia", password="noelia", host="192.168.105.133",port='5433', database="pconsultas")
cursor = conn.cursor()

while opcion_elegida != 6 :
    opcion_elegida=MariaDBmenu()
    
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
        PostgreSQLInsertarTour(cursor)
    # 4. Se eliminan los artistas cuyo nombre tenga más de 15 caracteres.
    elif opcion_elegida == 4:
        MariaDBBorrarArtistas15(cursor)
    # 5. Introduce el nntroduce el nombre de un tour y actualiza el país que ha visitado el artista.
    elif opcion_elegida == 5:
        MariaDBActualizarPaises(cursor)


if opcion_elegida==6:
    cursor.close()
    conn.close()
