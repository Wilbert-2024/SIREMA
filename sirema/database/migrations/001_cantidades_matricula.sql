-- ============================================================
-- SIREMA
-- Migración: 001_cantidades_matricula
-- Descripción:
-- Validación y restricciones para cantidades de matrícula.
-- Motor: MySQL
-- ============================================================

USE sirema;

-- ============================================================
-- Primero, revisar y corregir las filas devueltas por estas 
-- consultas.
-- ============================================================

SELECT Id, cantidad_femenino, cantidad_masculino
FROM detalle_registro_matricula
WHERE cantidad_femenino IS NULL OR cantidad_masculino IS NULL
   OR cantidad_femenino < 0 OR cantidad_masculino < 0;

SELECT Id, Total
FROM registro_matricula
WHERE Total IS NULL OR Total < 0;

-- ============================================================
-- Las sentencias ALTER fallarán si existen filas incompatibles; 
-- no borrar datos automáticamente.
-- ============================================================

ALTER TABLE detalle_registro_matricula
  ADD CONSTRAINT chk_detalle_cantidad_femenino
    CHECK (cantidad_femenino IS NOT NULL AND cantidad_femenino >= 0),
  ADD CONSTRAINT chk_detalle_cantidad_masculino
    CHECK (cantidad_masculino IS NOT NULL AND cantidad_masculino >= 0);

ALTER TABLE registro_matricula
  ADD CONSTRAINT chk_matricula_total
    CHECK (Total IS NOT NULL AND Total >= 0);