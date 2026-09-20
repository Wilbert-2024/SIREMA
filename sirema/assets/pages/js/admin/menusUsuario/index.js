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
* Conseguir todos los usuarios de la base de datos
* */
function getMenu(id)
{
    if(bind.usuario_id_actual() != id)
    {
        bind.MenuUsuario.removeAll();
        axios.post("views/ajax/admin/menusUsuario/action.php", { type: "getMenu", UsuarioId:id})
            .then(function(response) {
                let menus = response.data;
                menus.forEach((u) => {
                    bind.MenuUsuario.push(new addMenuUsuario(u));
                })
            })
            .catch(function(error) {
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
            if(_id == self.usuario_id_actual())
            {
                self.MenuUsuario.removeAll();
            }
            self.ListaDeUsuariosAgregados.remove(this);
            self.ListaDeUsuariosABuscar.push(new addUsuarioAListaBuscar(_id, _correo));
        },
        filtrarRegistros: function()
        {
            getMenu(_id);
            self.usuario_id_actual(_id);
        }
    }
}

/*
* Crear Arreglo de menus
* */
function addMenuUsuario(menu) {
    let hijos = [];
    let index  = 0;
    menu.hijos.forEach((h) =>{
        hijos[index] = new addMenuHijo(h.Id, h.Des, h.Estado);
        index++;
    })
    let estadoPadre = false;
    if(menu.padre.Estado == 1)
        estadoPadre = true;
    return {
        Id: ko.observable(menu.padre.Id),
        Descripcion: ko.observable(menu.padre.Des),
        Estado: ko.observable(estadoPadre),
        Hijos: ko.observableArray(hijos)
    }
}

/*
* Crear Arreglo de menus
* */
function addMenuHijo(_id, _des,_estado) {
    let estadoHijo = false;
    if(_estado == 1)
        estadoHijo = true;
    return {
        Id: ko.observable(_id),
        Descripcion: ko.observable(_des),
        Estado: ko.observable(estadoHijo)
    }
}


let menusUsuarioVm = function () {
    self = this;
    self = this;
    self.buscar_usuario = ko.observable();
    self.usuario_id_actual = ko.observable(0);

    ///Arrays
    self.ListaDeUsuariosABuscar = ko.observableArray();
    self.ListaDeUsuariosAgregados = ko.observableArray();

    self.MenuUsuario = ko.observableArray();
    ///True - False
    self.showUsuarioList = ko.observable(false);

    ///Events
    self.toggleUsuarioSearch = function ()
    {
        if(self.showUsuarioList() == false)
            self.showUsuarioList(true);

        else if(self.showUsuarioList() == true)
            self.showUsuarioList(false);
    }

    self.guardar = function()
    {
        let menuActualizado = [];
        let index = 0;
        if(self.usuario_id_actual() != 0)
        {
            self.MenuUsuario().forEach((mp)=>{
                if(mp.Estado() === true)
                {
                    menuActualizado[index] = {
                        menuId: mp.Id(),
                        usuarioId: self.usuario_id_actual()
                    }
                    index++;
                }
                mp.Hijos().forEach((mh)=>{
                    if(mh.Estado() === true)
                    {
                        menuActualizado[index] = {
                            menuId: mh.Id(),
                            usuarioId: self.usuario_id_actual()
                        }
                        index++;
                    }
                })
            })

            if(menuActualizado.length === 0)
            {
                menuActualizado[0] = {
                    menuId:0,
                    usuarioId: self.usuario_id_actual()
                }
            }
            /*Pertenecientes al usuario*/
          axios.post("views/ajax/admin/menusUsuario/action.php", { type: "actualizarRegistros", menus: menuActualizado})
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
                        'success'
                    )
                }).
            catch(function(error) {
                console.log(error)
            })
        }


    }
}

let bind = new menusUsuarioVm();
bind.errors = ko.validation.group(bind);

$(document).ready(function(){

    ko.applyBindings(bind);
    getUsuarios();
});