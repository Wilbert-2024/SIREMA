<?php
$permiso = new funcionUsuarioModel();
$estado = $permiso->validarPermiso('MATRCR');
if(!$estado['Estado'])
    echo '<script>location.href = "error_403";</script>';
?>
<div class="pt-2 pb-4">

    <div class="d-flex align-items-center gap-2">

        
        <a href="registro_matriculados_index" class="btn-regresar"
           title="Regresar">
            <i class="fas fa-arrow-left"></i>
        </a>        
        <h3 class="fw-bold mb-0">Matriculados </h3>

    </div>
    
    <h6 class="op-7 mb-0 subtitulo-registro"> Nuevo Registro</h6>

</div>

<style>


    .btn-regresar { 
        width: 34px; 
        height: 34px;

        display: flex;
        align-items: center;
        justify-content: center;

        color: #242525;
        text-decoration: none;

        border-radius: 8px;
        font-size: 17px;

        transition: all 0.2s ease;
    }

    .btn-regresar:hover {
        background-color: #e9ecef;
        color: #0d6efd;
    }

    .subtitulo-registro {
        margin-left: 42px;
        margin-top: 3px;
    }

    label {
        font-weight: bold;
    }


    /* CORRECCION: estilos locales; conserva el azul y el color de la tabla.
       Si el espacio es muy reducido, el desplazamiento queda dentro del marco. */
    #detalle_matriculado_contenedor .detalle-tabla-marco {
        width: 100%;
        max-width: 100%;
        overflow-x: auto;
    }

    #detalle_matriculado_contenedor .detalle-tabla {
        width: 100%;
        min-width: 760px;
        table-layout: fixed;
        margin-bottom: 0;
    }

    /* CORRECCION: limita el espacio interno impuesto por la plantilla.
       No se permite partir palabras como GRUPO o CARRERA por la mitad. */
    #detalle_matriculado_contenedor .detalle-tabla th,
    #detalle_matriculado_contenedor .detalle-tabla td {
        box-sizing: border-box;
        padding: 12px 10px !important;
        vertical-align: middle;
        word-break: normal !important;
        overflow-wrap: normal !important;
    }

    /* Encabezados legibles: los saltos se indican expresamente con br. */
    #detalle_matriculado_contenedor .detalle-tabla th {
        white-space: nowrap !important;
        font-size: 12px;
        line-height: 1.5;
        letter-spacing: 0.03em;
    }

    /* Carrera y turno se distribuyen por palabras completas. */
    #detalle_matriculado_contenedor .detalle-tabla td {
        white-space: normal !important;
        line-height: 1.5;
    }

    /* Centra las columnas breves y deja Carrera/Turno alineados a la izquierda. */
    #detalle_matriculado_contenedor .detalle-tabla th:not(:first-child):not(:nth-child(4)),
    #detalle_matriculado_contenedor .detalle-tabla td:not(:first-child):not(:nth-child(4)) {
        text-align: center;
    }

    /* Cantidades uniformes, contenidas y con espacio para leer el numero. */
    #detalle_matriculado_contenedor .detalle-tabla input[type="number"] {
        box-sizing: border-box;
        width: 100%;
        max-width: 100%;
        min-width: 0;
        height: 34px;
        padding: 4px 6px;
        border: 1px solid #adb5bd;
        border-radius: 4px;
    }

    /* Mantiene el icono original de eliminar dentro de la columna Accion. */
    #detalle_matriculado_contenedor .detalle-tabla td:last-child i {
        font-size: 1.5rem;
    }

</style>

<!-- NUEVO: ID utilizado solo por las reglas de esta vista. -->
<form id="form_matriculado" data-bind="submit: guardar">
    


<div class="row">
    <div class="col-12">
        <div class="card">
           <div class="card-body">
               <!--First Row-->
               <div class="row mb-3">
                   <div class="col-4">
                       <label for="anio_lectivo_id">Año Lectivo</label>
                       <select class="form-select" id="anio_lectivo_id" data-bind="value: anio_lectivo_id,html: select_anios_lectivos, event:{change: select_anio_lectivo_change}"></select>
                   </div>

                   <div class="col-4">
                       <label for="centro_id">Centro</label>
                       <select class="form-select" id="centro_id" data-bind="value: centro_id,html:select_centros, event:{change: select_centro_change}"></select>
                   </div>

                   <div class="col-4">
                       <label for="carrera_id">Carrera</label>
                       <select class="form-select" id="carrera_id" data-bind="value:carrera_id, html:select_carreras, event:{change: select_carrera_change}"></select>
                   </div>

               </div>

               <!--Second Row-->
               <div class="row">
                   <div class="col-3">
                       <label for="tipo_ingreso_id">Tipo de Ingreso</label>
                       <select class="form-select" id="tipo_ingreso_id" data-bind="value:tipo_ingreso_id, html:select_tipos_ingresos, event:{change: select_tipo_ingreso_change}"></select>
                   </div>


                   <div class="col-3">
                       <label for="semestre_id">Semestre</label>
                       <select class="form-select" id="semestre_id" data-bind="value:semestre_id, html:select_semestre, event:{change:select_semestre_change}"></select>
                   </div>

               </div>

               <!-- NUEVO: oculto hasta completar los cinco campos del encabezado.
                    Se conserva el contenido y todos sus data-bind originales. -->
               <div id="detalle_matriculado_contenedor" style="display: none;">
               <!--Third Row-->
               <hr>
               <div class="card">
                   <div class="card-header">
                       <div class="h5">Detalle de Matriculado</div>
                   </div>
                   <div class="card-body bg bg-primary bg-gradient">
                       <div class="row">

                           <div class="col-2">
                               <label for="anio_carrera_id">Año de Carrera</label>
                               <select class="form-select" id="anio_carrera_id" data-bind="html:select_anio_carrera"></select>
                           </div>

                           <div class="col-2">
                               <label for="grupo_id">Grupo</label>
                               <select class="form-select" id="grupo_id" data-bind="html:select_grupo"></select>
                           </div>

                           <div class="col-2">
                               <label for="modalidad_id">Modalidad</label>
                               <select class="form-select" id="modalidad_id" data-bind="html:select_modalidad, event:{change: select_modalidad_change}"></select>
                           </div>

                           <div class="col-2">
                               <label for="turno_id">Turno</label>
                               <select class="form-select" id="turno_id" data-bind="html:select_turno"></select>
                           </div>

                           <div class="col-3">
                               <a class="btn btn-info mt-3" href="#" data-bind="click: agregarDetalle"><i class="fas fa-angle-double-down" ></i> Agregar</a>
                           </div>
                       </div>

                       <div class="row mt-3">
                           <div class="col-12">
                               <!-- NUEVO: tabla contenida en el marco azul. -->
                               <div class="detalle-tabla-marco">
                               <table class="table table-success detalle-tabla">
                                   <!-- NUEVO: las siete columnas suman el 100% del ancho. -->
                                   <colgroup>
                                       <col style="width: 28%;">
                                       <col style="width: 11%;">
                                       <col style="width: 9%;">
                                       <col style="width: 17%;">
                                       <col style="width: 13%;">
                                       <col style="width: 13%;">
                                       <col style="width: 9%;">
                                   </colgroup>
                                   <thead class="">
                                    <tr>
                                        <th>Carrera</th>
                                        <th>Año<br>Carrera</th>
                                        <th>Grupo</th>
                                        <th>Turno</th>
                                        <th>Cant.<br>Femenino</th>
                                        <th>Cant.<br>Masculino</th>
                                        <th>Acción</th>
                                    </tr>
                                   </thead>
                                   <tbody data-bind="foreach: DetalleMatriculados">
                                        <tr>
                                            <td data-bind="text: Carrera"></td>
                                            <td data-bind="text: AnioCarreraDescripcion"></td>
                                            <td data-bind="text: GrupoDescripcion"></td>
                                            <td data-bind="text: TurnoDescripcion"></td>
                                            <td>
                                                <input type="number" min="0" step="1" autocomplete="off" class="" data-bind="value: Femeninos">
                                            </td>
                                            <td>
                                                <input type="number" min="0" step="1" autocomplete="off" class="" data-bind="value:Masculinos">
                                            </td>
                                            <td>
                                                <a class="text text-danger" href="#" data-bind="click: remover"><i class="fas fa-backspace fa-2x"></i></a>
                                            </td>
                                        </tr>
                                   </tbody>
                               </table>
                               </div><!-- NUEVO: fin del marco de la tabla. -->
                           </div>
                       </div>
                   </div>
               </div>


               <!--Fourt Row-->
               <div class="row mt-5">
                   <div class="col-3">
                    <!-- NUEVO: Guardar comparte el contenedor del detalle;
                         ambos se muestran y ocultan con la misma validacion. -->
                    <button type="submit" class="btn btn-primary">Guardar</button>

                   </div>
               </div>
               </div><!-- NUEVO: fin del contenedor de detalle y Guardar. -->
           </div>
        </div>
    </div>
</div>

<!-- CORRECCION: cierre correcto del formulario. -->
</form>



<!-- NUEVO: reglas de esta vista. El archivo create.js original no se modifica.
     Este bloque no carga librerias, no hace consultas y no llama a applyBindings. -->
<script>
(function () {
    var formulario = document.getElementById('form_matriculado');
    var detalle = document.getElementById('detalle_matriculado_contenedor');
    if (!formulario || !detalle) return;

    var ids = ['anio_lectivo_id', 'centro_id', 'carrera_id', 'tipo_ingreso_id', 'semestre_id'];
    var campos = ids.map(function (id) { return document.getElementById(id); });
    if (campos.some(function (campo) { return !campo; })) return;
    var tipoIngreso = campos[3];
    var semestre = campos[4];
    // NUEVO: selector existente de Año de Carrera; conserva las opciones de la BD.
    var anioCarrera = document.getElementById('anio_carrera_id');
    var actualizando = false;

    // Normaliza las etiquetas visibles, pero conserva los valores/IDs de la BD.
    // Admite "1° ingreso", "1.º ingreso", "1er ingreso" y "Primer ingreso".
    function etiqueta(texto) {
        return String(texto || '').toLowerCase()
            .replace(/[°ºª.]/g, '').replace(/\s+/g, ' ').trim();
    }

    // Sigue el criterio del JS original: una seleccion valida tiene un ID mayor a 0.
    function encabezadoCompleto() {
        return campos.every(function (campo) {
            return campo.selectedIndex >= 0 && Number(campo.value) > 0;
        });
    }

    function actualizarVista() {
        // Evita repetir la regla cuando se notifica al JS el cambio de semestre.
        if (actualizando) return;
        actualizando = true;
        try {
            var opcionTipo = tipoIngreso.options[tipoIngreso.selectedIndex];
            var primerIngreso = Number(tipoIngreso.value) > 0 && opcionTipo &&
                /^(?:1\s*(?:er|ro|o)?|primer|primero) ingreso$/.test(etiqueta(opcionTipo.text));

            // Solo primer ingreso bloquea Semestre. Los otros tipos permiten elegir.
            semestre.disabled = Boolean(primerIngreso);
            if (primerIngreso) {
                var valorAnterior = semestre.value;
                var indicePrimero = -1;
                for (var i = 0; i < semestre.options.length; i++) {
                    var opcion = semestre.options[i];
                    if (Number(opcion.value) > 0 &&
                        /^(?:(?:i|1\s*(?:er|ro|o)?|primer|primero) semestre|semestre (?:i|1)|i)$/.test(etiqueta(opcion.text))) {
                        indicePrimero = i;
                        break;
                    }
                }

                // Usa la opcion real recibida de la BD, sin inventar su ID.
                // Si aun no se ha cargado I semestre, mantiene el detalle oculto.
                semestre.selectedIndex = indicePrimero;
                if (semestre.value !== valorAnterior) {
                    // Notifica el cambio al evento ORIGINAL de create.js para que
                    // el valor que se guarda coincida con el mostrado en pantalla.
                    semestre.dispatchEvent(new Event('change', { bubbles: true }));
                }
            }

            // NUEVO: primer ingreso corresponde al año "I" (numero romano).
            // Busca su ID real entre las opciones; no supone que el ID sea 1.
            if (anioCarrera) {
                anioCarrera.disabled = Boolean(primerIngreso);
                if (primerIngreso) {
                    var indicePrimerAnio = -1;
                    for (var j = 0; j < anioCarrera.options.length; j++) {
                        var opcionAnio = anioCarrera.options[j];
                        if (Number(opcionAnio.value) > 0 && etiqueta(opcionAnio.text) === 'i') {
                            indicePrimerAnio = j;
                            break;
                        }
                    }
                    // Si aun no llega el catalogo, queda sin seleccion hasta recibirlo.
                    // create.js lee este mismo selector al pulsar Agregar.
                    anioCarrera.selectedIndex = indicePrimerAnio;
                }
                // Al cambiar a Reingreso se habilita de nuevo, sin borrar las filas.
            }

            // Oculta sin borrar filas. Centro y Carrera conservan su logica original.
            detalle.style.display = encabezadoCompleto() ? '' : 'none';
        } finally {
            actualizando = false;
        }
    }

    // Los cambios del usuario se procesan despues de los eventos de cada selector.
    formulario.addEventListener('change', function (evento) {
        // NUEVO: aplica tambien la regla cuando cambia Año de Carrera.
        if (ids.indexOf(evento.target.id) !== -1 || evento.target.id === 'anio_carrera_id') actualizarVista();
    });

    // Detecta cuando create.js inserta las opciones recibidas de la base de datos.
    // No depende de temporizadores ni del orden en que llegan las respuestas.
    var observador = new MutationObserver(actualizarVista);
    campos.forEach(function (campo) {
        observador.observe(campo, { childList: true, subtree: true, characterData: true });
    });

    // NUEVO: selecciona "I" tambien si los años llegan despues de elegir primer ingreso.
    if (anioCarrera) {
        observador.observe(anioCarrera, { childList: true, subtree: true, characterData: true });
    }

    // Evita guardar filas ocultas si algun campo ha vuelto a "Seleccione".
    // La captura comprueba el encabezado antes del submit: guardar original.
    formulario.addEventListener('submit', function (evento) {
        actualizarVista();
        if (!encabezadoCompleto()) {
            evento.preventDefault();
            evento.stopImmediatePropagation();
            var mensaje = 'Seleccione Año Lectivo, Centro, Carrera, Tipo de Ingreso y Semestre.';
            if (window.Swal && typeof window.Swal.fire === 'function') {
                window.Swal.fire('Atención!', mensaje, 'error');
            } else {
                window.alert(mensaje);
            }
        }
    }, true);

    // Oculta el detalle tambien al abrir la pagina, antes de recibir los catalogos.
    actualizarVista();
})();
</script>
