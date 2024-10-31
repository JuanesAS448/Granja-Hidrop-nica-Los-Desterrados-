CREATE DATABASE LosDesterrados;
USE LosDesterrados;

CREATE TABLE Cultivo (
    id_cultivo INT PRIMARY KEY auto_increment,
    tipo_planta VARCHAR(50),
    fecha_siembra DATE,
    estado_crecimiento VARCHAR(50),
    rendimiento_esperado DECIMAL(10, 2)
);

CREATE TABLE Insumo (
    id_insumo INT PRIMARY KEY auto_increment,
    tipo_insumo VARCHAR(50),
    cantidad_disponible DECIMAL(10, 2),
    fecha_caducidad DATE
);

CREATE TABLE Cliente (
    id_cliente INT PRIMARY KEY auto_increment,
    nombre VARCHAR(100),
    correo VARCHAR(100),
    telefono VARCHAR(15)
);

CREATE TABLE Venta (
    id_venta INT PRIMARY KEY auto_increment,
    cliente_id INT,
    fecha_venta DATETIME,
    total DECIMAL(10, 2),
    FOREIGN KEY (cliente_id) REFERENCES Cliente(id_cliente)
);

CREATE TABLE Detalle_Venta (
    id_detalle INT PRIMARY KEY auto_increment,
    venta_id INT,
    cultivo_id INT,
    cantidad DECIMAL(10, 2),
    subtotal DECIMAL(10, 2),
    FOREIGN KEY (venta_id) REFERENCES Venta(id_venta),
    FOREIGN KEY (cultivo_id) REFERENCES Cultivo(id_cultivo)
);



