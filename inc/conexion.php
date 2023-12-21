<?php

// Incluir las credenciales
include('credenciales.inc');

// Crear la conexión a MySQL
$conexion = new mysqli($host, $usuario, $contrasena, $base_datos);

// Verificar la conexión
if ($conexion->connect_error) {
    die("Error de conexión a MySQL: " . $conexion->connect_error);
}

// Configurar el conjunto de caracteres a utf8
$conexion->set_charset("utf8");

?>
