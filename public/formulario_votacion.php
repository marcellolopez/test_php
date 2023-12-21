<?php 
    // Incluye el header
    include 'templates/header.php';
?>

<h2>Formulario de votación</h2>

<form id="formulario_votacion" method="post" action="">
    <input type="hidden" id="funcion" name="funcion" value="registrarVotacion">
    <table>
        <tr>
            <td><label for="nombre_apellido">Nombre y Apellido:</label></td>
            <td><input type="text" id="nombre_apellido" name="nombre_apellido" ></td>
        </tr>
        <tr>
            <td><label for="alias">Alias:</label></td>
            <td><input type="text" id="alias" name="alias" ></td>
        </tr>
        <tr>
            <td><label for="rut">RUT:</label></td>
            <td><input type="text" id="rut" name="rut" ></td>
        </tr>
        <tr>
            <td><label for="email">Email:</label></td>
            <td><input type="email" id="email" name="email" ></td>
        </tr>
        <tr>
            <td><label for="region">Región:</label></td>
            <td>
                <select id="region" name="region" >
                    <?= obtenerRegionesSelect(); ?>             
                </select>
            </td>
        </tr>
        <tr>
            <td><label for="comuna">Comuna:</label></td>
            <td>
                <select id="comuna" name="comuna" >
                    <option value="">Seleccione una región</option>
                </select>
            </td>
        </tr>
        <tr>
            <td><label for="candidato">Candidato:</label></td>
            <td>
                <select id="candidato" name="candidato" >                    
                    <?= obtenerCandidatosSelect(); ?>
                </select>
            </td>
        </tr>
        <tr>
            <td><label for="como_se_entero">Como se enteró de Nosotros:</label></td>
            <td>
                <input type="checkbox" id="web" name="como_se_entero[]" value="Web">
                <label for="web">Web</label>

                <input type="checkbox" id="tv" name="como_se_entero[]" value="TV">
                <label for="tv">TV</label>

                <input type="checkbox" id="redes_sociales" name="como_se_entero[]" value="Redes Sociales">
                <label for="redes_sociales">Redes Sociales</label>

                <input type="checkbox" id="amigo" name="como_se_entero[]" value="Amigo">
                <label for="amigo">Amigo</label>
            </td>
        </tr>
    </table>
    <br>
    <input type="submit" value="Votar">
    <br>

</form>    

<?php 
    // Incluye el footer
    include 'templates/footer.php';
?>

<!-- Incluye el archivo de scripts assets/js/scripts.js -->
<script src="assets/js/scripts.js"></script>
    