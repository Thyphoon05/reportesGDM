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

Partial Public Class DatosdeAcceso

    Inherits System.Web.UI.Page

    Dim sConnection As String = Intelexion.Framework.Model.SQLConnectionProvider.getConnection("default").getConnection.ConnectionString
    'Dim sConnection As String = "Data Source=127.0.0.1; Initial Catalog=QAV6FCENomina; User Id=ITX_FCE; Password=GDM$1234; Connection Lifetime=60; Max Pool Size=200; Min Pool Size=3; Application Name=HRC_FCENomina"
    Dim SQL As String

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        SQL = "exec spq_DatosSesionesActivas 1"

        If Not Me.IsPostBack Then
            LlenarTabla()
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

        TablaTop10Users.Controls.Add(New Literal() With { _
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
End Class