<?php

$permiso = new funcionUsuarioModel();
$estado = $permiso->validarPermiso('ENLCR');

if (!$estado['Estado'])
    echo '<script>location.href = "error_403";</script>';


$enlace = new urlController();


/*
 * Detecta si create.php está siendo
 * mostrado dentro del modal.
 */
$modoModal =
    isset($_GET['modal']) &&
    $_GET['modal'] == '1';

?>


<?php if(!$modoModal): ?>

<!-- ENCABEZADO NORMAL -->
<div
    class="d-flex align-items-left align-items-md-center flex-column flex-md-row pt-2 pb-4"
>

    <div>
        <h3 class="fw-bold mb-3">
            Enlaces
        </h3>

        <h6 class="op-7 mb-2">
            Crear Nuevo Enlace
        </h6>
    </div>


    <div class="ms-md-auto py-2 py-md-0">

        <a
            href="admin_urls_index"
            class="btn btn-primary btn-round"
        >
            Regresar
        </a>

    </div>

</div>

<?php endif; ?>



<div class="row">

    <div class="col-md-12">

        <div
            class="card <?= $modoModal ? 'border-0 shadow-none mb-0' : '' ?>"
        >


            <?php if(!$modoModal): ?>

                <div class="card-header">
                    <div class="card-title">
                        Crear
                    </div>
                </div>

            <?php endif; ?>


            <div class="card-body formulario-enlace">


                <!-- =================================================
                     CAMPOS
                     ================================================= -->
                <div class="formulario-grid">


                    <!-- TEXTO A MOSTRAR -->
                    <div class="form-group-custom">

                        <label for="texto_mostrar">
                            Texto a Mostrar
                        </label>

                        <input
                            class="form-control"
                            id="texto_mostrar"
                            placeholder="Ej. Enlaces, Usuarios, Reportes"
                            autocomplete="off"
                            data-bind="value:texto_mostrar"
                        >

                    </div>



                    <!-- MÓDULO PADRE -->
                    <div class="form-group-custom">

                        <label for="padre_id">
                            Módulo Padre
                        </label>

                        <select
                            class="form-select"
                            id="padre_id"
                            data-bind="value:padre_id"
                        >

                            <?php
                                $enlace->getEnlacesPadres();
                            ?>

                        </select>

                    </div>



                    <!-- MÓDULO -->
                    <div class="form-group-custom">

                        <label for="modulo">
                            Módulo
                        </label>

                        <input
                            class="form-control"
                            id="modulo"
                            placeholder="Ej. admin_urls"
                            autocomplete="off"
                            data-bind="value:modulo"
                        >

                    </div>



                    <!-- ICONO MÓDULO -->
                    <div class="form-group-custom">

                        <label for="icono_modulo">
                            Icono del Módulo
                        </label>

                        <input
                            class="form-control"
                            id="icono_modulo"
                            placeholder="Ej. fas fa-link"
                            autocomplete="off"
                            data-bind="value:icono_modulo"
                        >

                    </div>



                    <!-- ACCIÓN -->
                    <div class="form-group-custom">

                        <label for="accion">
                            Acción
                        </label>

                        <input
                            class="form-control"
                            id="accion"
                            placeholder="Ej. index, create, update"
                            autocomplete="off"
                            data-bind="value:accion"
                        >

                    </div>



                    <!-- ICONO ACCIÓN -->
                    <div class="form-group-custom">

                        <label for="icono_accion">
                            Icono de Acción
                        </label>

                        <input
                            class="form-control"
                            id="icono_accion"
                            placeholder="Ej. fas fa-plus"
                            autocomplete="off"
                            data-bind="value:icono_accion"
                        >

                    </div>


                </div>



           

                <!-- =================================================
                     ESTADO
                     ================================================= -->
                <div class="estado-box">

                    <label class="estado-label">
                        Estado
                    </label>


                    <div class="form-check form-switch estado-switch">

                        <input
                            type="checkbox"
                            class="form-check-input"
                            id="estado"
                            autocomplete="off"
                            data-bind="checked:estado"
                        >

                        <label
                            class="form-check-label"
                            for="estado"
                        >
                            Activo
                        </label>

                    </div>

                </div>



                <!-- =================================================
                     BOTONES
                     ================================================= -->
                <div class="card-action acciones-formulario">


                    <?php if($modoModal): ?>

                        <button
                            type="button"
                            class="btn btn-light btn-cancelar-modal"
                            onclick="
                                window.parent.document
                                    .querySelector(
                                        '#modalCrearEnlace .btn-close'
                                    )
                                    .click();
                            "
                        >
                            Cancelar
                        </button>

                    <?php else: ?>

                        <a
                            class="btn btn-secondary"
                            href="admin_urls_index"
                        >
                            Regresar
                        </a>

                    <?php endif; ?>


                    <!--
                        SE MANTIENE LA FUNCIÓN ORIGINAL
                        DE GUARDADO
                    -->
                    <button
                        class="btn btn-primary btn-guardar-modal"
                        id="submit"
                        data-bind="click:create"
                    >

                        <i class="fas fa-check me-1"></i>

                        Guardar

                    </button>

                </div>


            </div>

        </div>

    </div>

</div>



<?php if($modoModal): ?>

<style>

    /* ============================================================
       LIMPIAR LA PÁGINA CUANDO ESTÁ DENTRO DEL MODAL
       ============================================================ */

    html,
    body {
        margin: 0 !important;
        padding: 0 !important;

        background: #ffffff !important;

        overflow-y: auto !important;
        overflow-x: hidden !important;
    }


    .wrapper,
    .main-panel,
    .container,
    .page-inner {
        width: 100% !important;
        max-width: none !important;

        min-height: auto !important;
        height: auto !important;

        margin: 0 !important;
        padding: 0 !important;
    }


    .main-panel {
        margin-left: 0 !important;
    }


    /* Ocultar elementos de la página completa */
    .sidebar,
    .main-header,
    .footer {
        display: none !important;
    }


    /* Eliminar apariencia de card */
    .card {
        margin: 0 !important;

        border: 0 !important;
        border-radius: 0 !important;

        box-shadow: none !important;
    }



    /* ============================================================
       CONTENIDO DEL FORMULARIO
       ============================================================ */

    .formulario-enlace {
        padding: 22px 24px 24px !important;

        background: #ffffff;
    }



    /* ============================================================
       GRID DE CAMPOS
       ============================================================ */

    .formulario-grid {
        display: grid;

        grid-template-columns:
            minmax(0, 1fr)
            minmax(0, 1fr);

        gap: 18px 16px;
    }



    /* Labels */
    .form-group-custom label {
        display: block;

        margin-bottom: 7px;

        font-size: 13px;
        font-weight: 700;

        color: #344054;
    }



    /* Inputs */
    .form-group-custom .form-control,
    .form-group-custom .form-select {
        width: 100%;

        min-height: 44px;

        padding-left: 12px;
        padding-right: 12px;

        border: 1px solid #d9dee7;
        border-radius: 10px;

        font-size: 14px;

        box-shadow: none;

        background-color: #ffffff;
    }



    /* Focus */
    .form-group-custom .form-control:focus,
    .form-group-custom .form-select:focus {
        border-color: #6c8cff;

        box-shadow:
            0 0 0 3px
            rgba(108, 140, 255, 0.12);
    }



    /* ============================================================
       CAJA DE INFORMACIÓN
       ============================================================ */

    .info-box-enlace {
        display: flex;

        align-items: flex-start;

        gap: 14px;

        margin-top: 22px;

        padding: 16px 18px;

        background: #eef4ff;

        border: 1px solid #d9e6ff;
        border-radius: 12px;
    }


    .info-box-icon {
        width: 36px;
        height: 36px;

        flex-shrink: 0;

        display: flex;

        align-items: center;
        justify-content: center;

        border-radius: 10px;

        background: #dbe8ff;

        color: #2f5bd3;

        font-size: 15px;
    }


    .info-box-title {
        margin-bottom: 4px;

        font-size: 14px;
        font-weight: 700;

        color: #2f5bd3;
    }


    .info-box-text {
        font-size: 12px;

        line-height: 1.5;

        color: #5b6b82;
    }



    /* ============================================================
       ESTADO
       ============================================================ */

    .estado-box {
        margin-top: 20px;
    }


    .estado-label {
        display: block;

        margin-bottom: 8px;

        font-size: 13px;
        font-weight: 700;

        color: #344054;
    }


    .estado-switch {
        display: flex;

        align-items: center;

        gap: 10px;

        padding-top: 4px;
    }


    .estado-switch .form-check-input {
        margin-top: 0;
    }


    .estado-switch .form-check-label {
        font-size: 14px;
        font-weight: 600;

        color: #344054;
    }



    /* ============================================================
       BOTONES
       ============================================================ */

    .acciones-formulario {
        display: flex !important;

        justify-content: flex-end !important;
        align-items: center !important;

        gap: 10px;

        margin-top: 24px !important;

        padding:
            18px
            0
            0
            0 !important;

        border-top:
            1px solid #eceff4 !important;

        background: #ffffff !important;
    }


    .btn-cancelar-modal {
        min-width: 105px;

        padding: 9px 18px;

        border-radius: 10px;

        font-weight: 600;
    }


    .btn-guardar-modal {
        min-width: 115px;

        padding: 9px 18px;

        border-radius: 10px;

        font-weight: 600;
    }



    /* ============================================================
       RESPONSIVE
       ============================================================ */

    @media (max-width: 600px) {

        .formulario-grid {
            grid-template-columns: 1fr;
        }

        .formulario-enlace {
            padding: 18px !important;
        }

    }

</style>

<?php endif; ?>