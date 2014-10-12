-- phpMyAdmin SQL Dump
-- version 4.2.7.1
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 10-10-2014 a las 07:51:15
-- Versión del servidor: 5.6.20
-- Versión de PHP: 5.5.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `gestionedificio`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `depto`
--

CREATE TABLE IF NOT EXISTS `depto` (
  `rut_Ed` int(11) NOT NULL,
  `n_Dpto` int(11) NOT NULL,
  `rut_Prop` int(11) DEFAULT NULL,
  `bodega` varchar(50) DEFAULT NULL,
  `estacionamiento` varchar(50) DEFAULT NULL,
  `gastos_Espe` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `edificio`
--

CREATE TABLE IF NOT EXISTS `edificio` (
  `Rut` int(11) NOT NULL,
  `Nombre` varchar(50) DEFAULT NULL,
  `Direccion` varchar(50) DEFAULT NULL,
  `Telefono` int(11) DEFAULT NULL,
  `nCuenta` int(11) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `gasto_espe`
--

CREATE TABLE IF NOT EXISTS `gasto_espe` (
  `n_Boleta` int(11) NOT NULL,
  `n_Depto` int(11) NOT NULL,
  `tipo_Gasto` int(11) DEFAULT NULL,
  `mes_Cobro` varchar(50) DEFAULT NULL,
  `nom_Gasto` varchar(50) DEFAULT NULL,
  `fecha_Em` date DEFAULT NULL,
  `fecha_Ven` date DEFAULT NULL,
  `n_Factura` int(11) DEFAULT NULL,
  `estado_Gasto` int(11) DEFAULT NULL,
  `otro` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `gasto_grales`
--

CREATE TABLE IF NOT EXISTS `gasto_grales` (
  `n_Boleta` int(11) DEFAULT NULL,
  `rut_Ed` int(11) DEFAULT NULL,
  `tipo_Gasto` int(11) DEFAULT NULL,
  `mes_Cobro` varchar(50) DEFAULT NULL,
  `nom_Gasto` varchar(50) DEFAULT NULL,
  `fecha_Em` date DEFAULT NULL,
  `fecha_Ven` date DEFAULT NULL,
  `n_Factura` int(11) DEFAULT NULL,
  `otros` varchar(200) DEFAULT NULL,
  `estado_Gasto` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE IF NOT EXISTS `usuario` (
  `id_Rut` int(11) NOT NULL,
  `contraseña` varchar(50) NOT NULL,
  `nombre_Completo` varchar(50) DEFAULT NULL,
  `tipo_Usuario` int(11) DEFAULT NULL,
  `fecha_Nac` date DEFAULT NULL,
  `n_Celular` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `depto`
--
ALTER TABLE `depto`
 ADD UNIQUE KEY `n_Dpto` (`n_Dpto`), ADD UNIQUE KEY `rut_Ed` (`rut_Ed`), ADD UNIQUE KEY `rut_Prop` (`rut_Prop`);

--
-- Indices de la tabla `edificio`
--
ALTER TABLE `edificio`
 ADD PRIMARY KEY (`Rut`);

--
-- Indices de la tabla `gasto_espe`
--
ALTER TABLE `gasto_espe`
 ADD PRIMARY KEY (`n_Depto`), ADD UNIQUE KEY `n_Boleta` (`n_Boleta`);

--
-- Indices de la tabla `gasto_grales`
--
ALTER TABLE `gasto_grales`
 ADD UNIQUE KEY `n_Boleta` (`n_Boleta`,`n_Factura`), ADD UNIQUE KEY `rut_Ed` (`rut_Ed`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
 ADD PRIMARY KEY (`id_Rut`), ADD UNIQUE KEY `id_Rut` (`id_Rut`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `depto`
--
ALTER TABLE `depto`
ADD CONSTRAINT `depto_ibfk_1` FOREIGN KEY (`rut_Prop`) REFERENCES `usuario` (`id_Rut`) ON DELETE SET NULL ON UPDATE CASCADE,
ADD CONSTRAINT `depto_ibfk_2` FOREIGN KEY (`rut_Ed`) REFERENCES `edificio` (`Rut`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `gasto_espe`
--
ALTER TABLE `gasto_espe`
ADD CONSTRAINT `gasto_espe_ibfk_1` FOREIGN KEY (`n_Depto`) REFERENCES `depto` (`n_Dpto`);

--
-- Filtros para la tabla `gasto_grales`
--
ALTER TABLE `gasto_grales`
ADD CONSTRAINT `gasto_grales_ibfk_1` FOREIGN KEY (`rut_Ed`) REFERENCES `edificio` (`Rut`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
