function DistribucionEtnicaVm() {
    const self = this;
    const id = Number(document.getElementById('formulario-etnias').dataset.matriculaId);
    self.cargado = ko.observable(false);
    self.estado = ko.observable('Cargando matrícula y etnias...');
    self.centro = ko.observable('');
    self.carrera = ko.observable('');
    self.total = ko.observable(0);
    self.etnias = ko.observableArray([]);
    self.suma = ko.pureComputed(() => self.etnias().reduce(
        (suma, etnia) => suma + (Number(etnia.cantidad()) || 0), 0));

    self.cargar = function () {
        axios.post('views/ajax/registro/matriculados/action.php',
            {type: 'getDistribucionEtnica', id: id})
            .then(function (response) {
                const datos = response.data;
                if (!datos || typeof datos !== 'object' || !Array.isArray(datos.Etnias)) {
                    self.estado('No se encontró la matrícula o no tienes acceso a su centro.');
                    return;
                }
                self.centro(datos.Centro);
                self.carrera(datos.Carrera);
                self.total(Number(datos.Total));
                self.etnias(datos.Etnias.map(etnia => ({
                    id: Number(etnia.EtniaId),
                    nombre: etnia.DescripcionEtnia,
                    cantidad: ko.observable(etnia.Cantidad)
                })));
                self.estado('');
                self.cargado(true);
            })
            .catch(function () { self.estado('No fue posible cargar la distribución.'); });
    };

    self.guardar = function () {
        const filas = self.etnias();
        if (!filas.length || filas.some(etnia => !/^(0|[1-9][0-9]*)$/.test(String(etnia.cantidad()))) ||
            self.suma() !== self.total()) {
            Swal.fire('Distribución incorrecta', 'Las cantidades deben ser enteras, no negativas y sumar el total de matrícula.', 'error');
            return;
        }
        axios.post('views/ajax/registro/matriculados/action.php', {
            type: 'guardarDistribucionEtnica',
            registro: {MatriculaId: id, Etnias: filas.map(etnia => ({
                EtniaId: etnia.id, Cantidad: etnia.cantidad()
            }))}
        }).then(function (response) {
            if (response.data === 'ok') {
                Swal.fire('Guardado', 'La distribución étnica se guardó correctamente.', 'success');
            } else if (response.data === 'etniasInvalidas') {
                Swal.fire('Distribución incorrecta', 'Verifica las cantidades y la suma por etnia.', 'error');
            } else if (response.data === 'denegado' || response.data === 'noEncontrada') {
                Swal.fire('Acceso denegado', 'No tienes acceso a esta matrícula.', 'error');
            } else {
                Swal.fire('Error', 'No fue posible guardar la distribución.', 'error');
            }
        }).catch(function () { Swal.fire('Error', 'No fue posible guardar la distribución.', 'error'); });
    };
}

$(function () {
    const vm = new DistribucionEtnicaVm();
    ko.applyBindings(vm, document.getElementById('formulario-etnias'));
    vm.cargar();
});
