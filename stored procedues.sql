-- stored procedues --
USE st_coder_rox;

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
    DECLARE domingos INT;
    DECLARE diasDisfrutados INT;
    
    SET diasTotales = DATEDIFF(fechaFin, fechaInicio) + 1;
    SET domingos =FLOOR((DATEDIFF(fechaFin, fechaInicio) - 1 + (8-1)) / 7);
    SET diasDisfrutados = diasTotales - domingos;
    
	INSERT INTO vacaciones_tecnicos ( id_tecnico, fecha_de_inicio, fecha_de_fin, dias_disfrutados)
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

DELIMITER //

-- CALL reporte_servicio_cliente(1);

-- START TRANSACTION;
-- CALL registrar_vacaciones(1,"2025-10-01","2025-10-6");
-- ROLLBACK

-- START TRANSACTION;
-- CALL registrar_solicitud(1,1,"EDO001",3);
-- ROLLBACK

-- COMMIT