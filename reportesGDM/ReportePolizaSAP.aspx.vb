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

Partial Public Class ReportePolizaSAP

    Inherits System.Web.UI.Page

    Dim sConnection As String = Intelexion.Framework.Model.SQLConnectionProvider.getConnection("default").getConnection.ConnectionString

    Dim SQL As String

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        Dim dt As DataTable

        SQL = "exec sp_Reporte_Poliza_SAP @IdRazonSocial = " + Request.Params("IdRazonSocial") + "," & _
                "@IdTipoNominaAsig = '" + Request.Params("IdTipoNominaAsig") + "'," & _
                "@IdTipoNominaProc = '" + Request.Params("IdTipoNominaProc") + "'," & _
                "@Anio = " + Request.Params("Periodo").Split("-")(1) + "," & _
                "@Periodo = " + Request.Params("Periodo").Split("-")(0) + "," & _
                "@IdEmpleado = '" + Request.Params("IdEmpleado") + "'"

        dt = GetAsistenceData()
        Dim concatenatedString As String = ConcatenateDataTableWithTabs(dt)

        Try
            Dim FileName, xlsxFilename, txtFilename As String
            Dim pathApp = MapPath("~")
            pathApp = pathApp + "\ArchivosTemp\"
            FileName = "PolizaSAP_" + Request.Params("IdTipoNominaAsig").Trim + "_" + Request.Params("Periodo").Trim + Request.Params("Anio").Trim + Date.Now.Day.ToString + "_" + Date.Now.Month.ToString + Date.Now.Year.ToString + Date.Now.Minute.ToString + Date.Now.Second.ToString
            xlsxFilename = pathApp + FileName + ".xlsx"
            txtFilename = pathApp + FileName + ".txt"
            CreateExcelFileFromDataTable(dt, xlsxFilename)
            WriteToFile(concatenatedString, txtFilename)
            xlsxFilename = Intelexion.Framework.ApplicationConfiguration.ConfigurationSettings.GetConfigurationSettings("ApplicationPath") + Intelexion.Framework.ApplicationConfiguration.ConfigurationSettings.GetConfigurationSettings("ArchivosTemporales") + "/" + FileName + ".xlsx"
            txtFilename = Intelexion.Framework.ApplicationConfiguration.ConfigurationSettings.GetConfigurationSettings("ApplicationPath") + Intelexion.Framework.ApplicationConfiguration.ConfigurationSettings.GetConfigurationSettings("ArchivosTemporales") + "/" + FileName + ".txt"
            ligaExcel.Text += "<a id='Archivo' href='" + xlsxFilename + "' target='_blank' >" + "<img src='../../images/xls.png' alt='XLS' class='image' /><br><span>Poliza en XLSX</span></a>"
            LigaTXT.Text += "<a id='Archivo' href='" + txtFilename + "' target='_blank' >" + "<img src='../../images/txt.png' alt='TXT' class='image' /><br><span>Poliza en TXT</span></a>"
        Catch ex As Exception
        End Try
    End Sub

    Public Sub WriteToFile(ByVal content As String, ByVal filePath As String)
        ' Usar StreamWriter para escribir el contenido en un archivo
        Using writer As New StreamWriter(filePath, False, Encoding.UTF8)
            writer.Write(content)
        End Using
    End Sub

    Public Function ConcatenateDataTableWithTabs(ByVal dt As DataTable) As String
        Dim result As New StringBuilder()

        For Each row As DataRow In dt.Rows
            For Each col As DataColumn In dt.Columns
                result.Append(row(col).ToString().Trim() & vbTab)
            Next
            ' Remove the last tab and add a new line
            If result.Length > 0 Then
                result.Length -= 1 ' Remove the last tab
                result.AppendLine()
            End If
        Next

        Return result.ToString()
    End Function

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
            Dim sheet As Sheet = New Sheet() With {.Id = workbookPart.GetIdOfPart(worksheetPart), .SheetId = 1, .Name = "Hoja1"}
            sheets.Append(sheet)
            'Save changes
            workbookPart.Workbook.Save()
        End Using
    End Sub

    Private Function GetAsistenceData() As DataTable
        Using con As New SqlConnection(sConnection)
            Using cmd As New SqlCommand(SQL)
                Using sda As New SqlDataAdapter()
                    cmd.Connection = con
                    cmd.CommandTimeout = 3600
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