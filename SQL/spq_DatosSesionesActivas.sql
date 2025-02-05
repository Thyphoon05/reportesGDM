GO
/****** Object:  StoredProcedure [dbo].[spq_DatosSesionesActivas]    Script Date: 10/31/2023 8:10:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[spq_DatosSesionesActivas]      
(      
 @tipo INT=1,
 @top  INT=10,
 @LID  VARCHAR(5) = 'es-MX'  
)      
AS      
BEGIN     
  --1 para top 10 personas en mes actual
  --2 para logins por mes en año en 

  IF @tipo = 1 
  BEGIN
	 select top (@top) count(PA.idPersona) as Visitas, concat(P.nombre, ' ' , p.apellidoPat,' ',P.apellidoMat) as Nombre from V6megapaca.dbo.PersonaSesionesActivas PA
		inner join Persona P
		on p.idPersona = pa.idPersona
		where year(getdate()) = year(fechaRegistro) --AND MONTH(GETDATE())=MONTH(fechaRegistro)
		group by P.nombre,p.apellidoPat,P.apellidoMat
		order by 1 DESC
  END
  IF @tipo = 2 
  BEGIN
	  SET language  'spanish'
	  select count(PA.idPersona) as Vicitas, concat(datename(MONTH,fechaRegistro),'-',year(fechaRegistro)) as Mes from V6megapaca.dbo.PersonaSesionesActivas PA
		where fechaRegistro >= DATEADD(year,-1,GETDATE())
		group by datename(MONTH,fechaRegistro),concat(datename(MONTH,fechaRegistro),'-',year(fechaRegistro))
		order by 2
  END

END