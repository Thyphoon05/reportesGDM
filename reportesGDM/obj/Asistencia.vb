Imports DataDynamics.ActiveReports
Imports Nomina
Imports System.IO
Imports System.Web
Imports System
Imports Intelexion.Framework.Model
Imports Intelexion.Nomina
Imports Intelexion.Framework.View
Imports Intelexion.Framework
Imports System.Web.HttpContext

Public Class Asistencia
    Inherits DataDynamics.ActiveReports.ActiveReport3
    Public Shared TotalPer, TotalDed As Decimal
    Public Shared tipo As Integer

    Dim IdElemento, varReferencia As String
    Dim Total_public As Integer

  
    Public Sub New()
        InitializeComponent()
    End Sub

    Private Sub TotalGlobal_ReportStart(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.ReportStart

        Me.ShowParameterUI = False
        Me.SetLicense("Hector Ramirez,Intelexion,DD-APN-30-C000260,S4VKSH448MS77HKH9FH9")

    End Sub

End Class
