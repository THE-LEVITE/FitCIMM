-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 28-07-2026 a las 22:31:45
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `fitcimm`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ingreso`
--

CREATE TABLE `ingreso` (
  `id_ingreso` int(11) NOT NULL,
  `id_socio` int(11) NOT NULL,
  `fecha_ingreso` date NOT NULL,
  `hora_ingreso` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `ingreso`
--

INSERT INTO `ingreso` (`id_ingreso`, `id_socio`, `fecha_ingreso`, `hora_ingreso`) VALUES
(11, 1, '2026-07-28', '05:02:14'),
(12, 2, '2026-07-27', '05:09:36'),
(13, 2, '2026-07-28', '07:30:50'),
(14, 6, '2026-07-22', '06:15:00'),
(15, 7, '2026-07-23', '07:30:00'),
(16, 8, '2026-07-24', '18:20:00'),
(17, 6, '2026-07-25', '06:00:00'),
(18, 10, '2026-07-26', '08:45:00'),
(19, 11, '2026-07-27', '19:10:00'),
(20, 7, '2026-07-27', '07:15:00'),
(21, 12, '2026-07-28', '06:30:00'),
(22, 13, '2026-07-28', '09:00:00'),
(23, 14, '2026-07-28', '17:45:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `membresia`
--

CREATE TABLE `membresia` (
  `id_membresia` int(11) NOT NULL,
  `id_socio` int(11) NOT NULL,
  `id_plan` int(11) NOT NULL,
  `fecha_inicio` date NOT NULL,
  `fecha_fin` date NOT NULL,
  `valor_pagado` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `membresia`
--

INSERT INTO `membresia` (`id_membresia`, `id_socio`, `id_plan`, `fecha_inicio`, `fecha_fin`, `valor_pagado`) VALUES
(2, 2, 1, '2026-07-25', '2026-07-30', 8000.00),
(3, 3, 1, '2026-06-01', '2026-06-02', 8000.00),
(4, 3, 2, '2026-07-28', '2026-08-27', 75000.00),
(7, 1, 3, '2026-06-01', '2026-06-30', 8000.00),
(8, 1, 3, '2026-07-28', '2026-10-26', 195000.00),
(9, 6, 1, '2026-07-20', '2026-07-21', 8000.00),
(10, 6, 2, '2026-07-28', '2026-08-27', 75000.00),
(11, 7, 2, '2026-07-01', '2026-07-31', 75000.00),
(12, 8, 3, '2026-05-01', '2026-07-30', 195000.00),
(13, 9, 1, '2026-07-27', '2026-07-28', 8000.00),
(14, 10, 2, '2026-07-15', '2026-08-14', 75000.00),
(15, 11, 2, '2026-07-25', '2026-08-24', 75000.00),
(16, 12, 1, '2026-07-28', '2026-07-29', 8000.00),
(17, 13, 3, '2026-07-01', '2026-09-29', 195000.00),
(18, 14, 2, '2026-07-22', '2026-08-21', 75000.00);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `plan`
--

CREATE TABLE `plan` (
  `id_plan` int(11) NOT NULL,
  `nombre` varchar(40) NOT NULL,
  `duracion_dias` int(11) NOT NULL CHECK (`duracion_dias` > 0),
  `valor` decimal(10,2) NOT NULL CHECK (`valor` > 0),
  `activo` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `plan`
--

INSERT INTO `plan` (`id_plan`, `nombre`, `duracion_dias`, `valor`, `activo`) VALUES
(1, 'Dia', 1, 8000.00, 1),
(2, 'Mensual', 30, 75000.00, 1),
(3, 'Trimestral', 90, 195000.00, 1),
(4, 'Anual edit', 365, 650000.00, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `socio`
--

CREATE TABLE `socio` (
  `id_socio` int(11) NOT NULL,
  `documento` varchar(15) NOT NULL,
  `nombres` varchar(60) NOT NULL,
  `apellidos` varchar(60) NOT NULL,
  `telefono` varchar(15) DEFAULT NULL,
  `correo` varchar(80) DEFAULT NULL,
  `fecha_nacimiento` date NOT NULL,
  `activo` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `socio`
--

INSERT INTO `socio` (`id_socio`, `documento`, `nombres`, `apellidos`, `telefono`, `correo`, `fecha_nacimiento`, `activo`) VALUES
(1, '1052837800', 'Kevinn Rodri edit', 'rodriguez', '3333333', 'halfonsokyar03@gmail.com', '2005-08-29', 1),
(2, '10528374596223', 'PruebaEliminar', 'Delete', '125354241', 'p@gmail.com', '2002-12-12', 1),
(3, '1052837459', 'Juan', 'Perez', '3123456789', 'juan@email.com', '1995-05-15', 1),
(4, '102356988', 'kevinn pruebaaaaa editar 2', 'rodriguez', '333333', 'halfonsokyar03@gmail.com', '2002-06-13', 0),
(5, '20133659484', 'kevinn prueba 777', 'rodriguez ;-;', '32012544851', 'halfonsokyar03@gmail.com', '2004-06-11', 0),
(6, '1011111111', 'Carlos', 'Mendoza', '3115551234', 'carlos.mendoza@email.com', '1990-04-12', 1),
(7, '1022222222', 'Ana Maria', 'Gomez', '3124445678', 'ana.gomez@email.com', '1993-08-22', 1),
(8, '1033333333', 'Diego', 'Torres', '3133339012', 'diego.torres@email.com', '1988-11-05', 1),
(9, '1044444444', 'Luisa', 'Fernandez', '3142223456', 'luisa.f@email.com', '1996-01-30', 1),
(10, '1055555555', 'Andres', 'Castro', '3151117890', 'andres.castro@email.com', '2000-05-14', 1),
(11, '1066666666', 'Camila', 'Rojas', '3169992345', 'camila.rojas@email.com', '1995-09-18', 1),
(12, '1077777777', 'Santiago', 'Ramirez', '3178886789', 'santiago.r@email.com', '1992-03-25', 1),
(13, '1088888888', 'Valentina', 'Ortiz', '3187771234', 'vale.ortiz@email.com', '1999-07-07', 1),
(14, '1099999999', 'Mateo', 'Morales', '3196665678', 'mateo.m@email.com', '1994-12-01', 0),
(15, '1000000000', 'Sofia', 'Herrera', '3205559012', 'sofia.herrera@email.com', '1997-02-10', 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `ingreso`
--
ALTER TABLE `ingreso`
  ADD PRIMARY KEY (`id_ingreso`),
  ADD UNIQUE KEY `unique_ingreso_dia` (`id_socio`,`fecha_ingreso`);

--
-- Indices de la tabla `membresia`
--
ALTER TABLE `membresia`
  ADD PRIMARY KEY (`id_membresia`),
  ADD KEY `fk_mem_socio` (`id_socio`),
  ADD KEY `fk_mem_plan` (`id_plan`);

--
-- Indices de la tabla `plan`
--
ALTER TABLE `plan`
  ADD PRIMARY KEY (`id_plan`),
  ADD UNIQUE KEY `nombre` (`nombre`);

--
-- Indices de la tabla `socio`
--
ALTER TABLE `socio`
  ADD PRIMARY KEY (`id_socio`),
  ADD UNIQUE KEY `documento` (`documento`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `ingreso`
--
ALTER TABLE `ingreso`
  MODIFY `id_ingreso` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT de la tabla `membresia`
--
ALTER TABLE `membresia`
  MODIFY `id_membresia` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT de la tabla `plan`
--
ALTER TABLE `plan`
  MODIFY `id_plan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `socio`
--
ALTER TABLE `socio`
  MODIFY `id_socio` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `ingreso`
--
ALTER TABLE `ingreso`
  ADD CONSTRAINT `fk_ingreso_socio` FOREIGN KEY (`id_socio`) REFERENCES `socio` (`id_socio`);

--
-- Filtros para la tabla `membresia`
--
ALTER TABLE `membresia`
  ADD CONSTRAINT `fk_mem_plan` FOREIGN KEY (`id_plan`) REFERENCES `plan` (`id_plan`),
  ADD CONSTRAINT `fk_mem_socio` FOREIGN KEY (`id_socio`) REFERENCES `socio` (`id_socio`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
