from funciones import MariaDBmenu,MariaDB_ArtistasTours,MariaDB_AlbumesPorArtista,MariaDB_ListarAlbumesArtistasPorLetra,MariaDBInsertarTour,MariaDBBorrarArtistas15,MariaDBActualizarPaises
import cx_Oracle

opcion_elegida=0

dsn_tns = cx_Oracle.makedsn('192.168.181.63', '1521', service_name='XE')
connection = cx_Oracle.connect(user='consultas', password='consultas', dsn=dsn_tns)

# conn = mysql.connector.connect(user="noelia", password="noelia", host="192.168.105.132", database="pconsultas")
cursor = connection.cursor()
