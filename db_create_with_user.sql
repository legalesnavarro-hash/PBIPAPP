-- Crea la base de datos, la tabla 'records' y un usuario con permisos sobre la BD.
-- EDITA: reemplaza 'CHANGE_ME_PASSWORD' por la contraseña que desees antes de ejecutar.

CREATE DATABASE IF NOT EXISTS `pbipapp` CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `pbipapp`;

CREATE TABLE IF NOT EXISTS `records` (
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `cuit` VARCHAR(50),
  `empresa` VARCHAR(255),
  `nombre` VARCHAR(255),
  `dni` VARCHAR(50),
  `tipo` VARCHAR(100),
  `documents` JSON,
  `createdAt` DATETIME,
  `exitAt` DATETIME,
  INDEX `idx_dni` (`dni`),
  INDEX `idx_createdAt` (`createdAt`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Crear usuario y otorgar permisos (ajusta host si necesitas acceso remoto)
CREATE USER IF NOT EXISTS 'pbip_user'@'localhost' IDENTIFIED BY 'CHANGE_ME_PASSWORD';
GRANT SELECT, INSERT, UPDATE, DELETE ON `pbipapp`.* TO 'pbip_user'@'localhost';
FLUSH PRIVILEGES;
FLUSH PRIVILEGES;
