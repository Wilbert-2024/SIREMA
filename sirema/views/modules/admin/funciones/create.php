<?php 
$permiso = new funcionUsuarioModel(); 
$estado = $permiso->validarPermiso('FUNCR'); 

if(!$estado['Estado']) 
    echo '<script>location.href = "error_403";</script>'; 
?> 


<!-- ENCABEZADO -->
<div class="d-flex align-items-center pt-2 pb-4">

    <!-- Flecha regresar -->
    <a href="admin_funciones_index" 
       class="btn-regresar me-3" 
       title="Regresar"> 

        <i class="fas fa-arrow-left"></i>

    </a> 


    <!-- Título -->
    <div> 
        <h3 class="fw-bold mb-1">Función</h3> 
        <h6 class="op-7 mb-0">Crear Nueva Función</h6> 
    </div> 

</div> 


<div class="row"> 

    <div class="col-md-12"> 

        <div class="card"> 

            <div class="card-header"> 
                <div class="card-title">Crear</div> 
            </div> 


            <div class="card-body"> 

                <div class="row"> 

                    <!-- Controlador -->
                    <div class="col-4"> 

                        <label for="controlador">
                            Controlador
                        </label> 

                        <input 
                            class="form-control" 
                            id="controlador" 
                            placeholder="controlador" 
                            autocomplete="off" 
                            data-bind="value:controlador"
                        > 

                    </div> 


                    <!-- Acción -->
                    <div class="col-4"> 

                        <label for="accion">
                            Acción
                        </label> 

                        <input 
                            class="form-control" 
                            id="accion" 
                            placeholder="accion" 
                            autocomplete="off" 
                            data-bind="value:accion"
                        > 

                    </div> 


                    <!-- Acrónimo -->
                    <div class="col-4"> 

                        <label for="acronimo">
                            Acrónimo
                        </label> 

                        <input 
                            class="form-control" 
                            id="acronimo" 
                            placeholder="acronimo" 
                            autocomplete="off" 
                            data-bind="value:acronimo"
                        > 

                    </div> 

                </div> 


                <!-- BOTÓN CREAR -->
                <div class="card-action"> 

                    <button 
                        class="btn btn-success" 
                        id="submit" 
                        data-bind="click:create"
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