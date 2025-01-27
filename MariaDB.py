# MariaDB [(none)]> CREATE USER 'noelia'@'localhost' IDENTIFIED BY 'noelia';
# MariaDB [(none)]> GRANT ALL PRIVILEGES ON *.* TO 'noelia'@'localhost';

from funciones import MariaDBmenu,MariaDB_ArtistasTours, MariaDB_AlbumesPorArtista, MariaDB_ListarAlbumesArtistasPorLetra, MariaDBInsertarTour, MariaDBBorrarArtistas15, MariaDBActualizarPaises
import mysql.connector

opcion_elegida=0
conn = mysql.connector.connect(user="noelia", password="noelia", host="192.168.105.132", database="consultas")
cursor = conn.cursor()

