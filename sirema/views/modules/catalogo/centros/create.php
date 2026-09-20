<?php
$permiso = new funcionUsuarioModel();
$estado = $permiso->validarPermiso('CENCR');

if(!$estado['Estado'])
    echo '<script>location.href = "error_403";</script>';
?>


<!-- ENCABEZADO -->
<div class="d-flex align-items-center pt-2 pb-4">

    <!-- Flecha regresar -->
    <a href="catalogo_centros_index"
       class="btn-regresar me-3"
       title="Regresar">

        <i class="fas fa-arrow-left"></i>

    </a>


    <!-- Título -->
    <div>
        <h3 class="fw-bold mb-1">Centros</h3>
        <h6 class="op-7 mb-0">Crear Nuevo Centro</h6>
    </div>

</div>


<div class="row">

    <div class="col-md-12">

        <div class="card">

            <div class="card-header">
                <div class="card-title">Nuevo</div>
            </div>


            <div class="card-body">

                <div class="row mb-2">

                    <div class="col-6">

                        <label for="descripcion_centro">
                            Centro
                        </label>

                        <input
                            type="text"
                            class="form-control"
                            id="descripcion_centro"
                            data-bind="value: descripcion_centro"
                            placeholder="Nombre del Centro"
                            autocomplete="off"
                        >

                    </div>


                    <div class="col-6">

                        <label for="tipo_centro_id">
                            Seleccione el Tipo de Centro
                        </label>

                        <select
                            class="form-select"
                            id="tipo_centro_id"
                            data-bind="
                                value:tipo_centro_id,
                                html:selectTipoCentros,
                                event:{change:getTipoCentro}
                            "
                        >
                        </select>

                    </div>

                </div>


                <div class="row">

                    <div class="col-6">

                        <label for="comunidad_id">
                            Seleccione la Comunidad
                        </label>

                        <select
                            class="form-select"
                            id="comunidad_id"
                            data-bind="
                                value:comunidad_id,
                                html:selectComunidades,
                                event:{change:getComunidad}
                            "
                        >
                        </select>

                    </div>


                    <div class="col-6" data-bind="visible: esHijo">

                        <label for="padre_id">
                            Seleccione el Centro Padre
                        </label>

                        <select
                            class="form-select"
                            id="padre_id"
                            data-bind="
                                value:padre_id,
                                html:selectCentrosPadres,
                                event:{change:getCentroPadre}
                            "
                        >
                        </select>

                    </div>

                </div>


                <!-- BOTÓN CREAR -->
                <div class="card-action">

                    <button
                        class="btn btn-success"
                        id="submit"
                        data-bind="click:guardar"
                    >
                        Crear
                    </button>

                </div>

            </div>

        </div>

    </div>

</div>


<style>

    /* Flecha simple al lado izquierdo del título */
    .btn-regresar {
        width: 28px;
        height: 34px;

        display: flex;
        align-items: center;
        justify-content: center;

        color: #111827;
        text-decoration: none;

        font-size: 16px;

        transition: color 0.2s ease;
    }

    .btn-regresar:hover {
        color: #0d6efd;
    }

</style>