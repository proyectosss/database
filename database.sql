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
/*!50003 CREATE*/ /*!50017 DEFINER=`skip-grants user`@`skip-grants host`*/ /*!50003 TRIGGER trigger_tblCategoria_antes_insert
BEFORE INSERT
   ON tblCategoria FOR EACH ROW
BEGIN
   -- variable declarations
   DECLARE usuario VARCHAR(50);
   SELECT USER() INTO usuario;
   SET NEW.creadoPor = usuario;
   SET NEW.creadoEn = SYSDATE();
   SET NEW.actualizadoPor = USER();
   SET NEW.actualizadoEn = SYSDATE();
   -- trigger code
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
/*!50003 CREATE*/ /*!50017 DEFINER=`skip-grants user`@`skip-grants host`*/ /*!50003 TRIGGER trigger_tblCategoria_antes_update
BEFORE UPDATE
   ON tblCategoria FOR EACH ROW
BEGIN
   -- variable declarations
   DECLARE usuario VARCHAR(50);
   SELECT USER() INTO usuario;
   SET NEW.actualizadoPor = USER();
   SET NEW.actualizadoEn = SYSDATE();
   -- trigger code
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`skip-grants user`@`skip-grants host`*/ /*!50003 TRIGGER trigger_tblEquipo_antes_insert
BEFORE INSERT
   ON tblEquipo FOR EACH ROW
BEGIN
   -- variable declarations
   DECLARE usuario VARCHAR(50);
   SELECT USER() INTO usuario;
   SET NEW.creadoPor = usuario;
   SET NEW.creadoEn = SYSDATE();
   SET NEW.actualizadoPor = USER();
   SET NEW.actualizadoEn = SYSDATE();
   -- trigger code
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
/*!50003 CREATE*/ /*!50017 DEFINER=`skip-grants user`@`skip-grants host`*/ /*!50003 TRIGGER trigger_tblEquipo_antes_update
BEFORE UPDATE
   ON tblEquipo FOR EACH ROW
BEGIN
   -- variable declarations
   DECLARE usuario VARCHAR(50);
   SELECT USER() INTO usuario;
   SET NEW.actualizadoPor = USER();
   SET NEW.actualizadoEn = SYSDATE();
   -- trigger code
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
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`skip-grants user`@`skip-grants host`*/ /*!50003 TRIGGER trigger_tblEquipoXEvento_antes_insert
BEFORE INSERT
   ON tblEquipoXEvento FOR EACH ROW
BEGIN
   -- variable declarations
   DECLARE usuario VARCHAR(50);
   SELECT USER() INTO usuario;
   SET NEW.creadoPor = usuario;
   SET NEW.creadoEn = SYSDATE();
   SET NEW.actualizadoPor = USER();
   SET NEW.actualizadoEn = SYSDATE();
   -- trigger code
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
/*!50003 CREATE*/ /*!50017 DEFINER=`skip-grants user`@`skip-grants host`*/ /*!50003 TRIGGER trigger_tblEquipoXEvento_antes_update
BEFORE UPDATE
   ON tblEquipoXEvento FOR EACH ROW
BEGIN
   -- variable declarations
   DECLARE usuario VARCHAR(50);
   SELECT USER() INTO usuario;
   SET NEW.actualizadoPor = USER();
   SET NEW.actualizadoEn = SYSDATE();
   -- trigger code
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
/*!50003 CREATE*/ /*!50017 DEFINER=`skip-grants user`@`skip-grants host`*/ /*!50003 TRIGGER trigger_tblEquipoXEvento_despues_delete
AFTER DELETE
	ON tblEquipoXEvento FOR EACH ROW
BEGIN
   DECLARE usuario VARCHAR(50);
   SELECT USER() INTO usuario;
   INSERT INTO tblHistoricoEquipoXEvento
    (equipoId, eventoId, creadoPor,creadoEn, actualizadoPor, actualizadoEn, eliminadoPor, eliminadoEn)
    VALUES
    (OLD.equipoId, OLD.eventoId, OLD.creadoPor, OLD.creadoEn, OLD.actualizadoPor, OLD.actualizadoEn, usuario, SYSDATE());
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

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
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`skip-grants user`@`skip-grants host`*/ /*!50003 TRIGGER trigger_tblMantenimiento_antes_insert
BEFORE INSERT
   ON tblMantenimiento FOR EACH ROW
BEGIN
   -- variable declarations
   DECLARE usuario VARCHAR(50);
   SELECT USER() INTO usuario;
   SET NEW.creadoPor = usuario;
   SET NEW.creadoEn = SYSDATE();
   SET NEW.actualizadoPor = USER();
   SET NEW.actualizadoEn = SYSDATE();
   -- trigger code
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
/*!50003 CREATE*/ /*!50017 DEFINER=`skip-grants user`@`skip-grants host`*/ /*!50003 TRIGGER trigger_tblMantenimiento_antes_update
BEFORE UPDATE
   ON tblMantenimiento FOR EACH ROW
BEGIN
   -- variable declarations
   DECLARE usuario VARCHAR(50);
   SELECT USER() INTO usuario;
   SET NEW.actualizadoPor = USER();
   SET NEW.actualizadoEn = SYSDATE();
   -- trigger code
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

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
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`skip-grants user`@`skip-grants host`*/ /*!50003 TRIGGER trigger_tblMarca_antes_insert
BEFORE INSERT
   ON tblMarca FOR EACH ROW
BEGIN
   -- variable declarations
   DECLARE usuario VARCHAR(50);
   SELECT USER() INTO usuario;
   SET NEW.creadoPor = usuario;
   SET NEW.creadoEn = SYSDATE();
   SET NEW.actualizadoPor = USER();
   SET NEW.actualizadoEn = SYSDATE();
   -- trigger code
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
/*!50003 CREATE*/ /*!50017 DEFINER=`skip-grants user`@`skip-grants host`*/ /*!50003 TRIGGER trigger_tblMarca_antes_update
BEFORE UPDATE
   ON tblMarca FOR EACH ROW
BEGIN
   -- variable declarations
   DECLARE usuario VARCHAR(50);
   SELECT USER() INTO usuario;
   SET NEW.actualizadoPor = USER();
   SET NEW.actualizadoEn = SYSDATE();
   -- trigger code
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

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
-- Dumping routines for database 'inventario_dos'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-10-01 21:21:47
