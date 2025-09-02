-- Crea la base de datos y la tabla 'records' para PBIPAPP

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
