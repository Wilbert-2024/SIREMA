<?php 
$permiso = new funcionUsuarioModel(); 
$estado = $permiso->validarPermiso('USCR'); 

if(!$estado['Estado']) 
    echo '<script>location.href = "error_403";</script>'; 
?> 


<!-- ENCABEZADO -->
<div class="d-flex align-items-center pt-2 pb-4">

    <!-- Flecha regresar -->
    <a href="admin_users_index" 
       class="btn-regresar me-3" 
       title="Regresar"> 

        <i class="fas fa-arrow-left"></i>

    </a> 


    <!-- Título -->
    <div> 
        <h3 class="fw-bold mb-1">Usuario</h3> 
        <h6 class="op-7 mb-0">Crear Nuevo Usuario</h6> 
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

                        <label for="usuario">
                            Nombre Usuario
                        </label> 

                        <input 
                            type="text" 
                            class="form-control" 
                            id="usuario" 
                            data-bind="value: usuario" 
                            placeholder="Nombre del Usuario" 
                            autocomplete="off"
                        > 

                    </div> 


                    <div class="col-6"> 

                        <label for="centro_id">
                            Seleccione el Centro
                        </label> 

                        <select 
                            class="form-select" 
                            id="centro_id" 
                            data-bind="
                                value:centro_id,
                                html:selectCentros,
                                event:{change:getCentro}
                            "
                        >
                        </select> 

                    </div> 

                </div> 


                <div class="row mt-2"> 

                    <div class="col-2"></div> 

                    <div class="col-8"> 

                        <label for="clave">
                            Contraseña del Usuario
                        </label> 

                        <label 
                            class="form-label" 
                            data-bind="text: clave" 
                            style="font-weight: bolder"
                        >
                        </label> 

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