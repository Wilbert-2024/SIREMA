<!-- Modal Reporte por Tipo Ingreso y Centro SEDE/Cur (opcional)-->
<div class="modal fade" id="reporteTipoIngreseCentro" tabindex="-1" aria-labelledby="reporteTipoIngreseCentroLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="reporteTipoIngreseCentroLabel">Reporte Tipo Ingreso - Centro (SEDE/CUR)</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form method="post" action="reporte_informes_reporteMatriculadosPorTipoIngresoCentro" id="reporteTipoIngreseCentroFrm" target="_blank">
                    <div class="row">
                        <div class="col-4">
                            <label>Año Lectivo</label>
                            <select class="form-select" id="AnioLectivoId_rep01" name="AnioLectivoId" required></select>
                        </div>

                        <div class="col-4">
                            <label>Tipo Ingreso</label>
                            <select class="form-select" id="TipoIngresoId_rep01" name="TipoIngresoId" required></select>
                        </div>
                        <div class="col-4">
                            <label>Semestre</label>
                            <select class="form-select" id="SemestreId_rep01" name="SemestreId" required></select>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-12">
                            <label>Centro</label>
                            <select class="form-select" id="CentroId_rep01" name="CentroId"></select>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cerrar</button>
                <button type="button" class="btn btn-secondary" id="reporteTipoIngreseCentroBTN">Ver Reporte</button>
            </div>
        </div>
    </div>
</div>



<!-- Modal Reporte por Tipo Ingreso y Centro Unicam (opcional)-->
<div class="modal fade" id="reporteTipoIngresoUnicam" tabindex="-1" aria-labelledby="reporteTipoIngresoUnicamLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="rreporteTipoIngresoUnicamLabel">Reporte Tipo Ingreso - Centro Unicam</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form method="post" action="reporte_informes_reporteMatriculadosPorTipoIngresoCentroUnicam" id="reporteTipoIngreseCentroUnicamFrm" target="_blank">
                    <div class="row">
                        <div class="col-4">
                            <label>Año Lectivo</label>
                            <select class="form-select" id="AnioLectivoId_rep02" name="AnioLectivoId" required></select>
                        </div>

                        <div class="col-4">
                            <label>Tipo Ingreso</label>
                            <select class="form-select" id="TipoIngresoId_rep02" name="TipoIngresoId" required></select>
                        </div>
                        <div class="col-4">
                            <label>Semestre</label>
                            <select class="form-select" id="SemestreId_rep02" name="SemestreId" required></select>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-12">
                            <label>Centro</label>
                            <select class="form-select" id="CentroId_rep02" name="CentroId"></select>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cerrar</button>
                <button type="button" class="btn btn-secondary" id="reporteTipoIngreseCentroUnicamBTN">Ver Reporte</button>
            </div>
        </div>
    </div>
</div>

<!-- Modal Reporte por Tipo Ingreso y Centro Unicam (opcional)-->
<div class="modal fade" id="reporteTipoIngresoUnicam" tabindex="-1" aria-labelledby="reporteTipoIngresoUnicamLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="rreporteTipoIngresoUnicamLabel">Reporte Tipo Ingreso - Centro Unicam</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form method="post" action="reporte_informes_reporteMatriculadosPorTipoIngresoCentroUnicam" id="reporteTipoIngreseCentroUnicamFrm" target="_blank">
                    <div class="row">
                        <div class="col-6">
                            <label>Tipo Ingreso</label>
                            <select class="form-select" id="TipoIngresoId_rep02" name="TipoIngresoId" required></select>
                        </div>
                        <div class="col-6">
                            <label>Semestre</label>
                            <select class="form-select" id="SemestreId_rep02" name="SemestreId" required></select>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-12">
                            <label>Centro</label>
                            <select class="form-select" id="CentroId_rep02" name="CentroId"></select>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cerrar</button>
                <button type="button" class="btn btn-secondary" id="reporteTipoIngreseCentroUnicamBTN">Ver Reporte</button>
            </div>
        </div>
    </div>
</div>

<!-- Modal Reporte por Tipo Ingreso y Centro Unicam (opcional)-->
<div class="modal fade" id="reporteConsolidadoPorCentro" tabindex="-1" aria-labelledby="reporteConsolidadPorCentroLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="reporteConsolidadoPorCentroLabel">Reporte Consolidado por Centro</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form method="post" action="reporte_informes_reporteConsolidadoPorCentro" id="reporteConsolidadoPorCentroFrm" target="_blank">
                    <div class="row">
                        <div class="col-6">
                            <label>Año Lectivo</label>
                            <select class="form-select" id="AnioLectivoId_rep03" name="AnioLectivoId" required></select>
                        </div>
                        <div class="col-6">
                            <label>Semestre</label>
                            <select class="form-select" id="SemestreId_rep03" name="SemestreId" required></select>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-12">
                            <label>Centro</label>
                            <select class="form-select" id="CentroId_rep03" name="CentroId"></select>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cerrar</button>
                <button type="button" class="btn btn-secondary" id="reporteConsolidadoPorCentroBTN">Ver Reporte</button>
            </div>
        </div>
    </div>
</div>


<!-- Modal Reporte por Area de Conocimiento con Anio (abligatorio)-->
<div class="modal fade" id="reporteConsolidadoPorAreaC" tabindex="-1" aria-labelledby="reporteConsolidadoPorAreaCLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="reporteConsolidadoPorAreaCLabel">Reporte Consolidado por Area de Conocimiento</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form method="post" action="reporte_informes_reporteConsolidadoPorAreaCon" id="reporteConsolidadoPorAreaConFrm" target="_blank">
                    <div class="row">
                        <div class="col-12">
                            <label>Año Lectivo</label>
                            <select class="form-select" id="AnioLectivoId_rep04" name="AnioLectivoId" required></select>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cerrar</button>
                <button type="button" class="btn btn-secondary" id="reporteConsolidadoPorAreaConBTN">Ver Reporte</button>
            </div>
        </div>
    </div>
</div>

<!-- Modal Reporte Consolidado de BICU para CNU con Anio (abligatorio)-->
<div class="modal fade" id="reporteConsolidadoBicuCnu" tabindex="-1" aria-labelledby="reporteConsolidadoBicuCnuLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="reporteConsolidadoBicuCnuLabel">Reporte Consolidado de BICU - Para CNU</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form method="post" action="reporte_informes_reporteConsolidadoBicuCnu" id="reporteConsolidadoBicuCnuFrm" target="_blank">
                    <div class="row">
                        <div class="col-12">
                            <label>Año Lectivo</label>
                            <select class="form-select" id="AnioLectivoId_rep05" name="AnioLectivoId" required></select>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cerrar</button>
                <button type="button" class="btn btn-secondary" id="reporteConsolidadoBicuCnuBTN">Ver Reporte</button>
            </div>
        </div>
    </div>
</div>



<!-- Modal Reporte Ultima actualizacion de registro por Centro-->
<div class="modal fade" id="ultimaActualizacionPorCarrera" tabindex="-1" aria-labelledby="ultimaActualizacionPorCarreraLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="ultimaActualizacionPorCarreraLabel">Reporte de Ultima Actualizacion de registro</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form method="post" action="reporte_informes_ultimaActualizacionPorCarrera" id="ultimaActualizacionPorCarreraFrm" target="_blank">
                    <div class="row">
                        <div class="row">
                            <div class="col-6">
                                <label>Año Lectivo</label>
                                <select class="form-select" id="AnioLectivoId_rep06" name="AnioLectivoId" required></select>
                            </div>

                            <div class="col-6">
                                <label>Tipo Ingreso</label>
                                <select class="form-select" id="TipoIngresoId_rep06" name="TipoIngresoId" required></select>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-6">
                                <label>Semestre</label>
                                <select class="form-select" id="SemestreId_rep06" name="SemestreId" required></select>
                            </div>


                                <div class="col-6">
                                    <label>Centro</label>
                                    <select class="form-select" id="CentroId_rep06" name="CentroId"></select>
                                </div>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cerrar</button>
                <button type="button" class="btn btn-secondary" id="ultimaActualizacionPorCarreraBTN">Ver Reporte</button>
            </div>
        </div>
    </div>
</div>

