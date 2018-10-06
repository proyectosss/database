-- MySQL dump 10.13  Distrib 5.7.23, for Linux (x86_64)
--
-- Host: localhost    Database: inventario_dos
-- ------------------------------------------------------
-- Server version	5.7.23-0ubuntu0.18.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `tblCategoria`
--

DROP TABLE IF EXISTS `tblCategoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblCategoria` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `responsable` char(32) DEFAULT NULL,
  `descripcion` text,
  `imagenPath` varchar(255) DEFAULT NULL,
  `creadoPor` char(32) DEFAULT NULL,
  `creadoEn` datetime DEFAULT NULL,
  `actualizadoPor` char(32) DEFAULT NULL,
  `actualizadoEn` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nombre` (`nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tblCliente`
--

DROP TABLE IF EXISTS `tblCliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblCliente` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` int(15) NOT NULL,
  `Apellido` int(30) NOT NULL,
  `Direccion` int(30) NOT NULL,
  `Correo` int(40) NOT NULL,
  `Telefono` int(20) NOT NULL,
  `identificacion` varchar(15) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `identificacion` (`identificacion`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tblControlAsistencia`
--

DROP TABLE IF EXISTS `tblControlAsistencia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblControlAsistencia` (
  `idControlAsistencia` int(11) NOT NULL AUTO_INCREMENT,
  `empleadoId` int(100) NOT NULL,
  `eventoId` int(11) NOT NULL,
  `horaEntrada` datetime DEFAULT NULL,
  `horaSalida` datetime DEFAULT NULL,
  PRIMARY KEY (`idControlAsistencia`),
  KEY `FK_tblControlAsistencia_eventoId` (`eventoId`),
  CONSTRAINT `FK_tblControlAsistencia_eventoId` FOREIGN KEY (`eventoId`) REFERENCES `tblEvento` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tblCursos`
--

DROP TABLE IF EXISTS `tblCursos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblCursos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Curso` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tblCursosXEmpleado`
--

DROP TABLE IF EXISTS `tblCursosXEmpleado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblCursosXEmpleado` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `empleadoId` int(11) DEFAULT NULL,
  `cursoId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_tblCursosXEmpleado_eventoId` (`cursoId`),
  KEY `FK_tblCursosXEmpleado_empleadoId` (`empleadoId`),
  CONSTRAINT `FK_tblCursosXEmpleado_empleadoId` FOREIGN KEY (`empleadoId`) REFERENCES `tblEmpleado` (`id`),
  CONSTRAINT `FK_tblCursosXEmpleado_eventoId` FOREIGN KEY (`cursoId`) REFERENCES `tblCursos` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tblEmpleado`
--

DROP TABLE IF EXISTS `tblEmpleado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblEmpleado` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Cedula` int(100) NOT NULL,
  `Nombre(s)` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `Apellido(s)` varchar(100) CHARACTER SET utf8 COLLATE utf8_vietnamese_ci DEFAULT NULL,
  `Cargo` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `Correo Electronico` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `Telefono` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `Direccion` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `Ciudad` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tblEmpleadoXEvento`
--

DROP TABLE IF EXISTS `tblEmpleadoXEvento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblEmpleadoXEvento` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `eventoId` int(11) DEFAULT NULL,
  `empleadoId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_tblEmpleadoXEvento_eventoId` (`eventoId`),
  KEY `FK_tblEmpleadoXEvento_empleadoId` (`empleadoId`),
  CONSTRAINT `FK_tblEmpleadoXEvento_empleadoId` FOREIGN KEY (`empleadoId`) REFERENCES `tblEmpleado` (`id`),
  CONSTRAINT `FK_tblEmpleadoXEvento_eventoId` FOREIGN KEY (`eventoId`) REFERENCES `tblEvento` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tblEquipo`
--

DROP TABLE IF EXISTS `tblEquipo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblEquipo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) DEFAULT NULL,
  `descripcion` text,
  `activo` tinyint(1) NOT NULL DEFAULT '1',
  `imagenPath` varchar(255) DEFAULT NULL,
  `codigo` varchar(50) DEFAULT NULL,
  `peso` double DEFAULT NULL,
  `consumoWatts` double DEFAULT NULL,
  `dimensionAlto` double DEFAULT NULL,
  `dimensionAncho` double DEFAULT NULL,
  `dimensionProfundidad` double DEFAULT NULL,
  `serial` varchar(255) DEFAULT NULL,
  `garantia` varchar(255) DEFAULT NULL,
  `manuales` varchar(255) DEFAULT NULL,
  `proteccion` varchar(255) DEFAULT NULL,
  `categoriaId` int(11) NOT NULL,
  `marcaId` int(11) NOT NULL,
  `creadoPor` char(32) DEFAULT NULL,
  `creadoEn` datetime DEFAULT NULL,
  `actualizadoPor` char(32) DEFAULT NULL,
  `actualizadoEn` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_tblEquipo_categoriaId` (`categoriaId`),
  KEY `FK_tblEquipo_marcaId` (`marcaId`),
  CONSTRAINT `FK_tblEquipo_categoriaId` FOREIGN KEY (`categoriaId`) REFERENCES `tblCategoria` (`id`),
  CONSTRAINT `FK_tblEquipo_marcaId` FOREIGN KEY (`marcaId`) REFERENCES `tblMarca` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER trigger_tblEquipo_antes_insert
BEFORE INSERT
   ON tblEquipo FOR EACH ROW
BEGIN
   
   DECLARE usuario VARCHAR(50);
   SELECT USER() INTO usuario;
   SET NEW.creadoPor = usuario;
   SET NEW.creadoEn = SYSDATE();
   SET NEW.actualizadoPor = USER();
   SET NEW.actualizadoEn = SYSDATE();
   
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER trigger_tblEquipo_antes_update
BEFORE UPDATE
   ON tblEquipo FOR EACH ROW
BEGIN
   
   DECLARE usuario VARCHAR(50);
   SELECT USER() INTO usuario;
   SET NEW.actualizadoPor = USER();
   SET NEW.actualizadoEn = SYSDATE();
   
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `tblEquipoXEvento`
--

DROP TABLE IF EXISTS `tblEquipoXEvento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblEquipoXEvento` (
  `equipoId` int(11) NOT NULL,
  `eventoId` int(11) NOT NULL,
  `creadoPor` char(32) DEFAULT NULL,
  `creadoEn` datetime DEFAULT NULL,
  `actualizadoPor` char(32) DEFAULT NULL,
  `actualizadoEn` datetime DEFAULT NULL,
  KEY `FK_tblEquipoXEvento_equipoId` (`equipoId`),
  KEY `FK_tblEquipoXEvento_eventoId` (`eventoId`),
  CONSTRAINT `FK_tblEquipoXEvento_equipoId` FOREIGN KEY (`equipoId`) REFERENCES `tblEquipo` (`id`),
  CONSTRAINT `FK_tblEquipoXEvento_eventoId` FOREIGN KEY (`eventoId`) REFERENCES `tblEvento` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tblEvento`
--

DROP TABLE IF EXISTS `tblEvento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblEvento` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Evento` int(11) NOT NULL,
  `Encargado` int(11) NOT NULL,
  `Lugar` int(11) NOT NULL,
  `Fecha` int(11) NOT NULL,
  `Transprotador` int(11) NOT NULL,
  `HoraAproximadaCargue` int(11) NOT NULL,
  `HoraAproximadaDescargue` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tblEventoXCliente`
--

DROP TABLE IF EXISTS `tblEventoXCliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblEventoXCliente` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `eventoId` int(11) NOT NULL,
  `clienteId` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_tblEventoXCliente_eventoId` (`eventoId`),
  KEY `FK_tblEventoXCliente_clienteId` (`clienteId`),
  CONSTRAINT `FK_tblEventoXCliente_clienteId` FOREIGN KEY (`clienteId`) REFERENCES `tblCliente` (`id`),
  CONSTRAINT `FK_tblEventoXCliente_eventoId` FOREIGN KEY (`eventoId`) REFERENCES `tblEvento` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tblHistoricoEquipoXEvento`
--

DROP TABLE IF EXISTS `tblHistoricoEquipoXEvento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblHistoricoEquipoXEvento` (
  `equipoId` int(11) NOT NULL,
  `eventoId` int(11) NOT NULL,
  `creadoPor` char(32) DEFAULT NULL,
  `creadoEn` datetime DEFAULT NULL,
  `actualizadoPor` char(32) DEFAULT NULL,
  `actualizadoEn` datetime DEFAULT NULL,
  `eliminadoPor` char(32) DEFAULT NULL,
  `eliminadoEn` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tblHorasTrabajadas`
--

DROP TABLE IF EXISTS `tblHorasTrabajadas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblHorasTrabajadas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `TotalHoras` int(100) NOT NULL,
  `PagoTotal` int(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tblMantenimiento`
--

DROP TABLE IF EXISTS `tblMantenimiento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblMantenimiento` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `equipoId` int(11) NOT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `fechaProgramada` datetime DEFAULT NULL,
  `fechaRealizado` datetime DEFAULT NULL,
  `creadoPor` char(32) DEFAULT NULL,
  `creadoEn` datetime DEFAULT NULL,
  `actualizadoPor` char(32) DEFAULT NULL,
  `actualizadoEn` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_tblMantenimiento_equipoId` (`equipoId`),
  CONSTRAINT `FK_tblMantenimiento_equipoId` FOREIGN KEY (`equipoId`) REFERENCES `tblEquipo` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tblMarca`
--

DROP TABLE IF EXISTS `tblMarca`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblMarca` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) DEFAULT NULL,
  `descripcion` text,
  `imagenPath` varchar(255) DEFAULT NULL,
  `creadoPor` char(32) DEFAULT NULL,
  `creadoEn` datetime DEFAULT NULL,
  `actualizadoPor` char(32) DEFAULT NULL,
  `actualizadoEn` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nombre` (`nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tblNormatividadLaboral`
--

DROP TABLE IF EXISTS `tblNormatividadLaboral`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblNormatividadLaboral` (
  `Id` int(100) NOT NULL,
  `Norma` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tblTarea`
--

DROP TABLE IF EXISTS `tblTarea`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblTarea` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(100) NOT NULL,
  `observaciones` varchar(800) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tblTareaXEmpleado`
--

DROP TABLE IF EXISTS `tblTareaXEmpleado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblTareaXEmpleado` (
  `empleadoId` int(11) NOT NULL,
  `tareaId` int(11) NOT NULL,
  `empleadoAsignaId` int(11) NOT NULL,
  PRIMARY KEY (`empleadoId`,`tareaId`),
  KEY `FK_tblTareaXEmpleado_empleadoAsignaId` (`empleadoAsignaId`),
  KEY `FK_tblTareaXEmpleado_empleadoId` (`empleadoId`),
  KEY `FK_tblTareaXEmpleado_tareaId_` (`tareaId`),
  CONSTRAINT `FK_tblTareaXEmpleado_empleadoAsignaId` FOREIGN KEY (`empleadoAsignaId`) REFERENCES `tblEmpleado` (`id`),
  CONSTRAINT `FK_tblTareaXEmpleado_empleadoId` FOREIGN KEY (`empleadoId`) REFERENCES `tblEmpleado` (`id`),
  CONSTRAINT `FK_tblTareaXEmpleado_tareaId_` FOREIGN KEY (`tareaId`) REFERENCES `tblTarea` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tbl_cliente`
--

DROP TABLE IF EXISTS `tbl_cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
  `int_documento_use` int(11) NOT NULL,
  PRIMARY KEY (`int_documento_cli`) USING BTREE,
  KEY `FK_CLIENTE_1` (`int_documento_use`),
  CONSTRAINT `tbl_cliente_ibfk_1` FOREIGN KEY (`int_documento_use`) REFERENCES `tbl_usuario` (`int_documento_use`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tbl_log`
--

DROP TABLE IF EXISTS `tbl_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_log` (
  `int_id_log` int(11) NOT NULL AUTO_INCREMENT,
  `int_documento_log` int(11) NOT NULL,
  `var_email_log` varchar(900) NOT NULL,
  `var_nombre_log` varchar(900) NOT NULL,
  `var_acion_log` text NOT NULL,
  `var_IPreal_log` varchar(900) NOT NULL,
  `var_ipscript_log` varchar(900) NOT NULL,
  `var_ipusuario_log` varchar(900) NOT NULL,
  `date_fecha_log` datetime NOT NULL,
  PRIMARY KEY (`int_id_log`),
  KEY `FK_LOG_1` (`int_documento_log`),
  CONSTRAINT `tbl_log_ibfk_1` FOREIGN KEY (`int_documento_log`) REFERENCES `tbl_usuario` (`int_documento_use`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tbl_usuario`
--

DROP TABLE IF EXISTS `tbl_usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
  `var_role_use` varchar(900) NOT NULL,
  PRIMARY KEY (`int_documento_use`),
  UNIQUE KEY `UNIQUE_USUARIO_1` (`var_email_use`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping routines for database 'inventario_dos'
--

-- insufficient privileges to SHOW CREATE PROCEDURE `sp_igreso_usuario`
-- does juan have permissions on mysql.proc?

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
DROP TABLE IF EXISTS `tbl_cliente`;
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

DROP TABLE IF EXISTS `tbl_log`;
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
DROP TABLE IF EXISTS `tbl_usuario`;
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
