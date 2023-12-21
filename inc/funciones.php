<?php

// Incluir el archivo de conexión
include('conexion.php');

// Comprobar si es un llamado por POST
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    // Este switch selecciona la función a ejecutar según el valor de la variable "funcion"
    switch ($_POST['funcion']) {
        case 'obtenerComunasSelect':
            return obtenerComunasSelect($_POST['id_region']);
        break;
        case 'registrarVotacion':
            return registrarVotacion($_POST);
        break;
    }
}

// Función para obtener las regiones desde la base de datos
function obtenerRegiones() {
    global $conexion;

    // Consulta SQL para obtener las regiones
    $sql = "SELECT * FROM regiones";

    // Ejecutar la consulta
    $resultado = $conexion->query($sql);

    // Verificar si hay resultados
    if ($resultado->num_rows > 0) {
        // Almacenar las regiones en un array asociativo
        $regiones = array();
        while ($row = $resultado->fetch_assoc()) {
            $regiones[] = $row;
        }
        return $regiones;
    } else {
        return array(); // Devolver un array vacío si no hay regiones
    }
}

// Función para obtener las comunas según la región seleccionada
function obtenerComunas($id_region) {
    global $conexion;

    // Consulta SQL para obtener las comunas según la región seleccionada
    $sql = "SELECT * FROM comunas WHERE id_region = $id_region";
    
    // Ejecutar la consulta
    $resultado = $conexion->query($sql);

    // Cerrar la conexión a la base de datos
    $conexion->close();

    // Verificar si hay resultados
    if ($resultado->num_rows > 0) {
        // Almacenar las comunas en un array asociativo
        $comunas = array();
        while ($row = $resultado->fetch_assoc()) {
            $comunas[] = $row;
        }
        return $comunas;
    } else {
        return array(); // Devolver un array vacío si no hay comunas
    }

    
}

// Función para obtener los candidatos desde la base de datos
function obtenerCandidatos() {
    global $conexion;

    // Consulta SQL para obtener los candidatos, siempre y cuando estén activos
    $sql = "SELECT * FROM candidatos WHERE activo = 1";

    // Ejecutar la consulta
    $resultado = $conexion->query($sql);

    // Verificar si hay resultados
    if ($resultado->num_rows > 0) {
        // Almacenar los candidatos en un array asociativo
        $candidatos = array();
        while ($row = $resultado->fetch_assoc()) {
            $candidatos[] = $row;
        }
        return $candidatos;
    } else {
        return array(); // Devolver un array vacío si no hay candidatos
    }
}

// Fución que consulta por el rut a la tabla votos y devuelve true si hay registros

function consultarVotos($rut) {
    global $conexion;

    // Consulta SQL para consultar por el rut
    $sql = "SELECT * FROM votos WHERE rut = '$rut'";

    // Ejecutar la consulta
    $resultado = $conexion->query($sql);

    // Verificar si hay resultados
    if ($resultado->num_rows > 0) {
        // Devolver true si hay registros
        return true;
    } else {
        // Devolver false si no hay registros
        return false;
    }
}

// Función que obtiene las regiones y retorna cada una como option para el select
function obtenerRegionesSelect() {
    $regiones = obtenerRegiones();
    $select = '<option value="">Seleccione una región</option>';
    foreach ($regiones as $region) {
        $select .= '<option value="' . $region['id_region'] . '">' . $region['nombre_region'] . '</option>';
    }

    echo $select;
}

// Función que obtiene las comunas y retorna cada una como option para el select
function obtenerComunasSelect($id_region) {
    $comunas = obtenerComunas($id_region);
    $select = '<option value="">Seleccione una comuna</option>';
    foreach ($comunas as $comuna) {
        $select .= '<option value="' . $comuna['id'] . '">' . $comuna['nombre_comuna'] . '</option>';
    }

    echo $select;
}

// Función para obtener los candidatos y retorna cada uno como option para el select
function obtenerCandidatosSelect() {
    $candidatos = obtenerCandidatos();
    $select = '<option value="">Seleccione un candidato</option>';
    foreach ($candidatos as $candidato) {
        $select .= '<option value="' . $candidato['id'] . '">' . $candidato['nombre'] . '</option>';
    }

    echo $select;
}

// Función para registrar una votación
function registrarVotacion($data) {
    global $conexion;

    // Asegurarse de escapar los datos para prevenir SQL injection
    $nombre_apellido = mysqli_real_escape_string($conexion, $data['nombre_apellido']);
    $alias = mysqli_real_escape_string($conexion, $data['alias']);
    $rut = mysqli_real_escape_string($conexion, $data['rut']);
    $email = mysqli_real_escape_string($conexion, $data['email']);
    $comuna = mysqli_real_escape_string($conexion, $data['comuna']);
    $candidato = mysqli_real_escape_string($conexion, $data['candidato']);

    // Procesar los checkboxes "como_se_entero"
    $medios_contacto = implode(",", $data['como_se_entero']);

    // Consulto por el rut para verificar si ya existe un registro con el mismo rut
    if (consultarVotos($rut))
    {
        echo "Ya existe un registro con el mismo rut.";
    }
    else{
        // Consulta SQL para insertar en la tabla votos
        $sql = "INSERT INTO votos (nombre_apellido, alias, rut, email, id_comuna, id_candidato, medios_contacto) 
                VALUES ('$nombre_apellido', '$alias', '$rut', '$email', '$comuna', '$candidato', '$medios_contacto')";

        // Ejecutar la consulta
        if ($conexion->query($sql) === TRUE) {
            // Devolver un mensaje de éxito
            $exito = "success";
        } else {
            // Devolver un mensaje de error y detalles si es necesario
            $exito = $conexion->error;
        }

        // Cerrar la conexión a la base de datos
        $conexion->close();

        echo $exito;
    }
}
