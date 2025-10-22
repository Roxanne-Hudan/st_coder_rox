-- -------------> importe los valores desde Mockaroo (Generacion aleatoria)
USE st_coder_rox; 

INSERT INTO tecnicos (nombre, apellido, fecha_de_ingreso, email)
VALUES ("Doy", "Mosley", "2023-12-16", "dmosley0@spiegel.de"),
	   ("Wilhelmine", "Scotchbourouge", "2025-06-10", "wscotchbourouge1@ftc.gov"),
	   ("Conchita", "Thorsby", "2023-01-08", "cthorsby2@w3.org"),
	   ("Darrick", "Marti", "2023-12-25", "dmarti3@elpais.com"),
	   ("Antonina", "Currane", "2021-01-24", "aocurrane4@archive.org"),
	   ("Malchy", "Reimer", "2020-02-01", "mreimer5@cnn.com"),
	   ("Dorie", "Posvner", "2021-05-28", "dposvner6@slideshare.net"),
	   ("Robbert", "Leving", "2025-01-14", "rleving7@feedburner.com"),
	   ("Cully", "Mummery", "2024-02-03", "cmummery8@smh.com.au"),
	   ("Alissa", "Obin", "2025-03-24", "aobin9@rambler.ru"),
	   ("Joann", "Shepland", "2022-11-08", "jsheplanda@amazon.co.uk"),
	   ("Frederic", "Schoninger", "2022-03-02", "ffranzschoningerb@usgs.gov");

INSERT INTO clientes (unidad, razon_social)
VALUES ("Macejkovic-Beatty", "Myworks"),
	   ("Hintz-Fisher", "Oozz"),
	   ("Waters-Ryan", "Feedspan"),
	   ("Pacocha Inc", "Yotz"),
	   ("Hudson and Sons", "Oozz"),
	   ("Kirlin 2", "Yombu"),
	   ("Pollich and Gorczany", "Youfeed"),
	   ("Runolfsdottir-Block", "Kazu"),
	   ("Cruickshank Inc", "Vinder"),
	   ("Koepp-Hilpert", "Leenti"),
	   ("Rau Bechtelar and Raynor", "Oozz"),
	   ("Mueller and Monahan", "Meejo"),
       ("Chilis", "Gastrosur");
 
INSERT INTO equipos_material (codigo, descripcion, tipo_de_producto, costo)
VALUES ('EDO001', 'Mix Master S','Dosificador para tarjas de 1 producto sanitizante', 1300),
	   ('EDO002', 'Mix Master D','Dosificador para tarjas de 2 producto sanitizante', 2600),
       ('EDO003', 'Mix Master T','Dosificador para tarjas de 3 producto sanitizante', 3900),
       ('EDO004', 'Handose Mini','Dosificador para manos 400 ml', 350),
       ('EDO005', 'Handose MD','Dosificador para manos 1 L', 420),
       ('EDO006', 'Satelite A','Dosificador para MLL', 3500),
       ('EDO007', 'Portagalon','Base de soporte de producto', 300),
       ('EDO008', 'Portafoam','Dosificador espumante en carrito', 7500),
       ('EDO009', 'Portafoam JR','Dosificador espumante en cubeta', 4000),
       ('EDO010', 'Time Asure','Dosificador para trampade grasa', 1500),
       ('EDO011', 'Atomizador','Botella con Atomizador', 30),
       ('EDO012', 'Blue Ray','Lampara de luy ultravioleta para insectos', 700);
   
-- Inserciones tablas con fk --

INSERT INTO inventario (codigo, cantidad, fecha_movimiento, tipo_de_transaccion)
VALUES ('EDO001', 15,'2010-01-01', 'Entrada'),
	   ('EDO002', 10,'2010-01-01', 'Entrada'),
       ('EDO003', 14,'2010-01-01', 'Entrada'),
       ('EDO004', 25,'2010-01-01', 'Entrada'),
       ('EDO005', 11,'2010-01-01', 'Entrada'),
       ('EDO006', 5,'2010-01-01', 'Entrada'),
       ('EDO007', 8,'2010-01-01', 'Entrada'),
       ('EDO008', 10,'2010-01-01', 'Entrada'),
       ('EDO009', 10,'2010-01-01', 'Entrada'),
       ('EDO010', 12,'2010-01-01', 'Entrada'),
       ('EDO011', 11,'2010-01-01', 'Entrada'),
       ('EDO012', 15,'2010-01-01', 'Entrada'),
       ('EDO001',-1,'2025-04-12','Salida'),
	   ('EDO004',-3,'2021-02-01','Salida'),
       ('EDO007',-2,'2022-01-17','Salida'),
       ('EDO008',-1,'2023-03-26','Salida'),
       ('EDO010',-3,'2024-02-16','Salida'),
       ('EDO002',-1,'2022-05-08','Salida'),
       ('EDO001',-1,'2022-04-09','Salida'),
       ('EDO003',-2,'2024-06-12','Salida'),
       ('EDO001',-1,'2023-08-15','Salida'),
       ('EDO001',-4,'2023-02-06','Salida'),
       ('EDO005',-2,'2021-01-27','Salida');
       

INSERT INTO base_de_servicio (id_tecnico, id_cliente, fecha_de_servicio, tipo_de_servicio)
VALUES (1,1,'2025-09-01','Mantenimiento preventivo'),
	   (1,11,'2025-09-02','Mantenimiento preventivo'),
       (3,1,'2025-09-03','Emergente'),
       (4,12,'2025-09-05','Mantenimiento preventivo'),
       (4,8,'2025-09-08','Mantenimiento preventivo'),
       (5,7,'2025-09-10','Emergente'),
       (8,5,'2025-09-12','Mantenimiento preventivo'),
       (8,2,'2025-09-15','Emergente'),
       (10,9,'2025-09-17','Mantenimiento preventivo'),
       (11,6,'2025-09-20','Mantenimiento preventivo');
       
    
INSERT INTO consignas (codigo, cantidad, id_cliente, fecha_instalacion)
VALUES ('EDO001', 2,1,'2022-01-05'),
	   ('EDO002', 5,11,'2022-02-18'),
       ('EDO003', 10,12,'2022-01-15'),
       ('EDO005', 21,8,'2022-05-23'),
       ('EDO010', 4,7,'2022-06-12'),
       ('EDO001', 2,5,'2022-02-21'),
       ('EDO007', 6,2,'2022-03-07'),
       ('EDO008', 8,9,'2022-04-18'),
       ('EDO012', 12,6,'2022-04-16'),
       ('EDO004', 11,1,'2022-04-24'),
       ('EDO002', 10,1,'2022-03-15'),
       ('EDO005', 3,12,'2022-03-28'),
       ('EDO008', 8,8,'2022-02-05'),
       ('EDO007', 1,7,'2022-02-02'),
       ('EDO003', 10,9,'2022-01-06'),
       ('EDO006', 22,6,'2022-04-21');
       
INSERT INTO solicitud_material (id_cliente, id_tecnico, codigo, cantidad, fecha_de_entrega)
VALUES (1, 1, 'EDO001',1,'2025-04-12'),
	   (11, 3, 'EDO004',3,'2021-02-01'),
       (12, 4, 'EDO007',2,'2022-01-17'),
       (6, 6, 'EDO008',1,'2023-03-26'),
       (1, 8, 'EDO010',3,'2024-02-16'),
       (1, 10, 'EDO002',1,'2022-05-08'),
       (12, 1, 'EDO001',1,'2022-04-09'),
       (8, 2, 'EDO003',2,'2024-06-12'),
       (7, 4, 'EDO001',1,'2023-08-15'),
       (9, 5, 'EDO001',4,'2023-02-06'),
       (6, 7, 'EDO005',2,'2021-01-27');

INSERT INTO vacaciones_tecnicos (id_tecnico, fecha_de_inicio, fecha_de_fin, dias_disfrutados)
VALUES (1,'2025-05-27', '2025-05-29', 2),
	   (2,'2025-04-17', '2025-04-27', 10),
       (3,'2025-08-04', '2025-08-08', 4),
       (5,'2025-02-14', '2025-02-15', 1),
       (7,'2025-01-20', '2025-01-25', 5);
       

-- SET FOREIGN_KEY_CHECKS = 0;
-- TRUNCATE TABLE clientes;
-- SET FOREIGN_KEY_CHECKS = 1;
