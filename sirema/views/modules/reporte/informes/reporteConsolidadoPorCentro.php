<?php
//Include conexion dataBase
require_once 'models/config.php';
// Include the main TCPDF library (search for installation path).
require_once('TCPDF/tcpdf.php');

$con = new DB();
//$fecha1 = date('Y-m-d', strtotime($_POST["fecha_i"]));
//$fecha2 = date('Y-m-d', strtotime($_POST["fecha_f"]));
$result = '';

//Cantidad de Correos
$estudiantil = 0;
$docente = 0;
$trabajador = 0;

$expedientes = [];
$yes = K_PATH_IMAGES.'yes.png';
$no = K_PATH_IMAGES.'no.png';
//anio_lectivo_encontrar


class PDF extends TCPDF
{
    public $tipoReporte="BLUEFEILDS INDIAN & CARIBBEAN UNIVERSITY";

    public function Header()
    {
        $con = new DB();
        $stmt = $con->conectar()->prepare('call anio_lectivo_encontrar(?)');
        $stmt->bindParam(1, $_POST['AnioLectivoId'], PDO::PARAM_INT);
        $stmt->execute();

        $anio = $stmt->fetch(PDO::FETCH_ASSOC);

        $stmt = null;
        $stmt = $con->conectar()->prepare("call semestre_encontrar(?)");
        $stmt->bindParam(1, $_POST['SemestreId'], PDO::PARAM_INT);
        $stmt->execute();
        $semestre =$stmt->fetch(PDO::FETCH_ASSOC);

        $stmt = null;
        $imageFile = K_PATH_IMAGES.'bicu.png';
        $this->Image($imageFile, 20, 10, 20, '', 'PNG', '', 'T', false, 300, '', false, false, 0, false, false, false);

        /*$this->Image($imageFile, 166, 10, 20, '', 'PNG', '', 'T', false, 300, '', false, false, 0, false, false, false);*/
        $this->Ln(5);

        $this->SetFont('helvetica', 'B', 12);//font name and size, style
        ////
        $this->Cell(189, 5, $this->tipoReporte, 0, 1, 'C');//189 is  the total width of an A4 page
        $this->Cell(189, 5, "BICU", 0, 1, 'C');
        $this->SetFont('helvetica', '', 12);
        $this->Cell(189, 3, 'DIRECCION DE REGISTRO ACADEMICO', 0, 1, 'C');
        $this->SetFont('helvetica', 'B', 12);
        $this->Cell(189, 3, 'AÑO LECTIVO '.$anio['AnioLectivo'], 0, 1, 'C');
        $this->SetFont('helvetica', '', 12);
        $this->Cell(189, 3, 'CONSOLIDADO DE MATRICULA', 0, 1, 'C');
        //$this->Cell(189, 3, 'CANTIDAD DE EXPEDIENTES POR CARRERA', 0, 1, 'C');
        $this->Cell(189, 3, strtoupper($semestre['DescripcionSemestre']), 0, 1, 'C');
        $this->Ln(3);
        $this->Line(5, $this->y, $this->w - 5, $this->y);
    }

    public function Footer()
    {
        $this->SetY(-20);

        $this->Ln(7);

        //Set font
        $this->SetFont('helvetica', 'I', 8);
        //Page Number
        date_default_timezone_set("America/Managua");
        $today = date('Y-m-d H:i:s', time());

        $this->Cell(25, 5, 'IMPRESO EL : '.$today, 0, 0, 'L');
        $this->Cell(164, 5, 'Pag '.$this->getAliasNumPage(). ' of '.$this->getAliasNbPages(), 0, false, 'R', 0, '', 0, false, 'T', 'M');
    }
}

// create new PDF document
$pdf = new PDF('p', 'mm', 'A4', true, 'UTF-8', false);

// set document information
$pdf->SetCreator(PDF_CREATOR);
$pdf->SetAuthor('BICU');
$pdf->SetTitle('Registro de Matriculados');
$pdf->SetSubject('');
$pdf->SetKeywords('');

// set default header data
$pdf->SetHeaderData(PDF_HEADER_LOGO, PDF_HEADER_LOGO_WIDTH, PDF_HEADER_TITLE.' 001', PDF_HEADER_STRING, array(0,64,255), array(0,64,128));
$pdf->setFooterData(array(0,64,0), array(0,64,128));

// set header and footer fonts
$pdf->setHeaderFont(Array(PDF_FONT_NAME_MAIN, '', PDF_FONT_SIZE_MAIN));
$pdf->setFooterFont(Array(PDF_FONT_NAME_DATA, '', PDF_FONT_SIZE_DATA));

// set default monospaced font
$pdf->SetDefaultMonospacedFont(PDF_FONT_MONOSPACED);

// set margins
$pdf->SetMargins(PDF_MARGIN_LEFT, PDF_MARGIN_TOP, PDF_MARGIN_RIGHT);
$pdf->SetHeaderMargin(PDF_MARGIN_HEADER);
$pdf->SetFooterMargin(PDF_MARGIN_FOOTER);

// set auto page breaks
$pdf->SetAutoPageBreak(TRUE, PDF_MARGIN_BOTTOM);

// set image scale factor
$pdf->setImageScale(PDF_IMAGE_SCALE_RATIO);

// set some language-dependent strings (optional)
if (@file_exists(dirname(__FILE__).'/lang/spa.php')) {
    require_once(dirname(__FILE__).'/lang/spa.php');
    $pdf->setLanguageArray($l);
}



// set default font subsetting mode
$pdf->setFontSubsetting(true);

// Set font
// dejavusans is a UTF-8 Unicode font, if you only need to
// print standard ASCII chars, you can use core fonts like
// helvetica or times to reduce file size.
$pdf->SetFont('dejavusans', '', 14, '', true);


// Add a page
// This method has several options, check the source code documentation for more information.
$pdf->AddPage();
$count = 0;
$newLineSize = false;
$pdf->Ln(24);
$pdf->SetFont('helvetica', 'B', 13);
//$pdf->SetFillColor(224, 235, 255);
$pdf->Cell(40, 5, '', 0, 0, '', 0);
$pdf->Cell(46, 5, 'Primer Ingreso', 0, 0, 'C', 0);
$pdf->Cell(46, 5, 'Reingreso', 0, 0, 'C', 0);
$pdf->Cell(50, 5, '', 0, 0, 'C', 0);

$pdf->Ln(6);
$pdf->SetFont('helvetica', 'B', 12);
$pdf->Cell(5, 5, 'N', 1, 0, 'L', 0);
$pdf->Cell(35, 5, 'Recinto', 1, 0, 'L', 0);
$pdf->Cell(23, 5, '1 Ingresos', 1, 0, 'L', 0);
$pdf->Cell(23, 5, 'UNICAM', 1, 0, 'L', 0);
$pdf->Cell(23, 5, 'Reingreso', 1, 0, 'L', 0);
$pdf->Cell(23, 5, 'UNICAM', 1, 0, 'L', 0);
$pdf->Cell(30, 5, 'EGRESADOS', 1, 0, 'L', 0);
$pdf->Cell(20, 5, 'TOTAL', 1, 0, 'L', 0);

//Variables de datos
$nombreCentro = '';
$contador = 1;

$totalPrimerIngreso = 0;
$totalPrimerIngresoUnicam = 0;
$totalReingreso = 0;
$totalReingresoUnicam = 0;
$totalCentro = 0;

$totalGenenralPrimerIngreso = 0;
$totalGenenralPrimerIngresoUnicam = 0;
$totalGeneralReingreso = 0;
$totalGeneralReingresoUnicam = 0;
$totalGeneral = 0;

$totalGeneralReingresoFinal = 0;
$totalGeneralPrimerIngresoFinal = 0;
$totalFinal = 0;
$centroId = 0;


if($_POST['CentroId'] > 0) {
    $stmt = $con->conectar()->prepare('call reporte_consolidado_matriculados_centro(?,?,?,?)');
    $stmt->bindParam(1, $_SESSION['usuario'], PDO::PARAM_STR);
    $stmt->bindParam(2, $_POST['CentroId'], PDO::PARAM_INT);
    $stmt->bindParam(3, $_POST['AnioLectivoId'], PDO::PARAM_INT);
    $stmt->bindParam(4, $_POST['SemestreId'], PDO::PARAM_INT);
    $stmt->execute();

    $registros = $stmt->fetchAll(PDO::FETCH_ASSOC);

    $stmt = null;

    foreach ($registros as $reg) {
        $nombreCentro = $reg['DescripcionCentro'];
        $stmt = $con->conectar()->prepare('call reporte_consolidad_matriculados_unicam(?)');
        $stmt->bindParam(1, $reg['centroId'], PDO::PARAM_INT);
        $stmt->execute();

        $unicams = $stmt->fetchAll(PDO::FETCH_ASSOC);

        foreach ($unicams as $un) {
            if ($un['TipoIngreso_Id'] == 1) {
                $totalPrimerIngresoUnicam =  $un['Total'];
            }

            if ($un['TipoIngreso_Id'] == 2) {
                $totalReingresoUnicam =  $un['Total'];
            }
        }

        if ($reg['TipoIngreso_Id'] == 1) {
            $totalPrimerIngreso = $reg['Total'];
        }

        if ($reg['TipoIngreso_Id'] == 2) {
            $totalReingreso = $reg['Total'];
        }

    }

    $totalCentro = $totalPrimerIngresoUnicam + $totalReingresoUnicam + $totalPrimerIngreso +$totalReingreso;
    $pdf->Ln(5);
    $pdf->SetFont('helvetica', 'N', 9);
    $pdf->Cell(5, 5, $contador, 1, 0, 'C', 0);
    $pdf->Cell(35, 5, $nombreCentro, 1, 0, 'C', 0);
    $pdf->Cell(23, 5, $totalPrimerIngreso, 1, 0, 'C', 0);
    $pdf->Cell(23, 5, $totalPrimerIngresoUnicam, 1, 0, 'C', 0);
    $pdf->Cell(23, 5, $totalReingreso, 1, 0, 'C', 0);
    $pdf->Cell(23, 5, $totalReingresoUnicam, 1, 0, 'C', 0);
    $pdf->Cell(30, 5, '', 1, 0, 'C', 0);
    $pdf->Cell(20, 5, $totalCentro, 1, 0, 'C', 0);

    $totalUnicamConseguido = false;
    $centroId = $reg['centroId'];
    $nombreCentro = $reg['DescripcionCentro'];
    $totalPrimerIngreso = 0;
    $totalPrimerIngresoUnicam = 0;
    $totalReingreso = 0;
    $totalReingresoUnicam = 0;
}

else{
    $tipo=1;
    $stmt = $con->conectar()->prepare('call permiso_centros_usuario(?,?)');
    $stmt->bindParam(1, $_SESSION['usuario'], PDO::PARAM_STR);
    $stmt->bindParam(2, $tipo, PDO::PARAM_INT);
    $stmt->execute();

    $centrosPardres = $stmt->fetchAll(PDO::FETCH_ASSOC);

    $stmt = null;

    foreach ($centrosPardres as $padre)
    {
        $stmt = $con->conectar()->prepare('call reporte_consolidado_matriculados_centro(?,?,?,?)');
        $stmt->bindParam(1, $_SESSION['usuario'], PDO::PARAM_STR);
        $stmt->bindParam(2, $padre['Id'], PDO::PARAM_INT);
        $stmt->bindParam(3, $_POST['AnioLectivoId'], PDO::PARAM_INT);
        $stmt->bindParam(4, $_POST['SemestreId'], PDO::PARAM_INT);
        $stmt->execute();

        $registros = $stmt->fetchAll(PDO::FETCH_ASSOC);

        $stmt = null;

        foreach ($registros as $reg) {
            $nombreCentro = $reg['DescripcionCentro'];
            $stmt = $con->conectar()->prepare('call reporte_consolidad_matriculados_unicam(?)');
            $stmt->bindParam(1, $reg['centroId'], PDO::PARAM_INT);
            $stmt->execute();

            $unicams = $stmt->fetchAll(PDO::FETCH_ASSOC);

            foreach ($unicams as $un) {
                if ($un['TipoIngreso_Id'] == 1) {
                    $totalPrimerIngresoUnicam =  $un['Total'];
                }

                if ($un['TipoIngreso_Id'] == 2) {
                    $totalReingresoUnicam =  $un['Total'];
                }
            }

            if ($reg['TipoIngreso_Id'] == 1) {
                $totalPrimerIngreso = $reg['Total'];
            }

            if ($reg['TipoIngreso_Id'] == 2) {
                $totalReingreso = $reg['Total'];
            }

        }

        $totalCentro = $totalPrimerIngresoUnicam + $totalReingresoUnicam + $totalPrimerIngreso +$totalReingreso;

        $totalGenenralPrimerIngreso = $totalGenenralPrimerIngreso + $totalPrimerIngreso;
        $totalGenenralPrimerIngresoUnicam = $totalGenenralPrimerIngresoUnicam + $totalPrimerIngresoUnicam;
        $totalGeneralReingreso = $totalGeneralReingreso + $totalReingreso;
        $totalGeneralReingresoUnicam = $totalGeneralReingresoUnicam + $totalReingresoUnicam;

        if($totalCentro > 0)
        {
            $pdf->Ln(5);
            $pdf->SetFont('helvetica', 'N', 9);
            $pdf->Cell(5, 5, $contador, 1, 0, 'C', 0);
            $pdf->Cell(35, 5, $nombreCentro, 1, 0, 'C', 0);
            $pdf->Cell(23, 5, $totalPrimerIngreso, 1, 0, 'C', 0);
            $pdf->Cell(23, 5, $totalPrimerIngresoUnicam, 1, 0, 'C', 0);
            $pdf->Cell(23, 5, $totalReingreso, 1, 0, 'C', 0);
            $pdf->Cell(23, 5, $totalReingresoUnicam, 1, 0, 'C', 0);
            $pdf->Cell(30, 5, '', 1, 0, 'C', 0);
            $pdf->Cell(20, 5, $totalCentro, 1, 0, 'C', 0);
        }


        $totalUnicamConseguido = false;
        $centroId = $reg['centroId'];
        $nombreCentro = $reg['DescripcionCentro'];
        $totalPrimerIngreso = 0;
        $totalPrimerIngresoUnicam = 0;
        $totalReingreso = 0;
        $totalReingresoUnicam = 0;
        $totalCentro = 0;
        $contador++;
    }
    $totalGeneral = $totalGenenralPrimerIngreso + $totalGenenralPrimerIngresoUnicam + $totalGeneralReingreso +$totalGeneralReingresoUnicam;
    $pdf->Ln(5);
    $pdf->SetFont('helvetica', 'B', 9);
    $pdf->Cell(40, 5, 'SUB-TOTAL', 1, 0, 'C');
    $pdf->Cell(23, 5,$totalGenenralPrimerIngreso, 1, 0, 'C');
    $pdf->Cell(23, 5,$totalGenenralPrimerIngresoUnicam, 1, 0, 'C');
    $pdf->Cell(23, 5,$totalGeneralReingreso, 1, 0, 'C');
    $pdf->Cell(23, 5,$totalGeneralReingresoUnicam, 1, 0, 'C');
    $pdf->Cell(30, 5, '', 1, 0, 'C', 0);
    $pdf->Cell(20, 5, $totalGeneral, 1, 0, 'C', 0);

    $totalGeneralPrimerIngresoFinal = $totalGenenralPrimerIngreso + $totalGenenralPrimerIngresoUnicam;
    $totalGeneralReingresoFinal = $totalGeneralReingreso + $totalGeneralReingresoUnicam;

    $totalFinal = $totalGeneralPrimerIngresoFinal + $totalGeneralReingresoFinal;
    $pdf->Ln(9);
    $pdf->SetFont('helvetica', 'B', 9);
    $pdf->Cell(40, 5, 'TOTAL GENERAL', 1, 0, 'C');
    $pdf->Cell(46, 5,$totalGeneralPrimerIngresoFinal, 1, 0, 'C');
    $pdf->Cell(46, 5,$totalGeneralReingresoFinal, 1, 0, 'C');
    $pdf->Cell(30, 5, '', 1, 0, 'C', 0);
    $pdf->Cell(20, 5, $totalFinal, 1, 0, 'C', 0);

    $totalGenenralPrimerIngreso = 0;
    $totalGenenralPrimerIngresoUnicam = 0;
    $totalGeneralReingreso = 0;
    $totalGeneralReingresoUnicam = 0;
    $totalGeneral = 0;

    $totalGeneralReingresoFinal = 0;
    $totalGeneralPrimerIngresoFinal = 0;
    $totalFinal = 0;

}
// Close and output PDF document
ob_end_clean();
// This method has several options, check the source code documentation for more information.
$pdf->Output('Reporte Individual de Registro Matriculado.pdf', 'I');

