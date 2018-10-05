<?php
session_start();
require_once 'bd/conexion.php';
require 'controller/core.php';

function getRealIP()
{

    if (isset($_SERVER["HTTP_CLIENT_IP"])) {
        return $_SERVER["HTTP_CLIENT_IP"];
    } elseif (isset($_SERVER["HTTP_X_FORWARDED_FOR"])) {
        return $_SERVER["HTTP_X_FORWARDED_FOR"];
    } elseif (isset($_SERVER["HTTP_X_FORWARDED"])) {
        return $_SERVER["HTTP_X_FORWARDED"];
    } elseif (isset($_SERVER["HTTP_FORWARDED_FOR"])) {
        return $_SERVER["HTTP_FORWARDED_FOR"];
    } elseif (isset($_SERVER["HTTP_FORWARDED"])) {
        return $_SERVER["HTTP_FORWARDED"];
    } else {
        return $_SERVER["REMOTE_ADDR"];
    }

}

function encriptar($cadena)
{
    $key       = 'hexe'; // Una clave de codificacion, debe usarse la misma para encriptar y desencriptar
    $encrypted = base64_encode(mcrypt_encrypt(MCRYPT_RIJNDAEL_256, md5($key), $cadena, MCRYPT_MODE_CBC, md5(md5($key))));
    return $encrypted; //Devuelve el string encriptado

}

function desencriptar($cadena)
{
    $key       = 'hexe'; // Una clave de codificacion, debe usarse la misma para encriptar y desencriptar
    $decrypted = rtrim(mcrypt_decrypt(MCRYPT_RIJNDAEL_256, md5($key), base64_decode($cadena), MCRYPT_MODE_CBC, md5(md5($key))), "\0");
    return $decrypted; //Devuelve el string desencriptado
}

function index($controller)
{
    require_once "controller/$controller" . "_controller.php";
    $controller = ucwords($controller) . '_controller';
    $controller = new $controller;
    $controller->index();
}

if (isset($_POST['ema']) && isset($_POST['pas'])) {
    $login = "login";
    require_once "controller/$login" . "_controller.php";
    $login = ucwords($login) . '_controller';
    $login = new $login;
    $login->validacion();
} else if (!isset($_SESSION['ema'])) {
    index("login");
}
if (isset($_SESSION['ema']) && isset($_REQUEST['c'])) {
    $controller = strtolower($_REQUEST['c']);
    $accion     = isset($_REQUEST['a']) ? $_REQUEST['a'] : 'Index';
    require_once "controller/$controller" . "_controller.php";
    $controller = ucwords($controller) . '_Controller';
    $controller = new $controller;
    call_user_func(array($controller, $accion));
} else if (isset($_SESSION['ema']) && !isset($_REQUEST['c'])) {
    index("summary");
}
