README
Este repositorio contiene los archivos organizados por componentes para facilitar su análisis y ejecución de manera sencilla. Los archivos se encuentran separados en las siguientes categorías:
Triggers, Stored Procedures (SP), Vistas, Inserciones de datos (en código SQL y en archivos CSV), Funciones

Orden de ejecución recomendado
Para garantizar la correcta carga y funcionamiento de la base de datos, se sugiere seguir el siguiente orden de ejecución:

Schema ---> Crear la estructura de las tablas de la base de datos.

Archivos CSV ---> Importar los datos iniciales de clientes, técnicos y equipos.

Inserción de datos ---> Ejecutar las sentencias INSERT INTO adicionales para poblar las tablas con información base.

Vistas ---> Crear las vistas definidas para facilitar la consulta de datos.

Funciones ---> Implementar las funciones diseñadas para cálculos y consultas específicas.

Stored Procedures (SP) ---> Registrar los procedimientos almacenados que automatizan operaciones frecuentes.

Triggers ---> Finalmente, activar los triggers que aseguran la integridad y validación de la información.


Notas adicionales
Aunque después de la inserción de datos se puede ejecutar el resto del código en el orden que se desee, el flujo sugerido asegura una configuración más clara y libre de errores.
Cada archivo está documentado y puede revisarse individualmente para su comprensión.
Por favor revisar el pdf en el que se informa de manera mas conreta todo el proyecto.
Agregue el Codigo completo como un .sql aparte por si desean ejecutarlo de un click solo tomar en cuenta los archivos CSV.
