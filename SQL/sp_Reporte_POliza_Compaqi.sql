ALTER PROCEDURE [dbo].[sp_Reporte_Poliza_Compaqi]
	@IdRazonSocial		INT		= 1,
	@IdTipoNominaAsig	VARCHAR(3)	= 'sem',
	@IdTipoNominaProc	VARCHAR(3)	= 'sem',
	@Anio			INT		= 2023,
	@mesDesde		INT 	=0,
	@mesHasta		INT		=0,
	@Periodo		INT		= 40,
	@UID			VARCHAR(50)	= '',
	@LID			VARCHAR(5)	= '',
	@idAccion		INT		= 0,
	@filtroidElementoCategoria  VARCHAR(MAX)=N''

AS

BEGIN

DECLARE @DatosCuentas TABLE 
(
Concepto VARCHAR (8)
, tipo TINYINT
, Cuenta VARCHAR (50)
, Importe DECIMAL (14, 4)
, TipoCuenta TINYINT
)

Insert into @DatosCuentas
select 
NEMH.Concepto
,tipo
,
case when NEMH.Concepto in ('D015') then
LEFT(
cast(ZonasEC.idElementoCentroCostos as varchar)
+cast(NEMH.IdEmpleado as varchar)
+REPLICATE(' ',30),30)
 when NEMH.Concepto in ('D008','D107') then
LEFT(
cast(ZonasEC.idElementoCentroCostos as varchar)
+cast(NEI.ParamStr4 as varchar)
+REPLICATE(' ',30),30)
when len(NCC.cuentaContable) < 3 then 
LEFT(
cast(ZonasEC.idElementoCentroCostos as varchar)
+right(cast(CedisEC.idElementoUsuario as varchar),2) 
+cast(NCC.cuentaContable as varchar)
+REPLICATE(' ',30),30)
else NCC.cuentaContable end as Cuenta,
case when NEMH.Concepto in ('D001','D002','D003','D005','D024','D027','D028','D037','D101','D102') then Importe*-1 else Importe end as Importe,
CASE WHEN Tipo=0 then 1 else 0 end
from nomEmpleadoMovtoHis NEMH
INNER JOIN nomConcepto NC
ON NC.Concepto = NEMH.Concepto
AND NC.IdRazonSocial = NEMH.IdRazonSocial
INNER JOIN nomEmpleadoNominaAcumulado NENA
ON NENA.IdRazonSocial = NEMH.IdRazonSocial
AND NENA.IdEmpleado = NEMH.IdEmpleado
AND NENA.IdTipoNominaAsig = NEMH.IdTipoNominaAsig
AND NENA.IdTipoNominaProc = NEMH.IdTipoNominaProc
AND NENA.Periodo = NEMH.Periodo
AND NENA.Anio = NEMH.Anio
inner join ElementoEntidad ZonasEE
ON ZonasEE.idEntidad = NENA.idPosicion
AND ZonasEE.tipoEntidad = 2
INNER JOIN ElementoCategoria ZonasEC
on ZonasEC.idElemento = ZonasEE.idElemento
AND ZonasEC.idcategoria = 2
inner join ElementoEntidad CedisEE
ON CedisEE.idEntidad = NENA.idPosicion
AND CedisEE.tipoEntidad = 2
INNER JOIN ElementoCategoria CedisEC
on CedisEE.idElemento = CedisEC.idElemento
AND CedisEE.idcategoria = 4
INNER JOIN nomConceptoContable NCC
ON NCC.Concepto = NEMH.Concepto
AND NCC.IdRazonSocial = NEMH.IdRazonSocial
LEFT OUTER JOIN nomEmpleadoInci NEI
ON  NEMH.Anio = NEI.Anio
AND NEMH.Concepto = NEI.Concepto
AND NEMH.Periodo = NEI.Periodo
AND NEMH.IdRazonSocial = NEI.IdRazonSocial
AND NEMH.IdEmpleado = NEI.IdEmpleado
AND NEMH.IdTipoNominaAsig = NEI.IdTipoNominaAsig
AND NEMH.IdTipoNominaProc = NEI.IdTipoNominaProc
WHERE NEMH.Periodo = @Periodo
AND NEMH.Anio = @Anio
AND NEMH.IdRazonSocial = @IdRazonSocial
AND NEMH.IdTipoNominaAsig = @IdTipoNominaAsig
AND NEMH.IdTipoNominaProc = @IdTipoNominaProc


DECLARE @Nominas TABLE 
	(
	 AnioPeriodo SMALLINT
	, IdTipoNomina VARCHAR (3)
	, MesAcumular TINYINT
	, Periodo INT
	, IdRazonSocial INT
	, NominaCompleto NVARCHAR (100)
	, Nomina VARCHAR (30)
	)

INSERT INTO @Nominas
SELECT AnioPeriodo,IdTipoNomina,MesAcumular,Periodo,IdRazonSocial,
concat('Nom ',ROW_NUMBER() over (partition by AnioPeriodo,IdTipoNomina,MesAcumular order by AnioPeriodo,IdTipoNomina,MesAcumular ),
' ',IdTipoNomina,' ',FORMAT (FechaInicio, 'dd/MM/yy'),'-',FORMAT (FechaFin, 'dd/MM/yy ')) as NominaCompleto,
concat(IdTipoNomina,' ',ROW_NUMBER() over (partition by AnioPeriodo,NC.IdTipoNomina,MesAcumular order by AnioPeriodo,NC.IdTipoNomina,MesAcumular))
as Nomina
from nomCalendario NC

SELECT 
'P  ',
CONVERT(VARCHAR, GETDATE(), 112),
' ',
'   3',
' ',
'    FOLIO',
' ','1',' 0         ',' ',
left(concat('Nom ',ROW_NUMBER() over (partition by AnioPeriodo,IdTipoNomina,MesAcumular order by AnioPeriodo,IdTipoNomina,MesAcumular ),
' ',IdTipoNomina,' ',FORMAT (FechaInicio, 'dd/MM/yy'),'-',FORMAT (FechaFin, 'dd/MM/yy '))
+replicate(' ', 100),100),
'  6 0 0 ',
'GUID',
' ',
' ',
' '
from nomCalendario NC
WHERE NC.Periodo = @Periodo
AND NC.AnioPeriodo = @Anio
AND NC.IdRazonSocial = @IdRazonSocial
AND NC.IdTipoNomina = @IdTipoNominaProc

UNION ALL

SELECT 
'M1 ',
' ',
DC.Concepto,
Cuenta,
' ',
left(Nomina+replicate(' ', 30),30),
' ',
TipoCuenta,
SUM(dc.Importe) as Importe ,
' 0 0 ',
NominaCompleto,
' ',
'SEQ ',
' ',
'GUID',
CONVERT(VARCHAR, GETDATE(), 112)
from nomEmpleadoMovtoHis NEMH
INNER JOIN @Nominas N
ON NEMH.Periodo = N.Periodo
AND NEMH.Anio = N.AnioPeriodo
AND NEMH.IdRazonSocial = N.IdRazonSocial
AND NEMH.IdTipoNominaProc = N.IdTipoNomina
INNER JOIN @DatosCuentas DC
ON DC.Concepto = NEMH.Concepto
WHERE NEMH.Periodo = @Periodo
AND NEMH.Anio = @Anio
AND NEMH.IdRazonSocial = @IdRazonSocial
AND NEMH.IdTipoNominaAsig = @IdTipoNominaAsig
AND NEMH.IdTipoNominaProc = @IdTipoNominaProc
AND Tipo IN (0,1)
GROUP BY Nomina, NominaCompleto, TipoCuenta,Cuenta,DC.Concepto
END