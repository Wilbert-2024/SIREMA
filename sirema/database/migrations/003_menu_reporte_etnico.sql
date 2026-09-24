-- Añade el reporte al submenú Reportes sin modificar el volcado original.
INSERT INTO menu (TextoMostrar, Modulo, IconoModulo, Accion, IconoAccion, Estado, PadreId, Orden)
SELECT 'Distribución étnica', 'informes_distribucionEtnica', NULL, 'index', NULL, 1, padre.Id, 7
FROM menu AS padre
WHERE padre.TextoMostrar = 'Reportes' AND padre.PadreId = 0
  AND NOT EXISTS (
      SELECT 1 FROM menu AS existente
      WHERE existente.Modulo = 'informes_distribucionEtnica'
        AND existente.Accion = 'index'
  );

-- Hace visible el nuevo enlace a quienes ya tienen Reportes y permiso de consulta de matrícula.
INSERT INTO menu_usuario (Usuarios_Id, Menu_Id)
SELECT DISTINCT acceso.Usuarios_Id, enlace.Id
FROM menu AS padre
JOIN menu_usuario AS acceso ON acceso.Menu_Id = padre.Id
JOIN funciones_usuario AS permiso ON permiso.Usuarios_Id = acceso.Usuarios_Id AND permiso.Estado = 1
JOIN funciones AS funcion ON funcion.Id = permiso.Funciones_Id AND funcion.Acronimo = 'MATRIN'
JOIN menu AS enlace ON enlace.PadreId = padre.Id
    AND enlace.Modulo = 'informes_distribucionEtnica' AND enlace.Accion = 'index'
WHERE padre.TextoMostrar = 'Reportes' AND padre.PadreId = 0
  AND NOT EXISTS (
      SELECT 1 FROM menu_usuario AS existente
      WHERE existente.Usuarios_Id = acceso.Usuarios_Id AND existente.Menu_Id = enlace.Id
  );

-- Verificación.
SELECT m.Id, m.TextoMostrar, m.Modulo, m.Accion, COUNT(mu.Id) AS UsuariosConAcceso
FROM menu AS m LEFT JOIN menu_usuario AS mu ON mu.Menu_Id = m.Id
WHERE m.Modulo = 'informes_distribucionEtnica' AND m.Accion = 'index'
GROUP BY m.Id, m.TextoMostrar, m.Modulo, m.Accion;
