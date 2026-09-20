<?php
$permiso = new funcionUsuarioModel();
$estado = $permiso->validarPermiso('ENLIN');

if(!$estado['Estado'])
    echo '<script>location.href = "error_403";</script>';
?>

<div
    class="d-flex align-items-left align-items-md-center flex-column flex-md-row pt-2 pb-4"
>
    <div>
        <h3 class="fw-bold mb-3">Enlaces</h3>
        <h6 class="op-7 mb-2">Administración de Enlaces</h6>
    </div>

    <div class="ms-md-auto py-2 py-md-0">

        <!-- Abrir modal para crear enlace -->
        <button
            type="button"
            class="btn btn-primary btn-round"
            data-bs-toggle="modal"
            data-bs-target="#modalCrearEnlace"
        >
            <i class="fas fa-plus me-1"></i>
            Crear Enlace
        </button>

    </div>
</div>


<!-- LISTADO -->
<div class="row">
    <div class="col-12">

        <div class="card">

            <div class="card-header">
                <h4 class="card-title">Enlaces</h4>
            </div>

            <div class="card-body">

                <div class="table-responsive">

                    <table
                        id="basic-datatables"
                        class="display table table-striped table-hover"
                    >

                        <thead>
                            <tr>
                                <th>TextoMostrar</th>
                                <th>Modulo</th>
                                <th>Padre</th>
                                <th>IconoModulo</th>
                                <th>Accion</th>
                                <th>IconoAccion</th>
                                <th>Estado</th>
                                <th>Accion</th>
                            </tr>
                        </thead>

                        <tfoot>
                            <tr>
                                <th>TextoMostrar</th>
                                <th>Modulo</th>
                                <th>Padre</th>
                                <th>IconoModulo</th>
                                <th>Accion</th>
                                <th>IconoAccion</th>
                                <th>Estado</th>
                                <th>Accion</th>
                            </tr>
                        </tfoot>

                        <tbody>

                            <?php
                            $enlace = new urlController();
                            echo $enlace->index();
                            ?>

                        </tbody>

                    </table>

                </div>

            </div>

        </div>

    </div>
</div>


<!-- =========================================================
     MODAL CREAR ENLACE
     ========================================================= -->
<div
    class="modal fade"
    id="modalCrearEnlace"
    tabindex="-1"
    aria-labelledby="modalCrearEnlaceLabel"
    aria-hidden="true"
>

    <div class="modal-dialog modal-dialog-centered modal-enlace">

        <div class="modal-content">

            <!-- CABECERA -->
            <div class="modal-header">

                <div>
                    <h5
                        class="modal-title"
                        id="modalCrearEnlaceLabel"
                    >
                        Crear nuevo enlace
                    </h5>

                    <p class="modal-subtitulo">
                        Complete la información del nuevo enlace
                    </p>
                </div>

                <button
                    type="button"
                    class="btn-close"
                    data-bs-dismiss="modal"
                    aria-label="Cerrar"
                ></button>

            </div>


            <!-- CONTENIDO -->
            <div class="modal-body">

                <iframe
                    id="iframeCrearEnlace"
                    src="admin_urls_create?modal=1"
                    class="iframe-crear-enlace"
                    title="Crear enlace"
                    onload="verificarCreacionEnlace()"
                ></iframe>

            </div>

        </div>

    </div>

</div>


<style>

    /* Tamaño del modal */
    #modalCrearEnlace .modal-enlace {
        width: calc(100% - 30px);
        max-width: 620px;
    }


    /* Contenedor */
    #modalCrearEnlace .modal-content {
        border: 0;
        border-radius: 14px;
        overflow: hidden;

        box-shadow:
            0 20px 55px rgba(0, 0, 0, 0.20);
    }


    /* Encabezado */
    #modalCrearEnlace .modal-header {
        padding: 18px 20px;
        border-bottom: 1px solid #e8ebf0;
    }


    /* Título */
    #modalCrearEnlace .modal-title {
        margin: 0;

        font-size: 17px;
        font-weight: 700;

        color: #26345d;
    }


    /* Subtítulo */
    #modalCrearEnlace .modal-subtitulo {
        margin: 3px 0 0;

        font-size: 12px;

        color: #8a93a3;
    }


    /* Contenido del modal */
    #modalCrearEnlace .modal-body {
        padding: 0;

        background: #ffffff;
    }


    /* Página create dentro del modal */
    .iframe-crear-enlace {
        width: 100%;
        height: 560px;

        display: block;

        border: 0;

        background: #ffffff;
    }

</style>


<script>

    function verificarCreacionEnlace()
    {
        const iframe =
            document.getElementById('iframeCrearEnlace');

        try
        {
            const ruta =
                iframe.contentWindow.location.href;

            /*
             * Si create redirige nuevamente al index,
             * significa que terminó el proceso.
             */
            if (
                ruta.includes('admin_urls_index') &&
                !ruta.includes('admin_urls_create')
            )
            {
                location.reload();
            }

        }
        catch(error)
        {
            // El iframe continúa funcionando normalmente.
        }
    }


    /*
     * Limpiar el formulario cuando se cierre el modal.
     */
    document
        .getElementById('modalCrearEnlace')
        .addEventListener(
            'hidden.bs.modal',
            function ()
            {
                document
                    .getElementById('iframeCrearEnlace')
                    .src = 'admin_urls_create?modal=1';
            }
        );

</script>