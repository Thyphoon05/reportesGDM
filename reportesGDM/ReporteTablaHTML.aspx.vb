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
Imports System.Globalization



Partial Public Class ReporteTablaHTML

    Inherits System.Web.UI.Page

    Dim sConnection As String = "Data Source=127.0.0.1; Initial Catalog=QAV6FCENomina; User Id=ITX_FCE; Password=GDM$1234; Connection Lifetime=60; Max Pool Size=200; Min Pool Size=3; Application Name=HRC_FCENomina"
    Dim SQL As String

    Public RPT As New Asistencia

    Private Sub Page_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load


        RPT.DataSource = New DataDynamics.ActiveReports.DataSources.OleDBDataSource("Provider=SQLOLEDB.1;" + sConnection, "Reporte_TotalGlobal_Cabecera", 90)

        Dim strName, FechaDesde, FechaHasta As String
        If Not String.IsNullOrEmpty(Request.QueryString("FechaDesde")) And Not String.IsNullOrEmpty(Request.QueryString("FechaHasta")) Then
            FechaDesde = Split(Request.Params("FechaDesde"), ",")(0)
            FechaHasta = Split(Request.Params("FechaHasta"), ",")(0)
            FechaDesde = DateTime.ParseExact(FechaDesde, "dd/MM/yyyy", CultureInfo.InvariantCulture).ToString("yyyyMMdd")
            FechaHasta = DateTime.ParseExact(FechaHasta, "dd/MM/yyyy", CultureInfo.InvariantCulture).ToString("yyyyMMdd")
            SQL = "exec spq_nomReporteAsistencia @idPersona=" + Request.Params("IdPersona") + ",@FechaDesde='" + FechaDesde + "',@FechaHasta='" + FechaHasta + "'"
        Else
            SQL = "exec spq_nomReporteAsistencia @idPersona=" + Request.Params("IdPersona")
        End If

        RPT.DataSource = New DataDynamics.ActiveReports.DataSources.OleDBDataSource("Provider=SQLOLEDB.1;" & _
            sConnection, SQL, 90)
        RPT.Run()
        'WebViewer10.Report = RPT

        Try
            Dim pathApp = MapPath("~")
            pathApp = pathApp + "\ArchivosTemp\"
            strName = "Asistencia_" + Context.Session("UID").trim + "_" + Date.Now.Day.ToString + Date.Now.Month.ToString + Date.Now.Year.ToString + Date.Now.Minute.ToString + Date.Now.Second.ToString + ".xls"
            Dim objXls As New DataDynamics.ActiveReports.Export.Xls.XlsExport
            objXls.Export(RPT.Document, pathApp + strName)
            ligaExcel.Text += "<a id='Archivo' href='" + Intelexion.Framework.ApplicationConfiguration.ConfigurationSettings.GetConfigurationSettings("ApplicationPath") + "/ArchivosTemp/" + strName + "' target='_blank' >" + Intelexion.Framework.SystemLabels.SystemLabels.getValueById(3423, Context.Session("LID")) + "</a>"
        Catch ex As Exception
        End Try

        If Not Me.IsPostBack Then
            LlenarTabla()

            ' FillidRazonSocialDropDown(sConnection)
            ' FillIdTipoNominaAsigDropDown(sConnection)
            'FillIdTipoNominaProcDropDown(sConnection)

        End If

    End Sub

    Sub LlenarTabla()

        Dim dt As DataTable = Me.GetAsistenceData()
        Dim html As New StringBuilder()
        html.Append("<table id='Asistencia'>")
        html.Append("<thead>")
        html.Append("<tr>")
        For Each column As DataColumn In dt.Columns
            html.Append("<th>")
            html.Append(column.ColumnName)
            html.Append("</th>")
        Next
        html.Append("</tr>")
        html.Append("</thead>")
        html.Append("<tbody>")
        For Each row As DataRow In dt.Rows
            html.Append("<tr>")
            For Each column As DataColumn In dt.Columns
                html.Append("<td>")
                html.Append(row(column.ColumnName))
                html.Append("</td>")
            Next
            html.Append("</tr>")
        Next
        html.Append("</tbody>")
        html.Append("</table>")

        PlaceHolder1.Controls.Add(New Literal() With { _
           .Text = html.ToString() _
         })
    End Sub

    Private Function GetAsistenceData() As DataTable
        Using con As New SqlConnection(sConnection)
            Using cmd As New SqlCommand(SQL)
                Using sda As New SqlDataAdapter()
                    cmd.Connection = con
                    sda.SelectCommand = cmd
                    Using dt As New DataTable()
                        sda.Fill(dt)
                        Return dt
                    End Using
                End Using
            End Using
        End Using
    End Function


    'Private Sub FillidRazonSocialDropDown(ByVal sConnection As String)
    '    Using con As New SqlConnection(sConnection)
    '        Using cmd As New SqlCommand("select nombre, IdRazonSocial from [dbo].[RazonSocial] where Activo = 1")
    '            cmd.CommandType = CommandType.Text
    '            cmd.Connection = con
    '            con.Open()
    '            idRazonSocial.DataSource = cmd.ExecuteReader()
    '            idRazonSocial.DataTextField = "nombre"
    '            idRazonSocial.DataValueField = "IdRazonSocial"
    '            idRazonSocial.DataBind()
    '            con.Close()
    '        End Using
    '    End Using
    '    idRazonSocial.Items.Insert(0, New ListItem("-Seleccione-", "0"))
    'End Sub

    'Private Sub FillIdTipoNominaAsigDropDown(ByVal sConnection As String)
    '    Using con As New SqlConnection(sConnection)
    '        Using cmd As New SqlCommand("select concat(IdTipoNomina,' - ',Descripcion) as name ,IdTipoNomina from nomTipoNomina")
    '            cmd.CommandType = CommandType.Text
    '            cmd.Connection = con
    '            con.Open()
    '            IdTipoNominaAsig.DataSource = cmd.ExecuteReader()
    '            IdTipoNominaAsig.DataTextField = "name"
    '            IdTipoNominaAsig.DataValueField = "IdTipoNomina"
    '            IdTipoNominaAsig.DataBind()
    '            con.Close()
    '        End Using
    '    End Using
    '    IdTipoNominaAsig.Items.Insert(0, New ListItem("-Seleccione-", "0"))
    'End Sub

    'Private Sub FillIdTipoNominaProcDropDown(ByVal sConnection As String)
    '    Using con As New SqlConnection(sConnection)
    '        Using cmd As New SqlCommand("select concat(IdTipoNomina,' - ',Descripcion) as name ,IdTipoNomina from nomTipoNomina")
    '            cmd.CommandType = CommandType.Text
    '            cmd.Connection = con
    '            con.Open()
    '            IdTipoNominaProc.DataSource = cmd.ExecuteReader()
    '            IdTipoNominaProc.DataTextField = "name"
    '            IdTipoNominaProc.DataValueField = "IdTipoNomina"
    '            IdTipoNominaProc.DataBind()
    '            con.Close()
    '        End Using
    '    End Using
    '    IdTipoNominaProc.Items.Insert(0, New ListItem("-Seleccione-", "0"))
    'End Sub

End Class