-- views --
USE st_coder_rox;

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