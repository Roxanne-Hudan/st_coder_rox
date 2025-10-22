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

DELIMITER ;

-- CALL reporte_servicio_cliente(1);

-- START TRANSACTION;
-- CALL registrar_vacaciones(1,"2025-10-07","2025-10-31");
-- ROLLBACK

-- START TRANSACTION;
-- CALL registrar_solicitud(1,1,"EDO001",3);
-- ROLLBACK

-- COMMIT