/*Muestra las tablas que estan creadas en el disco*/
show global status like 'Created_tmp_disk_tables';

/*Muestra las tablas creadas en ram*/
show global status like 'Created_tmp_tables';

/*Ver la cantidad de memoria asignada a las tablas temporales*/
show global variables like 'tmp_table_size';

/*Cambiando el valor de la variable*/
set global tmp_table_size = 136700160;

/*Usando mecanismos de almacenamiento*/


create database test_DBA;
use test_DBA;

create table df_table (
ID INT,
NOMBRE varchar(100));

/*Cambiando el tipo de de motor en la tabal default*/
ALTER TABLE df_table ENGINE = MyISAM;

/*Creando la tabla y definiendo el engine*/

create table df_table1 (
ID INT,
NOMBRE varchar(100)) engine = MEMORY;

/*Manejando directorios donde se almacenan las bases de datos*/
	
    /*Mostrando los directorios de la base de datos*/
show variables where Variable_Name like '%dir';

	/*Podemos cambiar el directorio pero tenemos que mover las tablas de configuracion al
    nuevo directorio para poder inicializar el servicio sin problemas*/
    
/*Backups logicos: mysqldump
comando: mysqldump -u root -p --databases jugos_ventas > ruta de destino
ejemplo: mysqldump -u root -p --databases jugos_ventas > /home/lubraska/Documentos/Sql/Administracion\ de\ bases\ de\ datos/jugos_ventas_full.sql

excluyendo una table:
mysqldump -u root -p --databases jugos_ventas --ignore-table jugos_ventas.facturas > /home/lubraska/Documentos/Sql/Administracion\ de\ bases\ de\ datos/jugos_ventas_sin_facturas.sql
*/

/*backups mysql work bench*/

#paramos la instancia
lock instance for backup;

/*
en la parte de navigator, vamos a administracion y le damos a data export

podemos guardarla en un archivo sql o en una carpeta

seleccionamos la base de datos que queremos exportar, elegimos el directorio de destino

y le damos a star export
*/

#arancamos la instancia
unlock instance;

/*Backup fisico*/

#bloqueamos la instancia
lock instance for backup;

/*nos movemos a el directorio donde guardamos los datos y copiamos toda la carpeta a donde queramos respaldar

debemos tener cuidado de copiar todos los archivos para evitar errores
*/

#arrancamos la instancia

unlock instance;

/*recuperando los back ups

Atraves de cmd o terminal podemos usar este comando:

mysql -u rooy -p > fichero a exportar

*/

create database jugos_ventas;

/*recuperar back up metodo fisico

detenemos el servicio mysql 80 y movemos el directrio data y el my.ini al la carpetas correspondientes y volvemos a iniciar el servicio

*/

