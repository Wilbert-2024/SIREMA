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
* Mostrar las Comunidades en la etiqueta
* select de Comunidades
* */
function getSelectComunidades()
{
    axios.post("views/ajax/catalogo/centros/action.php", { type: "getComunidades" })
        .then(function(response) {
            bind.selectComunidades(response.data);
        })
        .catch(function(error) {
            console.log(error)
        })

}

/*
* Mostrar los Tipos de Centros en la etiqueta
* select de Tipos de Centros
* */
function getSelecTipoCentros()
{
    axios.post("views/ajax/catalogo/centros/action.php", { type: "getTipoCentros" })
        .then(function(response) {
            bind.selectTipoCentros(response.data);
        })
        .catch(function(error) {
            console.log(error)
        })
}

/*
* Mostrar los Centros Padres en la etiqueta
* select de Centros Padres
* */
function getSelectCentrosPadre()
{
    axios.post("views/ajax/catalogo/centros/action.php", { type: "getCentrosPadre" })
        .then(function(response) {
            bind.selectCentrosPadres(response.data);
        })
        .catch(function(error) {
            console.log(error)
        })

}

/*
* Mostrar los datos del centro a ser
* actualizado
* */
function getRegistroCentro()
{
    axios.post("views/ajax/catalogo/centros/action.php", { type: "getCentro" , id: bind.id()})
        .then(function(response) {
            if(!response.data)
            {
                Swal.fire(
                    'Error!',
                    'Registro no existe.',
                    'warning'
                );
                return;
            }
            let centro = response.data;

            if(centro.Padre_Id == 0)
            {
                bind.esHijo(false)
            }
            else{
                bind.esHijo(true)
            }

            bind.padre_id(centro.Padre_Id);
            bind.descripcion_centro(centro.DescripcionCentro)
            bind.comunidad_id(centro.Comunidad_Id)
            bind.tipo_centro_id(centro.TipoDeCentro_Id)

            setTimeout(
                function(){
                    $("#tipo_centro_id").val(bind.tipo_centro_id())
                    $("#comunidad_id").val(bind.comunidad_id())
                    $("#padre_id").val(bind.padre_id())
                }
                ,500)
        })
        .catch(function(error) {
            console.log(error)
        })

}
let centroUpdateVm = function () {
    self = this;
    self.id = ko.observable($("#id").val());
    self.descripcion_centro = ko.observable().extend({required:{params:true, message:"Campo Requerido"}});
    self.tipo_centro_id = ko.observable().extend({required:{params: true, message:"Campo Requerido"}});
    self.comunidad_id = ko.observable().extend({required:{params: true, message:"Campo Requerido"}});
    self.padre_id = ko.observable($("#padre_id").val()).extend({required:{params: true, message:"Campo Requerido"}});

    self.selectTipoCentros = ko.observable();
    self.selectComunidades = ko.observable();
    self.selectCentrosPadres = ko.observable();

    self.esHijo = ko.observable(false);

    self.getTipoCentro = function()
    {
        self.tipo_centro_id($("#tipo_centro_id").val());
        if(self.tipo_centro_id() == 2)
        {
            self.esHijo(true)
        }
        else{
            self.esHijo(false)
            self.padre_id(0);
        }
    }

    self.getComunidad = function()
    {
        self.comunidad_id($("#comunidad_id").val());
    }

    self.getCentroPadre = function()
    {
        self.padre_id($("#padre_id").val());
    }

    self.actualizar = function()
    {
        if (bind.errors().length != 0) {

            bind.errors.showAllMessages();
        }

        else
        {
            let  form={
                id: self.id(),
                descripcion_centro: self.descripcion_centro(),
                tipo_centro_id : self.tipo_centro_id(),
                comunidad_id : self.comunidad_id(),
                padre_id : self.padre_id()
            }

            Swal.fire({
                title: 'Estas seguro?',
                text: "Los datos seran actualizados",
                icon: 'warning',
                showCancelButton: true,
                confirmButtonColor: '#3085d6',
                cancelButtonColor: '#d33',
                confirmButtonText: 'Si, guardar!'
            }).then((result) => {
                if (result.isConfirmed) {
                    axios.post("views/ajax/catalogo/centros/action.php", { type: "update", data: form })
                        .then(function(response) {

                            if(response.data == "duplicado")
                            {
                                Swal.fire(
                                    'Error!',
                                    'Registro ya existe.',
                                    'warning'
                                );
                            }
                            if(response.data == "ok")
                            {
                                Swal.fire(
                                    'Guardado!',
                                    'El centro ha sido creado exitosamente.',
                                    'success'
                                );
                                setTimeout(function(){
                                    location.reload();
                                },1000)


                            }


                        })
                        .catch(function(error) {
                            console.log(error)
                        })
                }
            });
        }
    };
}

let bind = new centroUpdateVm();
bind.errors = ko.validation.group(bind);

$(document).ready(function(){



    ko.applyBindings(bind);
    getSelectComunidades();
    getSelecTipoCentros();
    getSelectCentrosPadre();

    getRegistroCentro();

});