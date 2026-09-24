$(function () {
    const vm = {
        matriculas: ko.observableArray([]),
        estado: ko.observable('Cargando matrículas...')
    };
    ko.applyBindings(vm, document.getElementById('reporte-etnico'));
    axios.post('views/ajax/registro/matriculados/action.php', {type: 'listarReporteEtnico'})
        .then(function (response) {
            if (!Array.isArray(response.data)) {
                vm.estado('No tienes permiso para consultar este reporte.');
                return;
            }
            vm.matriculas(response.data.map(registro => ({
                Id: Number(registro.Id),
                Centro: registro.Centro,
                Carrera: registro.Carrera,
                Total: Number(registro.Total),
                TotalEtnias: Number(registro.TotalEtnias),
                completo: Number(registro.NumEtnias) > 0 &&
                    Number(registro.TotalEtnias) === Number(registro.Total)
            })));
            vm.estado(response.data.length ? '' : 'No hay matrículas disponibles para el reporte.');
        })
        .catch(function () { vm.estado('No fue posible cargar las matrículas.'); });
});
