<?php
require_once $_SERVER['DOCUMENT_ROOT'] . '/sirema/controllers/matriculadoController.php';
require_once $_SERVER['DOCUMENT_ROOT'] . '/sirema/TCPDF/tcpdf.php';

$controlador = new matriculadoController();
$datos = $controlador->getDistribucionEtnica($_POST['Id'] ?? null, true);
if (!is_array($datos)) {
    http_response_code(403);
    exit('No se encontró la matrícula o no tienes permiso para ver el reporte.');
}

$pdf = new TCPDF('P', 'mm', 'A4', true, 'UTF-8', false);
$pdf->SetCreator('SIREMA');
$pdf->SetTitle('Distribución étnica de matrícula ' . $datos['Id']);
$pdf->setPrintHeader(false);
$pdf->setPrintFooter(true);
$pdf->SetMargins(20, 20, 20);
$pdf->AddPage();
$pdf->SetFont('helvetica', 'B', 14);
$pdf->Cell(0, 10, 'Distribución étnica de matrícula', 0, 1, 'C');
$pdf->SetFont('helvetica', '', 10);
$pdf->MultiCell(0, 6, 'Matrícula: ' . $datos['Id'] . '    Centro: ' . $datos['Centro'] . "\nCarrera: " . $datos['Carrera'], 0, 'L');
$pdf->Ln(4);
$pdf->SetFont('helvetica', 'B', 10);
$pdf->Cell(100, 8, 'Etnia', 1, 0);
$pdf->Cell(35, 8, 'Estudiantes', 1, 0, 'R');
$pdf->Cell(35, 8, 'Porcentaje', 1, 1, 'R');
$pdf->SetFont('helvetica', '', 10);
$suma = 0;
$total = (int) $datos['Total'];
foreach ($datos['Etnias'] as $etnia) {
    $cantidad = (int) $etnia['Cantidad'];
    $suma += $cantidad;
    $porcentaje = $total > 0 ? number_format(100 * $cantidad / $total, 1) . '%' : '0.0%';
    $pdf->Cell(100, 8, $etnia['DescripcionEtnia'], 1, 0);
    $pdf->Cell(35, 8, $cantidad, 1, 0, 'R');
    $pdf->Cell(35, 8, $porcentaje, 1, 1, 'R');
}
$pdf->SetFont('helvetica', 'B', 10);
$pdf->Cell(100, 8, 'Total clasificado', 1, 0);
$pdf->Cell(35, 8, $suma, 1, 0, 'R');
$pdf->Cell(35, 8, $total > 0 ? number_format(100 * $suma / $total, 1) . '%' : '0.0%', 1, 1, 'R');
$pdf->Ln(5);
$pdf->SetFont('helvetica', '', 10);
$pdf->MultiCell(0, 6, 'Total de matrícula: ' . $total . '. Estado: ' .
    ($suma === $total && $total > 0 ? 'distribución completa' : 'distribución pendiente o incompleta') . '.', 0, 'L');
$pdf->Output('distribucion_etnica_' . (int) $datos['Id'] . '.pdf', 'I');
