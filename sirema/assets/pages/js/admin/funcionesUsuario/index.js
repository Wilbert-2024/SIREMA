ko.validation.registerExtenders();
ko.validation.init(
    {
        registerExtenders: true,
        errorsAsTitle: false,
        decorateInputElement: true,
        errorElementClass: "is-invalid",
        errorMessageClass: "invalid-feedback",
    },
    true
);

/*
* Conseguir todos los usuarios de la base de datos
* */
function getUsuarios()
{
    axios.post("views/ajax/admin/funcionesUsuario/action.php", { type: "getUsuarios"})
        .then(function(response) {
            let usuarios = response.data;
           usuarios.forEach((u) => {
                bind.ListaDeUsuariosABuscar.push(new addUsuarioAListaBuscar(u.Id, u.email));
            })
        })
        .catch(function(error) {
            console.log(error)
        })
}

/*
* Conseguir los registros no pertenecientes y pertenecientes al usuario selecionado
* u funcion seleccionado
* */

function getRegistrosUsuario(usuarioId)
{
    if(bind.tipo_funcion() == 'null')
    {
        Swal.fire(
            'Atención!',
            'Seleccione una función.',
            'error'
        )
        return;
    }
    if(usuarioId != bind.usuario_id_actual())
    {
        bind.registrosNoPertenecientesAUsuario.removeAll();
        bind.registrosPertenecientesAUsuario.removeAll();

        let data= {
            Id: usuarioId,
            fun: bind.tipo_funcion()
        }
        /*No Pertenecientes al usuario*/
        axios.post("views/ajax/admin/funcionesUsuario/action.php", { type: "noPertenecientes", data: data})
            .then(function(response) {
                let registros = response.data;

                registros.forEach((reg) => {
                    bind.registrosNoPertenecientesAUsuario.push(new addRegistroNoPerteneciente(reg.Id, reg.Des, usuarioId));
                })
            })
            .catch(function(error) {
                console.log(error)
            })

        /*Pertenecientes al usuario*/
        axios.post("views/ajax/admin/funcionesUsuario/action.php", { type: "pertenecientes", data: data})
            .then(function(response) {
                let registros = response.data;

                registros.forEach((reg) => {
                    bind.registrosPertenecientesAUsuario.push(new addRegistroPerteneciente(reg.Id, reg.Des, usuarioId));
                })
            }).
        catch(function(error) {
            console.log(error)
        })
    }
}
/*
* Funcion para agregar un usuario a la tabla de busqueda
* */
function addUsuarioAListaBuscar(_id, _correo) {
    return {
        Id: ko.observable(_id),
        Descripcion: ko.observable(_correo),
        remover: function () {
            self.ListaDeUsuariosABuscar.remove(this);
            self.ListaDeUsuariosAgregados.push(new addUsuarioAListaDeAgregados(_id, _correo));
        }
    }
}

/*
* Funcion para agregar un centro a la lista de agregados
* */
function addUsuarioAListaDeAgregados(_id, _correo) {
    return {
        Id: ko.observable(_id),
        Descripcion: ko.observable(_correo),
        remover: function () {
            self.ListaDeUsuariosAgregados.remove(this);
            self.ListaDeUsuariosABuscar.push(new addUsuarioAListaBuscar(_id, _correo));
            if(_id == self.usuario_id_actual())
            {
                self.registrosNoPertenecientesAUsuario.removeAll();
                self.registrosPertenecientesAUsuario.removeAll();
            }
        },
        filtrarRegistros: function()
        {
            getRegistrosUsuario(_id);
           self.usuario_id_actual(_id);
        }
    }
}


/*
* Funcion para agregar un centro no perteneciente a su respectiva lista
* */
function addRegistroNoPerteneciente(_idRegistros, _descripcion,_usuarioId) {
    return {
        RegistroId: ko.observable(_idRegistros),
        Descripcion: ko.observable(_descripcion),
        UsuarioId: ko.observable(_usuarioId),
        remover: function () {
            self.registrosNoPertenecientesAUsuario.remove(this);
           self.registrosPertenecientesAUsuario.push(new addRegistroPerteneciente(_idRegistros, _descripcion,_usuarioId));
        }
    }
}

/*
* Funcion para agregar una carrera perteneciente a la lista no perteneciente
* */
function addRegistroPerteneciente(_idRegistro, _descripcion, _usuarioId) {
    return {
        RegistroId: ko.observable(_idRegistro),
        Descripcion: ko.observable(_descripcion),
        UsuarioId: ko.observable(_usuarioId),
        remover: function () {
            self.registrosNoPertenecientesAUsuario.push(new addRegistroNoPerteneciente(_idRegistro, _descripcion,_usuarioId));
            self.registrosPertenecientesAUsuario.remove(this);
        }
    }
}


let funcionesUsuarioVm = function () {
    self = this;
    self.buscar_usuario = ko.observable();
    self.usuario_id_actual = ko.observable(0);
    self.tipo_funcion = ko.observable('null');
    self.fecha_inicio = ko.observable();
    self.fecha_final = ko.observable();
    ///Arrays
    self.ListaDeUsuariosABuscar = ko.observableArray();
    self.ListaDeUsuariosAgregados = ko.observableArray();

    self.registrosNoPertenecientesAUsuario = ko.observableArray();
    self.registrosPertenecientesAUsuario = ko.observableArray();

    ///True - False
    self.showUsuarioList = ko.observable(false);
    self.showFechas = ko.observable(false);

    ///Events
    self.toggleUsuarioSearch = function ()
    {
        if(self.showUsuarioList() == false)
            self.showUsuarioList(true);

        else if(self.showUsuarioList() == true)
            self.showUsuarioList(false);
    }

    self.change_tipo_function = function()
    {
        self.registrosNoPertenecientesAUsuario.removeAll();
        self.registrosPertenecientesAUsuario.removeAll();
        self.usuario_id_actual(0);

        if($('#tipo_funcion').val() == 'fun')
        {
            self.showFechas(true);
        }
        else{
            self.showFechas(false);
        }
    }
    ///Butones
    self.guardar = function()
    {
        if(self.usuario_id_actual() == 0)
            return;

        if($('#tipo_funcion').val() == 'fun')
        {
            if(bind.fecha_inicio() == undefined || bind.fecha_final() ==undefined
            || bind.fecha_inicio() == '' || bind.fecha_final() =='')
            {
                Swal.fire(
                    'Alerta!',
                    'Debe seleccionar las fechas del permiso.',
                    'info');

                return;
            }

            if(bind.fecha_inicio()  >= bind.fecha_final())
            {
                Swal.fire(
                    'Alerta!',
                    'La fecha de incio no puede ser igual o mayor a la fecha final.',
                    'info');

                return;
            }
        }

        let registros = [];
        let x = 0;
        self.registrosPertenecientesAUsuario().forEach(function(index){
            if($('#tipo_funcion').val() == 'fun')
            {
                registros[x] = {
                    RegistroId : index.RegistroId(),
                    UsuarioId: index.UsuarioId(),
                    Fecha1: bind.fecha_inicio(),
                    Fecha2: bind.fecha_final()
                }
            }

            if($('#tipo_funcion').val() == 'cen')
            {
                registros[x] = {
                    RegistroId : index.RegistroId(),
                    UsuarioId: index.UsuarioId()
                }
            }

            x++;
        });

        if(registros.length === 0)
        {
            registros[0] = {
                RegistroId:0,
                UsuarioId: bind.usuario_id_actual()
            }
        }


       axios.post("views/ajax/admin/funcionesUsuario/action.php", { type: "actualizarRegistros", reg: registros, fun:bind.tipo_funcion()})
            .then(function(response) {
                
                if(response.data == 'denegado')
                {
                    Swal.fire(
                        'CODIGO: 403!',
                        'ACCESO DENEGADO. NO TIENES PERMISO PARA REALIZAR ESTA OPERACION. CONSULTE AL ADMINISTRADOR.',
                        'warning'
                    );
                    return;
                }

                Swal.fire(
                    'Actualizado!',
                    'Los Registros Usuario han sido actualizados.',
                    'success')
            }).
        catch(function(error) {
            console.log(error)
        });

    }
}

let bind = new funcionesUsuarioVm();
bind.errors = ko.validation.group(bind);

$(document).ready(function(){

    ko.applyBindings(bind);

    getUsuarios();

    jQuery('#datetimepicker1').datetimepicker({
        format:'Y-m-d H:i'
    });
    jQuery('#datetimepicker2').datetimepicker({
        format:'Y-m-d H:i'
    });
});