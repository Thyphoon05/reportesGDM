<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="FuncionesTimbrado.aspx.vb" Inherits="ReportesGDM.Timbrado" %>
<%@ Register assembly="ActiveReports.Web, Version=5.2.1013.1, Culture=neutral, PublicKeyToken=cc4967777c49a3ff" namespace="DataDynamics.ActiveReports.Web" tagprefix="ActiveReportsWeb1" %>
<%@ Register TagPrefix="anthem" Namespace="Anthem" Assembly="Anthem" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">



<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
		<meta content="Microsoft Visual Studio.NET 7.0" name="GENERATOR">
		<meta content="Visual Basic 7.0" name="CODE_LANGUAGE">
		<meta content="JavaScript" name="vs_defaultClientScript">
		<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
				<meta content="JavaScript" name="vs_defaultClientScript">
		<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">		
        <LINK href='<%=Intelexion.Framework.ApplicationConfiguration.ConfigurationSettings.GetConfigurationSettings("ApplicationPath")%>/intelexion.css' type=text/css rel=stylesheet>
		<LINK href='<%=Intelexion.Framework.ApplicationConfiguration.ConfigurationSettings.GetConfigurationSettings("ApplicationPath")%>/scripts/jQuery/DataTables-1.13.5/datatables.min.css' type=text/css rel=stylesheet>		
			<script language="javascript">
			var mostrarV5 = "0";
		    var path;
		    path = '<%=Intelexion.Framework.ApplicationConfiguration.ConfigurationSettings.GetConfigurationSettings("ApplicationPath")%>'
		    var shortDatePattern = '%dd/%mm/%y'
		    var CarpetaTemp;
		    CarpetaTemp = '<%=Intelexion.Framework.ApplicationConfiguration.ConfigurationSettings.GetConfigurationSettings("ArchivosTemporales")%>'
		</script>		
		<script language="javascript" src='<%=Intelexion.Framework.ApplicationConfiguration.ConfigurationSettings.GetConfigurationSettings("PathJS")+"/Validacion.aspx"%>'></script>
		<script language="javascript" type="text/javascript" src='<%=Intelexion.Framework.ApplicationConfiguration.ConfigurationSettings.GetConfigurationSettings("ApplicationPath")%>/Calendario/popcalendar.js'></script>
		<script language="javascript" type="text/javascript" src='<%=Intelexion.Framework.ApplicationConfiguration.ConfigurationSettings.GetConfigurationSettings("ApplicationPath")%>/scripts/jQuery/jquery-1.12.4.min.js'></script>
		<script language="javascript" type="text/javascript" src='<%=Intelexion.Framework.ApplicationConfiguration.ConfigurationSettings.GetConfigurationSettings("ApplicationPath")%>/scripts/jQuery/DataTables-1.13.5/datatables.min.js'></script>


    <title>Funciones de Timbrado</title>

</head>
<body>
</body>
</html>
