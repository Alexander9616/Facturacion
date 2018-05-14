-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 14-05-2018 a las 15:18:28
-- Versión del servidor: 10.1.25-MariaDB
-- Versión de PHP: 7.1.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `notas`
--
CREATE DATABASE IF NOT EXISTS `notas` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `notas`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tblciclos`
--

DROP TABLE IF EXISTS `tblciclos`;
CREATE TABLE `tblciclos` (
  `codCiclo` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tblciclos`
--

INSERT INTO `tblciclos` (`codCiclo`) VALUES
('01-2018'),
('02-2018'),
('03-2018');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tblestudiantes`
--

DROP TABLE IF EXISTS `tblestudiantes`;
CREATE TABLE `tblestudiantes` (
  `carnet` varchar(20) NOT NULL,
  `nombre` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tblestudiantes`
--

INSERT INTO `tblestudiantes` (`carnet`, `nombre`) VALUES
('2500', 'Oscar Duran'),
('2501', 'Diego de la O'),
('2502', 'Alexander Lopez'),
('2503', 'Fernando Hernandez');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tblmaterias`
--

DROP TABLE IF EXISTS `tblmaterias`;
CREATE TABLE `tblmaterias` (
  `codMateria` varchar(15) NOT NULL,
  `nombre` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tblmaterias`
--

INSERT INTO `tblmaterias` (`codMateria`, `nombre`) VALUES
('est1', 'Estadistica y probabilidades'),
('etica1', 'Etica'),
('fisica3', ' Fisica 3'),
('prog3', 'Programacion 3'),
('redes1', 'Redes de datos 1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tblnotasnotas`
--

DROP TABLE IF EXISTS `tblNotas`;
CREATE TABLE `tblNotas` (
  `codCiclo` varchar(15) DEFAULT NULL,
  `carnet` varchar(20) DEFAULT NULL,
  `codMateria` varchar(15) DEFAULT NULL,
  `nota1` double DEFAULT NULL,
  `nota2` double DEFAULT NULL,
  `nota3` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tblnotasnotas`
--

INSERT INTO `tblNotas` (`codCiclo`, `carnet`, `codMateria`, `nota1`,`nota2`,`nota3`) VALUES
('03-2018', '2500', 'etica1', 9,7,7),
('03-2018', '2501', 'etica1', 10,7,9),
('03-2018', '2502', 'etica1', 7.5,6,8),
('03-2018', '2503', 'etica1', 8.5,7,8);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `tblciclos`
--
ALTER TABLE `tblciclos`
  ADD PRIMARY KEY (`codCiclo`);

--
-- Indices de la tabla `tblestudiantes`
--
ALTER TABLE `tblestudiantes`
  ADD PRIMARY KEY (`carnet`);

--
-- Indices de la tabla `tblmaterias`
--
ALTER TABLE `tblmaterias`
  ADD PRIMARY KEY (`codMateria`);

--
-- Indices de la tabla `tblnotasnotas`
--
ALTER TABLE `tblNotas`
  ADD KEY `codCiclo` (`codCiclo`),
  ADD KEY `carnet` (`carnet`),
  ADD KEY `codMateria` (`codMateria`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `tblnotasnotas`
--
ALTER TABLE `tblNotas`
  ADD CONSTRAINT `tblNotas_ibfk_1` FOREIGN KEY (`codCiclo`) REFERENCES `tblciclos` (`codCiclo`),
  ADD CONSTRAINT `tblNotas_ibfk_2` FOREIGN KEY (`carnet`) REFERENCES `tblestudiantes` (`carnet`),
  ADD CONSTRAINT `tblNotas_ibfk_3` FOREIGN KEY (`codMateria`) REFERENCES `tblmaterias` (`codMateria`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
