-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 28-11-2018 a las 17:58:26
-- Versión del servidor: 10.1.36-MariaDB
-- Versión de PHP: 7.2.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `db_ranking`
--

DELIMITER $$
--
-- Procedimientos
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_actualizar_categoria` (IN `nombre` VARCHAR(50), IN `responsable` CHAR(32), IN `descripcion` TEXT, IN `imagenPath` VARCHAR(255), IN `Id` INT)  NO SQL
BEGIN
SET @nombre=nombre;
SET @responsable=responsable;
SET @descripcion=descripcion;
SET @imagenPath=imagenPath;
SET @Id=Id;
UPDATE tblCategoria SET nombre=@nombre, responsable=@responsable, descripcion=@descripcion, imagenPath=@imagenPath, Id=@Id WHERE id=@Id;
SELECT ROW_COUNT() AS conteo;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_actualizar_cliente` (IN `nombre` VARCHAR(15), IN `apellido` VARCHAR(30), IN `direccion` VARCHAR(30), IN `correo` VARCHAR(40), IN `telefono` INT(20), IN `Id` INT)  NO SQL
BEGIN
SET @nombre=nombre;
SET @apellido=apellido;
SET @direccion=direccion;
SET @correo=correo;
SET @telefono=telefono;
SET @cedula=cedula;
SET @Id=Id;
UPDATE tblCliente set nombre=@nombre, apellido=@apellido, direccion=@direccion, correo=@correo, telefono=@telefono, Id=@Id
WHERE id=@Id;
SELECT ROW_COUNT() AS conteo;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_actualizar_cursoXEmpleado` (IN `empleadoId` INT, IN `cursoId` INT, IN `Id` INT)  NO SQL
BEGIN
SET @empleadoId=empleadoId;
SET @cursoId=cursoId;
SET @Id=Id;
UPDATE tblEmpleadoXEvento SET empleadoId=@empleadoId, cursoId=@cursoId,Id=@Id WHERE id=@Id;
SELECT ROW_COUNT() AS conteo;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_actualizar_empleado` (IN `cedula` INT(100), IN `nombre` VARCHAR(100), IN `apellido` VARCHAR(100), IN `cargo` VARCHAR(100), IN `correo` VARCHAR(100), IN `telefono` VARCHAR(100), IN `direccion` VARCHAR(100), IN `ciudad` VARCHAR(100))  NO SQL
BEGIN
SET @cedula=cedula;
SET @nombre=nombre;
SET @apellido=apellido;
SET @cargo=cargo;
SET @correo=correo;
SET @telefono=telefono;
SET @direccion=direccion;
SET @ciudad=ciudad;
UPDATE tblEmpleado set nombre=@nombre, apellido=@apellido, cargo=@cargo, correo=@correo, telefono=@telefono, direccion=@direccion, ciudad=@ciudad
WHERE id=@Cedula;
SELECT ROW_COUNT() AS conteo;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_actualizar_empleadoXEvento` (IN `eventoId` INT, IN `empleadoId` INT, IN `Id` INT)  NO SQL
BEGIN
SET @eventoId = eventoId;
SET @empleadoId = empleadoId;
SET @Id = Id;
UPDATE tblEmpleadoXEvento SET eventoId = @eventoId, empleadoId = empleadoId,Id=@Id WHERE id=@Id;
SELECT ROW_COUNT() AS conteo;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_actualizar_equipo` (IN `in_id` INT(11), IN `in_nombre` VARCHAR(50), IN `in_descripcion` TEXT, IN `in_activo` TINYINT(1), IN `in_imagenPath` VARCHAR(255), IN `in_codigo` VARCHAR(50), IN `in_peso` DOUBLE, IN `in_consumoWatts` DOUBLE, IN `in_dimensionAlto` DOUBLE, IN `in_dimensionAncho` DOUBLE, IN `in_dimensionProfundidad` DOUBLE, IN `in_serial` VARCHAR(255), IN `in_garantia` VARCHAR(255), IN `in_manuales` VARCHAR(255), IN `in_proteccion` VARCHAR(255), IN `in_categoriaId` INT(11), IN `in_marcaId` INT(11))  NO SQL
BEGIN
    SET @id = in_id;
    SET @nombre = in_nombre;
    SET @descripcion = in_descripcion;
    SET @activo = in_activo;
    SET @imagenPath = in_imagenPath;
    SET @codigo = in_codigo;
    SET @peso = in_peso;
    SET @consumoWatts = in_consumoWatts;
    SET @dimensionAlto = in_dimensionAlto;
    SET @dimensionAncho = in_dimensionAncho;
    SET @dimensionProfundidad = in_dimensionProfundidad;
    SET @serial = in_serial;
    SET @garantia = in_garantia;
    SET @manuales = in_manuales;
    SET @proteccion = in_proteccion;
    SET @categoriaId = in_categoriaId;
    SET @marcaId = in_marcaId;

    UPDATE tblEquipo
    set 
        `nombre` = @nombre,
        `descripcion` = @descripcion,
        `activo` = @activo,
        `imagenPath` = @imagenPath,
        `codigo` = @codigo,
        `peso` = @peso,
        `consumoWatts` = @consumoWatts,
        `dimensionAlto` = @dimensionAlto,
        `dimensionAncho` = @dimensionAncho,
        `dimensionProfundidad` = @dimensionProfundidad,
        `serial` = @serial,
        `garantia` = @garantia,
        `manuales` = @manuales,
        `proteccion` = @proteccion,
        `categoriaId` = @categoriaId,
        `marcaId` = @marcaId
    WHERE `id`=@id;
    SELECT ROW_COUNT() AS conteo;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_actualizar_equipoXEvento` (IN `equipoId` INT, IN `eventoId` INT, IN `Id` INT)  NO SQL
BEGIN
SET @equipoId = equipoId;
SET @eventoId = eventoId;
SET @Id = Id;
UPDATE tblEquipoXEvento SET  equipoId = @equipoId,eventoId = @eventoId,Id=@Id WHERE id=@Id;
SELECT ROW_COUNT() AS conteo;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_actualizar_evento` (IN `evento` VARCHAR(11), IN `encargado` VARCHAR(11), IN `lugar` VARCHAR(11), IN `fecha` DATETIME, IN `transportador` VARCHAR(11), IN `horaAproximadaCargue` TIME, IN `horaAproximadaDescargue` TIME)  NO SQL
BEGIN
SET @evento=evento;
SET @encargado=encargado;
SET @lugar=lugar;
SET @fecha=fecha;
SET @transportador=transportador;
SET @horaAproximadaCargue=horaAproximadaCargue;
SET @horaAproximadaDescargue=horaAproximadaDescargue;
UPDATE tblEvento set encargado=@encargado, lugar=@lugar, fecha=@fecha, transportado=@transportador, horaAproximadaCargue=@horaAproximadaCargue, horaAproximadaDescargue=@horaAproximadaDescargue WHERE id=@evento;
SELECT ROW_COUNT() AS conteo;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_actualizar_marca` (IN `nombre` VARCHAR(50), IN `descripcion` TEXT, IN `imagenPath` VARCHAR(255), IN `Id` INT)  NO SQL
BEGIN
SET @nombre=nombre;
SET @descripcion=descripcion;
SET @imagenPath=imagenPath;
SET @Id=Id;
UPDATE tblMarca set nombre=@nombre, descripcion=@descripcion, imagenPath=imagenPath, Id=@Id WHERE id=@Id;
SELECT ROW_COUNT() AS conteo;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_actualizar_tareaXEmpleado` (IN `empleadoId` INT, IN `tareaId` INT, IN `empleadoAsignaId` INT, IN `Id` INT)  NO SQL
BEGIN
SET @empleadoId = empleadoId;
SET @tareaId = tareaId;
SET @empleadoAsignaId = empleadoAsignaId;
SET @Id = Id;
UPDATE tblTareaXEmpleado SET empleadoId=@empleadoId, tareaId=@tareaId, empleadoAsignaId=@empleadoAsignaId, Id=@Id WHERE id=@Id;
SELECT ROW_COUNT() AS conteo;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_agregar_categoria` (IN `nombre` VARCHAR(50), IN `responsable` CHAR(32), IN `descripcion` TEXT)  NO SQL
BEGIN
SET @nombre=nombre;
SET @responsable=responsable;
SET @descripcion=descripcion;
INSERT INTO tblCategoria(id,nombre,responsable,descripcion) VALUES (null,@nombre,@responsable,@descripcion);
SELECT LAST_INSERT_ID() AS id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_agregar_cliente` (IN `Nombre` VARCHAR(15), IN `Apellido` VARCHAR(30), IN `Direccion` VARCHAR(30), IN `Correo` VARCHAR(40), IN `Telefono` INT(20), IN `identificacion` VARCHAR(15))  NO SQL
BEGIN
SET @Nombre= Nombre;
SET @Apellido = Apellido;
SET @Direccion = Direccion;
SET @Correo = Correo;
SET @Telefono = Telefono;
SET @identificacion = identificacion;
INSERT INTO tblCliente (nombre, apellido, direccion, correo, telefono, identificacion) VALUES(@Nombre, @Apellido, @Direccion, @Correo, @Telefono, @identificacion);
SELECT LAST_INSERT_ID() AS id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_agregar_cursoXEmpleado` (IN `empleadoId` INT, IN `curdoId` INT)  NO SQL
BEGIN
SET @empleadoId=empleadoId;
SET @cursoId=cursoId;
INSERT INTO tblCursoXEmpleado(id,empleadoId,cursoId) VALUES (null,@empleadoId,@cursoId);
SELECT LAST_INSERT_ID() AS id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_agregar_empleado` (IN `Cedula` VARCHAR(20), IN `Nombre` VARCHAR(100), IN `Apellido` VARCHAR(100), IN `Cargo` VARCHAR(100), IN `Correo` VARCHAR(100), IN `Telefono` VARCHAR(100), IN `Direccion` VARCHAR(100), IN `Ciudad` VARCHAR(100))  NO SQL
BEGIN
SET @Cedula=Cedula;
SET @Nombre=Nombre;
SET @Apellido=Apellido;
SET @Cargo=Cargo;
SET @Correo=Correo;
SET @Telefono=Telefono;
SET @Direccion=Direccion;
SET @Ciudad=Ciudad;
INSERT INTO tblEmpleado(cedula,nombre, apellido, cargo, correoElectronico, telefono, direccion, ciudad) VALUES(@Cedula, @Nombre, @Apellido, @Cargo, @Correo, @Telefono, @Direccion, @Ciudad);
SELECT LAST_INSERT_ID() AS id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_agregar_empleadoXEvento` (IN `eventoId` INT, IN `empleadoId` INT)  NO SQL
BEGIN
SET @eventoId=eventoId;
SET @empleadoId=empleadoId;
INSERT INTO tblEmpleadoXEvento(eventoId, empleadoId) VALUES (@eventoId,@empleadoId);
SELECT LAST_INSERT_ID() AS id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_agregar_equipo` (IN `in_nombre` VARCHAR(50), IN `in_descripcion` TEXT, IN `in_activo` TINYINT(1), IN `in_imagenPath` VARCHAR(255), IN `in_codigo` VARCHAR(50), IN `in_peso` DOUBLE, IN `in_consumoWatts` DOUBLE, IN `in_dimensionAlto` DOUBLE, IN `in_dimensionAncho` DOUBLE, IN `in_dimensionProfundidad` DOUBLE, IN `in_serial` VARCHAR(255), IN `in_garantia` VARCHAR(255), IN `in_manuales` VARCHAR(255), IN `in_proteccion` VARCHAR(255), IN `in_categoriaId` INT(11), IN `in_marcaId` INT(11))  NO SQL
BEGIN
    SET @nombre = in_nombre;
    SET @descripcion = in_descripcion;
    SET @activo = in_activo;
    SET @imagenPath = in_imagenPath;
    SET @codigo = in_codigo;
    SET @peso = in_peso;
    SET @consumoWatts = in_consumoWatts;
    SET @dimensionAlto = in_dimensionAlto;
    SET @dimensionAncho = in_dimensionAncho;
    SET @dimensionProfundidad = in_dimensionProfundidad;
    SET @serial = in_serial;
    SET @garantia = in_garantia;
    SET @manuales = in_manuales;
    SET @proteccion = in_proteccion;
    SET @categoriaId = in_categoriaId;
    SET @marcaId = in_marcaId;

    INSERT INTO tblEquipo(
        nombre,
        descripcion,
        activo,
        imagenPath,
        codigo,
        peso,
        consumoWatts,
        dimensionAlto,
        dimensionAncho,
        dimensionProfundidad,
        serial,
        garantia,
        manuales,
        proteccion,
        categoriaId,
        marcaId) 
    VALUES(
        @nombre,
        @descripcion,
        @activo,
        @imagenPath,
        @codigo,
        @peso,
        @consumoWatts,
        @dimensionAlto,
        @dimensionAncho,
        @dimensionProfundidad,
        @serial,
        @garantia,
        @manuales,
        @proteccion,
        @categoriaId,
        @marcaId);
    SELECT LAST_INSERT_ID() AS id;
    END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_agregar_equipoXEvento` (IN `equipoId` INT, IN `eventoId` INT)  NO SQL
BEGIN
SET @equipoId = equipoId;
SET @evenoId = equipoId;
INSERT INTO tblEquipoXEvento (id,eventoId,equipoId) VALUES (null, @eventoId, @equipodId);
SELECT LAST_INSERT_ID() AS id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_agregar_equipo_categoria_y_marca_por_nombre` (IN `in_nombre` VARCHAR(50), IN `in_descripcion` TEXT, IN `in_activo` TINYINT(1), IN `in_imagenPath` VARCHAR(255), IN `in_codigo` VARCHAR(50), IN `in_peso` DOUBLE, IN `in_consumoWatts` DOUBLE, IN `in_dimensionAlto` DOUBLE, IN `in_dimensionAncho` DOUBLE, IN `in_dimensionProfundidad` DOUBLE, IN `in_serial` VARCHAR(255), IN `in_garantia` VARCHAR(255), IN `in_manuales` VARCHAR(255), IN `in_proteccion` VARCHAR(255), IN `in_categoriaNombre` VARCHAR(50), IN `in_marcaNombre` VARCHAR(50))  NO SQL
BEGIN
    SET @nombre = in_nombre;
    SET @descripcion = in_descripcion;
    SET @activo = in_activo;
    SET @imagenPath = in_imagenPath;
    SET @codigo = in_codigo;
    SET @peso = in_peso;
    SET @consumoWatts = in_consumoWatts;
    SET @dimensionAlto = in_dimensionAlto;
    SET @dimensionAncho = in_dimensionAncho;
    SET @dimensionProfundidad = in_dimensionProfundidad;
    SET @serial = in_serial;
    SET @garantia = in_garantia;
    SET @manuales = in_manuales;
    SET @proteccion = in_proteccion;
    SET @categoriaNombre = in_categoriaNombre;
    SET @marcaNombre = in_marcaNombre;

    INSERT INTO tblEquipo(
        nombre,
        descripcion,
        activo,
        imagenPath,
        codigo,
        peso,
        consumoWatts,
        dimensionAlto,
        dimensionAncho,
        dimensionProfundidad,
        serial,
        garantia,
        manuales,
        proteccion,
        categoriaId,
        marcaId) 

        select
        @nombre,
        @descripcion,
        @activo,
        @imagenPath,
        @codigo,
        @peso,
        @consumoWatts,
        @dimensionAlto,
        @dimensionAncho,
        @dimensionProfundidad,
        @serial,
        @garantia,
        @manuales,
        @proteccion,
        tblCategoria.id,
        tblMarca.id
        from
        tblCategoria, tblMarca
        where
        tblCategoria.nombre = @categoriaNombre and tblMarca.nombre = @marcaNombre
        ;
    SELECT LAST_INSERT_ID() AS id;
    END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_agregar_evento` (IN `Evento` VARCHAR(11), IN `Encargado` VARCHAR(11), IN `Lugar` VARCHAR(11), IN `Fecha` DATETIME, IN `Transportador` VARCHAR(11), IN `HoraAproximadaCargue` TIME, IN `HoraAproximadaDescargue` TIME)  NO SQL
BEGIN
SET @Evento = Evento;
SET @Encargado = Encargado;
SET @Lugar = Lugar;
SET @Fecha = Fecha;
SET @Transportador = Transportador;
SET @HoraAproximadaCargue = HoraAproximadaCargue;
SET @HoraAproximadaDescargue = HoraAproximadaDescargue;
INSERT INTO tblEvento(id, evento, encargado, lugar, fecha, transportador, horaAproximadaCargue, horaAproximadaDescargue) VALUES (null, @Evento, @Encargado, @Lugar, @Fecha, @Transportador, @HoraAproximadaCargue, @HoraAproximadaDescargue);
SELECT LAST_INSERT_ID() AS id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_agregar_marca` (IN `nombre` VARCHAR(50), IN `descripcion` TEXT)  NO SQL
BEGIN
SET @nombre=nombre;
SET @descripcion=descripcion;
INSERT into tblMarca (nombre,descripcion) VALUES (@nombre,@descripcion);
SELECT LAST_INSERT_ID() AS id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_agregar_tareaXEmpleado` (IN `empleadoId` INT, IN `tareaId` INT, IN `empleadoAsignaId` INT)  NO SQL
BEGIN
SET @empleadoId = empleadoId;
SET @tareaId = tareaId;
SET @empleadoAsignaId = empleadoAsignaId;
INSERT INTO tblTareaXEmpleado(empleadoId, tareaId, empleadoAsignaId) VALUES (@empleadoId, @tareaId, @empleadoAsignaId);
SELECT LAST_INSERT_ID() AS id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_consultar_categoria` (IN `Id` INT)  NO SQL
BEGIN
SET @Id=Id;
SELECT nombre,responsable,imagenPath FROM tblCategoria WHERE id=@Id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_consultar_categorias` (IN `in_fila_inicio` INT(11), IN `in_cuantas_filas` INT(11))  NO SQL
BEGIN
SELECT
`id`,
`nombre`,
`responsable`,
`descripcion`,
`imagenPath`
FROM tblCategoria
LIMIT in_fila_inicio,in_cuantas_filas;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_consultar_cliente` (IN `Id` INT(11))  NO SQL
BEGIN
SET @Id=Id;
SELECT nombre as nombre, apellido as apellido, direccion as direccion, correo as correo, telefono as telefono, identificacion as identificacion FROM tblCliente WHERE id=@Id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_consultar_clientes` (IN `in_fila_inicio` INT(11), IN `in_cuantas_filas` INT(11))  NO SQL
BEGIN
SELECT
`id`,
`nombre`,
`apellido`,
`direccion`,
`correo`,
`telefono`,
`identificacion`
FROM tblCliente LIMIT in_fila_inicio,in_cuantas_filas;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_consultar_cursoXEmpleado` ()  NO SQL
SELECT * FROM tblCurso JOIN tblEmpleado ON tblCurso.id,tblCurso.curso,tblEmpleado.cedula,tblEmpleado.nombre,tblEmpleado.apellido$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_consultar_empleado` (IN `Id` INT(11))  NO SQL
BEGIN
SET Id=@Id;
SELECT cedula as cedula, nombre as nombre, apellido as apellido, cargo as cargo, correoElectronico as correoElectronico, telefono as telefono, direccion as direccion, ciudad as ciudad FROM tblEmpleado WHERE id=@Id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_consultar_empleados` (IN `in_fila_inicio` INT(11), IN `in_cuantas_filas` INT(11))  NO SQL
BEGIN
SELECT
`id`,`cedula`,`nombre`,`apellido`,`cargo`,`correoElectronico`,`telefono`,`direccion`,`ciudad` FROM tblEmpleado LIMIT in_fila_inicio,in_cuantas_filas;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_consultar_empleadoXEvento` ()  NO SQL
SELECT * FROM tblEmpleado JOIN tblEvento ON tblEmpleado.cedula, tblEmpleado.nombre,tblEmpleado.apellido, tblEvento.evento,tblEvento.lugar,tblEvento.fecha$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_consultar_equipo` (IN `in_id` INT(11))  NO SQL
BEGIN
    SET @id = in_id;
    SELECT
        `id`,
        `nombre`,
        `descripcion`,
        `activo`,
        `imagenPath`,
        `codigo`,
        `peso`,
        `consumoWatts`,
        `dimensionAlto`,
        `dimensionAncho`,
        `dimensionProfundidad`,
        `serial`,
        `garantia`,
        `manuales`,
        `proteccion`,
        `categoriaId`,
        `marcaId`
    FROM tblEquipo
    WHERE `id`=@id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_consultar_equipos` (IN `in_fila_inicio` INT(11), IN `in_cuantas_filas` INT(11))  NO SQL
BEGIN
    SELECT
        `id`,
        `nombre`,
        `descripcion`,
        `activo`,
        `imagenPath`,
        `codigo`,
        `peso`,
        `consumoWatts`,
        `dimensionAlto`,
        `dimensionAncho`,
        `dimensionProfundidad`,
        `serial`,
        `garantia`,
        `manuales`,
        `proteccion`,
        `categoriaId`,
        `marcaId`
    FROM tblEquipo
    LIMIT in_fila_inicio,in_cuantas_filas;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_consultar_equipoXEvento` ()  NO SQL
SELECT * FROM tblEquipo JOIN tblEvento on tblEquipo.nombre, tblEquipo.activo, tblEvento.evento,tblEvento.lugar,tblEvento.fecha$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_consultar_evento` (IN `Id` INT(11))  NO SQL
BEGIN 
SET @Id=Id;
SELECT evento as evento, encargado as encargado, lugar as lugar, fecha as fecha, transportador as transportador, horaAproximadaCarga as horaAproximadaCarga, horaAproximadaDescargue as horaAproximadaDescargue FROM tblEvento WHERE id=@Id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_consultar_eventos` (IN `in_fila_inicio` INT(11), IN `in_cuantas_filas` INT(11))  NO SQL
BEGIN
    SELECT
        `id`,
        `evento`,
        `encargado`,
        `lugar`,
        `fecha`,
        `transportador`,
        `encargado`,
        `horaAproximadaCargue`,
        `horaAproximadaDescargue`       
    FROM tblEvento
    LIMIT in_fila_inicio,in_cuantas_filas;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_consultar_marca` (IN `Id` INT(10))  NO SQL
BEGIN
SET @Id=Id;
SELECT nombre as nombre, descripcion as descripcion FROM tblMarca WHERE id=@Id ;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_consultar_marcas` (IN `in_fila_inicio` INT(11), IN `in_cuantas_filas` INT(11))  NO SQL
BEGIN
    SELECT
        `id`,
        `nombre`,
        `descripcion`
    FROM tblMarca
    LIMIT in_fila_inicio,in_cuantas_filas;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_consultar_tareaXEmpleado` ()  NO SQL
SELECT * FROM tblTarea JOIN tblEmpleado on tblTarea.descripcion,tblTarea.observacione,tblEmpleado.cedula,tblEmpleado.nombre,tblEmpleado.apellido$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_eliminar_categoria` (IN `in_id` INT(11))  NO SQL
BEGIN
set @id = in_id;
DELETE FROM tblCategoria WHERE id = @id;
SELECT ROW_COUNT() AS conteo;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_eliminar_cliente` (IN `in_id` INT(11))  NO SQL
BEGIN
SET @id=in_id;
DELETE FROM tblCliente WHERE id = @id;
SELECT ROW_COUNT() AS conteo;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_eliminar_cursoXEmpleado` (IN `in_id` INT)  NO SQL
BEGIN
SET @id=in_id;
DELETE FROM tblCursoXEmpleado WHERE id = @id;
SELECT ROW_COUNT() AS conteo;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_eliminar_empleado` (IN `in_id` INT(11))  NO SQL
BEGIN
SET @id=in_id;
DELETE FROM tblEmpleado WHERE id = @id;
SELECT ROW_COUNT() AS conteo;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_eliminar_empleadoXEvento` (IN `in_id` INT)  NO SQL
BEGIN
SET @id=in_id;
DELETE FROM tblEmpleadoXEventoo WHERE id = @id;
SELECT ROW_COUNT() AS conteo;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_eliminar_equipo` (IN `in_id` INT(11))  NO SQL
BEGIN
SET @id=in_id;
DELETE FROM tblEquipo WHERE id = @id;
SELECT ROW_COUNT() AS conteo;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_eliminar_equipoXEvento` (IN `in_id` INT)  NO SQL
BEGIN
SET @id=in_id;
DELETE FROM tblEquipoXEvento WHERE id = @id;
SELECT ROW_COUNT() AS conteo;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_eliminar_evento` (IN `in_id` INT(11))  NO SQL
BEGIN
SET @id=in_id;
DELETE FROM tblEvento WHERE id = @id;
SELECT ROW_COUNT() AS conteo;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_eliminar_marca` (IN `in_id` INT(11))  NO SQL
BEGIN
SET @id=in_id;
DELETE FROM tblMarca WHERE id = @id;
SELECT ROW_COUNT() AS conteo;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_eliminar_tareaXEmpleado` (IN `in_id` INT)  NO SQL
BEGIN
SET @id=in_id;
DELETE FROM tblTareaXEmpleado WHERE id = @id;
SELECT ROW_COUNT() AS conteo;
END$$

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
-- Estructura de tabla para la tabla `tblCategoria`
--

CREATE TABLE `tblCategoria` (
  `id` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `responsable` char(32) DEFAULT NULL,
  `descripcion` text,
  `imagenPath` varchar(255) DEFAULT NULL,
  `creadoPor` char(32) DEFAULT NULL,
  `creadoEn` datetime DEFAULT NULL,
  `actualizadoPor` char(32) DEFAULT NULL,
  `actualizadoEn` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tblCategoria`
--

INSERT INTO `tblCategoria` (`id`, `nombre`, `responsable`, `descripcion`, `imagenPath`, `creadoPor`, `creadoEn`, `actualizadoPor`, `actualizadoEn`) VALUES
(1, 'Pantalla', 'Juan', 'Carga', NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tblCliente`
--

CREATE TABLE `tblCliente` (
  `id` int(11) NOT NULL,
  `nombre` varchar(20) DEFAULT NULL,
  `apellido` varchar(20) DEFAULT NULL,
  `direccion` varchar(30) DEFAULT NULL,
  `correo` varchar(40) DEFAULT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `identificacion` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tblCliente`
--

INSERT INTO `tblCliente` (`id`, `nombre`, `apellido`, `direccion`, `correo`, `telefono`, `identificacion`) VALUES
(1, 'Julanito', 'Chismoso', '455', 'asda@gmail.com', '477', '465'),
(2, 'Alejandro', 'Aguirre', 'cra132', 'agurrealejandro@gmail.com', '42895465', '10006478952'),
(5, '1', '1', '1', '1', '1', '1'),
(6, 'Julanito', 'Chismoso', '455', 'asda@gmail.com', '477', '14444'),
(7, 'Oto', 'Sanchez', 'cra89', 'o.@gmail.com', '4435645', '18555');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tblControlAsistencia`
--

CREATE TABLE `tblControlAsistencia` (
  `idControlAsistencia` int(11) NOT NULL,
  `empleadoId` int(100) NOT NULL,
  `eventoId` int(11) NOT NULL,
  `horaEntrada` datetime DEFAULT NULL,
  `horaSalida` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tblCurso`
--

CREATE TABLE `tblCurso` (
  `id` int(11) NOT NULL,
  `curso` varchar(100) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tblCursoXEmpleado`
--

CREATE TABLE `tblCursoXEmpleado` (
  `id` int(11) NOT NULL,
  `empleadoId` int(11) DEFAULT NULL,
  `cursoId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tblEmpleado`
--

CREATE TABLE `tblEmpleado` (
  `id` int(11) NOT NULL,
  `cedula` varchar(20) DEFAULT NULL,
  `nombre` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `apellido` varchar(100) CHARACTER SET utf8 COLLATE utf8_vietnamese_ci DEFAULT NULL,
  `cargo` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `correoElectronico` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `telefono` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `direccion` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `ciudad` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tblEmpleado`
--

INSERT INTO `tblEmpleado` (`id`, `cedula`, `nombre`, `apellido`, `cargo`, `correoElectronico`, `telefono`, `direccion`, `ciudad`) VALUES
(19, '1111', 'Alejandro', 'Aguirre', 'Gerente', '', '4278895', 'cra156', 'Medellin');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tblEmpleadoXEvento`
--

CREATE TABLE `tblEmpleadoXEvento` (
  `id` int(11) NOT NULL,
  `eventoId` int(11) DEFAULT NULL,
  `empleadoId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tblEquipo`
--

CREATE TABLE `tblEquipo` (
  `id` int(11) NOT NULL,
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
  `actualizadoEn` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tblEquipo`
--

INSERT INTO `tblEquipo` (`id`, `nombre`, `descripcion`, `activo`, `imagenPath`, `codigo`, `peso`, `consumoWatts`, `dimensionAlto`, `dimensionAncho`, `dimensionProfundidad`, `serial`, `garantia`, `manuales`, `proteccion`, `categoriaId`, `marcaId`, `creadoPor`, `creadoEn`, `actualizadoPor`, `actualizadoEn`) VALUES
(1, 'Pantalla', 'Grande', 1, '', '456535', 5, 5, 5, 5, 5, '5', '5', '5', '5', 1, 1, 'root@localhost', '2018-11-28 10:02:23', 'root@localhost', '2018-11-28 10:02:23');

--
-- Disparadores `tblEquipo`
--
DELIMITER $$
CREATE TRIGGER `trigger_tblEquipo_antes_insert` BEFORE INSERT ON `tblEquipo` FOR EACH ROW BEGIN
   
   DECLARE usuario VARCHAR(50);
   SELECT USER() INTO usuario;
   SET NEW.creadoPor = usuario;
   SET NEW.creadoEn = SYSDATE();
   SET NEW.actualizadoPor = USER();
   SET NEW.actualizadoEn = SYSDATE();
   
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `trigger_tblEquipo_antes_update` BEFORE UPDATE ON `tblEquipo` FOR EACH ROW BEGIN
   
   DECLARE usuario VARCHAR(50);
   SELECT USER() INTO usuario;
   SET NEW.actualizadoPor = USER();
   SET NEW.actualizadoEn = SYSDATE();
   
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tblEquipoXEvento`
--

CREATE TABLE `tblEquipoXEvento` (
  `equipoId` int(11) NOT NULL,
  `eventoId` int(11) NOT NULL,
  `creadoPor` char(32) DEFAULT NULL,
  `creadoEn` datetime DEFAULT NULL,
  `actualizadoPor` char(32) DEFAULT NULL,
  `actualizadoEn` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tblEvento`
--

CREATE TABLE `tblEvento` (
  `id` int(11) NOT NULL,
  `evento` char(50) DEFAULT NULL,
  `encargado` char(50) DEFAULT NULL,
  `lugar` char(50) DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `transportador` varchar(50) DEFAULT NULL,
  `horaAproximadaCargue` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `horaAproximadaDescargue` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tblEvento`
--

INSERT INTO `tblEvento` (`id`, `evento`, `encargado`, `lugar`, `fecha`, `transportador`, `horaAproximadaCargue`, `horaAproximadaDescargue`) VALUES
(2, 'Fiesta', 'Juan', 'Laureles', '2018-11-23', '455', '0000-00-00 00:00:00', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tblEventoXCliente`
--

CREATE TABLE `tblEventoXCliente` (
  `id` int(11) NOT NULL,
  `eventoId` int(11) NOT NULL,
  `clienteId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tblHistoricoEquipoXEvento`
--

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

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tblhoraTrabajada`
--

CREATE TABLE `tblhoraTrabajada` (
  `id` int(11) NOT NULL,
  `totalHora` int(100) NOT NULL,
  `pagoTotal` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tblMantenimiento`
--

CREATE TABLE `tblMantenimiento` (
  `id` int(11) NOT NULL,
  `equipoId` int(11) NOT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `fechaProgramada` datetime DEFAULT NULL,
  `fechaRealizado` datetime DEFAULT NULL,
  `creadoPor` char(32) DEFAULT NULL,
  `creadoEn` datetime DEFAULT NULL,
  `actualizadoPor` char(32) DEFAULT NULL,
  `actualizadoEn` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tblMarca`
--

CREATE TABLE `tblMarca` (
  `id` int(11) NOT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  `descripcion` text,
  `imagenPath` varchar(255) DEFAULT NULL,
  `creadoPor` char(32) DEFAULT NULL,
  `creadoEn` datetime DEFAULT NULL,
  `actualizadoPor` char(32) DEFAULT NULL,
  `actualizadoEn` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tblMarca`
--

INSERT INTO `tblMarca` (`id`, `nombre`, `descripcion`, `imagenPath`, `creadoPor`, `creadoEn`, `actualizadoPor`, `actualizadoEn`) VALUES
(1, 'Pantalla', 'Carga', NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tblNormatividadLaboral`
--

CREATE TABLE `tblNormatividadLaboral` (
  `Id` int(100) NOT NULL,
  `norma` varchar(100) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tblTarea`
--

CREATE TABLE `tblTarea` (
  `id` int(11) NOT NULL,
  `descripcion` varchar(100) NOT NULL,
  `observacione` varchar(800) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tblTareaXEmpleado`
--

CREATE TABLE `tblTareaXEmpleado` (
  `empleadoId` int(11) NOT NULL,
  `tareaId` int(11) NOT NULL,
  `empleadoAsignaId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
(9, 222222, 'director@gmail.com', 'director comercial', 'inicio de sesion', '::1', '::1', '::1', '2017-12-07 22:05:49'),
(10, 11111111, 'administrador@gmail.com', 'administrador ad', 'inicio de sesion', '::1', '::1', '::1', '2018-11-10 17:50:18');

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
(222222, 'director', 'comercial', 232323, 324324, 'director@gmail.com', '123456', 'activo', '2017-12-19', '3'),
(11111111, 'administrador', 'ad', 34234, 4235345, 'administrador@gmail.com', '123456', 'activo', '2012-12-12', '2'),
(1000898270, 'yeisson', 'sanchez', 3203434, 3213123, 'j.arley111@gmail.com', 'vWE4pL3/n1jYwHUM6nP7EbaBYUx8vfNwDo/HH6t50qU=', 'activo', '2012-12-12', '1');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `tblCategoria`
--
ALTER TABLE `tblCategoria`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nombre` (`nombre`);

--
-- Indices de la tabla `tblCliente`
--
ALTER TABLE `tblCliente`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `identificacion` (`identificacion`);

--
-- Indices de la tabla `tblControlAsistencia`
--
ALTER TABLE `tblControlAsistencia`
  ADD PRIMARY KEY (`idControlAsistencia`),
  ADD KEY `FK_tblControlAsistencia_eventoId` (`eventoId`);

--
-- Indices de la tabla `tblCurso`
--
ALTER TABLE `tblCurso`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tblCursoXEmpleado`
--
ALTER TABLE `tblCursoXEmpleado`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UK_tblCursoXEmpleado_empleadoId_cursoId` (`empleadoId`,`cursoId`),
  ADD KEY `FK_tblCursoXEmpleado_eventoId` (`cursoId`),
  ADD KEY `FK_tblCursoXEmpleado_empleadoId` (`empleadoId`);

--
-- Indices de la tabla `tblEmpleado`
--
ALTER TABLE `tblEmpleado`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tblEmpleadoXEvento`
--
ALTER TABLE `tblEmpleadoXEvento`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_tblEmpleadoXEvento_eventoId` (`eventoId`),
  ADD KEY `FK_tblEmpleadoXEvento_empleadoId` (`empleadoId`);

--
-- Indices de la tabla `tblEquipo`
--
ALTER TABLE `tblEquipo`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_tblEquipo_categoriaId` (`categoriaId`),
  ADD KEY `FK_tblEquipo_marcaId` (`marcaId`);

--
-- Indices de la tabla `tblEquipoXEvento`
--
ALTER TABLE `tblEquipoXEvento`
  ADD KEY `FK_tblEquipoXEvento_equipoId` (`equipoId`),
  ADD KEY `FK_tblEquipoXEvento_eventoId` (`eventoId`);

--
-- Indices de la tabla `tblEvento`
--
ALTER TABLE `tblEvento`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tblEventoXCliente`
--
ALTER TABLE `tblEventoXCliente`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_tblEventoXCliente_eventoId` (`eventoId`),
  ADD KEY `FK_tblEventoXCliente_clienteId` (`clienteId`);

--
-- Indices de la tabla `tblhoraTrabajada`
--
ALTER TABLE `tblhoraTrabajada`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tblMantenimiento`
--
ALTER TABLE `tblMantenimiento`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_tblMantenimiento_equipoId` (`equipoId`);

--
-- Indices de la tabla `tblMarca`
--
ALTER TABLE `tblMarca`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nombre` (`nombre`);

--
-- Indices de la tabla `tblNormatividadLaboral`
--
ALTER TABLE `tblNormatividadLaboral`
  ADD PRIMARY KEY (`Id`);

--
-- Indices de la tabla `tblTarea`
--
ALTER TABLE `tblTarea`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tblTareaXEmpleado`
--
ALTER TABLE `tblTareaXEmpleado`
  ADD PRIMARY KEY (`empleadoId`,`tareaId`),
  ADD KEY `FK_tblTareaXEmpleado_empleadoAsignaId` (`empleadoAsignaId`),
  ADD KEY `FK_tblTareaXEmpleado_empleadoId` (`empleadoId`),
  ADD KEY `FK_tblTareaXEmpleado_tareaId_` (`tareaId`);

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
-- AUTO_INCREMENT de la tabla `tblCategoria`
--
ALTER TABLE `tblCategoria`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `tblCliente`
--
ALTER TABLE `tblCliente`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `tblControlAsistencia`
--
ALTER TABLE `tblControlAsistencia`
  MODIFY `idControlAsistencia` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tblCurso`
--
ALTER TABLE `tblCurso`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tblCursoXEmpleado`
--
ALTER TABLE `tblCursoXEmpleado`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tblEmpleado`
--
ALTER TABLE `tblEmpleado`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT de la tabla `tblEmpleadoXEvento`
--
ALTER TABLE `tblEmpleadoXEvento`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tblEquipo`
--
ALTER TABLE `tblEquipo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `tblEvento`
--
ALTER TABLE `tblEvento`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `tblEventoXCliente`
--
ALTER TABLE `tblEventoXCliente`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `tblhoraTrabajada`
--
ALTER TABLE `tblhoraTrabajada`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tblMantenimiento`
--
ALTER TABLE `tblMantenimiento`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tblMarca`
--
ALTER TABLE `tblMarca`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `tblTarea`
--
ALTER TABLE `tblTarea`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tbl_log`
--
ALTER TABLE `tbl_log`
  MODIFY `int_id_log` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `tblControlAsistencia`
--
ALTER TABLE `tblControlAsistencia`
  ADD CONSTRAINT `FK_tblControlAsistencia_eventoId` FOREIGN KEY (`eventoId`) REFERENCES `tblEvento` (`id`);

--
-- Filtros para la tabla `tblCursoXEmpleado`
--
ALTER TABLE `tblCursoXEmpleado`
  ADD CONSTRAINT `FK_tblCursoXEmpleado_cursoId` FOREIGN KEY (`cursoId`) REFERENCES `tblCurso` (`id`),
  ADD CONSTRAINT `FK_tblCursoXEmpleado_empleadoId` FOREIGN KEY (`empleadoId`) REFERENCES `tblEmpleado` (`id`);

--
-- Filtros para la tabla `tblEmpleadoXEvento`
--
ALTER TABLE `tblEmpleadoXEvento`
  ADD CONSTRAINT `FK_tblEmpleadoXEvento_empleadoId` FOREIGN KEY (`empleadoId`) REFERENCES `tblEmpleado` (`id`),
  ADD CONSTRAINT `FK_tblEmpleadoXEvento_eventoId` FOREIGN KEY (`eventoId`) REFERENCES `tblEvento` (`id`);

--
-- Filtros para la tabla `tblEquipo`
--
ALTER TABLE `tblEquipo`
  ADD CONSTRAINT `FK_tblEquipo_categoriaId` FOREIGN KEY (`categoriaId`) REFERENCES `tblCategoria` (`id`),
  ADD CONSTRAINT `FK_tblEquipo_marcaId` FOREIGN KEY (`marcaId`) REFERENCES `tblMarca` (`id`);

--
-- Filtros para la tabla `tblEquipoXEvento`
--
ALTER TABLE `tblEquipoXEvento`
  ADD CONSTRAINT `FK_tblEquipoXEvento_equipoId` FOREIGN KEY (`equipoId`) REFERENCES `tblEquipo` (`id`),
  ADD CONSTRAINT `FK_tblEquipoXEvento_eventoId` FOREIGN KEY (`eventoId`) REFERENCES `tblEvento` (`id`);

--
-- Filtros para la tabla `tblEventoXCliente`
--
ALTER TABLE `tblEventoXCliente`
  ADD CONSTRAINT `FK_tblEventoXCliente_clienteId` FOREIGN KEY (`clienteId`) REFERENCES `tblCliente` (`id`),
  ADD CONSTRAINT `FK_tblEventoXCliente_eventoId` FOREIGN KEY (`eventoId`) REFERENCES `tblEvento` (`id`);

--
-- Filtros para la tabla `tblMantenimiento`
--
ALTER TABLE `tblMantenimiento`
  ADD CONSTRAINT `FK_tblMantenimiento_equipoId` FOREIGN KEY (`equipoId`) REFERENCES `tblEquipo` (`id`);

--
-- Filtros para la tabla `tblTareaXEmpleado`
--
ALTER TABLE `tblTareaXEmpleado`
  ADD CONSTRAINT `FK_tblTareaXEmpleado_empleadoAsignaId` FOREIGN KEY (`empleadoAsignaId`) REFERENCES `tblEmpleado` (`id`),
  ADD CONSTRAINT `FK_tblTareaXEmpleado_empleadoId` FOREIGN KEY (`empleadoId`) REFERENCES `tblEmpleado` (`id`),
  ADD CONSTRAINT `FK_tblTareaXEmpleado_tareaId_` FOREIGN KEY (`tareaId`) REFERENCES `tblTarea` (`id`);

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
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
