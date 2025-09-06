CREATE SCHEMA st_coder_rox;
USE st_coder_rox;

CREATE TABLE tecnicos (
	id_tecnico INT AUTO_INCREMENT PRIMARY KEY,
	nombre VARCHAR(100) NOT NULL,
	apellido VARCHAR(100) NOT NULL,
	fecha_de_ingreso DATE NOT NULL,
	emil VARCHAR(100) unique
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

CREATE TABLE base_de_servicio (
	numero_servicio INT AUTO_INCREMENT PRIMARY KEY,
	id_tecnico INT NOT NULL,
	id_cliente INT NOT NULL,
	fecha_de_servicio DATE NOT NULL,
	tipo_de_servicio VARCHAR(100) NOT NULL,
	FOREIGN KEY (id_tecnico) REFERENCES tecnicos(id_tecnico),
	FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente)
);

CREATE TABLE solicitud_material (
	numero_movimiento INT AUTO_INCREMENT PRIMARY KEY,
	id_cliente INT NOT NULL,
	id_tecnico INT NOT NULL,
	codigo VARCHAR(100) NOT NULL,
	tipo_de_producto VARCHAR(100) NOT NULL,
	descripcion_producto VARCHAR(100) NOT NULL,
	cantidad INT NOT NULL,
	tipo_espesificacion VARCHAR(50) NOT NULL,
	fecha_de_entrega DATE NOT NULL,
	FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente),
	FOREIGN KEY (id_tecnico) REFERENCES tecnicos(id_tecnico),
	FOREIGN KEY (codigo) REFERENCES equipos_material(codigo)
);

CREATE TABLE consignas (
	numero_consigna INT AUTO_INCREMENT PRIMARY KEY,
	codigo VARCHAR(100) NOT NULL,
    cantidad VARCHAR(100) NOT NULL,
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



