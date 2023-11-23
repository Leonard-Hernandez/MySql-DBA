/*Muestra las tablas que estan creadas en el disco*/
show global status like 'Created_tmp_disk_tables';

/*Muestra las tablas creadas en ram*/
show global status like 'Created_tmp_tables';

/*Ver la cantidad de memoria asignada a las tablas temporales*/
show global variables like 'tmp_table_size';

/*Cambiando el valor de la variable*/
set global tmp_table_size = 136700160;