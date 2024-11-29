<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="ReporteAsistencia.aspx.vb" Inherits="ReportesGDM.ReporteAsistencia" %>
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

		<style type="text/css">

		    label{float:left;
		       display:block;}

		    /*alinea el boton del mensaje de error*/
		   .errButtonArea { text-align:right !important; }
			   
		</style>
		<script language="javascript">
		    var Empleados = true;
		    var processCommand = "";
		    
		    $(document).ready( function () {
            $('#Asistencia').DataTable({
				language: {
					"decimal": "",
					"emptyTable": "No hay información",
					"info": "Mostrando _START_ a _END_ de _TOTAL_ Entradas",
					"infoEmpty": "Mostrando 0 to 0 of 0 Entradas",
					"infoFiltered": "(Filtrado de _MAX_ total entradas)",
					"infoPostFix": "",
					"thousands": ",",
					"lengthMenu": "Mostrar _MENU_ Entradas",
					"loadingRecords": "Cargando...",
					"processing": "Procesando...",
					"search": "Buscar:",
					"zeroRecords": "Sin resultados encontrados",
					"paginate": {
						"first": "Primero",
						"last": "Ultimo",
						"next": "Siguiente",
						"previous": "Anterior"
					}
				}
			});
			} );
                </script>
    <title>Reporte de Asistencia</title>
    <script>
		    function Cancelar() {
                window.location.reload()
		    }
		    
		    function Refrescar() {
						const queryString = window.location.search;
						const urlParams = new URLSearchParams(queryString);
						const page_type  = window.location.search;

							var esValido = true;
							esValido = esValido && validacampo($("#FechaDesde")[0], true, $("#lblFechaDesde").text(), "fecha", 10, 9, '');
							esValido = esValido && validacampo($("#FechaHasta")[0], true, $("#lblFechaHasta").text(), "fecha", 10, 9, '');
							esValido = esValido && comparaValorTipo($("#FechaDesde")[0], $("#FechaHasta")[0], 'fecha', 'menorIgual', '<%=Intelexion.Framework.SystemLabels.SystemLabels.getValueById(14298,context.Session("LID"))%>');

						if (esValido) { 
							var idPersona;
							var FechaDesde;
							var FechaHasta;
						 
							FechaDesde = document.getElementById('FechaDesde').value
							FechaHasta = document.getElementById('FechaHasta').value
							idPersona=<%=Request.Params("idPersona")%>;
							document.forms[0].__VIEWSTATE.name = 'ignore';
							document.forms[0].__VIEWSTATE.value = '';
							console.log(path + '/nomina/asistencia/ReporteAsistencia.aspx?&idPersona='+idPersona+'&FechaDesde='+FechaDesde+'&FechaHasta='+FechaHasta)
							document.forms[0].action = path + '/nomina/asistencia/ReporteAsistencia.aspx?&idPersona='+idPersona+'&FechaDesde='+FechaDesde+'&FechaHasta='+FechaHasta
							document.forms[0].submit();		
						}
			};
    </script>
</head>
<body>
    <form id="form1" runat="server">
    		<div class="formArea rightForm" id="divFiltros" style="width:100%">
				<table>
				    <tr id="divRangoFechas">
			            <td><label id="lblFechaDesde"><%=Intelexion.Framework.SystemLabels.SystemLabels.getValueById(17724, Context.Session("LID"))%></label></td>
			            <td><input id="FechaDesde" type="text" runat="server" /></td>
                         <td><a onclick="javascript:str=&quot;dd/MM/yyyy&quot;;showCalendar(this, document.getElementById(&quot;FechaDesde&quot;),str.toLowerCase(),null,1,380,80)" style="cursor: pointer;">
								<img src="/V6FCE/images/calendar.gif" border="0" style="display: none;"><i class="material-icons md-dark " style="">date_range</i></a>
			            </td>
			            <td><label id="lblFechaHasta"><%=Intelexion.Framework.SystemLabels.SystemLabels.getValueById(17723, Context.Session("LID"))%></label></td>
			            <td><input id="FechaHasta" type="text" runat="server" /></td>
                        <td><a onclick="javascript:str=&quot;dd/MM/yyyy&quot;;showCalendar(this, document.getElementById(&quot;FechaHasta&quot;),str.toLowerCase(),null,1,380,80)" style="cursor: pointer;">
								<img src="/V6FCE/images/calendar.gif" border="0" style="display: none;"><i class="material-icons md-dark" style="">date_range</i></a>
			            </td>
			        </tr>
				</table>
			</div>
			<div class="botonArea">
			    <input class="boton boton-nuevo" id="Aceptar" onclick="Refrescar()" type="button" value="Actualizar" name="Aceptar">
			    <input class="boton" id="btnCancelar" type="button" value="<%=Intelexion.Framework.SystemLabels.SystemLabels.getValueById(16,context.Session("LID"))%>" name="btnCancelar" onClick="Cancelar();"/>
            </div>
        <div class="formArea rightForm" id="div1" style="width:80%">
            <asp:Label ID="ligaExcel" runat="server"></asp:Label>
	        <asp:PlaceHolder id="PlaceHolder1" runat="server"></asp:PlaceHolder>
        </div>

    </form>
    
</body>
</html>
