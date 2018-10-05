-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 08-12-2017 a las 17:04:28
-- Versión del servidor: 10.1.13-MariaDB
-- Versión de PHP: 5.6.23

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `db_follow`
--

DELIMITER $$
--
-- Procedimientos
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_igreso_usuario` (IN `documento` INT, IN `nombre` VARCHAR(900), IN `apellido` VARCHAR(900), IN `telefono` INT, IN `celular` BIGINT, IN `email` VARCHAR(900), IN `passwordu` VARCHAR(900), IN `estado` VARCHAR(200), IN `fecha` DATETIME, IN `role` VARCHAR(900))  NO SQL
BEGIN
SET @documento=documento; 
SET @nombre=nombre; 
SET @apellido=apellido; 
SET @telefono=telefono; 
SET @celular=celular; 
SET @email=email; 
SET @passwordu=passwordu; 
SET @estado=estado; 
SET @fecha=fecha; 
SET @role=role;
INSERT INTO tbl_usuario(int_documento_use, 
var_nombre_use, var_apellido_use,  int_telefono_use, int_celular_use, var_email_use, var_password_use, var_estado_use, date_fecha_inicio_use, var_role_use) VALUES (@documento, @nombre, @apellido, @telefono, @celular, @email, @passwordu, @estado, @fecha, @role);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_log` (IN `documento` INT, IN `emai` VARCHAR(900), IN `nombre` VARCHAR(900), IN `acion` TEXT, IN `IPreal` VARCHAR(900), IN `ipscript` VARCHAR(900), IN `ipusuario` VARCHAR(900), IN `fecha` DATETIME)  NO SQL
BEGIN
INSERT INTO tbl_log(int_id_log, int_documento_log, var_email_log, var_nombre_log, var_acion_log, var_IPreal_log, var_ipscript_log, var_ipusuario_log, date_fecha_log ) VALUES (null, documento, emai, nombre, acion, IPreal, ipscript, ipusuario, fecha);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_usuario_login` (IN `vemail` VARCHAR(900))  NO SQL
BEGIN
SELECT var_email_use AS email_usuario, var_password_use AS password_usuario, var_nombre_use AS nombre, var_apellido_use AS apellido, int_documento_use as documento, var_role_use as rol
FROM tbl_usuario
WHERE var_email_use = vemail;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_cliente`
--

CREATE TABLE `tbl_cliente` (
  `int_documento_cli` int(11) NOT NULL,
  `var_nombre_cli` varchar(900) NOT NULL,
  `var_apellido_cli` varchar(900) NOT NULL,
  `var_direccion_cli` varchar(900) NOT NULL,
  `int_telefono1_cli` int(11) NOT NULL,
  `int_telefono2_cli` int(11) DEFAULT NULL,
  `int_celular_cli` bigint(11) NOT NULL,
  `var_email_cli` varchar(900) NOT NULL,
  `var_observaciones_cli` text,
  `int_documento_use` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_log`
--

CREATE TABLE `tbl_log` (
  `int_id_log` int(11) NOT NULL,
  `int_documento_log` int(11) NOT NULL,
  `var_email_log` varchar(900) NOT NULL,
  `var_nombre_log` varchar(900) NOT NULL,
  `var_acion_log` text NOT NULL,
  `var_IPreal_log` varchar(900) NOT NULL,
  `var_ipscript_log` varchar(900) NOT NULL,
  `var_ipusuario_log` varchar(900) NOT NULL,
  `date_fecha_log` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tbl_log`
--

INSERT INTO `tbl_log` (`int_id_log`, `int_documento_log`, `var_email_log`, `var_nombre_log`, `var_acion_log`, `var_IPreal_log`, `var_ipscript_log`, `var_ipusuario_log`, `date_fecha_log`) VALUES
(1, 1000898270, 'j.arley111@gmail.com', 'yeisson sanchez', 'inicio de sesion', '::1', '::1', '::1', '2017-12-07 09:33:18'),
(2, 1000898270, 'j.arley111@gmail.com', 'yeisson sanchez', 'inicio de sesion', '::1', '::1', '::1', '2017-12-07 09:33:41'),
(3, 1000898270, 'j.arley111@gmail.com', 'yeisson sanchez', 'inicio de sesion', '::1', '::1', '::1', '2017-12-07 09:34:18'),
(4, 1000898270, 'j.arley111@gmail.com', 'yeisson sanchez', 'inicio de sesion', '::1', '::1', '::1', '2017-12-07 09:40:43'),
(5, 11111111, 'administrador@gmail.com', 'administrador ad', 'inicio de sesion', '::1', '::1', '::1', '2017-12-07 10:05:11'),
(6, 33333, 'vendedor@gmail.com', 'vendedor follow', 'inicio de sesion', '::1', '::1', '::1', '2017-12-07 10:19:00'),
(7, 222222, 'director@gmail.com', 'director comercial', 'inicio de sesion', '::1', '::1', '::1', '2017-12-07 10:19:30'),
(8, 33333, 'vendedor@gmail.com', 'vendedor follow', 'inicio de sesion', '::1', '::1', '::1', '2017-12-07 22:05:20'),
(9, 222222, 'director@gmail.com', 'director comercial', 'inicio de sesion', '::1', '::1', '::1', '2017-12-07 22:05:49');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_usuario`
--

CREATE TABLE `tbl_usuario` (
  `int_documento_use` int(11) NOT NULL,
  `var_nombre_use` varchar(900) NOT NULL,
  `var_apellido_use` varchar(900) NOT NULL,
  `int_telefono_use` int(11) NOT NULL,
  `int_celular_use` bigint(11) NOT NULL,
  `var_email_use` varchar(700) NOT NULL,
  `var_password_use` varchar(900) NOT NULL,
  `var_estado_use` varchar(200) NOT NULL,
  `date_fecha_inicio_use` date NOT NULL,
  `var_role_use` varchar(900) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tbl_usuario`
--

INSERT INTO `tbl_usuario` (`int_documento_use`, `var_nombre_use`, `var_apellido_use`, `int_telefono_use`, `int_celular_use`, `var_email_use`, `var_password_use`, `var_estado_use`, `date_fecha_inicio_use`, `var_role_use`) VALUES
(33333, 'vendedor', 'follow', 123213, 213123, 'vendedor@gmail.com', 'vWE4pL3/n1jYwHUM6nP7EbaBYUx8vfNwDo/HH6t50qU=', 'activo', '2017-12-15', '4'),
(222222, 'director', 'comercial', 232323, 324324, 'director@gmail.com', 'vWE4pL3/n1jYwHUM6nP7EbaBYUx8vfNwDo/HH6t50qU=', 'activo', '2017-12-19', '3'),
(11111111, 'administrador', 'ad', 34234, 4235345, 'administrador@gmail.com', 'vWE4pL3/n1jYwHUM6nP7EbaBYUx8vfNwDo/HH6t50qU=', 'activo', '2012-12-12', '2'),
(1000898270, 'yeisson', 'sanchez', 3203434, 3213123, 'j.arley111@gmail.com', 'vWE4pL3/n1jYwHUM6nP7EbaBYUx8vfNwDo/HH6t50qU=', 'activo', '2012-12-12', '1');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `tbl_cliente`
--
ALTER TABLE `tbl_cliente`
  ADD PRIMARY KEY (`int_documento_cli`) USING BTREE,
  ADD KEY `FK_CLIENTE_1` (`int_documento_use`);

--
-- Indices de la tabla `tbl_log`
--
ALTER TABLE `tbl_log`
  ADD PRIMARY KEY (`int_id_log`),
  ADD KEY `FK_LOG_1` (`int_documento_log`);

--
-- Indices de la tabla `tbl_usuario`
--
ALTER TABLE `tbl_usuario`
  ADD PRIMARY KEY (`int_documento_use`),
  ADD UNIQUE KEY `UNIQUE_USUARIO_1` (`var_email_use`) USING BTREE;

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `tbl_log`
--
ALTER TABLE `tbl_log`
  MODIFY `int_id_log` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `tbl_cliente`
--
ALTER TABLE `tbl_cliente`
  ADD CONSTRAINT `tbl_cliente_ibfk_1` FOREIGN KEY (`int_documento_use`) REFERENCES `tbl_usuario` (`int_documento_use`);

--
-- Filtros para la tabla `tbl_log`
--
ALTER TABLE `tbl_log`
  ADD CONSTRAINT `tbl_log_ibfk_1` FOREIGN KEY (`int_documento_log`) REFERENCES `tbl_usuario` (`int_documento_use`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
