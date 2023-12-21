
/*Validaciones para el formulario formulario_votacion con jquery.validate y que el error se muestre en el <td> del lado derecho
toma las siguientes validaciones:
    Nombre y Apellido: No debe quedar en Blanco.
    Alias: Validar que la cantidad de caracteres sea mayor a 5 y que contenga letras y números.
    RUT: Deberá Validar el RUT (Formato Chile).
    Email: Deberá validar el correo según estándar.
    Los Combo Box Región y Comuna No deberán quedar en blanco .
    Checkbox “Como se enteró de Nosotros”: Debe elegir al menos dos opciones.
*/
$(document).ready(function() {

    // Regla personalizada para requerir al menos dos checkboxes marcados
    $.validator.addMethod("check_min_selected", function(value, element, params) {
        return $(params).filter(':checked').length >= 2;
    }, "Por favor, seleccione al menos dos opciones.");

    //Regla personalizada para validar que el campo contenga letras y números
    $.validator.addMethod("alphanumeric", function(value, element) {
        return this.optional(element) || /^[A-Za-z0-9]+$/.test(value);
    }, "Debe contener letras y números");  

    // Regla personalizada para verificar que contenga al menos una letra
    $.validator.addMethod("contieneLetra", function(value, element) {
        return this.optional(element) || /[a-zA-Z]/.test(value);
    }, "Debe contener al menos una letra");

    // Regla personalizada para verificar que contenga al menos un número
    $.validator.addMethod("contieneNumero", function(value, element) {
        return this.optional(element) || /\d/.test(value);
    }, "Debe contener al menos un número");

    // Regla personalizada para validar rut chileno
    $.validator.addMethod(
        "rut",
        function(value, element) {
            var rut = value.replace(/\./g, "");
            rut = rut.replace(/\-/g, "");
            var dv = rut.slice(-1);
            var n = rut.slice(0, -1);
            if (n.length < 7) {
                return false;
            }
            var suma = 0;
            var multiplo = 2;
            for (i = 1; i <= n.length; i++) {
                var index = multiplo * n[n.length - i];
                suma = suma + index;
                if (multiplo < 7) {
                    multiplo = multiplo + 1;
                } else {
                    multiplo = 2;
                }
            }
            var dvEsperado = 11 - (suma % 11);
            dv = dv == "K" ? 10 : dv;
            dv = dv == 0 ? 11 : dv;
            return dv == dvEsperado;
        }
        , "RUT inválido.");

    // Validación del formulario
    $("#formulario_votacion").validate({
        rules: {
            nombre_apellido: {
                required: true
            },
            alias: {
                required: true,
                minlength: 5,
                alphanumeric: true,
                contieneLetra: true,
                contieneNumero: true
            },
            rut: {
                required: true,
                rut: true,
                minlength: 8,
            },
            email: {
                required: true,
                email: true
            },
            region: {
                required: true
            },
            comuna: {
                required: true
            },
            candidato: {
                required: true
            },
            "como_se_entero[]": {
                check_min_selected: ":checkbox[name='como_se_entero[]']",
                required: true
            }
        },
        messages: {
            nombre_apellido: {
                required: "No debe quedar en Blanco"
            },
            alias: {
                required: "No debe quedar en Blanco",
                minlength: "Debe tener al menos 5 caracteres",
                alphanumeric: "Debe contener letras y números",                
                contieneLetra: "Debe contener al menos una letra",
                contieneNumero: "Debe contener al menos un número"
                
            },
            rut: {
                required: "No debe quedar en Blanco",
                rut: "Debe ser un RUT válido"
                
            },
            email: {
                required: "No debe quedar en Blanco",
                email: "Debe ser un correo válido"
                
            },
            region: {
                required: "No debe quedar en Blanco"
                
            },
            comuna: {
                required: "No debe quedar en Blanco"
                
            },
            candidato: {
                required: "No debe quedar en Blanco"
                
            },
            "como_se_entero[]": {
                check_min_selected: "Por favor, seleccione al menos dos opciones.",
                required: "No debe quedar en Blanco",
            }
            
        },
        errorElement: "td",
        errorPlacement: function(error, element) {
            if (element.attr("name") === "como_se_entero[]") {
                error.appendTo(element.parent().parent());
            } else {
                error.appendTo(element.parent().parent());
            }
        },
        // Función que envía el formulario vía ajax
        submitHandler: function(form) {
            var data = $(form).serialize();
            $.ajax({
                url: "inc/funciones.php",
                type: "POST",
                data: data,
                success: function(response) {
                    if (response === "success") {
                        alert("Voto registrado con éxito");
                        form.reset();
                    } else {
                        alert("Error al registrar: " + response);
                    }
                }
            });
        }
        
    });    
});

//Función que permite cargar las comunas según la región seleccionada con jquery y se active cuando se seleccione la región
$("#region").change(function() {
    var id_region = $(this).val();
    $.ajax({
        url: "inc/funciones.php",
        type: "POST",
        data: {
            funcion: "obtenerComunasSelect",
            id_region: id_region
        },
        success: function(response) {
            $("#comuna").html(response);
        }
    });
});



    
   
