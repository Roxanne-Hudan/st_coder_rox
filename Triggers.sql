-- Triggers --
USE st_coder_rox;

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


-- SHOW TRIGGERS --

-- INSERT INTO solicitud_material (id_cliente, id_tecnico, codigo, cantidad, fecha_de_entrega) 
-- VALUES (1,1,"EDO001",5,"2025-10-10") 
