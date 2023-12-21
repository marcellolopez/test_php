# Proyecto de Sistema de Votación

Este proyecto es un sistema de votación desarrollado en PHP y jQuery. Permite a los usuarios registrarse y participar en votaciones para candidatos en regiones y comunas de Chile.

# Estructura de archivos

|-- test_php/

    |-- assets/
    
        |-- css/
        
            |-- estilos.css
            
        |-- js/
        
            |-- jquery-3.7.1.min.js
            
            |-- jquery.validate.js
            
            |-- scripts.js
            
    |-- inc/
    
        |-- conexion.php
        
        |-- credenciales.php
        
        |-- funciones.php   
        
    |-- public/
    
        |-- formulario_votacion.php
        
    |-- sql/
    
        |-- backup.sql
        
    |-- templates/
    
        |-- footer.php
        
        |-- header.php
        
    |-- doc.pdf
    
    |-- index.php
    
    |-- LEEME.php


## Requisitos del Sistema

- Servidor web (por ejemplo, Apache)
- Servidor de base de datos MySQL
- PHP 7.0 o superior
- jQuery (incluido en el proyecto)
- jQuery.Validate (incluido en el proyecto)

## Configuración del Proyecto

1. Clona este repositorio en tu servidor web.
2. Configura la base de datos ejecutando el script SQL proporcionado en la carpeta `sql`.
3. Actualiza la configuración de la base de datos en el archivo `inc/conexion.php`.

## Estructura del Proyecto

- `index.php`: Página de inicio del sistema.
- `public`: Contiene archivos públicos accesibles desde el navegador.
- `inc`: Contiene archivos PHP para la lógica del sistema.
- `sql`: Contiene scripts SQL para crear la base de datos.

## Uso del Sistema

1. Accede al sistema a través de tu navegador web.
2. Regístrate con tus datos participar en las votaciones.
3. Selecciona tu región, comuna y candidato preferido.
4. Completa el formulario y envía tu voto.
5. ¡Disfruta del proceso de votación!

## Colaboradores

- [Marcello López](https://github.com/marcellolopez) - Desarrollador principal

## Problemas Conocidos

- Puedes informar problemas o contribuir mediante problemas (issues) y solicitudes de extracción (pull requests) en GitHub.

## Licencia

Este proyecto está bajo la Licencia MIT. Consulta el archivo LICENSE para obtener más detalles.

¡Gracias por contribuir al desarrollo del Sistema de Votación!
