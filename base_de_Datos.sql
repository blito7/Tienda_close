CREATE DATABASE IF NOT EXISTS tienda_online;
USE tienda_online;

-- Tabla: registro_usuario
CREATE TABLE registro_usuario (
    id_registro INT AUTO_INCREMENT PRIMARY KEY,
    email VARCHAR(100) NOT NULL,
    contraseña VARCHAR(255) NOT NULL,
    nombre VARCHAR(50),
    apellido VARCHAR(50),
    numero VARCHAR(20),
    direccion VARCHAR(100),
    fecha_registro DATE
);

-- Tabla: usuario
CREATE TABLE usuario (
    id_usuario INT AUTO_INCREMENT PRIMARY KEY,
    id_registro INT,
    nombre VARCHAR(50),
    apellido VARCHAR(50),
    email VARCHAR(100),
    contraseña VARCHAR(255),
    direccion VARCHAR(100),
    telefono VARCHAR(20),
    fecha_registro DATE,
    FOREIGN KEY (id_registro) REFERENCES registro_usuario(id_registro)
);

-- Tabla: sesion_usuario
CREATE TABLE sesion_usuario (
    id_sesion INT AUTO_INCREMENT PRIMARY KEY,
    id_usuario INT,
    token_sesion VARCHAR(255),
    fecha_inicio DATETIME,
    fecha_expiracion DATETIME,
    FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario)
);

-- Tabla: producto
CREATE TABLE producto (
    id_producto INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100),
    descripcion TEXT,
    precio DECIMAL(10,2),
    stock INT,
    id_categoria INT,
    marca VARCHAR(50),
    talla VARCHAR(20)
);

-- Tabla: categoria
CREATE TABLE categoria (
    id_categoria INT AUTO_INCREMENT PRIMARY KEY,
    nombre_categoria VARCHAR(100)
);

-- Tabla: pedido
CREATE TABLE pedido (
    id_pedido INT AUTO_INCREMENT PRIMARY KEY,
    id_usuario INT,
    fecha_pedido DATE,
    estado_pedido VARCHAR(50),
    total DECIMAL(10,2),
    subtotal DECIMAL(10,2),
    FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario)
);

-- Tabla: detalle_pedido
CREATE TABLE detalle_pedido (
    id_detalle_pedido INT AUTO_INCREMENT PRIMARY KEY,
    id_pedido INT,
    id_producto INT,
    cantidad INT,
    precio_unitario DECIMAL(10,2),
    FOREIGN KEY (id_pedido) REFERENCES pedido(id_pedido),
    FOREIGN KEY (id_producto) REFERENCES producto(id_producto)
);

-- Tabla: envio
CREATE TABLE envio (
    id_envio INT AUTO_INCREMENT PRIMARY KEY,
    id_producto INT,
    direccion_envio VARCHAR(100),
    fecha_envio DATE,
    estado_envio VARCHAR(50),
    id_seguimiento VARCHAR(50),
    FOREIGN KEY (id_producto) REFERENCES producto(id_producto)
);

-- Tabla: pago
CREATE TABLE pago (
    id_pago INT AUTO_INCREMENT PRIMARY KEY,
    id_pedido INT,
    fecha_pago DATE,
    monto DECIMAL(10,2),
    metodo_pago VARCHAR(50),
    referencia_pago VARCHAR(100),
    estado_pago VARCHAR(50),
    FOREIGN KEY (id_pedido) REFERENCES pedido(id_pedido)
);

-- Tabla: comentario
CREATE TABLE comentario (
    id_comentario INT AUTO_INCREMENT PRIMARY KEY,
    id_usuario INT,
    id_producto INT,
    calificacion INT,
    texto TEXT,
    fecha_comentario DATE,
    FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario),
    FOREIGN KEY (id_producto) REFERENCES producto(id_producto)
);

-- Tabla: suscripcion
CREATE TABLE suscripcion (
    id_suscripcion INT AUTO_INCREMENT PRIMARY KEY,
    email VARCHAR(100),
    fecha_suscripcion DATE
);
