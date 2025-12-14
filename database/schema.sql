CREATE DATABASE IF NOT EXISTS mun_beneficios CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE mun_beneficios;

CREATE TABLE municipios (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(150) NOT NULL,
  rut VARCHAR(20) UNIQUE,
  email VARCHAR(150),
  estado TINYINT DEFAULT 1,
  creado_en TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE roles (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL,
  estado TINYINT DEFAULT 1
);

CREATE TABLE permisos (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(150) NOT NULL,
  estado TINYINT DEFAULT 1
);

CREATE TABLE usuario_roles (
  id_usuario INT,
  id_rol INT
);

CREATE TABLE usuarios (
  id INT AUTO_INCREMENT PRIMARY KEY,
  id_municipio INT NOT NULL,
  nombre VARCHAR(150),
  email VARCHAR(150) UNIQUE,
  password_hash VARCHAR(255),
  ultimo_acceso DATETIME NULL,
  estado TINYINT DEFAULT 1
);

CREATE TABLE beneficiarios (
  id INT AUTO_INCREMENT PRIMARY KEY,
  id_municipio INT NOT NULL,
  rut VARCHAR(20) UNIQUE,
  nombre VARCHAR(150),
  fecha_nacimiento DATE NULL,
  id_comuna INT NULL,
  estado TINYINT DEFAULT 1
);

CREATE TABLE beneficiario_cuentas (
  id INT AUTO_INCREMENT PRIMARY KEY,
  id_beneficiario INT NOT NULL,
  id_municipio INT NOT NULL,
  rut VARCHAR(20),
  email VARCHAR(150),
  password_hash VARCHAR(255),
  estado TINYINT DEFAULT 1
);

CREATE TABLE beneficios (
  id INT AUTO_INCREMENT PRIMARY KEY,
  id_municipio INT NOT NULL,
  nombre VARCHAR(150),
  descripcion TEXT,
  id_estado INT DEFAULT 1,
  estado TINYINT DEFAULT 1
);

CREATE TABLE solicitudes (
  id INT AUTO_INCREMENT PRIMARY KEY,
  id_beneficiario INT,
  id_municipio INT,
  id_beneficio INT,
  id_estado INT,
  fecha DATETIME DEFAULT CURRENT_TIMESTAMP,
  estado TINYINT DEFAULT 1
);

CREATE TABLE entregas (
  id INT AUTO_INCREMENT PRIMARY KEY,
  id_solicitud INT,
  id_beneficiario INT,
  id_municipio INT,
  id_estado INT,
  fecha_programada DATETIME NULL,
  fecha_entrega DATETIME NULL,
  estado TINYINT DEFAULT 1
);

CREATE TABLE notificaciones (
  id INT AUTO_INCREMENT PRIMARY KEY,
  id_email_config INT NULL,
  id_municipio INT NULL,
  id_beneficio INT NULL,
  para_email VARCHAR(150),
  para_nombre VARCHAR(150),
  asunto VARCHAR(200),
  cuerpo TEXT,
  envio_estado VARCHAR(20) DEFAULT 'PENDIENTE',
  intentos INT DEFAULT 0,
  programada_para DATETIME NULL,
  fecha_envio DATETIME NULL,
  estado TINYINT DEFAULT 1
);

CREATE TABLE email_configs (
  id INT AUTO_INCREMENT PRIMARY KEY,
  id_municipio INT,
  host VARCHAR(150),
  port INT,
  secure VARCHAR(10),
  user VARCHAR(150),
  password VARCHAR(255),
  from_email VARCHAR(150),
  from_name VARCHAR(150),
  ultimo_test_ok TINYINT DEFAULT 0,
  estado TINYINT DEFAULT 1
);

CREATE TABLE auditoria (
  id INT AUTO_INCREMENT PRIMARY KEY,
  entidad VARCHAR(100),
  id_entidad INT NULL,
  accion VARCHAR(50),
  ip VARCHAR(50),
  detalle TEXT,
  fecha DATETIME,
  estado TINYINT DEFAULT 1
);
