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

</style>

<form data-bind="submit: guardar">
    


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
                               <table class="table table-success">
                                   <thead class="">
                                    <tr>
                                        <th>Carrera</th>
                                        <th>Año Carrera</th>
                                        <th>Grupo</th>
                                        <th>Turno</th>
                                        <th>Cant. Femenino</th>
                                        <th>Cant. Masculino</th>
                                        <th>Action</th>
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
                           </div>
                       </div>
                   </div>
               </div>


               <!--Fourt Row-->
               <div class="row mt-5">
                   <div class="col-3">
                    <button type="submit" class="btn btn-primary">Guardar</button>

                   </div>
               </div>
           </div>
        </div>
    </div>
</div>

</from>


