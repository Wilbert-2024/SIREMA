<?php
require_once $_SERVER['DOCUMENT_ROOT'] . '/sirema/controllers/matriculadoController.php';
require_once $_SERVER['DOCUMENT_ROOT'] . '/sirema/TCPDF/tcpdf.php';

$controlador = new matriculadoController();
$datos = $controlador->getDistribucionEtnica($_POST['Id'] ?? null, true);
if (!is_array($datos)) {
    http_response_code(403);
    exit('No se encontró la matrícula o no tienes permiso para ver el reporte.');
}

class ReporteDistribucionEtnicaPDF extends TCPDF
{
    public function Header()
    {
        $logo = $_SERVER['DOCUMENT_ROOT'] . '/sirema/assets/img/bicu.png';
        if (is_file($logo)) {
            $this->Image($logo, 20, 10, 20, 0, 'PNG');
        }
        $this->SetY(12);
        $this->SetFont('helvetica', 'B', 11);
        $this->Cell(0, 6, 'BLUEFIELDS INDIAN & CARIBBEAN UNIVERSITY', 0, 1, 'C');
        $this->Cell(0, 5, 'BICU', 0, 1, 'C');
        $this->SetFont('helvetica', '', 10);
        $this->Cell(0, 5, 'DIRECCIÓN DE REGISTRO ACADÉMICO', 0, 1, 'C');
        $this->Ln(3);
        $this->Line(15, $this->GetY(), 195, $this->GetY());
    }

    public function Footer()
    {
        $this->SetY(-20);
        $this->SetFont('helvetica', 'I', 8);
        $fecha = new DateTimeImmutable('now', new DateTimeZone('America/Managua'));
        $this->Cell(95, 5, 'IMPRESO EL: ' . $fecha->format('Y-m-d H:i:s'), 0, 0, 'L');
        $this->Cell(75, 5, 'Pág. ' . $this->getAliasNumPage() . ' de ' . $this->getAliasNbPages(), 0, 0, 'R');
    }
}

$pdf = new ReporteDistribucionEtnicaPDF('P', 'mm', 'A4', true, 'UTF-8', false);
$pdf->SetCreator('SIREMA');
$pdf->SetAuthor('BICU');
$pdf->SetTitle('Distribución étnica de matrícula ' . $datos['Id']);
$pdf->SetMargins(20, 47, 20);
$pdf->SetAutoPageBreak(true, 25);
$pdf->AddPage();
$pdf->SetFont('helvetica', 'B', 13);
$pdf->Cell(0, 8, 'REPORTE DE DISTRIBUCIÓN ÉTNICA', 0, 1, 'C');
$pdf->Ln(4);
$pdf->SetFont('helvetica', 'B', 11);
$pdf->Cell(85, 6, 'Recinto', 0, 0);
$pdf->Cell(85, 6, 'Registro de matrícula', 0, 1);
$pdf->SetFont('helvetica', '', 10);
$pdf->Cell(85, 7, $datos['Centro'], 0, 0);
$pdf->Cell(85, 7, (string) $datos['Id'], 0, 1);
$pdf->Ln(3);
$pdf->SetFont('helvetica', 'B', 11);
$pdf->Cell(0, 6, 'Carrera', 0, 1);
$pdf->SetFont('helvetica', '', 10);
$pdf->MultiCell(0, 7, $datos['Carrera'], 0, 'L');
$pdf->Ln(8);

$dibujarEncabezado = function () use ($pdf) {
    $pdf->SetFont('helvetica', 'B', 9);
    $pdf->SetFillColor(224, 235, 255);
    $pdf->Cell(100, 8, 'Etnia', 1, 0, 'L', true);
    $pdf->Cell(35, 8, 'Cantidad', 1, 0, 'C', true);
    $pdf->Cell(35, 8, 'Porcentaje', 1, 1, 'C', true);
};
$dibujarEncabezado();

$suma = 0;
$total = (int) $datos['Total'];
foreach ($datos['Etnias'] as $etnia) {
    $cantidad = (int) $etnia['Cantidad'];
    $suma += $cantidad;
    $porcentaje = $total > 0 ? number_format(100 * $cantidad / $total, 1) . '%' : '0.0%';
    $pdf->SetFont('helvetica', '', 9);
    $alto = max(8, $pdf->getStringHeight(100, $etnia['DescripcionEtnia']));
    if ($pdf->GetY() + $alto > 265) {
        $pdf->AddPage();
        $dibujarEncabezado();
    }
    $x = $pdf->GetX();
    $y = $pdf->GetY();
    $pdf->MultiCell(100, $alto, $etnia['DescripcionEtnia'], 1, 'L', false, 0, $x, $y);
    $pdf->MultiCell(35, $alto, (string) $cantidad, 1, 'C', false, 0, $x + 100, $y);
    $pdf->MultiCell(35, $alto, $porcentaje, 1, 'C', false, 1, $x + 135, $y);
}
if ($pdf->GetY() > 250) {
    $pdf->AddPage();
    $dibujarEncabezado();
}
$pdf->SetFont('helvetica', 'B', 10);
$pdf->Cell(100, 8, 'TOTAL CLASIFICADO **', 1, 0);
$pdf->Cell(35, 8, (string) $suma, 1, 0, 'C');
$pdf->Cell(35, 8, $total > 0 ? number_format(100 * $suma / $total, 1) . '%' : '0.0%', 1, 1, 'C');
$pdf->Ln(6);
$pdf->Cell(100, 8, 'TOTAL GENERAL DE MATRÍCULA **', 1, 0);
$pdf->Cell(35, 8, (string) $total, 1, 0, 'C');
$pdf->Cell(35, 8, '', 1, 1);
$pdf->Ln(5);
$pdf->SetFont('helvetica', '', 9);
$estado = $suma === $total && $total > 0 ? 'Distribución completa' : 'Distribución pendiente o incompleta';
$pdf->Cell(0, 6, 'Estado: ' . $estado, 0, 1);
$pdf->Output('distribucion_etnica_' . (int) $datos['Id'] . '.pdf', 'I');
