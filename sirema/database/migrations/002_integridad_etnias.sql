-- RF03: revisar el estado de la tabla antes de aplicar las restricciones.
-- Se conserva la grafía original de la tabla: resgistro_matricula_etnia.
SELECT Id, RegistroMatricula_Id, Etnia_Id, Cantidad
FROM resgistro_matricula_etnia
WHERE Cantidad IS NULL OR Cantidad < 0;

SELECT RegistroMatricula_Id, Etnia_Id, COUNT(*) AS duplicados
FROM resgistro_matricula_etnia
GROUP BY RegistroMatricula_Id, Etnia_Id
HAVING COUNT(*) > 1;

-- Corregir las filas devueltas antes de ejecutar ALTER TABLE.
ALTER TABLE resgistro_matricula_etnia
  ADD CONSTRAINT chk_etnia_cantidad CHECK (Cantidad IS NOT NULL AND Cantidad >= 0),
  ADD CONSTRAINT uq_matricula_etnia UNIQUE (RegistroMatricula_Id, Etnia_Id);

-- Auditoría histórica: mostrar matrículas sin distribución o con suma distinta.
-- Los registros previos no se modifican automáticamente.
SELECT r.Id, r.Total, COALESCE(SUM(e.Cantidad), 0) AS TotalEtnias
FROM registro_matricula AS r
LEFT JOIN resgistro_matricula_etnia AS e ON e.RegistroMatricula_Id = r.Id
GROUP BY r.Id, r.Total
HAVING COUNT(e.Id) = 0 OR COALESCE(SUM(e.Cantidad), 0) <> r.Total;
