-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 04-10-2019 a las 22:24:00
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
-- Base de datos: `Memes`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Memes`
--

CREATE TABLE `Memes` (
  `Id` int(11) NOT NULL,
  `Genero` varchar(30) COLLATE utf8_spanish_ci NOT NULL,
  `Descripcion` text COLLATE utf8_spanish_ci NOT NULL,
  `Imagen` text COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `Memes`
--

INSERT INTO `Memes` (`Id`, `Genero`, `Descripcion`, `Imagen`) VALUES
(1, 'Comedia', 'Recordar una buena anécdota del semestre 2019', 'https://www.eluniversal.com.mx/sites/default/files/styles/f03-651x400/public/2019/08/27/meme_ivana_2.jpg?itok=WOwNwreV'),
(2, 'Drama', 'Un meme con el que si tienes un mal día te puedes identificar muy bien.', 'https://i.pinimg.com/736x/da/2c/44/da2c44b1c6fa36044f14b351fa0f7d79.jpg'),
(3, 'Comedia', 'Este meme te hará sentirte todavía mas feliz de lo que ya estabas, y para que vuelvas a sentir ese amor por los perros que ya tienes.', 'https://images3.memedroid.com/images/UPLOADED455/5adbcd4ce9f8c.jpeg'),
(4, 'Romantico', 'Este meme para esos días que te sientes romantico y quieres expresarlo a toda la actitud.', 'https://i.imgur.com/u2CfOGC.jpg'),
(5, 'Comedia', 'Un meme para rears en un bien viernes.', 'https://media.metrolatam.com/2019/08/30/facebookelmememe-88461e19f33c79372e055a8d989ae099-900x600.jpg');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `Memes`
--
ALTER TABLE `Memes`
  ADD PRIMARY KEY (`Id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `Memes`
--
ALTER TABLE `Memes`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
