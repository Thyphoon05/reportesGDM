GO
/****** Object:  StoredProcedure [dbo].[spq_LoginData]    Script Date: 10/31/2023 8:10:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[spq_LoginData]      
(      
 @idRazonSocial INT,
 @FechaDesde date,
 @FechaHasta date,
 @LID  VARCHAR(5) = 'es-MX'  
)      
AS      
BEGIN     

if @FechaHasta = '' SET @FechaHasta = getdaTE()

SELECT  distinct
    IdEmpleado as 'Número de nómina',
    p.nombre + ' ' + apellidoPat + ' ' + apellidoMat AS Nombre, 
    CAST(p.FechaAlta AS DATE) AS 'Fecha antigüedad',
	isnull(n.FechaBaja,'') as 'Fecha de baja',
    CASE 
        WHEN Status = 1 THEN 'ACTIVO' 
        ELSE 'INACTIVO' 
    END AS Estatus,
    ISNULL(ec.nombreElemento,'') AS Sucursal,
    pu.nombre AS Puesto, 
	ISNULL(ecd.nombreElemento,'') AS Direccion,
    CONVERT(VARCHAR, r.fechaRegistro, 103) AS Fecha,
    CONVERT(VARCHAR, r.fechaRegistro, 108) as hora,
    '' AS actividad,
	fechaRegistro
FROM 
    [V6Tertius].[dbo].[registroLogin] r
    INNER JOIN [V6Tertius].[dbo].Persona p ON r.Usuario = p.userId
    INNER JOIN V6Tertius.dbo.nomEmpleadoNomina n ON n.idPersona = p.idPersona
    INNER JOIN V6Tertius.dbo.Puesto pu ON pu.idPuesto = n.IdPuesto
    LEFT OUTER JOIN ElementoEntidad EE ON n.IdPuesto = ee.idEntidad
	AND ee.idCategoria = 9
    LEFT OUTER JOIN ElementoCategoria EC 
	    ON ec.idCategoria = EE.idCategoria 
        AND ec.idElemento = EE.idElemento 
    LEFT OUTER JOIN ElementoEntidad EEd ON n.idPersona = eed.idEntidad
	AND eed.idCategoria = 3
	and eed.tipoEntidad = 6
    LEFT OUTER JOIN ElementoCategoria ECd 
	    ON ecd.idCategoria = EEd.idCategoria 
        AND ecd.idElemento = EEd.idElemento 
	and n.idRazonSocial = @idRazonSocial
	WHERE fechaRegistro >=  @FechaDesde AND fechaRegistro <= @FechaHasta
order by fechaRegistro


END