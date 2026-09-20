<?php
    $enlaces = new urlController();
    $isNotReport = true;
if(isset($_GET['action']))
{
    $rep = explode('_', $_GET['action']);
    if($rep[0] == 'reporte')
        $isNotReport = false;
}
?>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <title>SIREMA</title>
    <meta
      content="width=device-width, initial-scale=1.0, shrink-to-fit=no"
      name="viewport"
    />
    <link
      rel="icon"
      href="assets/img/bicu.png"
      type="image/x-icon"
    />

    <!-- Fonts and icons -->
    <script src="assets/js/plugin/webfont/webfont.min.js"></script>
    <script>
      WebFont.load({
        google: { families: ["Public Sans:300,400,500,600,700"] },
        custom: {
          families: [
            "Font Awesome 5 Solid",
            "Font Awesome 5 Regular",
            "Font Awesome 5 Brands",
            "simple-line-icons",
          ],
          urls: ["assets/css/fonts.min.css"],
        },
        active: function () {
          sessionStorage.fonts = true;
        },
      });
    </script>

    <!-- CSS Files -->
    <link rel="stylesheet" href="assets/css/bootstrap.min.css" />
    <link rel="stylesheet" href="assets/css/plugins.min.css" />
    <link rel="stylesheet" href="assets/css/kaiadmin.min.css" />
      <link rel="stylesheet" href="assets/css/leaflet.css" />
      <link rel="stylesheet" href="assets/js/plugin/jquery-datetimepicker/datetimepicker.min.css" />

  </head>
  <body>
    <div class="wrapper">
        <?php if(isset($_SESSION['valido']) and $isNotReport) {?>
      <!-- Sidebar -->
      <div class="sidebar" data-background-color="dark">
        <div class="sidebar-logo">
          <!-- Logo Header -->
          <div class="logo-header" data-background-color="">
            <a href="index.php" class="logo">
              <img
                src="assets/img/bicu.png"
                alt="navbar brand"
                class="navbar-brand"
                height="20"
              /><span style="font-size: 20px" class="text text-white"> SIREMA</span>
            </a>
            <div class="nav-toggle">
              <button class="btn btn-toggle toggle-sidebar">
                <i class="gg-menu-right"></i>
              </button>
              <button class="btn btn-toggle sidenav-toggler">
                <i class="gg-menu-left"></i>
              </button>
            </div>
            <button class="topbar-toggler more">
              <i class="gg-more-vertical-alt"></i>
            </button>
          </div>
          <!-- End Logo Header -->
        </div>
        <div class="sidebar-wrapper scrollbar scrollbar-inner">
          <div class="sidebar-content">
            <ul class="nav nav-secondary">

              <li class="nav-section">
                <span class="sidebar-mini-icon">
                  <i class="fa fa-ellipsis-h"></i>
                </span>
                <h4 class="text-section">MENU</h4>
              </li>

                <!--Pages Links are here-->
              <li class="nav-item">
                  <?php
                    $enlaces->formSideBarMenu();
                  ?>
                </li>
                  <!--End of pages links-->



            </ul>
          </div>
        </div>
      </div>
      <!-- End Sidebar -->


      <div class="main-panel">
        <div class="main-header">

          <!-- Navbar Header -->
          <nav
            class="navbar navbar-header navbar-header-transparent navbar-expand-lg border-bottom"
          >
            <div class="container-fluid">
              <nav
                class="navbar navbar-header-left navbar-expand-lg navbar-form nav-search p-0 d-none d-lg-flex"
              >

              </nav>

              <ul class="navbar-nav topbar-nav ms-md-auto align-items-center">
                <li
                  class="nav-item topbar-icon dropdown hidden-caret d-flex d-lg-none"
                >
                  <a
                    class="nav-link dropdown-toggle"
                    data-bs-toggle="dropdown"
                    href="#"
                    role="button"
                    aria-expanded="false"
                    aria-haspopup="true"
                  >
                    <i class="fa fa-search"></i>
                  </a>
                  <ul class="dropdown-menu dropdown-search animated fadeIn">
                    <form class="navbar-left navbar-form nav-search">
                      <div class="input-group">
                        <input
                          type="text"
                          placeholder="Search ..."
                          class="form-control"
                        />
                      </div>
                    </form>
                  </ul>
                </li>


                <li class="nav-item topbar-user dropdown hidden-caret">
                  <a
                    class="dropdown-toggle profile-pic"
                    data-bs-toggle="dropdown"
                    href="#"
                    aria-expanded="false"
                  >
                    <div class="avatar-sm">
                      <img
                        src="assets/img/bicu.png"
                        alt="..."
                        class="avatar-img rounded-circle"
                      />
                    </div>
                    <span class="profile-username">
                      <span class="fw-bold">
                          <?php
                          if(isset($_SESSION['valido']))
                          {
                              echo $_SESSION['centro'];
                          }
                          ?>
                      </span>
                    </span>
                  </a>
                  <ul class="dropdown-menu dropdown-user animated fadeIn">
                    <div class="dropdown-user-scroll scrollbar-outer">
                      <li>
                        <div class="user-box">
                          <div class="avatar-lg">
                            <img
                              src="assets/img/bicu.png"
                              alt="image profile"
                              class="avatar-img rounded"
                            />
                          </div>
                          <div class="u-text">
                            <p class="text-muted">
                                <?php
                                if(isset($_SESSION['valido']))
                                {
                                    echo $_SESSION['usuario'];
                                }
                                ?>
                            </p>
                            <a
                              href="#"
                              class="btn btn-xs btn-secondary btn-sm" id="cerrar_session"
                              >Cerrar Session</a
                            >
                          </div>
                        </div>
                      </li>
                    </div>
                  </ul>
                </li>
              </ul>
            </div>
          </nav>
          <!-- End Navbar -->
        </div>

        <div class="container">
          <div class="page-inner">
              <!-- Display pages here-->
              <?php } ?>
        <?php
            $enlaces->displayPage();
        ?>

              <?php if(isset($_SESSION['valido'])) {?>
              <!--End pages display -->
          </div>
        </div>

        <footer class="footer">
          <div class="container-fluid d-flex justify-content-between">
            <nav class="pull-left">
              <ul class="nav">
                <li class="nav-item">
                  <a class="nav-link" href="http://www.themekita.com">
                    ThemeKita
                  </a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" href="#"> Help </a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" href="#"> Licenses </a>
                </li>
              </ul>
            </nav>
            <!--<div class="copyright">
              2024, made with <i class="fa fa-heart heart text-danger"></i> by
              <a href="http://www.themekita.com">ThemeKita</a>
            </div>
            <div>
              Distributed by
              <a target="_blank" href="https://themewagon.com/">ThemeWagon</a>.
            </div>-->
          </div>
        </footer>
      </div>
    <?php } ?>

    </div>
    <!--   Core JS Files   -->
    <script src="assets/js/core/jquery-3.7.1.min.js"></script>
    <script src="assets/js/core/popper.min.js"></script>
    <script src="assets/js/core/bootstrap.min.js"></script>

    <!-- jQuery Scrollbar -->
    <script src="assets/js/plugin/jquery-scrollbar/jquery.scrollbar.min.js"></script>

    <!-- Chart JS -->
    <script src="assets/js/plugin/chart.js/chart.min.js"></script>

    <!-- jQuery Sparkline -->
    <script src="assets/js/plugin/jquery.sparkline/jquery.sparkline.min.js"></script>

    <!-- Chart Circle -->
    <script src="assets/js/plugin/chart-circle/circles.min.js"></script>

    <!-- Datatables -->
    <script src="assets/js/plugin/datatables/datatables.min.js"></script>

    <!-- Bootstrap Notify -->
    <script src="assets/js/plugin/bootstrap-notify/bootstrap-notify.min.js"></script>

    <!-- jQuery Vector Maps -->
    <script src="assets/js/plugin/jsvectormap/jsvectormap.min.js"></script>
    <script src="assets/js/plugin/jsvectormap/world.js"></script>

    <!-- Sweet Alert -->
    <script src="assets/js/plugin/sweetalert/sweetalert.min.js"></script>

    <!-- Sweet Alert -->
    <script src="assets/js/plugin/axios/axios.min.js"></script>

    <!-- Select 2 min JS -->
    <script src="assets/js/plugin/select2/select2.full.min.js"></script>

    <!-- Kaiadmin JS -->
    <script src="assets/js/kaiadmin.min.js"></script>

  <!--Knockout JS-->
    <script src="assets/js/plugin/knockout/knockout-3.5.1.js"></script>
    <script src="assets/js/plugin/knockout/knockout.validation.js"></script>

    <!--Date Time picker-->
    <script src="assets/js/plugin/jquery-datetimepicker/datepicker.full.min.js"></script>


    <!--Leaflet Map-->
    <script src="assets/js/plugin/leaflet/leaflet.js"></script>
    <!--Render JS Personalized pages-->

    <?php
    echo '<script src="'.$enlaces->renderJS().'"></script>';
    ?>

  <script>

      $('#cerrar_session').click(function (){
          Swal.fire({
              title: 'Estas seguro?',
              text: "La sessión se cerrara",
              icon: 'warning',
              showCancelButton: true,
              confirmButtonColor: '#3085d6',
              cancelButtonColor: '#d33',
              confirmButtonText: 'Si, cerrar!'
          }).then((result) => {
              if (result.isConfirmed) {
                  axios.post("views/ajax/login/action.php", { type: "cerrar"})
                      .then(function(response) {

                          if(response.data =='ok')
                          {
                              Swal.fire(
                                  'Cerrado!',
                                  'La session se cerrado exitosamente.',
                                  'success'
                              );

                              setTimeout(function()
                              {
                                  location.reload();
                              },1000)
                          }

                      })
                      .catch(function(error) {
                          console.log(error)
                      })
              }
          });
      })

  </script>
  </body>
</html>

<?php
include_once "views/modules/modales.php";
?>

<script>
    ///Get Centros SEDE/CUR/EXT
    axios.post("views/ajax/registro/matriculados/action.php", { type: "getCentros", filtro:1})
        .then(function(response) {
            $('#CentroId_rep01').html(response.data);
            $('#CentroId_rep03').html(response.data);
            $('#CentroId_rep06').html(response.data);
        })
        .catch(function(error) {
            console.log(error)
        });

    ///Get Centros Unicam
    axios.post("views/ajax/registro/matriculados/action.php", { type: "getCentros", filtro:2})
        .then(function(response) {
            $('#CentroId_rep02').html(response.data);
        })
        .catch(function(error) {
            console.log(error)
        });

    ///Get Tipos de Ingresos
    axios.post("views/ajax/registro/matriculados/action.php", { type: "getTipoIngresos"})
        .then(function(response) {
            $('#TipoIngresoId_rep01').html(response.data);
            $('#TipoIngresoId_rep02').html(response.data);
            $('#TipoIngresoId_rep06').html(response.data);
        })
        .catch(function(error) {
            console.log(error)
        })

    ///Get Semestres
    axios.post("views/ajax/registro/matriculados/action.php", { type: "getSemestres"})
        .then(function(response) {
            $('#SemestreId_rep01').html(response.data);
            $('#SemestreId_rep02').html(response.data);
            $('#SemestreId_rep06').html(response.data);
            $('#SemestreId_rep03').html(response.data);
        })
        .catch(function(error) {
            console.log(error)
        })
////Anios Lectivos
    axios.post("views/ajax/registro/matriculados/action.php", { type: "getAniosLectivos"})
        .then(function(response) {
            $('#AnioLectivoId_rep01').html(response.data);
            $('#AnioLectivoId_rep02').html(response.data);
            $('#AnioLectivoId_rep03').html(response.data);
            $('#AnioLectivoId_rep04').html(response.data);
            $('#AnioLectivoId_rep05').html(response.data);
            $('#AnioLectivoId_rep06').html(response.data);
        })
        .catch(function(error) {
            console.log(error)
        })
    //Reporte #1 reporteTipoIngreseCentro
    $('#reporteTipoIngreseCentroBTN').click(function()
    {
        if($('#AnioLectivoId_rep01').val() < 1)
        {
            Swal.fire(
                'Atención!',
                'Debe seleccionar un Año Lectivo.',
                'error'
            )
            return;
        }

        if($('#TipoIngresoId_rep01').val() < 1)
        {
            Swal.fire(
                'Atención!',
                'Debe seleccionar un Tipo de Ingreso.',
                'error'
            )
            return;
        }
        if($('#SemestreId_rep01').val() < 1)
        {
            Swal.fire(
                'Atención!',
                'Debe seleccionar un Semestre.',
                'error'
            )
            return;
        }

        if($('#CentroId_rep01').val() < 1)
        {
            $('#CentroId_rep01').val(0)
        }
        document.getElementById('reporteTipoIngreseCentroFrm').submit();
    })

    //Reporte #2 reporteTipoIngreseCentroUnicam
    $('#reporteTipoIngreseCentroUnicamBTN').click(function()
    {
        if($('#AnioLectivoId_rep02').val() < 1)
        {
            Swal.fire(
                'Atención!',
                'Debe seleccionar un Año Lectivo.',
                'error'
            )
            return;
        }

        if($('#TipoIngresoId_rep02').val() < 1)
        {
            Swal.fire(
                'Atención!',
                'Debe seleccionar un Tipo de Ingreso.',
                'error'
            )
            return;
        }
        if($('#SemestreId_rep02').val() < 1)
        {
            Swal.fire(
                'Atención!',
                'Debe seleccionar un Semestre.',
                'error'
            )
            return;
        }

        if($('#CentroId_rep02').val() < 1)
        {
            $('#CentroId_rep02').val(0)
        }
        document.getElementById('reporteTipoIngreseCentroUnicamFrm').submit();
    })

    //Reporte #3 reporteTipoIngreseCentroUnicam
    $('#reporteConsolidadoPorCentroBTN').click(function()
    {
        if($('#AnioLectivoId_rep03').val() < 1)
        {
            Swal.fire(
                'Atención!',
                'Debe seleccionar un Año Lectivo.',
                'error'
            )
            return;
        }

        if($('#SemestreId_rep03').val() < 1)
        {
            Swal.fire(
                'Atención!',
                'Debe seleccionar un Semestre.',
                'error'
            )
            return;
        }

        if($('#CentroId_rep03').val() < 1)
        {
            $('#CentroId_rep03').val(0)
        }
        document.getElementById('reporteConsolidadoPorCentroFrm').submit();
    })

    //Reporte #4 reporteConsolidadoPorAreaCon
    $('#reporteConsolidadoPorAreaConBTN').click(function()
    {
        if($('#AnioLectivoId_rep04').val() < 1)
        {
            Swal.fire(
                'Atención!',
                'Debe seleccionar un Año Lectivo.',
                'error'
            )
            return;
        }

        document.getElementById('reporteConsolidadoPorAreaConFrm').submit();
    })

    //Reporte #5 reporteConsolidadoPorAreaCon
    $('#reporteConsolidadoBicuCnuBTN').click(function()
    {
        if($('#AnioLectivoId_rep05').val() < 1)
        {
            Swal.fire(
                'Atención!',
                'Debe seleccionar un Año Lectivo.',
                'error'
            )
            return;
        }

        document.getElementById('reporteConsolidadoBicuCnuFrm').submit();
    })

    //Reporte #6 ultimaActualizacionPorCarrera
    $('#ultimaActualizacionPorCarreraBTN').click(function()
    {
        if($('#AnioLectivoId_rep06').val() < 1)
        {
            Swal.fire(
                'Atención!',
                'Debe seleccionar un Año Lectivo.',
                'error'
            )
            return;
        }


        if($('#TipoIngresoId_rep06').val() < 1)
        {
            Swal.fire(
                'Atención!',
                'Debe seleccionar un Tipo de Ingreso.',
                'error'
            )
            return;
        }

        if($('#SemestreId_rep06').val() < 1)
        {
            Swal.fire(
                'Atención!',
                'Debe seleccionar un Semestre.',
                'error'
            )
            return;
        }

        if($('#CentroId_rep06').val() < 1)
        {
            Swal.fire(
                'Atención!',
                'Debe seleccionar un Centro.',
                'error'
            )
            return;
        }

        document.getElementById('ultimaActualizacionPorCarreraFrm').submit();
    })

</script>
