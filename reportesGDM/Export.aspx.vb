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
Imports DocumentFormat.OpenXml
Imports DocumentFormat.OpenXml.Packaging
Imports DocumentFormat.OpenXml.Spreadsheet



Partial Public Class ReportExport

    Inherits System.Web.UI.Page

    Dim sConnection As String = System.Configuration.ConfigurationManager.ConnectionStrings("default").ConnectionString
    Dim SQL As String

    Public Sub CreateExcelFileFromDataTable(ByVal dataTable As DataTable, ByVal filePath As String)

        'Create the SpreadsheetDocument object and set its type to Workbook
        Using document As SpreadsheetDocument = SpreadsheetDocument.Create(filePath, SpreadsheetDocumentType.Workbook)
            'Create the workbook
            Dim workbookPart As WorkbookPart = document.AddWorkbookPart()
            workbookPart.Workbook = New Workbook()
            'Create the worksheet
            Dim worksheetPart As WorksheetPart = workbookPart.AddNewPart(Of WorksheetPart)()
            worksheetPart.Worksheet = New Worksheet()
            'Create the sheet data
            Dim sheetData As SheetData = worksheetPart.Worksheet.AppendChild(New SheetData())
            'Create the header row
            Dim headerRow As Row = New Row()
            'Loop through each column in the DataTable and add it to the header row
            For Each column As DataColumn In dataTable.Columns
                headerRow.AppendChild(New Cell() With {.DataType = CellValues.String, .CellValue = New CellValue(column.ColumnName)})
            Next

            'Add the header row to the sheet data
            sheetData.AppendChild(headerRow)
            'Populate the data rows
            For Each dataRow As DataRow In dataTable.Rows
                Dim row As Row = New Row()
                'Loop through each column in the DataTable and add the corresponding cell value to the current row
                For Each column As DataColumn In dataTable.Columns
                    row.AppendChild(New Cell() With {.DataType = CellValues.String, .CellValue = New CellValue(dataRow(column.ColumnName).ToString())})
                Next

                'Add the row to the sheet data
                sheetData.AppendChild(row)
            Next

            'Create the sheets
            Dim sheets As Sheets = workbookPart.Workbook.AppendChild(New Sheets())
            Dim sheet As Sheet = New Sheet() With {.Id = workbookPart.GetIdOfPart(worksheetPart), .SheetId = 1, .Name = "Sheet1"}
            sheets.Append(sheet)
            'Save changes
            workbookPart.Workbook.Save()
        End Using
    End Sub

    Private Sub Page_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load
        Dim strName As String


        Dim FechaDesde, FechaHasta As String
        If Not String.IsNullOrEmpty(Request.QueryString("FechaDesde")) And Not String.IsNullOrEmpty(Request.QueryString("FechaHasta")) Then
            FechaDesde = Split(Request.Params("FechaDesde"), ",")(0)
            FechaHasta = Split(Request.Params("FechaHasta"), ",")(0)
            FechaDesde = DateTime.ParseExact(FechaDesde, "dd/MM/yyyy", CultureInfo.InvariantCulture).ToString("yyyyMMdd")
            FechaHasta = DateTime.ParseExact(FechaHasta, "dd/MM/yyyy", CultureInfo.InvariantCulture).ToString("yyyyMMdd")
            SQL = "exec spq_nomReporteAsistencia @idPersona=" + Request.Params("IdPersona") + ",@FechaDesde='" + FechaDesde + "',@FechaHasta='" + FechaHasta + "'"
        Else
            SQL = "exec spq_nomReporteAsistencia @idPersona=" + Request.Params("IdPersona")
        End If


        'WebViewer10.Report = RPT

        Try
            Dim pathApp = MapPath("~")
            Dim xlsxfilename As String
            pathApp = pathApp + "\ArchivosTemp\"
            strName = "Asistencia_" + Context.Session("UID").trim + "_" + Date.Now.Day.ToString + Date.Now.Month.ToString + Date.Now.Year.ToString + Date.Now.Minute.ToString + Date.Now.Second.ToString + ".xls"
            xlsxfilename = Intelexion.Framework.ApplicationConfiguration.ConfigurationSettings.GetConfigurationSettings("ApplicationPath") + "/ArchivosTemp/" + strName
            CreateExcelFileFromDataTable(Me.GetAsistenceData(), xlsxfilename)
            ligaExcel.Text += "<a id='Archivo' href='" + Intelexion.Framework.ApplicationConfiguration.ConfigurationSettings.GetConfigurationSettings("ApplicationPath") + "/ArchivosTemp/" + strName + "' target='_blank' >" + Intelexion.Framework.SystemLabels.SystemLabels.getValueById(3423, Context.Session("LID")) + "</a>"
        Catch ex As Exception
        End Try

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

End Class