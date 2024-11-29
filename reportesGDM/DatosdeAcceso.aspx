<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="DatosdeAcceso.aspx.vb" Inherits="ReportesGDM.DatosdeAcceso" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
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
	<script language="javascript" type="text/javascript" src='<%=Intelexion.Framework.ApplicationConfiguration.ConfigurationSettings.GetConfigurationSettings("ApplicationPath")%>/Calendario/popcalendar.js'></script>
	<script language="javascript" type="text/javascript" src='<%=Intelexion.Framework.ApplicationConfiguration.ConfigurationSettings.GetConfigurationSettings("ApplicationPath")%>/scripts/jQuery/jquery-1.12.4.min.js'></script>
	<script language="javascript" type="text/javascript" src='<%=Intelexion.Framework.ApplicationConfiguration.ConfigurationSettings.GetConfigurationSettings("ApplicationPath")%>/scripts/jQuery/DataTables-1.13.5/datatables.min.js'></script>
	<script language="javascript" type="text/javascript" src='<%=Intelexion.Framework.ApplicationConfiguration.ConfigurationSettings.GetConfigurationSettings("ApplicationPath")%>/scripts/jQuery/DataTables-1.13.5/dataTables.buttons.js'></script>
	<script language="javascript" type="text/javascript" src='<%=Intelexion.Framework.ApplicationConfiguration.ConfigurationSettings.GetConfigurationSettings("ApplicationPath")%>/scripts/jQuery/DataTables-1.13.5/buttons.dataTables.js'></script>
	<script language="javascript" type="text/javascript" src='<%=Intelexion.Framework.ApplicationConfiguration.ConfigurationSettings.GetConfigurationSettings("ApplicationPath")%>/scripts/jQuery/DataTables-1.13.5/jszip.min.js'></script>
	<script language="javascript" type="text/javascript" src='<%=Intelexion.Framework.ApplicationConfiguration.ConfigurationSettings.GetConfigurationSettings("ApplicationPath")%>/scripts/jQuery/DataTables-1.13.5/pdfmake.min.js'></script>
	<script language="javascript" type="text/javascript" src='<%=Intelexion.Framework.ApplicationConfiguration.ConfigurationSettings.GetConfigurationSettings("ApplicationPath")%>/scripts/jQuery/DataTables-1.13.5/vfs_fonts.js'></script>	
	<script language="javascript" type="text/javascript" src='<%=Intelexion.Framework.ApplicationConfiguration.ConfigurationSettings.GetConfigurationSettings("ApplicationPath")%>/scripts/jQuery/DataTables-1.13.5/buttons.html5.min.js'></script>
	<script language="javascript" type="text/javascript" src='<%=Intelexion.Framework.ApplicationConfiguration.ConfigurationSettings.GetConfigurationSettings("ApplicationPath")%>/scripts/jQuery/DataTables-1.13.5/buttons.print.min.js'></script>
	
   <script language="javascript">
		    var Empleados = true;
		    var processCommand = "";
		    
		    $(document).ready( function () {
			
			new DataTable('#Asistencia', {
					layout: {
						topStart: {
							buttons: [ 'copy', 'excel',
								{   
									extend: 'pdfHtml5',
									orientation: 'landscape',
									pageSize: 'LEGAL'
								}
							]
						}
					},
					language: {
								url: '<%=Intelexion.Framework.ApplicationConfiguration.ConfigurationSettings.GetConfigurationSettings("ApplicationPath")%>/scripts/jQuery/DataTables-1.13.5/es-MX.json',
							}
				});
			} );
                </script>
    <title>Gr&aacute;ficos de Accesos</title>
</head>
<body>

    <form id="form1" runat="server">
       <div class="formArea rightForm" id="div1" style="width:80%">
	        <asp:PlaceHolder id="TablaTop10Users" runat="server"></asp:PlaceHolder>
        </div>
    </form>
</body>
</html>
