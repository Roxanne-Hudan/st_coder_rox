-- funciones --
USE st_coder_rox;

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
	RETURN antiguedad ;
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

-- SELECT costo_solicitud(3) AS costo_solicitud
-- SELECT total_servicios_cliente(1,09)
