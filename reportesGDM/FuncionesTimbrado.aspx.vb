Imports System
Imports System.IO
Imports System.Web
Imports DataDynamics.ActiveReports
Imports Intelexion.Framework.Model
Imports Intelexion.Nomina
Imports Intelexion.Framework.View
Imports System.Collections.Generic
Imports System.Web.HttpContext
Imports System.Data
Imports System.Text
Imports System.Configuration
Imports System.Data.SqlClient
Imports System.Web.Script.Serialization
Imports System.Globalization
Imports DataDynamics.ActiveReports.ActiveReport3
Imports DataDynamics.ActiveReports.Export.Pdf
Imports ITX.Aliatec.ReciboNomina


Partial Public Class Timbrado
    Inherits System.Web.UI.Page
    Dim sConnection As String = Intelexion.Framework.Model.SQLConnectionProvider.getConnection("default").getConnection.ConnectionString

    <System.Web.Services.WebMethod()> _
    Public Shared Function ObtenerAnios(ByVal IdRazonSocial As Integer, ByVal IdTipoNominaProc As String, ByVal IdTipoNominaAsig As String) As String

        ' Llama a la función ConsultaRazonesSociales
        Dim anios = New Timbrado().ConsultaAnios(IdRazonSocial, IdTipoNominaProc, IdTipoNominaAsig)

        ' Serializa la lista de resultados a JSON
        Dim jsSerializer As New JavaScriptSerializer()
        Return jsSerializer.Serialize(anios)
    End Function
    <System.Web.Services.WebMethod()> _
    Public Shared Function ObtenerPeriodos(ByVal IdRazonSocial As Integer, ByVal IdTipoNominaProc As String, ByVal IdTipoNominaAsig As String, ByVal Anio As Integer) As String

        ' Llama a la función ConsultaRazonesSociales
        Dim periodos = New Timbrado().ConsultaPeriodos(IdRazonSocial, IdTipoNominaProc, IdTipoNominaAsig, Anio)

        ' Serializa la lista de resultados a JSON
        Dim jsSerializer As New JavaScriptSerializer()
        Return jsSerializer.Serialize(periodos)
    End Function

    <System.Web.Services.WebMethod()> _
    Public Shared Function ObtenerRazonesSociales(ByVal userId As String, ByVal languageId As String) As String
        ' Llama a la función ConsultaRazonesSociales
        Dim razonesSociales = New Timbrado().ConsultaRazonesSociales(userId, languageId)

        ' Serializa la lista de resultados a JSON
        Dim jsSerializer As New JavaScriptSerializer()
        Return jsSerializer.Serialize(razonesSociales)
    End Function

    <System.Web.Services.WebMethod()> _
    Public Shared Function ObtenerTiposNomina(ByVal IdRazonSocial As Integer, ByVal userId As String, ByVal languageId As String) As String
        Try
            Dim logPath As String = HttpContext.Current.Server.MapPath("~/debug_log.txt")

            ' Asignación de valores predeterminados para porTipo y tipoClase de forma segura
            Dim porTipo As Boolean = If(HttpContext.Current.Request.Params("porTipo") IsNot Nothing, Convert.ToBoolean(HttpContext.Current.Request.Params("porTipo")), False)
            Dim tipoClase As Integer = If(HttpContext.Current.Request.Params("tipoClase") IsNot Nothing, Convert.ToInt32(HttpContext.Current.Request.Params("tipoClase")), -1)

            ' Escribir valores en el archivo de log
            Dim logMessage As String = "IdRazonSocial: {IdRazonSocial}, userId: {userId}, languageId: {languageId}, porTipo: {porTipo}, tipoClase: {tipoClase}"
            System.IO.File.AppendAllText(logPath, logMessage & Environment.NewLine)

            ' Llama a la función ConsultaTiposNomina
            Dim TiposNomina = New Timbrado().ConsultaTiposNomina(IdRazonSocial, userId, languageId, porTipo, tipoClase)

            Dim jsSerializer As New JavaScriptSerializer()
            Return jsSerializer.Serialize(TiposNomina)
        Catch ex As Exception
            Dim logPath As String = HttpContext.Current.Server.MapPath("~/debug_log.txt")
            Dim errorMessage As String = "Error en ObtenerTiposNomina: " & ex.Message
            System.IO.File.AppendAllText(logPath, errorMessage & Environment.NewLine)
            Return "Error: " & ex.Message
        End Try
    End Function

    <System.Web.Services.WebMethod()> _
    Public Shared Function AccederFiltraTimbrado(ByVal IdRazonSocial As Integer, ByVal IdTipoNominaAsig As String, ByVal IdTipoNominaProc As String, ByVal Anio As Integer, ByVal Periodo As Integer, ByVal IdAtributos As String) As String
        Try
            ' Extraer parámetros enviados por DataTables
            Dim requestParams = HttpContext.Current.Request.Params

            Dim status As Integer = If(requestParams("Status") IsNot Nothing, Convert.ToInt32(requestParams("Status")), 0)
            Dim orderBy As String = If(requestParams("orderBy") IsNot Nothing, requestParams("orderBy").ToString(), "IdEmpleado")
            Dim searchValue As String = If(requestParams("sSearch") IsNot Nothing, requestParams("sSearch").ToString(), "")
            Dim start As Integer = If(requestParams("iDisplayStart") IsNot Nothing, Convert.ToInt32(requestParams("iDisplayStart")), 0)
            Dim length As Integer = If(requestParams("iDisplayLength") IsNot Nothing, Convert.ToInt32(requestParams("iDisplayLength")), 10)
            Dim pageNumber As Integer = (start \ length) + 1
            Dim pageSize As Integer = length

            ' Llamar al método de negocio FiltraTimbrado
            Dim FiltraTimbrado = New Timbrado().FiltraTimbrado(IdRazonSocial, IdTipoNominaAsig, IdTipoNominaProc, Anio, Periodo, orderBy, status, IdAtributos, searchValue, pageNumber, pageSize)
            Dim totalRecords As Integer = 0
            Dim TotalDisplayRecords As Integer = If(FiltraTimbrado.Count > 0, FiltraTimbrado.Count, 0)
            If FiltraTimbrado.Count > 0 Then
                Dim firstItem As Dictionary(Of String, Object) = FiltraTimbrado(0)
                If firstItem.ContainsKey("TotalRows") Then
                    totalRecords = CType(firstItem("TotalRows"), Integer)
                End If
            End If

            ' Formatear la respuesta para DataTables

            Dim response As New Dictionary(Of String, Object)

            'response.Add("draw", draw)
            'response.Add("recordsTotal", totalRecords)
            'response.Add("recordsFiltered", TotalDisplayRecords)
            response.Add("data", FiltraTimbrado)

            ' Serializar la respuesta en JSON
            Dim jsSerializer As New JavaScriptSerializer()
            jsSerializer.MaxJsonLength = Integer.MaxValue
            Return jsSerializer.Serialize(response)

        Catch ex As Exception
            ' Manejo de errores
            Dim errorResponse As New Dictionary(Of String, String)()
            errorResponse.Add("error", ex.Message)
            Dim jsSerializer As New JavaScriptSerializer()
            Return jsSerializer.Serialize(errorResponse)
        End Try
    End Function

    <System.Web.Services.WebMethod()> _
Public Shared Function EjecutarEmpleadosTimbrar(ByVal Password As String, ByVal IdRazonSocial As Integer, ByVal IdTipoNominaAsig As String, ByVal IdTipoNominaProc As String, ByVal Anio As Integer, ByVal Periodo As Integer, ByVal UserId As String, ByVal LanguageId As String, ByVal cadenaEmpleados As String, ByVal checkAll As Boolean, ByVal IdAtributos As String) As String
        ' Llama a la función ConsultaRazonesSociales
        Dim FiltraTimbrado = New Timbrado().EmpleadosTimbrar(Password, IdRazonSocial, IdTipoNominaAsig, IdTipoNominaProc, Anio, Periodo, UserId, LanguageId, cadenaEmpleados, checkall, IdAtributos)

        ' Serializa la lista de resultados a JSON
        Dim jsSerializer As New JavaScriptSerializer()
        Return jsSerializer.Serialize(FiltraTimbrado)
    End Function

    <System.Web.Services.WebMethod()> _
Public Shared Function EjecutarEmpleadosTimbrarDirecto(ByVal IdRazonSocial As Integer, ByVal IdTipoNominaAsig As String, ByVal IdTipoNominaProc As String, ByVal Anio As Integer, ByVal Periodo As Integer) As String
        ' Llama a la función ConsultaRazonesSociales
        Dim FiltraTimbrado = New Timbrado().EmpleadosTimbrarDirecto(IdRazonSocial, IdTipoNominaAsig, IdTipoNominaProc, Anio, Periodo)

        ' Serializa la lista de resultados a JSON
        Dim jsSerializer As New JavaScriptSerializer()
        Return jsSerializer.Serialize(FiltraTimbrado)
    End Function


    <System.Web.Services.WebMethod()> _
    Public Shared Function ObtenerXML(ByVal FolioFiscal As String, ByVal salvar As Boolean) As String

        ' Llama a la función ConsultaRazonesSociales
        Dim XMLTimbrado = New Timbrado().ProcesarDescagaFolio(FolioFiscal, salvar)

        If salvar Then
            ' Obtener la ruta de guardado
            Dim rutaGuardado As String = Intelexion.Framework.SystemFlags.SystemFlags.getValueById(7020)

            ' Validar la ruta
            If String.IsNullOrEmpty(rutaGuardado) Then
                Throw New InvalidOperationException("No se encontró una ruta válida para guardar el archivo.")
            End If

            ' Asegurar que la carpeta exista
            If Not IO.Directory.Exists(rutaGuardado) Then
                IO.Directory.CreateDirectory(rutaGuardado)
            End If

            ' Generar un nombre único para el archivo
            Dim nombreArchivo As String = FolioFiscal & ".xml"
            Dim rutaCompleta As String = IO.Path.Combine(rutaGuardado, nombreArchivo)

            ' Guardar el archivo en la ruta especificada
            IO.File.WriteAllText(rutaCompleta, XMLTimbrado)

            ' Confirmación de guardado
            HttpContext.Current.Response.Write("Archivo guardado correctamente en: {rutaCompleta}")
        Else
            ' Configurar la respuesta HTTP para forzar la descarga del archivo
            HttpContext.Current.Response.Clear()
            HttpContext.Current.Response.ContentType = "application/xml"
            HttpContext.Current.Response.AddHeader("Content-Disposition", "attachment; filename=" + FolioFiscal + ".xml")
            HttpContext.Current.Response.Write(XMLTimbrado)
            HttpContext.Current.Response.End()
        End If

        Dim jsSerializer As New JavaScriptSerializer()
        Return jsSerializer.Serialize(XMLTimbrado)
    End Function

    <System.Web.Services.WebMethod()> _
   Public Shared Sub GenerarReporteReciboNomina(ByVal IdRazonSocial As Integer, ByVal IdTipoNominaAsig As String, ByVal IdTipoNominaProc As String, ByVal Anio As Integer, ByVal Periodo As Integer, ByVal IdEmpleado As String, ByVal abrirEnNuevaPestana As Boolean)
        Try
            ' Crear una instancia del reporte
            Dim reporte As New ITX.Aliatec.ReciboNomina()

            ' Configuración de parámetros
            reporte.Parameters("IdRazonSocial").Value = IdRazonSocial
            reporte.Parameters("IdTipoNominaAsig").Value = IdTipoNominaAsig
            reporte.Parameters("IdTipoNominaProc").Value = IdTipoNominaProc
            reporte.Parameters("Anio").Value = Anio
            reporte.Parameters("Periodo").Value = Periodo
            reporte.Parameters("IdEmpleado").Value = IdEmpleado
            reporte.Parameters("UID").Value = ""
            reporte.Parameters("LID").Value = ""
            reporte.Parameters("idAccion").Value = ""
            reporte.Parameters("filtroidElementoCategoria").Value = ""

            ' Ejecutar el reporte
            reporte.Run()

            ' Crear un exportador PDF
            Dim pdfExport As New PdfExport()
            Dim memoryStream As New IO.MemoryStream()

            ' Exportar el reporte al MemoryStream
            pdfExport.Export(reporte.Document, memoryStream)

            ' Configurar la respuesta HTTP para abrir o descargar el archivo
            HttpContext.Current.Response.Clear()
            HttpContext.Current.Response.ContentType = "application/pdf"
            HttpContext.Current.Response.AddHeader("Content-Disposition", "attachment; filename=ReciboNomina.pdf")

            HttpContext.Current.Response.BinaryWrite(memoryStream.ToArray())
            HttpContext.Current.Response.End()
        Catch ex As Exception
            ' Manejar errores y responder al cliente
            HttpContext.Current.Response.Clear()
            HttpContext.Current.Response.ContentType = "text/plain"
            HttpContext.Current.Response.Write("Error al generar el reporte: " & ex.Message)
            HttpContext.Current.Response.End()
        End Try
    End Sub

    Public Function ConsultaRazonesSociales(ByVal userId As String, ByVal languageId As String) As List(Of Object)
        Dim resultadoConsulta As New List(Of Object)()
        Try
            ' Validación de argumentos
            If String.IsNullOrEmpty(userId) Then
                Throw New ArgumentException("El argumento userId es inválido")
            End If
            If String.IsNullOrEmpty(languageId) Then
                Throw New ArgumentException("El argumento languageId es inválido")
            End If

            ' Construcción de la consulta SQL
            Dim stringBuilder As New StringBuilder()
            stringBuilder.Append(" declare @idPersona int ")
            stringBuilder.Append(" select distinct ")
            stringBuilder.Append(" " & vbTab & "@idPersona = ISNULL(p.idPersona, 0) ")
            stringBuilder.Append(" from Persona p WITH(NOLOCK) ")
            stringBuilder.Append(" where p.userId = @userId ")
            stringBuilder.Append(" select DISTINCT ")
            stringBuilder.Append(" " & vbTab & "rs.IdRazonSocial, ")
            stringBuilder.Append(" " & vbTab & "rs.nombre as descripcionRazonSocial, ")
            stringBuilder.Append(" " & vbTab & "isnull(rs.RFC, '') as RFCRazonSocial, ")
            stringBuilder.Append(" " & vbTab & "isnull(rs.CURP, '') as CURPRazonSocial ")
            stringBuilder.Append(" from RazonSocial rs WITH(NOLOCK) ")
            stringBuilder.Append(" inner join dbo.fn_RazonesSocialesPermiso(@idPersona) rsp ")
            stringBuilder.Append(" " & vbTab & "on rsp.idRazonSocial = rs.IdRazonSocial ")
            stringBuilder.Append(" order by rs.IdRazonSocial ")

            ' Ejecución de la consulta
            Using con As New SqlConnection(sConnection)
                Using cmd As New SqlCommand(stringBuilder.ToString(), con)
                    cmd.CommandType = CommandType.Text
                    cmd.Parameters.AddWithValue("@userId", userId)
                    cmd.Parameters.AddWithValue("@languageId", languageId)
                    con.Open()

                    ' Usa SqlDataReader para leer los datos y llenar la lista de resultados
                    Using sqlDataReader As SqlDataReader = cmd.ExecuteReader()
                        While sqlDataReader.Read()
                            ' Crea un diccionario para cada fila
                            Dim razonSocial As New Dictionary(Of String, Object)
                            razonSocial.Add("IdRazonSocial", sqlDataReader("IdRazonSocial"))
                            razonSocial.Add("DescripcionRazonSocial", sqlDataReader("descripcionRazonSocial"))
                            razonSocial.Add("RFCRazonSocial", sqlDataReader("RFCRazonSocial"))
                            razonSocial.Add("CURPRazonSocial", sqlDataReader("CURPRazonSocial"))

                            ' Añade el diccionario a la lista de resultados
                            resultadoConsulta.Add(razonSocial)
                        End While
                    End Using
                End Using
            End Using

        Catch ex As Exception
            Print("Method FAILED, Error[{0}], StackTrace[{1}{2}{1}]", ex.Message, Environment.NewLine, ex.StackTrace)
        End Try

        ' Retorna el resultado como lista de objetos
        Return resultadoConsulta
    End Function

    Public Function ConsultaTiposNomina(ByVal IdRazonSocial As Integer, ByVal userId As String, ByVal languageId As String, Optional ByVal porTipo As Boolean = False, Optional ByVal tipoClase As Integer = -1) As List(Of Dictionary(Of String, Object))
        Dim resultadoConsulta As New List(Of Dictionary(Of String, Object))
        Try
            ' Validación de argumentos
            If IdRazonSocial < 1 Then
                Throw New ArgumentException("El argumento IdRazonSocial es invalido")
            End If
            If String.IsNullOrEmpty(userId) Then
                Throw New ArgumentException("El argumento userId es inválido")
            End If
            If String.IsNullOrEmpty(languageId) Then
                Throw New ArgumentException("El argumento languageId es inválido")
            End If

            ' Construcción de la consulta SQL
            Dim stringBuilder As New StringBuilder()
            stringBuilder.Append(" declare @idPersona int ")
            stringBuilder.Append(" select @idPersona = isnull(idPersona, 0) from Persona WITH(NOLOCK) where userId = @userId ")
            stringBuilder.Append(" select isnull(tn.IdRazonSocial, 0) as IdRazonSocial, ")
            stringBuilder.Append(" isnull(tn.IdTipoNomina, '') as IdTipoNomina, ")
            stringBuilder.Append(" isnull(tn.Descripcion, '') as Descripcion, ")
            stringBuilder.Append(" isnull(tn.IdImpuesto, '') as IdImpuesto, ")
            stringBuilder.Append(" isnull(tn.IdSubsidio, '') as IdSubsidio, ")
            stringBuilder.Append(" isnull(tn.IdCreditoSal, '') as IdCreditoSal, ")
            stringBuilder.Append(" isnull(tn.idClaseNomina, 0) as idClaseNomina, ")
            stringBuilder.Append(" isnull(tn.idPeriodicidad, '') as idPeriodicidad, ")
            stringBuilder.Append(" isnull(tn.IdVacacion, '') as IdVacacion, ")
            stringBuilder.Append(" isnull(tn.IdAguinaldo, '') as IdAguinaldo, ")
            stringBuilder.Append(" isnull(tn.IdDivision, '') as IdDivision, ")
            stringBuilder.Append(" isnull(tn.IdZonaEconomica, '') as IdZonaEconomica ")
            stringBuilder.Append(" from nomTipoNomina tn WITH(NOLOCK) ")
            stringBuilder.Append(" inner join dbo.fn_TiposNominaPermiso(@idPersona) tnp on tnp.idRazonSocial = tn.IdRazonSocial and tnp.idTipoNomina = tn.IdTipoNomina ")
            stringBuilder.Append(" where tn.IdRazonSocial = @idRazonSocial ")
            If porTipo Then
                stringBuilder.Append(" and tn.idClaseNomina = @tipoClase ")
            End If

            ' Ejecución de la consulta
            Using con As New SqlConnection(sConnection)
                Using cmd As New SqlCommand(stringBuilder.ToString(), con)
                    cmd.CommandType = CommandType.Text
                    cmd.Parameters.AddWithValue("@idRazonSocial", IdRazonSocial)
                    cmd.Parameters.AddWithValue("@userId", userId)
                    If porTipo Then
                        cmd.Parameters.AddWithValue("@tipoClase", tipoClase)
                    End If
                    con.Open()

                    ' Usa SqlDataReader para leer los datos y llenar la lista de resultados
                    Using sqlDataReader As SqlDataReader = cmd.ExecuteReader()
                        While sqlDataReader.Read()
                            ' Crea un diccionario para cada fila
                            Dim tipoNomina As New Dictionary(Of String, Object)
                            tipoNomina.Add("IdRazonSocial", sqlDataReader("IdRazonSocial"))
                            tipoNomina.Add("IdTipoNomina", sqlDataReader("IdTipoNomina"))
                            tipoNomina.Add("Descripcion", sqlDataReader("Descripcion"))
                            tipoNomina.Add("IdImpuesto", sqlDataReader("IdImpuesto"))
                            tipoNomina.Add("IdSubsidio", sqlDataReader("IdSubsidio"))
                            tipoNomina.Add("IdCreditoSal", sqlDataReader("IdCreditoSal"))
                            tipoNomina.Add("IdClaseNomina", sqlDataReader("idClaseNomina"))
                            tipoNomina.Add("IdPeriodicidad", sqlDataReader("idPeriodicidad"))
                            tipoNomina.Add("IdVacacion", sqlDataReader("IdVacacion"))
                            tipoNomina.Add("IdAguinaldo", sqlDataReader("IdAguinaldo"))
                            tipoNomina.Add("IdDivision", sqlDataReader("IdDivision"))
                            tipoNomina.Add("IdZonaEconomica", sqlDataReader("IdZonaEconomica"))

                            ' Añade el diccionario a la lista de resultados
                            resultadoConsulta.Add(tipoNomina)
                        End While
                    End Using
                End Using
            End Using

        Catch ex As Exception
            System.Diagnostics.Debug.WriteLine("Method FAILED, Error: " & ex.Message & " StackTrace: " & ex.StackTrace)
        End Try

        ' Retorna el resultado como lista de objetos
        Return resultadoConsulta
    End Function


    Public Function ConsultaAnios(ByVal IdRazonSocial As Integer, ByVal IdTipoNominaProc As String, ByVal IdTipoNominaAsig As String) As List(Of Object)
        Dim resultadoConsulta As New List(Of Object)()
        Try
            ' Validación de argumentos
            If IdRazonSocial < 1 Then
                Throw New ArgumentException("El argumento IdRazonSocial es invalido")
            End If
            If String.IsNullOrEmpty(IdTipoNominaAsig) Then
                Throw New ArgumentException("El argumento IdTipoNominaAsig es invalido")
            End If
            If String.IsNullOrEmpty(IdTipoNominaProc) Then
                Throw New ArgumentException("El argumento IdTipoNominaProc es invalido")
            End If

            ' Construcción de la consulta SQL
            Dim stringBuilder As New StringBuilder()
            stringBuilder.Append(" select distinct ")
            stringBuilder.Append(" " & vbTab & "nc.AnioPeriodo as Anio ")
            stringBuilder.Append(" from nomEmpleadoNominaAcumulado c WITH(NOLOCK) ")
            stringBuilder.Append(" inner join nomCalendario nc WITH(NOLOCK) ")
            stringBuilder.Append(" on nc.IdRazonSocial = c.IdRazonSocial ")
            stringBuilder.Append(" AND nc.IdTipoNomina collate database_default = c.IdTipoNominaProc collate database_default ")
            stringBuilder.Append(" AND nc.AnioPeriodo = c.Anio ")
            stringBuilder.Append(" AND nc.Periodo = c.Periodo ")
            stringBuilder.Append(" where c.IdRazonSocial = @idRazonSocial ")
            stringBuilder.Append(" and c.IdTipoNominaProc = @IdTipoNominaProc  ")
            stringBuilder.Append(" and c.IdTipoNominaAsig = @IdTipoNominaAsig  ")
            stringBuilder.Append(" and ISNULL(c.EstatusTimbrado, 0) > -1 ")
            stringBuilder.Append(" order by nc.AnioPeriodo desc ")

            ' Ejecución de la consulta
            Using con As New SqlConnection(sConnection)
                Using cmd As New SqlCommand(stringBuilder.ToString(), con)
                    cmd.CommandType = CommandType.Text
                    cmd.Parameters.AddWithValue("@IdRazonSocial", IdRazonSocial)
                    cmd.Parameters.AddWithValue("@IdTipoNominaProc", IdTipoNominaProc)
                    cmd.Parameters.AddWithValue("@IdTipoNominaAsig", IdTipoNominaAsig)
                    con.Open()

                    ' Usa SqlDataReader para leer los datos y llenar la lista de resultados
                    Using sqlDataReader As SqlDataReader = cmd.ExecuteReader()
                        While sqlDataReader.Read()
                            ' Crea un diccionario para cada fila
                            Dim Anios As New Dictionary(Of String, Object)
                            Anios.Add("Anio", sqlDataReader("Anio"))

                            ' Añade el diccionario a la lista de resultados
                            resultadoConsulta.Add(Anios)
                        End While
                    End Using
                End Using
            End Using

        Catch ex As Exception
            System.Diagnostics.Debug.WriteLine(String.Format("Method FAILED, Error[{0}], StackTrace[{1}{2}{1}]", ex.Message, Environment.NewLine, ex.StackTrace))
        End Try

        ' Retorna el resultado como lista de objetos
        Return resultadoConsulta
    End Function


    Public Function ConsultaPeriodos(ByVal IdRazonSocial As Integer, ByVal IdTipoNominaProc As String, ByVal IdTipoNominaAsig As String, ByVal Anio As Integer) As List(Of Object)
        Dim resultadoConsulta As New List(Of Object)()
        Try
            ' Validación de argumentos
            If IdRazonSocial < 1 Then
                Throw New ArgumentException("El argumento IdRazonSocial es invalido")
            End If
            If String.IsNullOrEmpty(IdTipoNominaAsig) Then
                Throw New ArgumentException("El argumento IdTipoNominaAsig es invalido")
            End If
            If String.IsNullOrEmpty(IdTipoNominaProc) Then
                Throw New ArgumentException("El argumento IdTipoNominaProc es invalido")
            End If
            If Anio < 1 Then
                Throw New ArgumentException("El argumento Anio es invalido")
            End If

            ' Construcción de la consulta SQL
            Dim stringBuilder As New StringBuilder()

            stringBuilder.Append(" select distinct ")
            stringBuilder.Append(" " & vbTab & "c.IdRazonSocial, ")
            stringBuilder.Append(" " & vbTab & "c.IdTipoNomina, ")
            stringBuilder.Append(" " & vbTab & "c.AnioPeriodo, ")
            stringBuilder.Append(" " & vbTab & "c.Periodo, ")
            stringBuilder.Append(" " & vbTab & "c.FechaInicio, ")
            stringBuilder.Append(" " & vbTab & "case  when CONVERT(datetime, isnull(c.FechaInicio, '1900-01-01')) = '1900-01-01' then ")
            stringBuilder.Append(" " & vbTab & vbTab & "'' ")
            stringBuilder.Append(" " & vbTab & "else ")
            stringBuilder.Append(" " & vbTab & vbTab & "CONVERT(VARCHAR(25), c.FechaInicio, 103) ")
            stringBuilder.Append(" " & vbTab & "end as FechaInicioFormato, ")
            stringBuilder.Append(" " & vbTab & "c.FechaFin, ")
            stringBuilder.Append(" " & vbTab & "case  when CONVERT(datetime, isnull(c.FechaFin, '1900-01-01')) = '1900-01-01' then ")
            stringBuilder.Append(" " & vbTab & vbTab & "'' ")
            stringBuilder.Append(" " & vbTab & "else ")
            stringBuilder.Append(" " & vbTab & vbTab & "CONVERT(VARCHAR(25), c.FechaFin, 103) ")
            stringBuilder.Append(" " & vbTab & "end as FechaFinFormato, ")
            stringBuilder.Append(" " & vbTab & "c.FechaPago ")
            stringBuilder.Append(" from nomCalendario c WITH(NOLOCK) ")
            stringBuilder.Append(" inner join nomEmpleadoNominaAcumulado NAN WITH(NOLOCK) ")
            stringBuilder.Append(" " & vbTab & "on nan.IdRazonSocial = c.IdRazonSocial ")
            stringBuilder.Append(" " & vbTab & "and nan.IdTipoNominaProc collate database_default = c.IdTipoNomina collate database_default ")
            stringBuilder.Append(" " & vbTab & "and nan.Anio = c.AnioPeriodo ")
            stringBuilder.Append("     and nan.Periodo = c.Periodo ")
            stringBuilder.Append(" " & vbTab & "and nan.IdTipoNominaAsig = @IdTipoNominaAsig ")
            stringBuilder.Append(" " & vbTab & "and ISNULL(nan.EstatusTimbrado, 0) > -1 ")
            stringBuilder.Append(" where c.IdRazonSocial = @idRazonSocial ")
            stringBuilder.Append(" and c.IdTipoNomina = @IdTipoNominaProc  ")
            stringBuilder.Append(" and c.AnioPeriodo = @Anio  ")
            stringBuilder.Append(" ORDER BY c.Periodo DESC ")

            ' Ejecución de la consulta
            Using con As New SqlConnection(sConnection)
                Using cmd As New SqlCommand(stringBuilder.ToString(), con)
                    cmd.CommandType = CommandType.Text
                    cmd.Parameters.AddWithValue("@IdRazonSocial", IdRazonSocial)
                    cmd.Parameters.AddWithValue("@IdTipoNominaProc", IdTipoNominaProc)
                    cmd.Parameters.AddWithValue("@IdTipoNominaAsig", IdTipoNominaAsig)
                    cmd.Parameters.AddWithValue("@Anio", Anio)
                    con.Open()

                    ' Usa SqlDataReader para leer los datos y llenar la lista de resultados
                    Using sqlDataReader As SqlDataReader = cmd.ExecuteReader()
                        While sqlDataReader.Read()
                            ' Crea un diccionario para cada fila
                            Dim Periodos As New Dictionary(Of String, Object)
                            Periodos.Add("IdRazonSocial", sqlDataReader("IdRazonSocial"))
                            Periodos.Add("IdTipoNomina", sqlDataReader("IdTipoNomina"))
                            Periodos.Add("AnioPeriodo", sqlDataReader("AnioPeriodo"))
                            Periodos.Add("Periodo", sqlDataReader("Periodo"))
                            Periodos.Add("FechaInicio", sqlDataReader("FechaInicio"))
                            Periodos.Add("FechaInicioFormato", sqlDataReader("FechaInicioFormato"))
                            Periodos.Add("FechaFin", sqlDataReader("FechaFin"))
                            Periodos.Add("FechaFinFormato", sqlDataReader("FechaFinFormato"))
                            Periodos.Add("FechaPago", sqlDataReader("FechaPago"))

                            ' Añade el diccionario a la lista de resultados
                            resultadoConsulta.Add(Periodos)
                        End While
                    End Using
                End Using
            End Using

        Catch ex As Exception
            Dim errorInfo As New Dictionary(Of String, Object)
            errorInfo.Add("Error", ex.Message)
            errorInfo.Add("StackTrace", ex.StackTrace)
            resultadoConsulta.Add(errorInfo)
        End Try

        ' Retorna el resultado como lista de objetos
        Return resultadoConsulta
    End Function

    Public Function EmpleadosTimbrar(ByVal password As String, ByVal IdRazonSocial As Integer, ByVal IdTipoNominaAsig As String, ByVal IdTipoNominaProc As String, ByVal Anio As Integer, ByVal Periodo As Integer, ByVal UserId As String, ByVal LanguageId As String, ByVal cadenaEmpleados As String, ByVal checkAll As Boolean, ByVal IdAtributos As String) As List(Of Object)
        Dim resultadoConsulta As New List(Of Object)()
        Dim listaEmpleados As New List(Of String)()
        Try
            If IdRazonSocial < 1 Then
                Throw New ArgumentException("El argumento IdRazonSocial es invalido")
            End If
            If String.IsNullOrEmpty(IdTipoNominaAsig) Then
                Throw New ArgumentException("El argumento IdTipoNominaAsig es invalido")
            End If
            If String.IsNullOrEmpty(IdTipoNominaProc) Then
                Throw New ArgumentException("El argumento IdTipoNominaProc es invalido")
            End If
            If Anio < 1 Then
                Throw New ArgumentException("El argumento Anio es invalido")
            End If
            If Periodo < 1 Then
                Throw New ArgumentException("El argumento Periodo es invalido")
            End If
            If String.IsNullOrEmpty(LanguageId) Then
                Throw New ArgumentException("El argumento LanguageId es invalido")
            End If

            Dim Filtrar_Atributos As String = Intelexion.Framework.SystemFlags.SystemFlags.getValueById(7336)
            Dim stringBuilder As New StringBuilder()
            Dim idEmpleadosStr As String

            stringBuilder.Append(" " & vbTab & "select distinct" & vbTab & vbTab & vbTab & " ")
            stringBuilder.Append(" " & vbTab & vbTab & "isnull(ENA.IdEmpleado, '') as NumEmpleado, ")
            stringBuilder.Append(" " & vbTab & vbTab & "isnull(ENA.EstatusTimbrado, 0) as EstatusTimbrado ")
            stringBuilder.Append(" " & vbTab & "from nomEmpleadoNominaAcumulado ENA WITH(NOLOCK)" & vbTab & vbTab & vbTab & " ")
            If Filtrar_Atributos = "1" And IdAtributos <> "" Then
                stringBuilder.Append(" INNER JOIN dbo.fn_PosicionesAtributos(@filtroidElementoCategoria) PA ")
                stringBuilder.Append(" ON PA.IdPosicion = ena.IdPosicion ")
            End If
            stringBuilder.Append(" " & vbTab & "inner join Persona PER WITH(NOLOCK)" & vbTab & vbTab & vbTab & " ")
            stringBuilder.Append(" " & vbTab & vbTab & "on PER.idPersona = ENA.idPersona" & vbTab & " ")
            stringBuilder.Append("     inner join vRazonSocial rs WITH(NOLOCK) ")
            stringBuilder.Append("  " & vbTab & "    on rs.IdRazonSocial = ena.IdRazonSocial ")
            stringBuilder.Append(" " & vbTab & "inner join nomTipoNomina TN WITH(NOLOCK)" & vbTab & vbTab & vbTab & " ")
            stringBuilder.Append(" " & vbTab & vbTab & "on TN.IdRazonSocial = ENA.IdRazonSocial" & vbTab & vbTab & " ")
            stringBuilder.Append(" " & vbTab & vbTab & "and TN.IdTipoNomina collate database_default = ENA.IdTipoNominaAsig collate database_default" & vbTab & vbTab & " ")
            stringBuilder.Append(" " & vbTab & "inner join nomCalendario CAL WITH(NOLOCK)" & vbTab & vbTab & vbTab & " ")
            stringBuilder.Append(" " & vbTab & vbTab & "on CAL.IdRazonSocial = ENA.IdRazonSocial" & vbTab & vbTab & " ")
            stringBuilder.Append(" " & vbTab & vbTab & "and CAL.IdTipoNomina collate database_default = ENA.IdTipoNominaProc collate database_default" & vbTab & vbTab & " ")
            stringBuilder.Append(" " & vbTab & vbTab & "and CAL.AnioPeriodo = ENA.Anio" & vbTab & vbTab & " ")
            stringBuilder.Append(" " & vbTab & vbTab & "and CAL.Periodo = ENA.Periodo" & vbTab & vbTab & " ")
            stringBuilder.Append(" " & vbTab & "where ENA.IdRazonSocial = @idRazonSocial" & vbTab & vbTab & vbTab & " ")
            stringBuilder.Append(" " & vbTab & "and ENA.IdTipoNominaAsig collate database_default = @idTipoNominaAsig" & vbTab & vbTab & vbTab & " ")
            stringBuilder.Append(" " & vbTab & "and ENA.IdTipoNominaProc collate database_default = @idTipoNominaProc" & vbTab & vbTab & vbTab & " ")
            stringBuilder.Append(" " & vbTab & "and ENA.Anio = @anio" & vbTab & vbTab & vbTab & " ")
            stringBuilder.Append(" " & vbTab & "and ENA.Periodo = @periodo" & vbTab & vbTab & vbTab & " ")
            stringBuilder.Append(" " & vbTab & "and ISNULL(ENA.EstatusTimbrado, 0) not in (-1) ")
            If cadenaEmpleados = "" Then
                ' Ejecución de la consulta
                Using con As New SqlConnection(sConnection)
                    Using cmd As New SqlCommand(stringBuilder.ToString(), con)
                        cmd.CommandType = CommandType.Text
                        cmd.Parameters.AddWithValue("@IdRazonSocial", IdRazonSocial)
                        cmd.Parameters.AddWithValue("@IdTipoNominaProc", IdTipoNominaProc)
                        cmd.Parameters.AddWithValue("@IdTipoNominaAsig", IdTipoNominaAsig)
                        cmd.Parameters.AddWithValue("@Anio", Anio)
                        cmd.Parameters.AddWithValue("@Periodo", Periodo)
                        If Filtrar_Atributos = "1" And IdAtributos <> "" Then
                            cmd.Parameters.AddWithValue("@filtroidElementoCategoria", IdAtributos.ToString())
                        End If
                        con.Open()

                        ' Usa SqlDataReader para leer los datos y llenar la lista de resultados
                        Using sqlDataReader As SqlDataReader = cmd.ExecuteReader()
                            While sqlDataReader.Read()
                                ' Crea un diccionario para cada fila
                                Dim empleadosEnProceso As New Dictionary(Of String, Object)
                                empleadosEnProceso.Add("IdEmpleado", sqlDataReader("IdEmpleado"))
                                empleadosEnProceso.Add("nombrePersona", sqlDataReader("nombrePersona"))
                                ' Añade el diccionario a la lista de resultados
                                listaEmpleados.Add(sqlDataReader("NumEmpleado").ToString())
                            End While
                        End Using
                    End Using
                End Using

                ' Crear cadena con los IdEmpleados separados por comas
                idEmpleadosStr = String.Join(",", listaEmpleados.ToArray())
            Else
                idEmpleadosStr = cadenaEmpleados
            End If

            ' Insertar el listado de IdEmpleados en la tabla nomEmpleadosTimbrar
            Using con As New SqlConnection(sConnection)
                Using cmd As New SqlCommand("EXEC spa_gdmSolicitudTimbrado @idRazonSocial, @idTipoNominaProc, @idTipoNominaAsig, @anio, @periodo, @IdEmpleados", con)
                    cmd.CommandType = CommandType.Text
                    cmd.Parameters.AddWithValue("@IdRazonSocial", IdRazonSocial)
                    cmd.Parameters.AddWithValue("@IdTipoNominaAsig", IdTipoNominaAsig)
                    cmd.Parameters.AddWithValue("@IdTipoNominaProc", IdTipoNominaProc)
                    cmd.Parameters.AddWithValue("@Anio", Anio)
                    cmd.Parameters.AddWithValue("@Periodo", Periodo)
                    cmd.Parameters.AddWithValue("@IdEmpleados", idEmpleadosStr)

                    con.Open()
                    cmd.ExecuteNonQuery()
                    resultadoConsulta.Add("Completo")
                End Using
            End Using


        Catch ex As Exception
            Dim errorInfo As New Dictionary(Of String, Object)
            errorInfo.Add("Error", ex.Message)
            errorInfo.Add("StackTrace", ex.StackTrace)
            resultadoConsulta.Add(errorInfo)
        End Try


        ' Retorna el resultado como lista de objetos
        Return resultadoConsulta
    End Function

    Public Function EmpleadosTimbrarDirecto(ByVal IdRazonSocial As Integer, ByVal IdTipoNominaAsig As String, ByVal IdTipoNominaProc As String, ByVal Anio As Integer, ByVal Periodo As Integer) As Boolean
        Dim resultadoConsulta As Boolean
        Dim listaEmpleados As New List(Of String)()
        Try
            If IdRazonSocial < 1 Then
                Throw New ArgumentException("El argumento IdRazonSocial es invalido")
            End If
            If String.IsNullOrEmpty(IdTipoNominaAsig) Then
                Throw New ArgumentException("El argumento IdTipoNominaAsig es invalido")
            End If
            If String.IsNullOrEmpty(IdTipoNominaProc) Then
                Throw New ArgumentException("El argumento IdTipoNominaProc es invalido")
            End If
            If Anio < 1 Then
                Throw New ArgumentException("El argumento Anio es invalido")
            End If
            If Periodo < 1 Then
                Throw New ArgumentException("El argumento Periodo es invalido")
            End If

            ' Crear cadena con los IdEmpleados separados por comas
            Dim idEmpleadosStr As String = String.Join(",", listaEmpleados.ToArray())

            ' Insertar el listado de IdEmpleados en la tabla nomEmpleadosTimbrar
            Using con As New SqlConnection(sConnection)
                Using cmd As New SqlCommand("EXEC spa_gdmSolicitudTimbrado @idRazonSocial, @idTipoNominaProc, @idTipoNominaAsig, @anio, @periodo", con)
                    cmd.CommandType = CommandType.Text
                    cmd.Parameters.Add(New SqlParameter("@IdRazonSocial", SqlDbType.Int) With {.Value = IdRazonSocial})
                    cmd.Parameters.Add(New SqlParameter("@IdTipoNominaAsig", SqlDbType.VarChar, 50) With {.Value = IdTipoNominaAsig})
                    cmd.Parameters.Add(New SqlParameter("@IdTipoNominaProc", SqlDbType.VarChar, 50) With {.Value = IdTipoNominaProc})
                    cmd.Parameters.Add(New SqlParameter("@Anio", SqlDbType.Int) With {.Value = Anio})
                    cmd.Parameters.Add(New SqlParameter("@Periodo", SqlDbType.Int) With {.Value = Periodo})
                    con.Open()
                    cmd.ExecuteNonQuery()
                    resultadoConsulta = True
                End Using
            End Using


        Catch ex As Exception
            System.Diagnostics.Debug.WriteLine(String.Format("Method FAILED, Error[{0}], StackTrace[{1}{2}{1}]", ex.Message, Environment.NewLine, ex.StackTrace))
            resultadoConsulta = False
        End Try


        ' Retorna el resultado como lista de objetos
        Return resultadoConsulta
    End Function

    Public Function FiltraTimbrado(ByVal IdRazonSocial As Integer, ByVal IdTipoNominaAsig As String, ByVal IdTipoNominaProc As String, ByVal Anio As Integer, ByVal Periodo As Integer, ByVal orderBy As String, ByVal Status As Integer, ByVal IdAtributos As String, ByVal query As String, ByVal pageNumber As Integer, ByVal pageSize As Integer) As List(Of Object)
        Dim resultadoConsulta As New List(Of Object)()
        Dim totalRows As Integer = 0
        Dim filteredRows As Integer = 0

        Try
            ' Validación de argumentos
            If IdRazonSocial < 1 Then
                Throw New ArgumentException("El argumento IdRazonSocial es invalido")
            End If
            If String.IsNullOrEmpty(IdTipoNominaAsig) Then
                Throw New ArgumentException("El argumento IdTipoNominaAsig es invalido")
            End If
            If String.IsNullOrEmpty(IdTipoNominaProc) Then
                Throw New ArgumentException("El argumento IdTipoNominaProc es invalido")
            End If
            If Anio < 1 Then
                Throw New ArgumentException("El argumento Anio es invalido")
            End If
            If Periodo < 1 Then
                Throw New ArgumentException("El argumento Periodo es invalido")
            End If

            query = query.Trim()
            query = "%" + query.Replace(" ", "%") + "%"
            Dim stringBuilder As New StringBuilder()
            Dim Mostrar_filtro As String = String.Empty
            Dim Atributos As String = String.Empty
            Dim Attrib As Boolean = False
            Dim text4 As String = ""
            Dim Pagina As Integer = (pageNumber - 1) * pageSize + 1
            Mostrar_filtro = Intelexion.Framework.SystemFlags.SystemFlags.getValueById(7336)
            Atributos = Intelexion.Framework.SystemFlags.SystemFlags.getValueById(7336)
            Atributos = Strings.Trim(Strings.Replace(Atributos, " ", "", 1, -1, CompareMethod.Binary))

            If Atributos.Length > 0 Then
                Attrib = True
            End If

            stringBuilder.Append("  create table #temp( ")
            stringBuilder.Append(" " & vbTab & "rownum int identity(1,1), ")
            stringBuilder.Append(" " & vbTab & "IdEmpleado varchar(20), ")
            stringBuilder.Append(" " & vbTab & "nombrePersona varchar(300), ")
            stringBuilder.Append(" " & vbTab & "FolioFiscal varchar(100), ")
            stringBuilder.Append(" " & vbTab & "FechaHoraCertificacion smalldatetime, ")
            stringBuilder.Append(" " & vbTab & "FechaHoraCertificacionFormato varchar(100), ")
            stringBuilder.Append(" " & vbTab & "NumeroCertificadoDigital varchar(100), ")
            stringBuilder.Append(" " & vbTab & "EstatusTimbrado int, ")
            stringBuilder.Append(" " & vbTab & "XMLTimbrado text, ")
            stringBuilder.Append(" " & vbTab & "MensajeTimbrado varchar(8000), ")
            If Attrib Then
                For Each Atributo As String In Atributos.Split(New Char() {","c})
                    If IsNumeric(Atributo) Then
                        stringBuilder.Append(" " & vbTab & "atributo" + Atributo + " varchar(500), ")
                        stringBuilder.Append(" " & vbTab & "descripcionElemento" + Atributo + " varchar(500), ")
                        If Not String.IsNullOrEmpty(text4) Then
                            text4 += ","
                        End If
                        text4 = String.Format("{0}atributo{1},descripcionElemento{1}", text4, Atributo)
                    End If
                Next
            End If
            stringBuilder.Append("     campoControl int, ")
            stringBuilder.Append("     statusEnvioCorreo INT,")
            stringBuilder.Append("     TotalPercepciones DECIMAL(18,2), ")
            stringBuilder.Append("     TotalDeducciones DECIMAL(18,2) ")
            stringBuilder.Append("  ) ")
            stringBuilder.Append("  insert into #temp ")
            stringBuilder.Append("  (IdEmpleado,nombrePersona,FolioFiscal,FechaHoraCertificacion,FechaHoraCertificacionFormato,NumeroCertificadoDigital,EstatusTimbrado,XMLTimbrado,MensajeTimbrado," + text4 + ",campoControl, statusEnvioCorreo,TotalPercepciones,TotalDeducciones)")
            stringBuilder.Append("  select  ")
            stringBuilder.Append("  " & vbTab & "isnull(ena.IdEmpleado, '') as IdEmpleado,  ")
            stringBuilder.Append("  " & vbTab & "isnull(RTRIM(per.nombre + ' ' + ISNULL(per.apellidoPat, '') + ' ' + ISNULL(per.apellidoMat, '')), '')  as nombrePersona,  ")
            stringBuilder.Append("  " & vbTab & "isnull(ena.FolioFiscal, '') as FolioFiscal,  ")
            stringBuilder.Append("  " & vbTab & "isnull(ena.FechaHoraCertificacion, '1900-01-01') as FechaHoraCertificacion,  ")
            stringBuilder.Append("  " & vbTab & "case  when CONVERT(datetime, isnull(ena.FechaHoraCertificacion, '1900-01-01')) = '1900-01-01' then  ")
            stringBuilder.Append("  " & vbTab & vbTab & "''  ")
            stringBuilder.Append("  " & vbTab & "else  ")
            stringBuilder.Append("  " & vbTab & vbTab & "CONVERT(varchar(10), ena.FechaHoraCertificacion, 103) + ' ' + SUBSTRING(CONVERT(varchar(20), ena.FechaHoraCertificacion, 22), 10, 11)  ")
            stringBuilder.Append("  " & vbTab & "end as FechaHoraCertificacionFormato,  ")
            stringBuilder.Append("  " & vbTab & "isnull(ena.NumeroCertificadoDigital, '') as NumeroCertificadoDigital,  ")
            stringBuilder.Append("  " & vbTab & "isnull(ena.EstatusTimbrado, 0) as EstatusTimbrado,  ")
            stringBuilder.Append("  " & vbTab & "isnull(ena.XMLTimbrado, '') as XMLTimbrado,  ")
            stringBuilder.Append("  " & vbTab & "isnull(ena.MensajeTimbrado, '') as MensajeTimbrado,  ")
            If Attrib Then
                For Each Attributo As String In Atributos.Split(New Char() {","c})
                    If IsNumeric(Attributo) Then
                        stringBuilder.Append(String.Concat(New String() {"  " & vbTab & "isnull(cat", Attributo, ".nombre, '') as atributo", Attributo, ", "}))
                        stringBuilder.Append(String.Concat(New String() {"  " & vbTab & "isnull(ec", Attributo, ".nombreElemento, '') as descripcionElemento", Attributo, ", "}))
                    End If
                Next
            End If
            stringBuilder.Append("     1 as campoControl, ")
            stringBuilder.Append("     1 as statusEnvioCorreo,  ")
            stringBuilder.Append("     PERC.Importe,  ")
            stringBuilder.Append("     DED.Importe  ")

            stringBuilder.Append("  from nomEmpleadoNominaAcumulado ena WITH(NOLOCK)  ")
            stringBuilder.Append("  inner join Persona per WITH(NOLOCK)  ")
            stringBuilder.Append("  " & vbTab & "on per.idPersona = ena.idPersona  ")
            If Mostrar_filtro = "1" And IdAtributos <> "" Then
                stringBuilder.Append(" INNER JOIN dbo.fn_PosicionesAtributos(@filtroidElementoCategoria) PA ")
                stringBuilder.Append(" ON PA.IdPosicion = ena.IdPosicion ")
            End If
            If Attrib Then
                For Each Atributo As String In Atributos.Split(New Char() {","c})
                    If IsNumeric(Atributo) Then
                        stringBuilder.Append(" " & vbTab & "left outer join ElementoEntidad ee" + Atributo + " ")
                        stringBuilder.Append(" " & vbTab & vbTab & "on ee" + Atributo + ".tipoEntidad = 2 ")
                        stringBuilder.Append(" " & vbTab & vbTab & "and ee" + Atributo + ".idEntidad = ena.idPosicion ")
                        stringBuilder.Append(String.Concat(New String() {" " & vbTab & vbTab & "and ee", Atributo, ".idCategoria = ", Atributo, " "}))
                        stringBuilder.Append(" " & vbTab & "left outer join ElementoCategoria ec" + Atributo + " ")
                        stringBuilder.Append(String.Concat(New String() {" " & vbTab & vbTab & "on ec", Atributo, ".idCategoria = ee", Atributo, ".idCategoria "}))
                        stringBuilder.Append(String.Concat(New String() {" " & vbTab & vbTab & "and ec", Atributo, ".idElemento = ee", Atributo, ".idElemento "}))
                        stringBuilder.Append(" " & vbTab & "left outer join Categoria cat" + Atributo + " ")
                        stringBuilder.Append(String.Concat(New String() {" " & vbTab & vbTab & "on cat", Atributo, ".idCategoria = ee", Atributo, ".idCategoria "}))
                    End If
                Next
            End If
            stringBuilder.Append("  inner join nomEmpleadoMovtoHis DED  ")
            stringBuilder.Append("  on DED.Anio = ena.Anio  ")
            stringBuilder.Append("  and DED.Periodo = ena.Periodo  ")
            stringBuilder.Append("  and DED.IdEmpleado = ena.IdEmpleado  ")
            stringBuilder.Append("  and DED.IdTipoNominaAsig = ena.IdTipoNominaAsig  ")
            stringBuilder.Append("  and DED.IdTipoNominaProc = ena.IdTipoNominaProc  ")
            stringBuilder.Append("  and DED.IdRazonSocial = ena.IdRazonSocial  ")
            stringBuilder.Append("  and DED.Concepto = 'TOTALDED'  ")
            stringBuilder.Append("  inner join nomEmpleadoMovtoHis PERC  ")
            stringBuilder.Append("  on PERC.Anio = ena.Anio  ")
            stringBuilder.Append("  and PERC.Periodo = ena.Periodo  ")
            stringBuilder.Append("  and PERC.IdEmpleado = ena.IdEmpleado  ")
            stringBuilder.Append("  and PERC.IdTipoNominaAsig = ena.IdTipoNominaAsig  ")
            stringBuilder.Append("  and PERC.IdTipoNominaProc = ena.IdTipoNominaProc  ")
            stringBuilder.Append("  and PERC.IdRazonSocial = ena.IdRazonSocial  ")
            stringBuilder.Append("  and PERC.Concepto = 'TOTALPER'  ")
            stringBuilder.Append("  where ena.IdRazonSocial = @idRazonSocial  ")
            stringBuilder.Append("  and ena.IdTipoNominaAsig collate database_default = @idTipoNominaAsig  ")
            stringBuilder.Append("  and ena.IdTipoNominaProc collate database_default = @idTipoNominaProc  ")
            If Status = 5 Then
                stringBuilder.Append("  and ena.IdEmpleado not in (select idEmpleado  collate database_default from nomCancelacionCFDI where idRazonSocial = @idRazonSocial and IdTipoNominaAsig collate database_default = @idTipoNominaAsig and idTipoNominaProc collate database_default = @idTipoNominaProc and Anio = @anio and periodo = @periodo)  ")
            End If
            stringBuilder.Append("  and ena.Anio = @anio  ")
            stringBuilder.Append("  and ena.Periodo = @periodo  ")
            stringBuilder.Append("  and isnull(ena.EstatusTimbrado, 0) > -1  ")
            If query <> "" Then
                stringBuilder.Append("      AND (ena.IdEmpleado like @query  ")
                stringBuilder.Append("      OR per.nombre + ' ' + per.apellidoPat + ' ' + ISNULL(per.apellidoMat, '') like @query)  ")
            End If
            Dim Order_By As String = " " & vbTab & "order by"
            stringBuilder.Append(Order_By + " ena.IdEmpleado")
            stringBuilder.Append(" select  ")
            stringBuilder.Append(" " & vbTab & "IdEmpleado, ")
            stringBuilder.Append(" " & vbTab & "nombrePersona, ")
            stringBuilder.Append(" " & vbTab & "FolioFiscal, ")
            stringBuilder.Append(" " & vbTab & "FechaHoraCertificacion, ")
            stringBuilder.Append(" " & vbTab & "FechaHoraCertificacionFormato, ")
            stringBuilder.Append(" " & vbTab & "NumeroCertificadoDigital, ")
            stringBuilder.Append(" " & vbTab & "EstatusTimbrado, ")
            stringBuilder.Append(" " & vbTab & "XMLTimbrado, ")
            stringBuilder.Append(" " & vbTab & "MensajeTimbrado, ")
            stringBuilder.Append(" " & vbTab & "statusEnvioCorreo,")
            stringBuilder.Append(" " & vbTab & "TotalPercepciones, ")
            stringBuilder.Append(" " & vbTab & "TotalDeducciones,")

            stringBuilder.Append(" " & vbTab & "(select COUNT(1) from #temp) as TotalRows ")
            stringBuilder.Append(" from #temp ")
            'stringBuilder.Append(" WHERE rownum >= @pageStart ")
            'stringBuilder.Append(" AND rownum < (@pageStart + @pageSize) ")
            stringBuilder.Append(" drop table #temp ")

            ' Ejecución de la consulta
            Using con As New SqlConnection(sConnection)
                Using cmd As New SqlCommand(stringBuilder.ToString(), con)
                    cmd.CommandType = CommandType.Text
                    cmd.Parameters.AddWithValue("@IdRazonSocial", IdRazonSocial)
                    cmd.Parameters.AddWithValue("@IdTipoNominaProc", IdTipoNominaProc)
                    cmd.Parameters.AddWithValue("@IdTipoNominaAsig", IdTipoNominaAsig)
                    cmd.Parameters.AddWithValue("@Anio", Anio)
                    cmd.Parameters.AddWithValue("@Periodo", Periodo)
                    cmd.Parameters.AddWithValue("@pageStart", Pagina)
                    cmd.Parameters.AddWithValue("@pageSize", pageSize)
                    If IsNumeric(Status) Then
                        cmd.Parameters.AddWithValue("@Status", Status)
                    Else
                        cmd.Parameters.AddWithValue("@Status", "0")
                    End If

                    If Mostrar_filtro = "1" Then
                        If IdAtributos <> "" Then
                            cmd.Parameters.AddWithValue("@filtroidElementoCategoria", IdAtributos.ToString())
                        End If
                    End If
                    cmd.Parameters.AddWithValue("@query", query)
                    con.Open()

                    ' Usa SqlDataReader para leer los datos y llenar la lista de resultados
                    Using sqlDataReader As SqlDataReader = cmd.ExecuteReader()
                        While sqlDataReader.Read()
                            ' Crea un diccionario para cada fila
                            Dim empleadosEnProceso As New Dictionary(Of String, Object)
                            empleadosEnProceso.Add("NumEmpleado", If(IsDBNull(sqlDataReader("IdEmpleado")), "", sqlDataReader("IdEmpleado")))
                            empleadosEnProceso.Add("NombrePersona", If(IsDBNull(sqlDataReader("nombrePersona")), "", sqlDataReader("nombrePersona")))
                            empleadosEnProceso.Add("FolioFiscal", If(IsDBNull(sqlDataReader("FolioFiscal")), "", sqlDataReader("FolioFiscal")))
                            empleadosEnProceso.Add("FechaHoraCertificacionFormato", If(IsDBNull(sqlDataReader("FechaHoraCertificacionFormato")), "", sqlDataReader("FechaHoraCertificacionFormato")))
                            empleadosEnProceso.Add("NumeroCertificadoDigital", If(IsDBNull(sqlDataReader("NumeroCertificadoDigital")), "", sqlDataReader("NumeroCertificadoDigital")))
                            empleadosEnProceso.Add("EstatusTimbrado", If(IsDBNull(sqlDataReader("EstatusTimbrado")), 0, sqlDataReader("EstatusTimbrado")))
                            empleadosEnProceso.Add("FolioTimbrado", If(IsDBNull(sqlDataReader("XMLTimbrado")), "", sqlDataReader("XMLTimbrado")))
                            empleadosEnProceso.Add("statusEnvioCorreo", If(IsDBNull(sqlDataReader("statusEnvioCorreo")), 0, sqlDataReader("statusEnvioCorreo")))
                            empleadosEnProceso.Add("MensajeTimbrado", If(IsDBNull(sqlDataReader("MensajeTimbrado")), "", sqlDataReader("MensajeTimbrado")))
                            empleadosEnProceso.Add("TotalPercepciones", If(IsDBNull(sqlDataReader("TotalPercepciones")), "", sqlDataReader("TotalPercepciones")))
                            empleadosEnProceso.Add("TotalDeducciones", If(IsDBNull(sqlDataReader("TotalDeducciones")), "", sqlDataReader("TotalDeducciones")))
                            empleadosEnProceso.Add("TotalRows", If(IsDBNull(sqlDataReader("TotalRows")), "", sqlDataReader("TotalRows")))
                            resultadoConsulta.Add(empleadosEnProceso)
                        End While
                    End Using
                End Using
            End Using

            filteredRows = resultadoConsulta.Count

        Catch ex As Exception
            System.Diagnostics.Debug.WriteLine(String.Format("Method FAILED, Error[{0}], StackTrace[{1}{2}{1}]", ex.Message, Environment.NewLine, ex.StackTrace))
        End Try

        ' Retorna el resultado como lista de objetos
        Return resultadoConsulta
    End Function

    Public Function Timbrar(ByVal IdRazonSocial As Integer, ByVal IdTipoNominaAsig As String, ByVal IdTipoNominaProc As String, ByVal Anio As Integer, ByVal Periodo As Integer) As Boolean
        Dim resultadoConsulta As Boolean
        Dim listaEmpleados As New List(Of String)()
        Try
            If IdRazonSocial < 1 Then
                Throw New ArgumentException("El argumento IdRazonSocial es invalido")
            End If
            If String.IsNullOrEmpty(IdTipoNominaAsig) Then
                Throw New ArgumentException("El argumento IdTipoNominaAsig es invalido")
            End If
            If String.IsNullOrEmpty(IdTipoNominaProc) Then
                Throw New ArgumentException("El argumento IdTipoNominaProc es invalido")
            End If
            If Anio < 1 Then
                Throw New ArgumentException("El argumento Anio es invalido")
            End If
            If Periodo < 1 Then
                Throw New ArgumentException("El argumento Periodo es invalido")
            End If

            ' Crear cadena con los IdEmpleados separados por comas
            Dim idEmpleadosStr As String = String.Join(",", listaEmpleados.ToArray())

            ' Insertar el listado de IdEmpleados en la tabla nomEmpleadosTimbrar
            Using con As New SqlConnection(sConnection)
                Using cmd As New SqlCommand("EXEC spa_gdmSolicitudTimbrado @idRazonSocial, @idTipoNominaProc, @idTipoNominaAsig, @anio, @periodo", con)
                    cmd.CommandType = CommandType.Text
                    cmd.Parameters.Add(New SqlParameter("@IdRazonSocial", SqlDbType.Int) With {.Value = IdRazonSocial})
                    cmd.Parameters.Add(New SqlParameter("@IdTipoNominaAsig", SqlDbType.VarChar, 50) With {.Value = IdTipoNominaAsig})
                    cmd.Parameters.Add(New SqlParameter("@IdTipoNominaProc", SqlDbType.VarChar, 50) With {.Value = IdTipoNominaProc})
                    cmd.Parameters.Add(New SqlParameter("@Anio", SqlDbType.Int) With {.Value = Anio})
                    cmd.Parameters.Add(New SqlParameter("@Periodo", SqlDbType.Int) With {.Value = Periodo})
                    con.Open()
                    cmd.ExecuteNonQuery()
                    resultadoConsulta = True
                End Using
            End Using


        Catch ex As Exception
            System.Diagnostics.Debug.WriteLine(String.Format("Method FAILED, Error[{0}], StackTrace[{1}{2}{1}]", ex.Message, Environment.NewLine, ex.StackTrace))
            resultadoConsulta = False
        End Try


        ' Retorna el resultado como lista de objetos
        Return resultadoConsulta
    End Function

    Public Function ProcesarDescagaFolio(ByVal FolioFiscal As String, ByVal salvar As Boolean) As String
        Dim XMLTimbrado As String = String.Empty
        Try
            ' Cadena de conexión a la base de datos
            Dim stringBuilder As New StringBuilder()
            ' Consulta para obtener el campo XMLTimbrado

            stringBuilder.Append("Select XMLTimbrado ")
            stringBuilder.Append("FROM nomEmpleadoNominaAcumulado ")
            stringBuilder.Append("WHERE FolioFiscal = @FolioFiscal ")

            ' Ejecutar la consulta y obtener el resultado
            Using connection As New SqlConnection(sConnection)
                Using command As New SqlCommand(stringBuilder.ToString(), connection)
                    ' Agregar parámetros a la consulta
                    command.Parameters.AddWithValue("@FolioFiscal", FolioFiscal)

                    connection.Open()
                    Dim result = command.ExecuteScalar()
                    If result IsNot Nothing Then
                        XMLTimbrado = result.ToString()
                    End If
                End Using
            End Using

            ' Verificar que el XMLTimbrado no esté vacío
            If String.IsNullOrEmpty(XMLTimbrado) Then
                Throw New Exception("No se encontró ningún valor para XMLTimbrado con los parámetros especificados.")
            End If



        Catch ex As Exception
            ' Manejo de errores
            HttpContext.Current.Response.Write("Ocurrió un error: {ex.Message}")
        End Try
        Return XMLTimbrado

    End Function

    
End Class