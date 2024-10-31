CREATE DATABASE LosDesterrados;
USE LosDesterrados;

CREATE TABLE Cultivo (
    id_cultivo INT PRIMARY KEY IDENTITY(1,1),
    tipo_planta NVARCHAR(50) NOT NULL,
    fecha_siembra DATE,
    estado_crecimiento NVARCHAR(50),
    rendimiento_esperado DECIMAL(10, 2)
);

CREATE TABLE Insumo (
    id_insumo INT PRIMARY KEY IDENTITY(1,1),
    tipo_insumo NVARCHAR(50) NOT NULL,
    cantidad_disponible DECIMAL(10, 2),
    fecha_caducidad DATE
);

CREATE TABLE Cliente (
    id_cliente INT PRIMARY KEY IDENTITY(1,1),
    nombre NVARCHAR(100),
    correo NVARCHAR(100),
    telefono NVARCHAR(15)
);

CREATE TABLE Venta (
    id_venta INT PRIMARY KEY IDENTITY(1,1),
    cliente_id INT,
    fecha_venta DATETIME,
    total DECIMAL(10, 2),
    FOREIGN KEY (cliente_id) REFERENCES Cliente(id_cliente)
);

CREATE TABLE Detalle_Venta (
    id_detalle INT PRIMARY KEY IDENTITY(1,1),
    venta_id INT,
    cultivo_id INT,
    cantidad DECIMAL(10, 2),
    subtotal DECIMAL(10, 2),
    FOREIGN KEY (venta_id) REFERENCES Venta(id_venta),
    FOREIGN KEY (cultivo_id) REFERENCES Cultivo(id_cultivo)
);

