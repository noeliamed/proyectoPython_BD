def MariaDBmenu():
    opcion_elegida=int(input('''
    0. Se introduce el nombre de un artista y muestra una lista con cuántos tours ha realizado.
    1. Se introduce el nombre de un artista y se filtra todos los álbumes que ha lanzado.
    2. Se introduce una letra y lista los álbumes de los artistas cuyo nombre empiece con esa letra.
    3. Se introducen los datos de un nuevo tour (nombre del tour, fechas de inicio y fin, países visitados) y se insertan en la tabla de tours.
    4. Se eliminan los artistas cuyo nombre tenga más de 15 caracteres.
    5. Introduce el nombre de un tour y actualiza el país que ha visitado el artista.
    6. Salir del menú.
    '''))

    return opcion_elegida

