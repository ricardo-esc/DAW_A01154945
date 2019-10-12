-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 12-10-2019 a las 02:23:56
-- Versión del servidor: 10.4.6-MariaDB
-- Versión de PHP: 7.3.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `Refranes`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Refranes`
--

CREATE TABLE `Refranes` (
  `ID` int(11) NOT NULL,
  `Descripcion` varchar(500) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `Refranes`
--

INSERT INTO `Refranes` (`ID`, `Descripcion`) VALUES
(1, 'A darle que es mole de olla'),
(2, 'Agua que no has de beber, déjala correr'),
(3, 'Camaron que se duerme, se lo lleva la corriente'),
(4, 'Dando y dando, pajarito volando'),
(5, 'De tal palo tal astilla'),
(6, 'El que con lobo anda a aullar se enseña');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `Refranes`
--
ALTER TABLE `Refranes`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `Refranes`
--
ALTER TABLE `Refranes`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
