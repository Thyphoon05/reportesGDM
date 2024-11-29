Imports Intelexion.Framework.Model
Imports System.Data
Imports Intelexion.Nomina
Imports System.Web
Imports System.Collections
Imports System.Collections.Specialized
Imports Intelexion.Framework.Controller
Imports Intelexion.Framework.View
Imports System.IO
Imports System.Data.SqlClient
Imports System.Configuration
Imports System.Globalization

Public Class Export
    Inherits System.Web.UI.Page


    Dim sConnection As String = "Data Source=127.0.0.1; Initial Catalog=QAV6FCENomina; User Id=ITX_FCE; Password=GDM$1234; Connection Lifetime=60; Max Pool Size=200; Min Pool Size=3; Application Name=HRC_FCENomina"
    Dim SQL As String = "EXEC SPXXX '@IdRazonSocial','@IdTipoNominaAsig','@IdTipoNominaProc','@Anio','@mesDesde','@mesHasta','@Periodo','@UID','@LID','@idAccion','@filtroidElementoCategoria'"

    Public Function ExportTxt(ByVal SPEjecutar As String, ByVal opL As String, ByVal context As System.Web.HttpContext) As String
        Dim ds As New DataSet
        Dim sFile As String
        Dim ext() As String = opL.Split(";")
        Dim sPathApp As String = Intelexion.Framework.ApplicationConfiguration.ConfigurationSettings.GetConfigurationSettings("ApplicationPath")
        Dim sPathArchivosTemp As String = Intelexion.Framework.ApplicationConfiguration.ConfigurationSettings.GetConfigurationSettings("ArchivosTemporales")
        opL = ext(0)
        SQL = Replace(SQL, "SPXXX", opL)
        sFile = "\" + opL + "_" + Date.Now.Second.ToString + ".txt"


        ' Crear conexión a la base de datos
        Using connection As New SqlConnection(sConnection)
            ' Abrir la conexión
            connection.Open()

            ' Crear el comando SQL
            Using command As New SqlCommand(SQL, connection)
                ' Ejecutar la consulta y obtener un lector de datos
                Using reader As SqlDataReader = command.ExecuteReader()
                    ' Crear un archivo de texto para guardar los resultados
                    Using file As New StreamWriter(Server.MapPath("resultados.txt"))
                        ' Iterar sobre los resultados y escribir en el archivo de texto
                        While reader.Read()
                            file.WriteLine(reader("centroCosto").ToString())
                        End While
                    End Using
                End Using
            End Using
        End Using

        Return Server.MapPath("resultados.txt")

    End Function
End Class
