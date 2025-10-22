-- Todo el script completo ordenado como debe ejecutarse. --

CREATE SCHEMA st_coder_rox;
USE st_coder_rox;

CREATE TABLE tecnicos (
	id_tecnico INT AUTO_INCREMENT PRIMARY KEY,
	nombre VARCHAR(100) NOT NULL,
	apellido VARCHAR(100) NOT NULL,
	fecha_de_ingreso DATE NOT NULL,
	email VARCHAR(100) unique
);

CREATE TABLE clientes (
	id_cliente INT AUTO_INCREMENT PRIMARY KEY,
	unidad VARCHAR(100) NOT NULL,
	razon_social VARCHAR(100) NOT NULL
);

CREATE TABLE equipos_material (
	codigo VARCHAR(100) PRIMARY KEY,
	descripcion VARCHAR(100) NOT NULL,
	tipo_de_producto VARCHAR(100) NOT NULL,
	costo DECIMAL(10,2) NOT NULL
);

-- Tabla Transacciones -- 
CREATE TABLE inventario( 
	movimiento INT AUTO_INCREMENT PRIMARY KEY,
	codigo VARCHAR(100) NOT NULL,
    cantidad INT NOT NULL,
    fecha_movimiento DATE NOT NULL,
    tipo_de_transaccion VARCHAR(100) NOT NULL,
    FOREIGN KEY (codigo) REFERENCES equipos_material(codigo)
);

CREATE TABLE base_de_servicio (
	numero_servicio INT AUTO_INCREMENT PRIMARY KEY,
	id_tecnico INT NOT NULL,
	id_cliente INT NOT NULL,
	fecha_de_servicio DATE NOT NULL,
	tipo_de_servicio VARCHAR(100) NOT NULL,
	FOREIGN KEY (id_tecnico) REFERENCES tecnicos(id_tecnico),
	FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente)
);

-- Tabla de Hechos -- 
CREATE TABLE solicitud_material (
	numero_movimiento INT AUTO_INCREMENT PRIMARY KEY,
	id_cliente INT NOT NULL,
	id_tecnico INT NOT NULL,
	codigo VARCHAR(100) NOT NULL,
	cantidad INT NOT NULL,
	fecha_de_entrega DATE NOT NULL,
	FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente),
	FOREIGN KEY (id_tecnico) REFERENCES tecnicos(id_tecnico),
	FOREIGN KEY (codigo) REFERENCES equipos_material(codigo)
);

-- Tablas Complementarias --
CREATE TABLE consignas (
	numero_consigna INT AUTO_INCREMENT PRIMARY KEY,
	codigo VARCHAR(100) NOT NULL,
    cantidad INT NOT NULL,
	id_cliente INT NOT NULL,
    fecha_instalacion DATE NOT NULL,
	FOREIGN KEY (codigo) REFERENCES equipos_material(codigo),
	FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente)
);

CREATE TABLE vacaciones_tecnicos (
	numero_movimiento INT AUTO_INCREMENT PRIMARY KEY,
	id_tecnico INT NOT NULL,
	fecha_de_inicio DATE NOT NULL,
	fecha_de_fin DATE NOT NULL,
	dias_disfrutados INT NOT NULL,
	FOREIGN KEY (id_tecnico) REFERENCES tecnicos(id_tecnico)
);

-- Insercion de datos -- 

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
       

-- views --

-- Vista de inventario --
CREATE VIEW stock AS
SELECT i.codigo, e.descripcion, SUM(i.cantidad) AS stock
FROM inventario i
JOIN equipos_material e ON i.codigo = e.codigo
GROUP BY i.codigo, e.descripcion;

-- Vista de servicios realizados --

CREATE VIEW vista_servicios AS
SELECT bs.numero_servicio, t.nombre, c.razon_social, bs.fecha_de_servicio, bs.tipo_de_servicio
FROM base_de_servicio bs
JOIN tecnicos t ON bs.id_tecnico = t.id_tecnico
JOIN clientes c ON bs.id_cliente = c.id_cliente;

-- Vista de clientes sin equipos consignados (todos los clientes deben tener una consigna y asi poder visualizar los que faltan) --

CREATE VIEW consignas_pendientes AS
SELECT c.id_cliente, c.razon_social
FROM clientes c 
LEFT JOIN consignas co ON c.id_cliente = co.id_cliente
WHERE co.id_cliente IS NULL;

-- Vista de materiales solicitados por el cliente -- 

CREATE VIEW solicitudes_material_cliente AS
SELECT s.numero_movimiento, c.unidad, e.descripcion, s.cantidad, s.fecha_de_entrega
FROM solicitud_material s
JOIN clientes c ON s.id_cliente = c.id_cliente 
JOIN equipos_material e ON s.codigo = e.codigo;

-- Vista clientes que no se les ha dado ningun tipo de servicio --

CREATE VIEW servicios_pendientes AS
SELECT c.id_cliente, c.razon_social
FROM clientes c
LEFT JOIN base_de_servicio b ON c.id_cliente = b.id_cliente
WHERE b.id_cliente IS NULL;

-- Vista de tecnicos que han tomado vacaciones y cuantos dias --

CREATE VIEW vacaciones_tomadas AS
SELECT v.numero_movimiento, t.nombre, t.apellido, v.dias_disfrutados
FROM vacaciones_tecnicos v
JOIN tecnicos t ON v.id_tecnico = t.id_tecnico;

-- funciones --

-- Funcion Antiguedad de personal -- 

DELIMITER //
CREATE FUNCTION calcular_antiguedad (id INT)
RETURNS INT
DETERMINISTIC
BEGIN
	DECLARE antiguedad INT;
    SELECT TIMESTAMPDIFF(YEAR, fecha_de_ingreso, CURDATE())
    INTO antiguedad
    FROM tecnicos
    WHERE id_tecnico = id
    LIMIT 1;
	RETURN IFNULL (antiguedad,0) ;
END//

DELIMITER ; 

SELECT calcular_antiguedad(1) AS Antiguedad_Años


-- Calculo de costo total de solicitud --

DELIMITER //
CREATE FUNCTION costo_solicitud(id_solicitud INT)
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
	DECLARE total DECIMAL(10,2);
    
    SELECT sum(s.cantidad * e.costo)
    INTO total
    FROM solicitud_material s
    INNER JOIN equipos_material e ON e.codigo = s.codigo
    WHERE s.numero_movimiento = id_solicitud;
    RETURN IFNULL(total,0);
END //

DELIMITER ;

-- funcion de servicios realizados a un cliente --

DELIMITER //

CREATE FUNCTION total_servicios_cliente(idCliente INT, mes int)
RETURNS INT
DETERMINISTIC
BEGIN
	DECLARE servicios INT;
    
    SELECT COUNT(*) INTO servicios
    FROM base_de_servicio
    WHERE id_cliente = idCliente
    AND MONTH(fecha_de_servicio) = mes;
    
    RETURN IFNULL(servicios,0);
END //

DELIMITER ;

-- stored procedues --

-- Registrar solicitudes de equipos -- 

DELIMITER //
CREATE PROCEDURE registrar_solicitud( 
    IN idCliente INT, 
    IN idTecnico INT, 
    IN idCodigo VARCHAR(100), 
    IN cantidad INT 
    )
BEGIN
	INSERT INTO solicitud_material (id_cliente, id_tecnico, codigo, cantidad, fecha_de_entrega)
    VALUES (idCliente, idTecnico, idCodigo, cantidad, CURDATE());
   
END //

DELIMITER ; 

-- Vacaciones para tecnico --

DELIMITER //
CREATE PROCEDURE registrar_vacaciones(
    IN idTecnico INT,
    IN fechaInicio DATE,
    IN fechaFin DATE
)    
BEGIN 
    DECLARE diasTotales INT;
    DECLARE domingos INT DEFAULT 0;
    DECLARE diasDisfrutados INT;
    DECLARE fechaActual DATE;
    
    IF fechaFin < fechaInicio THEN
        SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = 'La fecha de fin debe ser posterior a la fecha de inicio';
    END IF;
    
    SET diasTotales = DATEDIFF(fechaFin, fechaInicio) + 1;
    
    SET fechaActual = fechaInicio;
    WHILE fechaActual <= fechaFin DO
        IF DAYOFWEEK(fechaActual) = 1 THEN -- 1 = Domingo
            SET domingos = domingos + 1;
        END IF;
        SET fechaActual = DATE_ADD(fechaActual, INTERVAL 1 DAY);
    END WHILE;
    
    SET diasDisfrutados = diasTotales - domingos;
    
    IF diasDisfrutados <= 0 THEN
        SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = 'El período de vacaciones no incluye días laborables';
    END IF;
    
    INSERT INTO vacaciones_tecnicos (id_tecnico, fecha_de_inicio, fecha_de_fin, dias_disfrutados)
    VALUES (idTecnico, fechaInicio, fechaFin, diasDisfrutados);
    
END //
DELIMITER ;


-- Reporte simple de servicio -- 

DELIMITER // 
CREATE PROCEDURE reporte_servicio_cliente (
	IN idCliente INT
    )

BEGIN
	SELECT b.numero_servicio, b.fecha_de_servicio, t.nombre AS Tecnico
    FROM base_de_servicio b
    INNER JOIN tecnicos t ON b.id_tecnico = t.id_tecnico
    WHERE b.id_cliente = idCliente;
    
END //

DELIMITER;

-- Triggers --

-- Actualizar inventario --
DELIMITER //

CREATE TRIGGER descontar_inventario
AFTER INSERT ON solicitud_material
FOR EACH ROW
BEGIN
    -- Actualizar el inventario restando la cantidad solicitada
    UPDATE inventario
    SET cantidad = cantidad - NEW.cantidad
    WHERE codigo = NEW.codigo
    LIMIT 1;
END;
//

DELIMITER ;

-- Evitar se solicite mas del cantidad existente --

DELIMITER //

CREATE TRIGGER validar_cantidad
BEFORE INSERT ON solicitud_material
FOR EACH ROW
BEGIN
    DECLARE cantidad_total INT;

    SELECT SUM(cantidad) INTO cantidad_total
    FROM inventario
    WHERE codigo = NEW.codigo;

    IF NEW.cantidad > cantidad_total THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'No hay suficiente stock en inventario';
    END IF;
END;
//

DELIMITER ;

-- Trigger para prevenir que no se borre un cliente con una consigna activa -- 
DELIMITER //
CREATE TRIGGER prevenir_borrado_cliente
BEFORE DELETE ON clientes
FOR EACH ROW
BEGIN
  IF EXISTS (SELECT 1 FROM consignas WHERE id_cliente = OLD.id_cliente) THEN
    SIGNAL SQLSTATE '45000' 
    SET MESSAGE_TEXT = 'No se puede borrar cliente con consignas registradas';
  END IF;
END;
//
DELIMITER ;

