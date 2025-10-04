-- Triggers --
USE st_coder_rox;

-- Validación de vacaciones -- 

DELIMITER //
CREATE TRIGGER validar_vacaciones
BEFORE INSERT ON vacaciones_tecnicos
FOR EACH ROW
BEGIN
  IF NEW.fecha_de_fin <= NEW.fecha_de_inicio THEN
    SIGNAL SQLSTATE '45000' 
    SET MESSAGE_TEXT = 'La fecha de fin debe ser posterior a la fecha de inicio';
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



