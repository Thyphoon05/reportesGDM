<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="ReportePolizaSAP.aspx.vb" Inherits="ReportesGDM.ReportePolizaSAP" %>
<%@ Register TagPrefix="activereportsweb1" Namespace="DataDynamics.ActiveReports.Web" Assembly="ActiveReports.Web, Version=5.2.1013.1, Culture=neutral, PublicKeyToken=cc4967777c49a3ff" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Poliza SAP</title>
    <style>
        .container {
            text-align: center;
            margin-top: 20px;
        }
        .links {
            text-align: center;
            margin-bottom: 10px;
        }
        .links a {
            display: inline-block;
            margin: 0 10px; /* Espacio entre los enlaces */
            text-align: center;
            text-decoration: none; /* Quitar subrayado de los enlaces */
        }
        .links img {
            width: 64px;
            height: 64px;
        }
        .links span {
            display: inline-block;
            margin: 5px;
        }
        .text {
            margin-top: 10px; /* Espacio entre los enlaces y el texto */
        }
    </style>
</head>
<body>
    <form id="Form1" name="Form1" method="post" runat="server">
        <div class="container">
            <div class="links">
                <asp:Label ID="ligaExcel" runat="server"></asp:Label>
                <asp:Label ID="LigaTXT" runat="server"></asp:Label>
            </div>
        </div>
    </form>
</body>
</html>