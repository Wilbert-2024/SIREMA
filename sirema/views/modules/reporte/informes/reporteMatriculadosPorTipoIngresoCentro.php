<?php
//Include conexion dataBase
require_once 'models/config.php';
// Include the main TCPDF library (search for installation path).
require_once('TCPDF/tcpdf.php');

$con = new DB();
//$fecha1 = date('Y-m-d', strtotime($_POST["fecha_i"]));
//$fecha2 = date('Y-m-d', strtotime($_POST["fecha_f"]));
$result = '';

$expedientes = [];
$yes = K_PATH_IMAGES.'yes.png';
$no = K_PATH_IMAGES.'no.png';

if (session_status() === PHP_SESSION_NONE) {
    session_start();
}

$filtro = 1;
$stmt = $con->conectar()->prepare('call reporte_multiple_matriculados_por_tipoIngreso_centros(?,?,?,?,?,?)');
$stmt->bindParam(1,$_SESSION['usuario'] ,PDO::PARAM_STR);
$stmt->bindParam(2,$_POST['CentroId'] ,PDO::PARAM_INT);
$stmt->bindParam(3,$_POST['TipoIngresoId'] ,PDO::PARAM_INT);
$stmt->bindParam(4,$_POST['SemestreId'] ,PDO::PARAM_INT);
$stmt->bindParam(5, $_POST['AnioLectivoId'], PDO::PARAM_INT);
$stmt->bindParam(6,$filtro,PDO::PARAM_INT);
$stmt->execute();

$registro = $stmt->fetchAll(PDO::FETCH_ASSOC);

$stmt = null;
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
        $this->Cell(189, 3, 'AÑO LECTIVO '.$anio['AnioLectivo'], 0, 1, 'C');
        //$this->Cell(189, 3, 'CANTIDAD DE EXPEDIENTES POR CARRERA', 0, 1, 'C');
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
$imageFile = K_PATH_IMAGES.'bicu.png';

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

$count = 0;
$newLineSize = false;

$newPage = 0;

$totalCentro = 0;
$totalCentroFem = 0;
$totalCentroMas = 0;

////Total General
$totolGeneral = 0;
$totalGeneralFem = 0;
$totalGeneralMas = 0;
foreach ($registro as $reg)
{
    $newPage = 0;
    $pdf->SetMargins(5, 20, 5, true);
    $pdf->AddPage();
    $pdf->Ln(20);
    $pdf->SetFont('helvetica', 'B', 15);
    $pdf->Cell(60, 5, 'Recinto', 0, 0, 'C', 0);
    $pdf->Cell(60, 5, 'Tipo Ingreso', 0, 0, 'C', 0);
    $pdf->Cell(60, 5, 'Semestre', 0, 0, 'C', 0);
    $pdf->Ln(7);
    $pdf->SetFont('helvetica', 'N', 13);
    $pdf->Cell(60, 5, $reg['TC'].' - '.$reg['Centro'], 0, 0, 'C', 0);
    $pdf->Cell(60, 5, $reg['TI'], 0, 0, 'C', 0);
    $pdf->Cell(60, 5, $reg['Sem'], 0, 0, 'C', 0);

    $stmt = $con->conectar()->prepare('call reporte_multiple_matriculados_por_tipoIngreso_centros_detalle(?,?,?,?)');
    $stmt->bindParam(1,$reg['Id'] ,PDO::PARAM_INT);
    $stmt->bindParam(2,$_POST['TipoIngresoId'] ,PDO::PARAM_INT);
    $stmt->bindParam(3,$_POST['SemestreId'] ,PDO::PARAM_INT);
    $stmt->bindParam(4, $_POST['AnioLectivoId'], PDO::PARAM_INT);
    $stmt->execute();

    $detalles = $stmt->fetchAll(PDO::FETCH_ASSOC);
    $ARCS = [];
    $index = 0;
    $areaSet = false;
    $totalMasculinos = 0;
    $totalFemeninos = 0;
    $totalArea = 0;
    foreach ($detalles as $det)
    {
        if(!in_array($det['ARC'], $ARCS))
        {
            $ARCS[$index] = $det['ARC'];
            $index++;
        }

    }

    foreach ($ARCS as $a)
    {
        $pdf->Ln(10);

        $areaSet = false;

        foreach ($detalles as $det)
        {

            if($a == $det['ARC'])
            {

                $pdf->SetFont('helvetica', 'B', 10);
                $pdf->SetFillColor(224, 235, 255);
                if(!$areaSet)
                {
                    $pdf->Cell(200, 5, $det['AreaC'], 1, 0, 'C', 1);
                    $areaSet = true;
                    $pdf->Ln(5);
                    $pdf->SetFont('helvetica', 'B', 8);
                    $pdf->SetFillColor(224, 235, 255);
                    $pdf->Cell(10, 5, 'Año', 1, 0, 'L', 1);
                    $pdf->Cell(125, 5, 'Carrera', 1, 0, 'L', 1);
                    $pdf->Cell(20, 5, 'Modalidad', 1, 0, 'L', 1);
                    $pdf->Cell(15, 5, 'FEM', 1, 0, 'L', 1);
                    $pdf->Cell(15, 5, 'MAS', 1, 0, 'L', 1);
                    $pdf->Cell(15, 5, 'Total', 1, 0, 'L', 1);

                    $newPage = $newPage + 5;
                }
                $pdf->Ln(5);
                $pdf->SetFillColor(255, 255, 255);
                $pdf->SetFont('helvetica', 'N', 8);
                $pdf->Cell(10, 5, $det['anio'], 1, 0, 'L', 1);
                $pdf->Cell(125, 5, $det['Carrera'], 1, 0, 'L', 1);
                $pdf->Cell(20, 5, $det['modalidad'], 1, 0, 'L', 1);
                $pdf->Cell(15, 5, $det['fem'], 1, 0, 'L', 1);
                $pdf->Cell(15, 5, $det['mas'], 1, 0, 'L', 1);
                $pdf->Cell(15, 5, $det['TotalR'], 1, 0, 'L', 1);

                $totalMasculinos = $totalMasculinos + $det['mas'];
                $totalFemeninos = $totalFemeninos +  $det['fem'];
                $totalArea = $totalArea + $det['TotalR'];

                $newPage = $newPage + 5;
            }

        }
        //Una area de conocimeinto finaliza
        $pdf->Ln(6);
        $pdf->SetFont('helvetica', 'B', 10);
        $pdf->Cell(105, 4, '', 0, 0, 'C');
        $pdf->Cell(50, 4, 'SUB-TOTAL **', 0, 0, 'L');
        $pdf->Cell(15, 4,$totalFemeninos, 1, 0, 'L');
        $pdf->Cell(15, 4,$totalMasculinos, 1, 0, 'L');
        $pdf->Cell(15, 4,$totalArea, 1, 0, 'L');

        $totalCentro = $totalCentro + $totalArea;
        $totalCentroFem = $totalCentroFem +$totalFemeninos;
        $totalCentroMas = $totalCentroMas + $totalMasculinos;


        $totalMasculinos = 0;
        $totalFemeninos = 0;
        $totalArea = 0;
        $pdf->Ln(2);

        $newPage = $newPage + 8;
    }
    $pdf->Ln(6);
    $pdf->SetFont('helvetica', 'B', 13);
    $pdf->Cell(155, 4, 'TOTAL ** '.$reg['TC'].' - '.$reg['Centro'], 1, 0, 'L');
    $pdf->Cell(15, 4,$totalCentroFem, 1, 0, 'L');
    $pdf->Cell(15, 4,$totalCentroMas, 1, 0, 'L');
    $pdf->Cell(15, 4,$totalCentro, 1, 0, 'L');


    $totolGeneral = $totolGeneral + $totalCentro;
    $totalGeneralFem = $totalGeneralFem + $totalCentroFem;
    $totalGeneralMas = $totalGeneralMas + $totalCentroMas;

    //Un Centro finaliza
    $totalCentroMas = 0;
    $totalCentroFem = 0;
    $totalCentro = 0;
}

$pdf->Ln(13);
$pdf->SetFont('helvetica', 'B', 13);
$pdf->Cell(155, 4, 'TOTAL GENERAL ** ', 0, 0, 'L');
$pdf->Cell(15, 4,$totalGeneralFem, 1, 0, 'L');
$pdf->Cell(15, 4,$totalGeneralMas, 1, 0, 'L');
$pdf->Cell(15, 4,$totolGeneral, 1, 0, 'L');
/*
$pdf->Cell(80, 5, 'Centro', 0, 0, 'L', 0);
$pdf->Cell(80, 5, 'Tipo Ingreso', 0, 0, 'L', 0);

$pdf->Ln(6);
$pdf->SetFont('helvetica', 'N', 10);
$pdf->Cell(80, 5, $registro['Centro'], 0, 0, 'L', 0);
$pdf->Cell(80, 5, $registro['TipoIngreso'], 0, 0, 'L', 0);

$pdf->Ln(9);
$pdf->SetFont('helvetica', 'B', 15);
$pdf->Cell(80, 5, 'Carrera', 0, 0, 'L', 0);
$pdf->Cell(80, 5, 'Semestre', 0, 0, 'L', 0);
$pdf->Ln(6);
$pdf->SetFont('helvetica', 'N', 10);
$pdf->Cell(80, 5, $registro['Carrera'], 0, 0, 'L', 0);
$pdf->Cell(80, 5, $registro['Semestre'], 0, 0, 'L', 0);

$pdf->Ln(15);
$pdf->SetFont('helvetica', 'B', 8);
$pdf->SetFillColor(224, 235, 255);
$pdf->Cell(35, 5, 'Año Carrera', 1, 0, 'L', 1);
$pdf->Cell(35, 5, 'Modalidad', 1, 0, 'L', 1);
$pdf->Cell(35, 5, 'Cantidad Masculino', 1, 0, 'L', 1);
$pdf->Cell(35, 5, 'Cantidad Femenino', 1, 0, 'L', 1);
$pdf->Cell(35, 5, 'Total', 1, 0, 'L', 1);



$stmt = $con->conectar()->prepare('call reporte_registro_matriculado_individual_detalle(?)');
$stmt->bindParam(1,$id ,PDO::PARAM_INT);
$stmt->execute();

$detalles = $stmt->fetchAll(PDO::FETCH_ASSOC);
$totalMasculinos = 0;
$totalFemeninos = 0;
foreach ($detalles as $xpe)
{
    if($count == 60) // Create New Page
    {
        $pdf->AddPage();
        $pdf->Ln(9);
        $pdf->SetFont('helvetica', 'B', 8);
        $pdf->SetFillColor(224, 235, 255);
        $pdf->Cell(35, 5, 'Año Carrera', 1, 0, 'L', 1);
        $pdf->Cell(35, 5, 'Modalidad', 1, 0, 'L', 1);
        $pdf->Cell(35, 5, 'Cantidad Masculino', 1, 0, 'L', 1);
        $pdf->Cell(35, 5, 'Cantidad Femenino', 1, 0, 'L', 1);
        $pdf->Cell(35, 5, 'Total', 1, 0, 'L', 1);
        $pdf->SetFont('helvetica', '', 8);

        $newLineSize = false;
        $count = 0;
    }

    if($newLineSize)
    {
        $pdf->Ln(4);
    }
    else{
        $pdf->Ln(5);
    }

//Information
    $pdf->SetFont('helvetica', 'N', 8);
    $pdf->Cell(35, 4, $xpe['anio'], 1, 0, 'C');
    $pdf->Cell(35, 4, $xpe['modalidad'], 1, 0, 'C');
    $pdf->Cell(35, 4, $xpe['mas'], 1, 0, 'C');
    $pdf->Cell(35, 4, $xpe['fem'], 1, 0, 'C');
    $pdf->SetFont('helvetica', 'B', 8);
    $pdf->Cell(35, 4, $xpe['TotalR'], 1, 0, 'C');

    $totalMasculinos = $totalMasculinos + $xpe['mas'];
    $totalFemeninos = $totalFemeninos + $xpe['fem'];
    $count++;
    $newLineSize = true;
}
$pdf->Ln(6);
$pdf->SetFont('helvetica', 'B', 10);
$pdf->Cell(35, 4, '', 0, 0, 'C');
$pdf->Cell(35, 4, 'TOTAL **', 0, 0, 'C');
$pdf->Cell(35, 4,$totalMasculinos, 1, 0, 'C');
$pdf->Cell(35, 4,$totalFemeninos, 1, 0, 'C');
$pdf->Cell(35, 4,$registro['Total'], 1, 0, 'C');
*/

// Close and output PDF document
ob_end_clean();
// This method has several options, check the source code documentation for more information.
$pdf->Output('Reporte Individual de Registro Matriculado.pdf', 'I');





