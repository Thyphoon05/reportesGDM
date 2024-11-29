<%@ Register TagPrefix="cc1" Namespace="Intelexion.Framework.View.UI.Controles" Assembly="Intelexion.Framework.View.UI.Controles" %>
<%@ Register TagPrefix="anthem" Namespace="Anthem" Assembly="Anthem" %>
<%@ Register TagPrefix="org" Namespace="Intelexion.Organizacion" Assembly="Intelexion.Organizacion" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
    <title>Consulta de Timbrados</title>
    <meta content="Microsoft Visual Studio.NET 7.0" name="GENERATOR" />
    <meta content="Visual Basic 7.0" name="CODE_LANGUAGE" />
    <meta content="JavaScript" name="vs_defaultClientScript" />
    <meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <link href='<%=Intelexion.Framework.ApplicationConfiguration.ConfigurationSettings.GetConfigurationSettings("ApplicationPath")%>/intelexion.css' type="text/css" rel="stylesheet" />
    <link href='<%=Intelexion.Framework.ApplicationConfiguration.ConfigurationSettings.GetConfigurationSettings("ApplicationPath")%>/jqueryTimbrado.dataTables.css' type="text/css" rel="stylesheet" />
    <link href='<%=Intelexion.Framework.ApplicationConfiguration.ConfigurationSettings.GetConfigurationSettings("ApplicationPath")%>/jquery-ui-itx.css' type="text/css" rel="stylesheet" />       
    <link href='<%=Intelexion.Framework.ApplicationConfiguration.ConfigurationSettings.GetConfigurationSettings("ApplicationPath")+ "/CSS/50/quickTabs.css"%>' type='text/css' rel='stylesheet' />
	<link href='<%=Intelexion.Framework.ApplicationConfiguration.ConfigurationSettings.GetConfigurationSettings("ApplicationPath")+ "/CSS/50/filtroAtributos.css"%>'
	type='text/css' rel='stylesheet' />
    
    <script language="javascript" type="text/javascript">
        var path;
        var usarVista5;
        path = '<%=Intelexion.Framework.ApplicationConfiguration.ConfigurationSettings.GetConfigurationSettings("ApplicationPath")%>'
        usarVista5 = '<%=Intelexion.Framework.ApplicationConfiguration.ConfigurationSettings.GetConfigurationSettings("usarVista5")%>';
    </script>

    <script language="javascript" type="text/javascript" src='<%=Intelexion.Framework.ApplicationConfiguration.ConfigurationSettings.GetConfigurationSettings("PathJS")+"/Validacion.aspx"%>'></script>
    <script language="javascript" type="text/javascript" src='<%=Intelexion.Framework.ApplicationConfiguration.ConfigurationSettings.GetConfigurationSettings("PathJS")+"/JQuery/jquery-1.7.2.min.js"%>'></script>
    <script language="javascript" type="text/javascript" src='<%=Intelexion.Framework.ApplicationConfiguration.ConfigurationSettings.GetConfigurationSettings("PathJS")+"/JQuery/json2.min.js"%>'></script>
    <script language="javascript" type="text/javascript" src='<%=Intelexion.Framework.ApplicationConfiguration.ConfigurationSettings.GetConfigurationSettings("PathJS")+"/JQuery/jquery.glob.js"%>'></script>
    <script language="javascript" type="text/javascript" src='<%=Intelexion.Framework.ApplicationConfiguration.ConfigurationSettings.GetConfigurationSettings("PathJS")+"/JQuery/globinfo/jQuery.glob." + context.Session("LID") + ".min.js"%>'></script>
    <script language="javascript" type="text/javascript" src='<%=Intelexion.Framework.ApplicationConfiguration.ConfigurationSettings.GetConfigurationSettings("PathJS")+"/JQuery/jquery.dataTables.js"%>'></script>
    <script language="javascript" type="text/javascript" src='<%=Intelexion.Framework.ApplicationConfiguration.ConfigurationSettings.GetConfigurationSettings("PathJS")+"/JQuery/localization/jquery.dataTables." + context.Session("LID").toString().replace("-", "_") + ".js"%>'></script>

    <%If Intelexion.Framework.ApplicationConfiguration.ConfigurationSettings.GetConfigurationSettings("usarVista5") = "1" Then%>
    <script language="javascript" type="text/javascript" src='<%=Intelexion.Framework.ApplicationConfiguration.ConfigurationSettings.GetConfigurationSettings("PathJS")+"/50/jQueryInclude.js"%>'></script>
    <%Else%>
    <script language="javascript" type="text/javascript" src='<%=Intelexion.Framework.ApplicationConfiguration.ConfigurationSettings.GetConfigurationSettings("PathJS")+"/50/jQueryIncludeV4.js"%>'></script>
    <%End If%>
    
    <script language="javascript" type="text/javascript" src='<%=Intelexion.Framework.ApplicationConfiguration.ConfigurationSettings.GetConfigurationSettings("PathJS")+"/JQuery/modelDialogCrossBrowser/showModelDialogCrossBrowser.js"%>'></script>	    
    <script language="javascript" type="text/javascript" src='<%=Intelexion.Framework.ApplicationConfiguration.ConfigurationSettings.GetConfigurationSettings("PathJS")+"/Nomina/PopupEmpleado.js"%>'></script>
    <script language="javascript" src='<%=Intelexion.Framework.ApplicationConfiguration.ConfigurationSettings.GetConfigurationSettings("PathJS")+"/Nomina/Procesos/CalculoNomina.js"%>'></script>
    
</head>
<body>
    <form id="Form1" method="post" runat="server">
    <cc1:ErrorDisplay ID="ErrorDisplay1" runat="server" Text="No Hay Errores"></cc1:ErrorDisplay>
    <div id="navigation">
        <ul>
            <li idopcion="50" id="Nav1">
                <%=Intelexion.Framework.SystemLabels.SystemLabels.getValueById(5884,context.Session("LID"))%>
            </li>
            <li idopcion="89">
                <%=Intelexion.Framework.SystemLabels.SystemLabels.getValueById(5885,context.Session("LID"))%>
            </li>
            <li > Consulta de Timbrados </li>
        </ul>
    </div>
    <span id="Header" runat="server">Consulta de Timbrados</span>
    <div class="formArea" id="divFiltros" style="width: 1200px;">
        <table style="width: 100%; vertical-align: text-top">
            <!--quitar border=1-->
            <tr>
                <td style="width: 65%; padding: 0px; vertical-align: top;">
                    <div>
                        <table>
                            <tr>
                                <td>
                                    <label id="lblRazonSocial" for="IdRazonSocial">
                                        <%=Intelexion.Framework.SystemLabels.SystemLabels.getValueById(82,context.Session("LID"))%></label>                                
                                    <span class="labelRequerido">
                                        <%=Intelexion.Framework.SystemLabels.SystemLabels.getValueById(87,context.Session("LID"))%></span>
                                </td>
                                <td class="td_combo">
                                    <select id="IdRazonSocial" name="IdRazonSocial">
                                    </select>
                                </td>
								<td></td>
								<td></td>
                                <td></td>
                            </tr>
                            <tr>
                                <td>
                                    <label id="lblTipoNominaAsig" for="IdTipoNominaAsig"><%=Intelexion.Framework.SystemLabels.SystemLabels.getValueById(14328, Context.Session("LID"))%></label>
									<span class="labelRequerido"><%=Intelexion.Framework.SystemLabels.SystemLabels.getValueById(87,context.Session("LID"))%></span>
                                </td>
                                <td class="td_combo">
                                    <select id="IdTipoNominaAsig" name="IdTipoNominaAsig">
                                        <option value=""><%=Intelexion.Framework.SystemLabels.SystemLabels.getValueById(55,context.Session("LID"))%></option>
                                    </select>
                                </td>
								<td></td>
								 <td></td>
								 <td></td>
                            </tr>
                            <tr>
                                <td>
                                    <label id="lblTipoNominaProc" for="IdTipoNominaProc"><%=Intelexion.Framework.SystemLabels.SystemLabels.getValueById(3951, Context.Session("LID"))%></label>
									<span class="labelRequerido"><%=Intelexion.Framework.SystemLabels.SystemLabels.getValueById(87,context.Session("LID"))%></span>
                                </td>
                                <td class="td_combo">
                                    <select id="IdTipoNominaProc" name="IdTipoNominaProc">
                                        <option value=""><%=Intelexion.Framework.SystemLabels.SystemLabels.getValueById(55,context.Session("LID"))%></option>
                                    </select>
                                </td>
								<td></td>
								<td></td>
								<td></td>
                            </tr>
                            <tr>                           	
						        <td><label id="lblEmpleado" for="IdEmpleado"><%=Intelexion.Framework.SystemLabels.SystemLabels.getValueById(12815, Context.Session("LID"))%></label>
						        <span class="labelRequerido"><%=Intelexion.Framework.SystemLabels.SystemLabels.getValueById(87,context.Session("LID"))%></span></td>						
						        <td><input type="text"  id="IdEmpleado" onblur="NombreEmpleado($('#IdEmpleado')[0],$('#Nombre')[0])"   /></td>
						         <td colspan="2" style="width:240px"><input type="text"  id="Nombre"   disabled /> </td>
							     <td><a id="linkPopupEmpleado" onclick="PopupEmpleadoMultipleCFDI(IdTipoNominaAsig.value,IdEmpleado,Nombre,IdRazonSocial.value, 1, gridEmpleados,0, '')">
								        <IMG src='<%=Intelexion.Framework.ApplicationConfiguration.ConfigurationSettings.GetConfigurationSettings("ApplicationPath")%>/images/tb_ViewReport.GIF' border=0 />
							        </a>
						        </td>
						    </tr>					        
					        <tr>
					            <td></td>					            
						        <td colspan="3">
						            <table>
                                        <tr id="divGridEmpleados">
                                        <td colspan="6"> 
                                            <div class="scroller">
				                                <table ID="gridEmpleados" style="width:100%; border-collapse:collapse;" Runat="server">
				                                <tr>
					                                <td class="headerTabla" Width="160px"><b><%=Intelexion.Framework.SystemLabels.SystemLabels.getValueById(7211,context.Session("LID"))%></b></td>
					                                <td class="headerTabla" Width="160px"><b><%=Intelexion.Framework.SystemLabels.SystemLabels.getValueById(7212,context.Session("LID"))%></b></td>
					                                <td class="headerTabla" Width="70px"><div></div></td>
				                                </tr>
				                                </table>  
			                                </div>
			                            </td> 
			                            </tr>
					                </table>
						        </td>						         
		                        <td></td>		                        
					        </tr>	
					        <tr>
						        <td>
						         <label id="lblAnioDesde" for="AnioDesde"><%=Intelexion.Framework.SystemLabels.SystemLabels.getValueById(12800, Context.Session("LID"))%></label>
						        <span class="labelRequerido"><%=Intelexion.Framework.SystemLabels.SystemLabels.getValueById(87,context.Session("LID"))%></span></td>						        
						        <td><input type="text" id="AnioDesde"  /></td>
						       	<td><label id="lblAnioHasta" for="AnioHasta"><%=Intelexion.Framework.SystemLabels.SystemLabels.getValueById(12802, Context.Session("LID"))%></label>
						       	<span class="labelRequerido"><%=Intelexion.Framework.SystemLabels.SystemLabels.getValueById(87,context.Session("LID"))%></span></td>						       	
						        <td><input type="text" id="AnioHasta" /></td> 
								<td></td>								
					        </tr>
					        <tr>
					            <td>
					                <label id="lblPeriodoDesde" for="PeriodoDesde"><%=Intelexion.Framework.SystemLabels.SystemLabels.getValueById(7910, Context.Session("LID"))%></label>
									<span class="labelRequerido"><%=Intelexion.Framework.SystemLabels.SystemLabels.getValueById(87,context.Session("LID"))%></span>
					            </td>					            
						        <td><input type="text" id="PeriodoDesde"  disabled="disabled" /></td>							        
						        <td>
						            <label id="lblPeriodoHasta" for="PeriodoHasta"><%=Intelexion.Framework.SystemLabels.SystemLabels.getValueById(7911, Context.Session("LID"))%></label>
									<span class="labelRequerido"><%=Intelexion.Framework.SystemLabels.SystemLabels.getValueById(87,context.Session("LID"))%></span>
						        </td>						       
		                        <td><input type="text" id="PeriodoHasta" disabled="disabled" /></td>
								<td></td>
					        </tr>					  
                        </table>
                    </div>
                </td> 					  
                <td style="width: 20%; padding: 0px; vertical-align: top;">
                    <div style="float: right;">                      
                        <div>
                            <table style="float: right;">
                                <tr>
                                    <td align="right">
                                       <label>Pendientes:</label>
                                    </td>
                                    <td class="tdContadores" id="tdPendientes">
                                        0
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right">
                                     <label>Timbrados:</label>
                                    </td>
                                    <td class="tdContadores" id="tdTimbrados">
                                        0
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right">
                                        <label>Con error:</label>
                                    </td>
                                    <td class="tdContadores" id="tdConError">
                                        0
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right">
                                       <label>TOTAL:</label>
                                    </td>
                                    <td class="tdContadores" id="tdTotal">
                                        0
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </div>
                </td>
            </tr>
			<%If Not Intelexion.Framework.SystemFlags.SystemFlags.getValueById(7336) Is Nothing AndAlso Intelexion.Framework.SystemFlags.SystemFlags.getValueById(7336) = "1" Then%>
				
				<tr>
					<td></td>
					<table style="margin-left: 31px;">
					   <tr>
						<td style="width: 20%; padding: 0px; vertical-align: top;">
                            <div id="divOpcion7">
                                <asp:Label ID="lblopcion7">
                                    <%=Intelexion.Framework.SystemLabels.SystemLabels.getValueById(2192,context.Session("LID"))%>
                                </asp:Label>
                                <org:filtroAtributos ID="attr" runat="server" />
                                
                            </div>
                        </td>
					   </tr>
					</table>
				</tr>
            <%End If%>
		
        </table>
			
			
        <div class="botonArea">
            <input class="boton boton-nuevo" id="btnFiltrar" type="button" value='Filtrar' />           
            <input class="boton" id="btnLimpiarCampos" type="button" value='Limpiar' />
        </div>
    </div>
    <div style="display:none;" id="progressDialog" title="Generando archivo pdf" >
    <div id="progressbar">
	<div class="progress-label"><%=Intelexion.Framework.SystemLabels.SystemLabels.getValueById(2535, Context.Session("LID"))%></div>
	</div>
	</div>
				                  				               
    <div id="datatable" style="width:100%" >
        <table cellpadding="0" cellspacing="0" border="0" class="display" id="gridNominas"></table>
    </div>
    <input type="hidden" id="filtroidElementoCategoria" runat="server" name="filtroidElementoCategoria" />
    
    </form>
    
    <script type="text/javascript" language="javascript">					
			var tablaCreada = 0;
			var fullData = {};
            var historial = {};
			var keepFunctionAlive = false;
			var objTime;
			var rsParams = 'INVALID';
			
			var EmpleadosConError;
			var EmpleadosPendientes;
			var EmpleadosTimbrados;
			var EmpleadosNoTimbrados;
			var EmpleadosTotal;
			var EmpleadosEnProceso;
			
			$(document).ready(function(){
				
				       var progressbar = $("#progressbar"),
                        progressLabel = $(".progress-label");
		                progressbar.progressbar({value: false,change: function() {progressLabel.text(progressbar.progressbar("value") + "%");},max: 100});
		                $("#progressbar").css("display", "");		            
		                $(".scroller").css("background-color", $(".formArea").css("background-color"));
						
                jQuery.support.cors = true;
				$('#btnFiltrar').click(function(){					
					$('.tdContadores').text('0');			
					clearTimeout(objTime);
					
					var IdRazonSocial = $('#IdRazonSocial').find('option:selected').val();
					var IdTipoNominaAsig = $('#IdTipoNominaAsig').find('option:selected').val();
					var IdTipoNominaProc = $('#IdTipoNominaProc').find('option:selected').val(); 
					var IdEmpleado = $('#IdEmpleado').val();
					var AnioDesde = $('#AnioDesde').val();
					var AnioHasta = $('#AnioHasta').val();
					var periodoD = $('#PeriodoDesde').val()
					var PeriodoDesde = (periodoD.length > 0) ? periodoD:0;
					var periodoH = $('#PeriodoHasta').val()
					var PeriodoHasta = (periodoH.length > 0) ? periodoH:0;
                    var UserId = '<%=Context.Session("UID").replace("\","\\")%>';
                    var IdAtributos =   $('#filtroidElementoCategoria').val() ;                  
					Filtrar(IdRazonSocial,IdTipoNominaAsig,IdTipoNominaProc,IdEmpleado,AnioDesde,AnioHasta,PeriodoDesde,PeriodoHasta,'',UserId,IdAtributos);
				});
				
				$('#btnLimpiarCampos').click(function(){
					LimpiarCampos();
				});
				
				cargarRazonesSociales();
				
				$('#IdTipoNominaAsig,#IdTipoNominaProc').change(function(){
				     if($(this).val().length == 0) {
                        $("#PeriodoDesde").attr("disabled", "disabled"); 
                        $("#PeriodoHasta").attr("disabled", "disabled"); 
                        
                         $("#PeriodoDesde,#PeriodoHasta").val('')
                        
                    }
                    else {
                        $("#PeriodoDesde").removeAttr("disabled"); 
                        $("#PeriodoHasta").removeAttr("disabled"); 
                    }
				});
				
				$('#IdRazonSocial').change(function(){
			        $("#PeriodoDesde").attr("disabled", "disabled"); 
                    $("#PeriodoHasta").attr("disabled", "disabled"); 
				});
				
			});
			
			function LimpiarCampos(){
				$('#IdTipoNominaAsig, #IdTipoNominaProc').html('<option value="">Selecciona</option>');  
				$('#IdEmpleado, #Nombre, #AnioDesde, #AnioHasta, #PeriodoDesde, #PeriodoHasta').val('');              			
				$('.tdContadores').text('0');
	
				$("#gridEmpleados tr:not(:first-child)").remove();
				
				if(tablaCreada == 1){
					tablaCreada = 0;
					$('#gridNominas').dataTable().fnDestroy();
					$('#gridNominas').empty();
				}
				if (usarVista5=='1'){
				    fnAttr_ResetFiltroAtributos();
				    $('#txtFiltroAutocomplete').val('');	    				    
				}
				$('#filtroidElementoCategoria').val('');
				<%If Not Intelexion.Framework.SystemFlags.SystemFlags.getValueById(7336) Is Nothing AndAlso Intelexion.Framework.SystemFlags.SystemFlags.getValueById(7336) = "1" Then%>
                $("#filtroAtributos")[0].selectedIndex = -1;
				<%End if%>
				cargarRazonesSociales();
			}

            function cargarRazonesSociales() {
            	var args = {
					userId: '<%=Context.Session("UID").replace("\","\\")%>',
					languageId: '<%=Context.Session("LID")%>'
				}
				showWait();
                $.ajax({
                    type: "POST",
                    url: "FuncionesTimbrado.aspx/ObtenerRazonesSociales",
                    data: JSON.stringify(args),
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (response) {
                        $('#IdRazonSocial').empty();

                        var str = '<option value="" attr-rfc="">Selecciona</option>';

                        var data = JSON.parse(response.d);
                        data.forEach(function (item) {
                            var rfc = item.RFCRazonSocial.toString().replace('-', '');
                            str += '<option value="' + item.IdRazonSocial + '" attr-rfc="' + rfc + '">' + item.DescripcionRazonSocial + ' (' + item.IdRazonSocial + ')</option>';
                        });

                        $('#IdRazonSocial').append(str);

                    },
                    error: function (xhr, textStatus, errorThrown) {
                        alert("Error al consultar las razones sociales: " + errorThrown);
                    }
                });
            }
            
			function ConsultaRazones(){
				var args = {
					userId: '<%=Context.Session("UID").replace("\","\\")%>',
					languageId: '<%=Context.Session("LID")%>'
				}
				showWait();
				jQuery.ajax({
					type: "POST",
					url: "<%=Intelexion.Framework.ApplicationConfiguration.ConfigurationSettings.GetConfigurationSettings("ITXCFDIConnectorPath")%>ITXCFDIConnectorService.svc/ConsultaRazonSocial",
					dataType: "json",
					data: JSON.stringify(args),
					contentType: "application/json; charset=utf-8",
					async: true,
					success: function (data) {
						$('#IdRazonSocial').empty();
						var str = '<option value="" attr-rfc="">Selecciona</option>';
						if(data.ConsultaRazonSocialResult){
							if(data.ConsultaRazonSocialResult.WithError){
								alert(data.ConsultaRazonSocialResult.ErrorMsg);
							} else {
								if(data.ConsultaRazonSocialResult.Items.length > 0){
									for(var x= 0; x < data.ConsultaRazonSocialResult.Items.length; x++){
										var obj = data.ConsultaRazonSocialResult.Items[x];
										var rfc = obj.RFCRazonSocial.toString().replace('-','');
										str += '<option value="' + obj.IdRazonSocial + '" attr-rfc="' + rfc + '">' + obj.DescripcionRazonSocial + ' (' + obj.IdRazonSocial + ')</option>';
									}
								}
							}
						}
						$('#IdRazonSocial').append(str).change(function(){
							$('#IdTipoNominaAsig, #IdTipoNominaProc').html('<option value="">Selecciona</option>');
							if($(this).find('option:selected').val() != ''){
								ConsultaTipoNominaAsig($(this).find('option:selected').val());
								ConsultaTipoNominaProc($(this).find('option:selected').val());
							}
						});
						hideWait();
					},
					error: function (xhr, textStatus, e) {						
						ConsultaRazones2();
					}
				});	

			}
			
			function ConsultaRazones2(){
				var args = {
					userId: '<%=Context.Session("UID").replace("\","\\")%>',
					languageId: '<%=Context.Session("LID")%>'
				}
				showWait();
				jQuery.ajax({
					type: "POST",
					url: "<%=Intelexion.Framework.ApplicationConfiguration.ConfigurationSettings.GetConfigurationSettings("ITXCFDIConnectorPath")%>ITXCFDIConnectorService.svc/ConsultaRazonSocial",
					dataType: "json",
					data: JSON.stringify(args),
					contentType: "application/json; charset=utf-8",
					async: true,
					success: function (data) {
						$('#IdRazonSocial').empty();
						var str = '<option value="" attr-rfc="">Selecciona</option>';
						if(data.ConsultaRazonSocialResult){
							if(data.ConsultaRazonSocialResult.WithError){
								alert(data.ConsultaRazonSocialResult.ErrorMsg);
							} else {
								if(data.ConsultaRazonSocialResult.Items.length > 0){
									for(var x= 0; x < data.ConsultaRazonSocialResult.Items.length; x++){
										var obj = data.ConsultaRazonSocialResult.Items[x];
										var rfc = obj.RFCRazonSocial.toString().replace('-','');
										str += '<option value="' + obj.IdRazonSocial + '" attr-rfc="' + rfc + '">' + obj.DescripcionRazonSocial + ' (' + obj.IdRazonSocial + ')</option>';
									}
								}
							}
						}
						$('#IdRazonSocial').append(str).change(function(){
							$('#IdTipoNominaAsig, #IdTipoNominaProc').html('<option value="">Selecciona</option>');
							if($(this).find('option:selected').val() != ''){
								ConsultaTipoNominaAsig($(this).find('option:selected').val());
								ConsultaTipoNominaProc($(this).find('option:selected').val());
							}
						});
						hideWait();
					},
					error: function (xhr, textStatus, e) {						
						hideWait();
						alert('Error al consultar las razones sociales');
					}
				});	

			}

			function ConsultaTipoNominaAsig(idRazonSocial){
				var args = {
					IdRazonSocial: idRazonSocial,
					userId: '<%=Context.Session("UID").replace("\","\\")%>',
					languageId: '<%=Context.Session("LID")%>',
					porTipo: true,
					tipoClase: 1
				}
				showWait();
				jQuery.ajax({
					type: "POST",
					url: "<%=Intelexion.Framework.ApplicationConfiguration.ConfigurationSettings.GetConfigurationSettings("ITXCFDIConnectorPath")%>ITXCFDIConnectorService.svc/ConsultaTiposNomina",
					data: JSON.stringify(args),
					contentType: "application/json; charset=utf-8",
					dataType: "json",
					async: true,
					success: function (data) {
						$('#IdTipoNominaAsig').empty();
						var str = '<option value="">Selecciona</option>';
						if(data.ConsultaTiposNominaResult){
							if(data.ConsultaTiposNominaResult.WithError){
								alert(data.ConsultaTiposNominaResult.ErrorMsg);
							} else {
								if(data.ConsultaTiposNominaResult.Items.length > 0){
									for(var x= 0; x < data.ConsultaTiposNominaResult.Items.length; x++){
										var obj = data.ConsultaTiposNominaResult.Items[x];
										str += '<option value="' + obj.IdTipoNomina + '">' + obj.IdTipoNomina + ' - ' + obj.Descripcion + '</option>';
									}
								}							
							}
						}

						$('#IdTipoNominaAsig').append(str).change(function(){
							$('#IdTipoNominaProc').find('option[value="' + $(this).find('option:selected').val() + '"]').attr('selected', true);
						});
						hideWait();
					},
					error: function (xhr, textStatus, e) {						
						hideWait();
						alert('Error al consultar los tipos de nomina');
					}
				});	
			}
			function ConsultaTipoNominaProc(idRazonSocial){
				var args = {
					IdRazonSocial: idRazonSocial,
					userId: '<%=Context.Session("UID").replace("\","\\")%>',
					languageId: '<%=Context.Session("LID")%>'
				}
				showWait();
				jQuery.ajax({
					type: "POST",
					url: "<%=Intelexion.Framework.ApplicationConfiguration.ConfigurationSettings.GetConfigurationSettings("ITXCFDIConnectorPath")%>ITXCFDIConnectorService.svc/ConsultaTiposNomina",
					data: JSON.stringify(args),
					contentType: "application/json; charset=utf-8",
					dataType: "json",
					async: true,
					success: function (data) {
						$('#IdTipoNominaProc').empty();
						var str = '<option value="">Selecciona</option>';
						if(data.ConsultaTiposNominaResult){
							if(data.ConsultaTiposNominaResult.WithError){
								alert(data.ConsultaTiposNominaResult.ErrorMsg);
							} else {
								if(data.ConsultaTiposNominaResult.Items.length > 0){
									for(var x= 0; x < data.ConsultaTiposNominaResult.Items.length; x++){
										var obj = data.ConsultaTiposNominaResult.Items[x];
										str += '<option value="' + obj.IdTipoNomina + '">' + obj.IdTipoNomina + ' - ' + obj.Descripcion + '</option>';
									}
								}
							}
						}

						$('#IdTipoNominaProc').append(str).change(function(){
												
						});
						hideWait();
					},
					error: function (xhr, textStatus, e) {						
						hideWait();
						alert('Error al consultar los tipos de nomina');
					}
				});	
			}			
		
			function ConsultaDatosUnitarios(IdRazonSocial,IdTipoNominaAsig,IdTipoNominaProc,IdEmpleado,AnioDesde,AnioHasta,PeriodoDesde,PeriodoHasta,UserId,IdAtributos){					
				var args = {
					IdRazonSocial: parseInt(IdRazonSocial), 
					IdTipoNominaAsig: IdTipoNominaAsig, 
					IdTipoNominaProc: IdTipoNominaProc, 
					IdEmpleado: IdEmpleado,
					AnioDesde: parseInt(AnioDesde), 
					AnioHasta: parseInt(AnioHasta),
					PeriodoDesde: parseInt(PeriodoDesde),
					PeriodoHasta: parseInt(PeriodoHasta),					
					UserId: UserId,
					IdAtributos: IdAtributos
				}	
				jQuery.ajax({
					type: "POST",
					url: "<%=Intelexion.Framework.ApplicationConfiguration.ConfigurationSettings.GetConfigurationSettings("ITXCFDIConnectorPath")%>ITXCFDIConnectorService.svc/ConsultaTimbradoDatosUnitariosEmpleado",
					data: JSON.stringify(args),
					contentType: "application/json; charset=utf-8",
					dataType: "json",
					async: false,
					success: function (data) {
						if(data.ConsultaTimbradoDatosUnitariosEmpleadoResult){
							if(data.ConsultaTimbradoDatosUnitariosEmpleadoResult.WithError){
								alert(data.ConsultaTimbradoDatosUnitariosEmpleadoResult.ErrorMsg);
							} else {
								if(data.ConsultaTimbradoDatosUnitariosEmpleadoResult){
									
									var objeto = data.ConsultaTimbradoDatosUnitariosEmpleadoResult;
									
									if(objeto.EmpleadosEnProceso > 0){
										var Sts = ($('#gridNominas_status select').length > 0) ? $('#gridNominas_status select').find('option:selected').val() : '';
//                                        
										objTime = setTimeout(function(){Filtrar(IdRazonSocial,IdTipoNominaAsig,IdTipoNominaProc,IdEmpleado,AnioDesde,AnioHasta,PeriodoDesde,PeriodoHasta,Sts,UserId)}, 60 * 1000);										
									}
									
									$('#tdPendientes').text(objeto.EmpleadosPendientes);
									$('#tdTimbrados').text(objeto.EmpleadosTimbrados);
									$('#tdConError').text(objeto.EmpleadosConError);
									$('#tdTotal').text(objeto.EmpleadosTotal);

									EmpleadosConError = objeto.EmpleadosConError;
									EmpleadosPendientes = objeto.EmpleadosPendientes;
									EmpleadosTimbrados = objeto.EmpleadosTimbrados;
									EmpleadosTotal = objeto.EmpleadosTotal;
									EmpleadosEnProceso = objeto.EmpleadosEnProceso;
								}
							}
						}
					},
					error: function (xhr, textStatus, e) {
					    hideWait();
						alert('Error Datos unitarios');
					}
				});					
			}
			function Filtrar(IdRazonSocial,IdTipoNominaAsig,IdTipoNominaProc,IdEmpleado,AnioDesde,AnioHasta,PeriodoDesde,PeriodoHasta,status,UserId,		   IdAtributos){
				clearErrors();	
				var Valida=true;	
				var noMostrarBotones=0;
				historial = {};
                
                var ListaEmpleados = '',grid = $('#gridEmpleados')[0];
    		  		
                $(grid).find("tbody tr:not(:first-child) td:first-child").each(function() {    			        
    	            ListaEmpleados += $(this).text() + ','
    	        });
                
                if(ListaEmpleados.length > 0)
                    ListaEmpleados = ListaEmpleados.substring(0, ListaEmpleados.length - 1);
                
				 var esValido=true;
                esValido = esValido && validacombo2($("#IdRazonSocial")[0], $("#lblRazonSocial").text());
				//esValido = esValido && validacombo2($("#IdTipoNominaAsig")[0], $("#lblTipoNominaAsig").text());
				//esValido = esValido && validacombo2($("#IdTipoNominaProc")[0], $("#lblTipoNominaProc").text());
				
				
				if(ListaEmpleados.length == 0 )
				<%If Not Intelexion.Framework.SystemFlags.SystemFlags.getValueById(7336) Is Nothing AndAlso Intelexion.Framework.SystemFlags.SystemFlags.getValueById(7336) = "1" Then%>
				   if (IdAtributos == ""){
					esValido = esValido && validacampo($("#IdEmpleado")[0],true,$("#lblEmpleado").text(), "texto", 30, 1, '');
				   }	
				<%else%>
					esValido = esValido && validacampo($("#IdEmpleado")[0],true,$("#lblEmpleado").text(), "texto", 30, 1, '');
				<%end if%>
				esValido = esValido && validacampo($("#AnioDesde")[0],true,$("#lblAnioDesde").text(),'numero',4,1,4);
				esValido = esValido && validacampo($("#AnioHasta")[0],true,$("#lblAnioHasta").text(),'numero',4,1,4);
				
				if($("#IdTipoNominaAsig").val().length > 0 && $("#IdTipoNominaProc").val().length > 0 ){
				    esValido = esValido && validacampo($("#PeriodoDesde")[0],true,$("#lblPeriodoDesde").text(),'numero',10,1,10);
				    esValido = esValido && validacampo($("#PeriodoHasta")[0],true,$("#lblPeriodoHasta").text(),'numero',10,1,10);
				}
				
				if(esValido == false){					
					return;				
				}	
				
				showWait();						 		
				//ConsultaDatosUnitarios(IdRazonSocial,IdTipoNominaAsig,IdTipoNominaProc,IdEmpleado,AnioDesde,AnioHasta,PeriodoDesde,PeriodoHasta,UserId);
				
				if(tablaCreada == 1){
					$('#gridNominas').dataTable().fnDestroy();
					$('#gridNominas').empty();
				}
				fullData = {};
				try{
				$('#gridNominas').dataTable({
					//"aaData": data.FiltraTimbradoResult.ListaNominas.Items,
					"bDeferRender": true,
					"bFilter": false,
					"bServerSide": true,
					"sAjaxSource": "<%=Intelexion.Framework.ApplicationConfiguration.ConfigurationSettings.GetConfigurationSettings("ITXCFDIConnectorPath")%>ITXCFDIConnectorService.svc/ConsultaTimbradoEmpleado",
					"fnServerData": function (sSource, aoData, fnCallback, oSettings) {
						aoData.push({ "name": "IdRazonSocial", "value": parseInt(IdRazonSocial) });
						aoData.push({ "name": "IdTipoNominaAsig", "value": IdTipoNominaAsig });
						aoData.push({ "name": "IdTipoNominaProc", "value": IdTipoNominaProc });
						aoData.push({ "name": "IdEmpleado", "value": IdEmpleado });
						aoData.push({ "name": "AnioDesde", "value":  parseInt(AnioDesde) });
						aoData.push({ "name": "AnioHasta", "value": parseInt(AnioHasta) });
						aoData.push({ "name": "PeriodoDesde", "value":  parseInt(PeriodoDesde) });
						aoData.push({ "name": "PeriodoHasta", "value": parseInt(PeriodoHasta) });
						aoData.push({ "name": "ListaEmpleados", "value": ListaEmpleados });
						aoData.push({ "name": "languageId", "value": '<%=Context.Session("LID")%>' });
						aoData.push({ "name": "orderBy", "value": 'IdEmpleado' });
						aoData.push({ "name": "Status", "value": status });
						aoData.push({ "name": "UserId", "value": UserId });
						aoData.push({ "name": "cacheToken", "value": (new Date()).getTime() });
						aoData.push({ "name": "IdAtributos", "value": IdAtributos });
						oSettings.jqXHR = $.ajax({
							"dataType": 'json',
							"type": "GET",
							"url": sSource,
							"data": aoData,
							"async": false,
							"success": fnCallback
						});
						
					},
					"fnInitComplete" : function() { //Esta funcion es importante para que se ajusten las columnas correctamente.
						this.fnAdjustColumnSizing();
						this.fnDraw();
					},
					"aoColumns": [
					    //{ "sTitle": 'Tienda', 'sClass': 'dt_center', "mData": "Tienda" },
						{ "sTitle": '<%=Intelexion.Framework.SystemLabels.SystemLabels.getValueById(1894,context.Session("LID"))%>', 'sClass': 'dt_center', "mData": "NumEmpleado" },
						
						{ "sTitle": '<%=Intelexion.Framework.SystemLabels.SystemLabels.getValueById(21,context.Session("LID"))%>', "mData": "NombrePersona" },
						{ "sTitle": 'Apellido', "mData": "Apellido" },
						{ "sTitle": '<%=Intelexion.Framework.SystemLabels.SystemLabels.getValueById(13,context.Session("LID"))%>', "mData": "Nomina" },
						{ "sTitle": '<%=Intelexion.Framework.SystemLabels.SystemLabels.getValueById(1836,context.Session("LID"))%>', "mData": "Anio" },
						{ "sTitle": '<%=Intelexion.Framework.SystemLabels.SystemLabels.getValueById(2378,context.Session("LID"))%>', "mData": "Periodo" },
						{ "sTitle": 'Fecha.Envio', 'sClass': 'dt_center', "mData": "FechaHoraCertificacionFormato" }, //FechaHoraCertificacionFormato
//						{ "sTitle": 'No. certificado digital', "mData": "NumeroCertificadoDigital" },
						{ "sTitle": '<%=Intelexion.Framework.SystemLabels.SystemLabels.getValueById(117,context.Session("LID"))%>', 'sClass': 'dt_center', "mData": function (source, type, val) {
							switch(source.EstatusTimbrado){
								case 0:	return 'No timbrado';
								case 2:	return 'En proceso de timbrado';
								case 3:	return 'Cancelado';
								case 4:	
									fullData["error_" + source.NumEmpleado + source.Anio + source.Periodo] = source.MensajeTimbrado;
									return '<a href="javascript: VentanaErrores(\'' + source.NumEmpleado + source.Anio + source.Periodo + '\')">Con error</a>';
								case 5:	return 'Timbrado';
								case 6:	return 'En proceso de timbrado';
								default: return '';
							}
						} },
						//{ "sTitle": 'Mensajes Error', "mData": "MensajeTimbrado" },	,,,,AnioDesde,AnioHasta,PeriodoDesde,PeriodoHasta,UserId					
						{ "sTitle": 'FacturaID', "mData": "FacturaId" },
						{ "sTitle": 'XML', 'sClass': 'dt_center', "mData": function (source, type, val) {
							var str = ''
							//var fileName = IdRazonSocial.toString() + '|' + IdTipoNominaAsig + '|' + IdTipoNominaProc + '|' + source.Anio + '|' + source.Periodo + '|' + source.NumEmpleado  + '|' +  UserId;
							var fileName = source.key;
							if(source.EstatusTimbrado == 5){
								str = '<a href="<%=Intelexion.Framework.ApplicationConfiguration.ConfigurationSettings.GetConfigurationSettings("ITXCFDIConnectorPath")%>ITXCFDIConnectorService.svc/XMLFile/' + fileName + '">bajar</a>';
							}							
							return str;						
						} },
						{ "sTitle": 'PDF', 'sClass': 'dt_center', "mData": function (source, type, val) {
							var str = ''
							//var fileName = idRazon.toString() + '-' + IdAsig + '-' + IdProc + '-' + Anio.toString() + '-' + Per.toString() + '-' + source.NumEmpleado;
							var fileName = source.key;
							if(source.EstatusTimbrado == 5){
								str = '<a href="<%=Intelexion.Framework.ApplicationConfiguration.ConfigurationSettings.GetConfigurationSettings("ITXCFDIConnectorPath")%>ITXCFDIConnectorService.svc/PDFFile/' + fileName + '">pdf</a>';
							}							
							return str;
						

						
						} },
						{ "sTitle": '<%=Intelexion.Framework.SystemLabels.SystemLabels.getValueById(760,context.Session("LID"))%>', 'sClass': 'dt_center', "mData": function (source, type, val) {
//						var str = ''
                             //console.log(source.ListaCancelacion)
                             
                             
                             if(source.ListaCancelacion.Items != null){
                             if (source.ListaCancelacion.Items.length > 0){
                                historial["obj_" + source.NumEmpleado + source.Anio + source.Periodo] = source;
                                return '<a href="javascript: VentanaHistorial(\'' + source.NumEmpleado + source.Anio + source.Periodo + '\')" >Ver</a>';
                                    }
                             
                             }
                             
                           /*  if(source.ListaCancelacion != null){
                               
                               if (source.ListaCancelacion.Items.length > 0){
                                historial["obj_" + source.NumEmpleado + source.Anio + source.Periodo] = source;
                                return '<a href="javascript: VentanaHistorial(\'' + source.NumEmpleado + source.Anio + source.Periodo + '\')" >Ver</a>';
                                    }
                           
                             }
                            */
                            return '';
                           
                        } }
                        

					],
					"oLanguage":dtLanguage // el objeto dtLanguage fue creado en el archivo localization/jquery.datatables.es_MX.js
				});
				}
				catch(ex){
				    hideWait();
				    noMostrarBotones=1;    
				}
		
				tablaCreada = 1;
				hideWait();	
			
				$('#gridNominas_status, #gridNominas_imprimir, #gridNominas_enviarcorreo, #gridNominas_generarXls').remove();
		
				var strControlEstatus = '';				
				strControlEstatus += '<div id="gridNominas_status" class="dataTables_status">';
				strControlEstatus += '<label>';
				strControlEstatus += 'Estatus: '; 
				strControlEstatus += '<select size="1" name="gridNominas_status" aria-controls="gridNominas" style="width:100px;">';
				strControlEstatus += '<option value="" selected="selected">Todos</option>';
				strControlEstatus += '<option value="0">No timbrado</option>';
				strControlEstatus += '<option value="2">En proceso</option>';
				strControlEstatus += '<option value="3">Cancelado</option>';
				strControlEstatus += '<option value="4">Con error</option>';
				strControlEstatus += '<option value="5">Timbrado</option>';
				strControlEstatus += '</select>';
				strControlEstatus += '</label>';
				strControlEstatus += '</div>';
				
				var strControlImprimir = '';
				strControlImprimir += '<div id="gridNominas_imprimir" class="dataTables_imprimir" style="float:right;">';                                                                                                                                                                                                                                                                                                                                                                                                                                                                  
				strControlImprimir += '<input style="border:none;background: url(<%=Intelexion.Framework.ApplicationConfiguration.ConfigurationSettings.GetConfigurationSettings("ApplicationPath")%>/ui/50/images/icons/document-pdf.png) no-repeat center left;" title="Generar un solo archivo PDF con los recibos CFDI de todos los empleados" type="button" class="boton" id="btnImprimir" value="Generar PDF masivo" attr-idrazonsocial="' + IdRazonSocial + '" attr-idtiponominaasig="' + IdTipoNominaAsig + '" attr-idtiponominaproc="' + IdTipoNominaProc + '" attr-idempleado="' + IdEmpleado + '" attr-aniodesde="' + AnioDesde + '" attr-aniohasta="' + AnioHasta + '" attr-periododesde="' + PeriodoDesde + '" attr-periodohasta="' + PeriodoHasta + '" attr-userId="' + UserId + '" />';
				strControlImprimir += '</div>';
				
				var strControlEnviar = '';
				strControlEnviar += '<div id="gridNominas_enviarcorreo" class="dataTables_enviarcorreo" style="float:right;">';
				strControlEnviar += '<input style="border:none;background: url(<%=Intelexion.Framework.ApplicationConfiguration.ConfigurationSettings.GetConfigurationSettings("ApplicationPath")%>/ui/50/images/icons/mail--arrow.png) no-repeat center left;" title="Enviar archivos PDF y XML a cada empleado que cuente con correo electrónico" type="button" class="boton" id="btnEnviarCorreo" value="Enviar por correo" attr-idrazonsocial="' + IdRazonSocial + '" attr-idtiponominaasig="' + IdTipoNominaAsig + '" attr-idtiponominaproc="' + IdTipoNominaProc + '" attr-idempleado="' + IdEmpleado + '" attr-aniodesde="' + AnioDesde + '" attr-aniohasta="' + AnioHasta + '" attr-periododesde="' + PeriodoDesde + '" attr-periodohasta="' + PeriodoHasta + '" attr-userId="' + UserId + '" />';
				strControlEnviar += '</div>';
			
				var strControlGenerarXls = '';
				strControlGenerarXls += '<div id="gridNominas_generarXls" class="dataTables_generarXls" style="float:right;">';
				strControlGenerarXls += '<input style="border:none;background: url(<%=Intelexion.Framework.ApplicationConfiguration.ConfigurationSettings.GetConfigurationSettings("ApplicationPath")%>/ui/50/images/icons/document-excel-csv.png) no-repeat center left;" title="Generar archivo de excel de la información filtrada" type="button" class="boton" id="btnGenerarXls" value="Generar excel" attr-idrazonsocial="' + IdRazonSocial + '" attr-idtiponominaasig="' + IdTipoNominaAsig + '" attr-idtiponominaproc="' + IdTipoNominaProc + '" attr-idempleado="' + IdEmpleado + '" attr-aniodesde="' + AnioDesde + '" attr-aniohasta="' + AnioHasta + '" attr-periododesde="' + PeriodoDesde + '" attr-periodohasta="' + PeriodoHasta + '" attr-userId="' + UserId + '"  />'; 
				strControlGenerarXls += '</div>';				

//				$('#gridNominas_status select').find('option[value="' + status + '"]').attr('selected', true);
				$('#gridNominas_wrapper').prepend(strControlEstatus);
                $('#gridNominas_wrapper').prepend(strControlImprimir);
			    $('#gridNominas_wrapper').prepend(strControlEnviar);
                $('#gridNominas_wrapper').prepend(strControlGenerarXls);
                
              
				$('#gridNominas_status select').change(function(){					
					Filtrar(IdRazonSocial,IdTipoNominaAsig,IdTipoNominaProc,IdEmpleado,AnioDesde,AnioHasta,PeriodoDesde,PeriodoHasta, $(this).val(),UserId,IdAtributos)
					$('#gridNominas_status select').val($(this).val());
				});

				$('#gridNominas_imprimir input[type="button"]').click(function(){
					var idRazonSocialImprimir = $(this).attr('attr-idrazonsocial');
					var idTipoNominaAsigImprimir = $(this).attr('attr-idtiponominaasig');
					var idTipoNominaProcImprimir = $(this).attr('attr-idtiponominaproc');
					var idEmpleadoImprimir = $(this).attr('attr-idempleado');
					var AnioDesdeImprimir = $(this).attr('attr-aniodesde');
					var AnioHastaImprimir = $(this).attr('attr-aniohasta');
					var PeriodoDesdeImprimir = $(this).attr('attr-periododesde');
					var PeriodoHastaImprimir = $(this).attr('attr-periodohasta');

					var userIdImprimir = $(this).attr('attr-userId');
					var ListaEmpleados = '',grid = $('#gridEmpleados')[0];    		  		
					var IdAtributos =   $('#filtroidElementoCategoria').val() ;
					
					$(grid).find("tbody tr:not(:first-child) td:first-child").each(function() {    			        
						ListaEmpleados += $(this).text() + ','
					});					
					if(ListaEmpleados.length > 0)
						ListaEmpleados = ListaEmpleados.substring(0, ListaEmpleados.length - 1);
					ResumenImprimir(idRazonSocialImprimir,idTipoNominaAsigImprimir,idTipoNominaProcImprimir,idEmpleadoImprimir,AnioDesdeImprimir,AnioHastaImprimir,PeriodoDesdeImprimir,PeriodoHastaImprimir,ListaEmpleados,userIdImprimir,IdAtributos);
				});

    			$('#gridNominas_generarXls input[type="button"]').click(function(){
			        var idRazonSocialXls = $(this).attr('attr-idrazonsocial');
					var idTipoNominaAsigXls = $(this).attr('attr-idtiponominaasig');
					var idTipoNominaProcXls = $(this).attr('attr-idtiponominaproc');//			
                    var idEmpleadoXls = $(this).attr('attr-idempleado');
					var AnioDesdeXls = $(this).attr('attr-aniodesde');
					var AnioHastaXls = $(this).attr('attr-aniohasta');
					var PeriodoDesdeXls = $(this).attr('attr-periododesde');
					var PeriodoHastaXls = $(this).attr('attr-periodohasta');
					var langXls = ''  ;
					var orderByXls = 'IdEmpleado'  ;
					var statusXls = $('#gridNominas_status select').val(); 
					var userXls =  UserId ;
					var tokenXls = new Date().getTime();
					var ListaEmpleados = '',grid = $('#gridEmpleados')[0];    		  		
					var IdAtributos =   $('#filtroidElementoCategoria').val() ; 
					
					$(grid).find("tbody tr:not(:first-child) td:first-child").each(function() {    			        
						ListaEmpleados += $(this).text() + ','
					});					
					if(ListaEmpleados.length > 0)
						ListaEmpleados = ListaEmpleados.substring(0, ListaEmpleados.length - 1);
						
					var nombrArchivo = idRazonSocialXls +'|'+ idTipoNominaAsigXls +'|'+ idTipoNominaProcXls + '|' + idEmpleadoXls + '|' + AnioDesdeXls + '|' + AnioHastaXls + '|' + PeriodoDesdeXls + '|' + PeriodoHastaXls +'|'+ ListaEmpleados +'|'+ IdAtributos +'|'+ langXls +'|'+ orderByXls +'|'+ statusXls +'|'+ userXls +'|'+'<%=Date.Now.Ticks%>'
					ResumenGenerarXls(nombrArchivo);
            	});                                                                  
				
				$('#gridNominas_enviarcorreo input[type="button"]').click(function(){
					var idRazonSocialEnviar = $(this).attr('attr-idrazonsocial');
					var idTipoNominaAsigEnviar = $(this).attr('attr-idtiponominaasig');
					var idTipoNominaProcEnviar = $(this).attr('attr-idtiponominaproc');
                    var idEmpleadoEnviar = $(this).attr('attr-idempleado');
					var AnioDesdeEnviar = $(this).attr('attr-aniodesde');
					var AnioHastaEnviar = $(this).attr('attr-aniohasta');
					var PeriodoDesdeEnviar = $(this).attr('attr-periododesde');
					var PeriodoHastaEnviar = $(this).attr('attr-periodohasta');
					var ListaEmpleados = '',grid = $('#gridEmpleados')[0];    		  		
					var IdAtributos =   $('#filtroidElementoCategoria').val() ; 
					
					$(grid).find("tbody tr:not(:first-child) td:first-child").each(function() {    			        
						ListaEmpleados += $(this).text() + ','
					});					
					if(ListaEmpleados.length > 0)
						ListaEmpleados = ListaEmpleados.substring(0, ListaEmpleados.length - 1);

					var userIdEnviar = $(this).attr('attr-userId');
					ResumenEnvioCorreo(idRazonSocialEnviar, idTipoNominaAsigEnviar, idTipoNominaProcEnviar, idEmpleadoEnviar, AnioDesdeEnviar, AnioHastaEnviar, PeriodoDesdeEnviar, PeriodoHastaEnviar,ListaEmpleados, userIdEnviar,IdAtributos);
				});
//				
			}
			function fnCallback()
			{
			    alert('consutla realizada');
			}
			
			function ResumenImprimir(idRazonSocialImprimir,idTipoNominaAsigImprimir,idTipoNominaProcImprimir,idEmpleadoImprimir,AnioDesdeImprimir,AnioHastaImprimir,PeriodoDesdeImprimir,PeriodoHastaImprimir,ListaEmpleados,userIdImprimir,IdAtributos){	
				var args = {
					IdRazonSocial: parseInt(idRazonSocialImprimir), 
					IdTipoNominaAsig: idTipoNominaAsigImprimir, 
					IdTipoNominaProc: idTipoNominaProcImprimir, 
					IdEmpleado : idEmpleadoImprimir,
					AnioDesde: parseInt(AnioDesdeImprimir), 					
					AnioHasta: parseInt(AnioHastaImprimir), 
					PeriodoDesde: parseInt(PeriodoDesdeImprimir),
					PeriodoHasta: parseInt(PeriodoHastaImprimir),
					ListaEmpleados: ListaEmpleados,
					UserId: userIdImprimir,
					IdAtributos: IdAtributos
									
				}	
				showWait();
				jQuery.ajax({
					type: "POST",
					url: "<%=Intelexion.Framework.ApplicationConfiguration.ConfigurationSettings.GetConfigurationSettings("ITXCFDIConnectorPath")%>ITXCFDIConnectorService.svc/ConsultaResumenImprimirEmpleado",
					data: JSON.stringify(args),
					contentType: "application/json; charset=utf-8",
					dataType: "json",
					async: true,
					success: function (data) {	
						if(data.ConsultaResumenImprimirEmpleadoResult){
							if(data.ConsultaResumenImprimirEmpleadoResult.WithError){
								alert(data.ConsultaResumenImprimirEmpleadoResult.ErrorMsg);
							} else {
								if(data.ConsultaResumenImprimirEmpleadoResult){
									var obj = data.ConsultaResumenImprimirEmpleadoResult;
									if(obj.TotalTimbrados == 0){
										alert('No hay recibos timbrados');
										hideWait();
										return;
									}
									if(confirm('Total de recibos del periodo: ' + obj.TotalRecibos + ' \nTotal de recibos ya timbrados: ' + obj.TotalTimbrados + ' \nSe generara(n) ' + obj.TotalTimbrados + ' recibo(s) en un solo archivo PDF.')){                                                                           
										hideWait();
                                        var nombrepdf = idRazonSocialImprimir + '|' + idTipoNominaAsigImprimir + '|' + idTipoNominaProcImprimir + '|' + idEmpleadoImprimir + '|' + AnioDesdeImprimir + '|' + AnioHastaImprimir + '|' + PeriodoDesdeImprimir + '|' + PeriodoHastaImprimir + '|' + ListaEmpleados + '|' + userIdImprimir + '|' + IdAtributos;
										$("#progressbar").css("display", "block");
										 $('#progressDialog').dialog({ 
											autoOpen: false, width: 450, resizable: false, modal: true,
											open: function( event, ui ) {
												
												GeneracionArchivosGlobales(nombrepdf);
											} 
										});                            
										$("#progressDialog").css('display', '');
										$("#progressDialog").dialog("open");
										$("#progressDialog").css('width', '93%');
										$("#progressDialog").css('min-height', '100px');
										$("#progressDialog").css('max-height', '100px');
										$("#progressDialog").css('height', '175px');
										$("#progressDialog").closest('div.ui-dialog', '175px').css("height","175px");
																									
									}
								}
							}
						}
						hideWait();
					},
					error: function (xhr, textStatus, e) {	
						alert('Error al imprimir');
					}
				});	
			}

        function GeneracionArchivosGlobales(nombrepdf){				
                var args = {
                    fileName: nombrepdf                   
				}
                jQuery.ajax({
					type: "POST",
					url: "<%=Intelexion.Framework.ApplicationConfiguration.ConfigurationSettings.GetConfigurationSettings("ITXCFDIConnectorPath")%>ITXCFDIConnectorService.svc/GenerarPDFConsultaEmpleado",
					data: JSON.stringify(args),
					contentType: "application/json; charset=utf-8",
					dataType: "json",
					async: true,
					success: function (data) {
                        $("#progressDialog").dialog("close");
                        var Contiene = data.GenerarPDFConsultaEmpleadoResult;
                        if (data.GenerarPDFConsultaEmpleadoResult == "" || Contiene.includes('-')) {
                            var Liga = data.GenerarPDFConsultaEmpleadoResult;
                           
                                document.location.href = '<%=Intelexion.Framework.ApplicationConfiguration.ConfigurationSettings.GetConfigurationSettings("ITXCFDIConnectorPath")%>ITXCFDIConnectorService.svc/ObtenerArchivos/' + Liga;
                            
                        } else {
                            alert(data.GenerarPDFConsultaEmpleadoResult);
                        }
                        
					},
					error: function (xhr, textStatus, e) {						
                         $("#progressDialog").dialog("close");
						alert('Error al consultar el recibo PDF');
					}
				});
            }

            function ResumenGenerarXls(fileName){
			    var liga = "<%=Intelexion.Framework.ApplicationConfiguration.ConfigurationSettings.GetConfigurationSettings("ITXCFDIConnectorPath")%>ITXCFDIConnectorService.svc/ConsultaXLSFile/"+fileName ;
			    showWait();
			    window.location=liga;
			    hideWait();
			}
		

			function ResumenEnvioCorreo(idRazonSocialEnviar, idTipoNominaAsigEnviar, idTipoNominaProcEnviar, idEmpleadoEnviar, AnioDesdeEnviar, AnioHastaEnviar, PeriodoDesdeEnviar, PeriodoHastaEnviar,ListaEmpleados, userIdEnviar, IdAtributos){	
				var args = {
					IdRazonSocial: parseInt(idRazonSocialEnviar), 
					IdTipoNominaAsig: idTipoNominaAsigEnviar, 
					IdTipoNominaProc: idTipoNominaProcEnviar, 
					IdEmpleado: idEmpleadoEnviar, 
					AnioDesde: parseInt(AnioDesdeEnviar), 
					AnioHasta: parseInt(AnioHastaEnviar),
					PeriodoDesde: parseInt(PeriodoDesdeEnviar), 
					PeriodoHasta: parseInt(PeriodoHastaEnviar),
					listaEmpleados: ListaEmpleados,
					UserId: userIdEnviar,
					IdAtributos:IdAtributos
					
				}	
				showWait();
				jQuery.ajax({
					type: "POST",
					url: "<%=Intelexion.Framework.ApplicationConfiguration.ConfigurationSettings.GetConfigurationSettings("ITXCFDIConnectorPath")%>ITXCFDIConnectorService.svc/ConsultaResumenEnvioCorreoEmpleado",
					data: JSON.stringify(args),
					contentType: "application/json; charset=utf-8",
					dataType: "json",
					async: true,
					success: function (data) {	
						if(data.ConsultaResumenEnvioCorreoEmpleadoResult){
							if(data.ConsultaResumenEnvioCorreoEmpleadoResult.WithError){
								alert(data.ConsultaResumenEnvioCorreoEmpleadoResult.ErrorMsg);
							} else {
								if(data.ConsultaResumenEnvioCorreoEmpleadoResult){
									var obj = data.ConsultaResumenEnvioCorreoEmpleadoResult;
									if(obj.TotalConCorreo == 0){
										alert('No hay empleados con correo electrnico configurado');
										hideWait();
										return;
									}
                                    if (confirm('Total de recibos del periodo: ' + obj.TotalRecibos + ' \nTotal de recibos ya timbrados: ' + obj.TotalTimbrados + ' \nTotal de empleados con correo electronico: ' + obj.TotalConCorreo + ' \nSe enviar la informacin por correo a ' + obj.TotalConCorreo + ' empleado(s).')) {
                                        var args = {
                                            IdRazonSocial: parseInt(idRazonSocialEnviar),
                                            IdTipoNominaAsig: idTipoNominaAsigEnviar,
                                            IdTipoNominaProc: idTipoNominaProcEnviar,
                                            IdEmpleado: idEmpleadoEnviar,
                                            AnioDesde: parseInt(AnioDesdeEnviar),
                                            AnioHasta: parseInt(AnioHastaEnviar),
                                            PeriodoDesde: parseInt(PeriodoDesdeEnviar),
                                            PeriodoHasta: parseInt(PeriodoHastaEnviar),
                                            listaEmpleados: ListaEmpleados,
                                            UserId: userIdEnviar,
                                            IdAtributos: IdAtributos
                                        }
                                        jQuery.ajax({
                                            type: "POST",
                                            url: "<%=Intelexion.Framework.ApplicationConfiguration.ConfigurationSettings.GetConfigurationSettings("ITXCFDIConnectorPath")%>ITXCFDIConnectorService.svc/SendMailConsultaFullEmpleado",
                                            data: JSON.stringify(args),
                                            contentType: "application/json; charset=utf-8",
                                            dataType: "json",
                                            async: true,
                                            success: function (data) {
                                                hideWait();
                                            },
                                            error: function (xhr, textStatus, e) {
                                                hideWait();
                                                alert('Error Datos unitarios');
                                            }
                                        });
                                    }
                                    else {hideWait();}
								}
							}
						}
						//hideWait();
					},
					error: function (xhr, textStatus, e) {
						alert('Error en envio de correo');
						hideWait();
					}
				});	
			}
			
            

			function VentanaErrores(IdEmpleado, FolioFiscal) {
				width = 450;
				title = 'Errores en el proceso de timbrado';
				var dialogName = 'dlg' + getNewUniqueId();
				var strHTML = "";
				var curYear = new Date().getFullYear();

				strHTML += "<div id='" + dialogName + "'>";
				strHTML += '<form id="dialogForm' + dialogName + '" action="#">';
				strHTML += '<div>';
				
                if(FolioFiscal){
                    if(FolioFiscal.length > 0){
                        var obj = historial["obj_" + IdEmpleado].ListaCancelacion.Items;
                        for(var x = 0; x < obj.length; x++){
                            if(obj[x].FolioFiscal == FolioFiscal){
                                strHTML += '<p>' + obj[x].MensajeCancelacion + '</p>';
                            }
                        }
                    }
                } else {
				    strHTML += '<p>' + fullData["error_" + IdEmpleado] + '</p>';
                }
				
				strHTML += '</div>';
				strHTML += "<div class='botonArea'>";
				strHTML += '<input type="button" class="boton boton-cancel" id="btnCancel' + dialogName + '" value="Cerrar" />';
				strHTML += "</div>";			
				strHTML += "</form>";
				strHTML += "</div>";

				$("#modalDialogArea").append(strHTML);
				//$('#btnCancel' + dialogName + '').wrap("<span class='boton-wrap-left'><span class='boton-wrap-right'></span></span>");
				$("#" + dialogName).dialog({
					modal: true,
					title: title,
					width: width,
					autoOpen: false,
					resizable: false
				});
				$("#" + dialogName).dialog('open');
                $("#" + dialogName).css('display', 'block');
                $("#" + dialogName).css('width', '94%');
                $("#" + dialogName).css('min-height', '100px');
                $("#" + dialogName).css('height', 'auto');
                $("#" + dialogName).closest('div.ui-dialog', 'auto').css("height", "auto");
				$("#btnCancel" + dialogName).click(function () {
					CancelarDialog("#" + dialogName);					
				});
			}

			function CancelarDialog(id) {
				$(id).dialog('close');
			}
			
			var cur_uniqueId = (new Date()).getTime()
			function getNewUniqueId() {
				return cur_uniqueId++;
			}
		
            function VentanaHistorial(emp){
                var obj = historial["obj_" + emp].ListaCancelacion.Items;
				width = 850;
				height = 110;
				title = 'Historial de cancelacin';
				var dialogName = 'dlg' + getNewUniqueId();
				var strHTML = "";
				var curYear = new Date().getFullYear();

				strHTML += "<div id='" + dialogName + "'>";
				strHTML += '<form id="dialogForm' + dialogName + '" action="#">';
				strHTML += '<div>';
				strHTML += '<div class="clearfix"></div>';
				strHTML += '<div class="anthemscroller anthemscroller' + dialogName + '" style="width: 750px;">';
                strHTML += '<div>';
                strHTML += '<table cellspacing="0" rules="all" border="1" style="border-collapse:collapse; width: 750px;">';
                strHTML += '<tbody>';
                strHTML += '<tr><td class="headerTabla">Factura Id</td><td class="headerTabla">Folio fiscal</td><td class="headerTabla">Estatus cancelacin</td><td class="headerTabla">XML</td></tr>';

                for(var x = 0; x < obj.length; x++){
                    strHTML += '<tr>';
                    
                    strHTML += '<td>';
                    strHTML += '<div style="text-align:center;">' + obj[x].FacturaId + '</div>';
                    strHTML += '</td>';
                    
                    strHTML += '<td>';
                    strHTML += '<div style="text-align:center;">' + obj[x].FolioFiscal + '</div>';
                    strHTML += '</td>';

                    strHTML += '<td>';
                    switch(obj[x].EstatusCancelacion){
                        case '0':
                            strHTML += '<div style="text-align:center;">Por cancelar</div>';
                            break;
                        case '1':
                            strHTML += '<div style="text-align:center;">En proceso</div>';
                            break;
                        case '2':
                            strHTML += '<div style="text-align:center;">Cancelado</div>';
                            break;
                        case '3':
                            strHTML += '<div style="text-align:center;"><a href="javascript: VentanaErrores(\'' + obj[x].IdEmpleado +obj[x].Anio + obj[x].Periodo + '\', \'' + obj[x].FolioFiscal + '\')">Con error</a></div>';
                            break;
                        default:
                            strHTML += '<div></div>';
                            break;
                    }                    
                    strHTML += '</td>';

                    strHTML += '<td>';
                    if(obj[x].XMLCancelacion.length > 0){                    
                        var params = obj[x].IdRazonSocial + '|' + obj[x].RFC + '|' + obj[x].IdTipoNominaAsig + '|' + obj[x].IdTipoNominaProc + '|' + obj[x].Anio + '|' + obj[x].Periodo + '|' + obj[x].IdEmpleado + '|' + obj[x].FolioFiscal;
                        strHTML += '<div style="text-align:center;"><a href="<%=Intelexion.Framework.ApplicationConfiguration.ConfigurationSettings.GetConfigurationSettings("ITXCFDIConnectorPath")%>ITXCFDIConnectorService.svc/XMLCancelacion/' + params + '">xml</a></div>';
                    }                    
                    strHTML += '</td>';                    
                    strHTML += '</tr>';
                }

                strHTML += '</tbody>';
                strHTML += '</table>';
                strHTML += '</div>'; // content
                strHTML += '</div>'; // listbox-full-width listbox

				
				strHTML += '</div>';
				strHTML += "<div class='botonArea'>";
				strHTML += '<input type="button" class="boton boton-cancel" id="btnCancel' + dialogName + '" value="Cerrar" />';
				strHTML += "</div>";			
				strHTML += "</form>";
				strHTML += "</div>";

				$("#modalDialogArea").append(strHTML);
				$('#btnCancel' + dialogName + '').wrap("<span class='boton-wrap-left'><span class='boton-wrap-right'></span></span>");
				$("#" + dialogName).dialog({
					modal: true,
					title: title,
					width: width,
					height: height,
					autoOpen: false,
					resizable: false
				});
				$("#" + dialogName).dialog('open');
                $('#' + dialogName).closest('div').css('height', $('#' + dialogName).closest('div').height() + $('.anthemscroller' + dialogName).height());

				$("#btnCancel" + dialogName).click(function () {
					CancelarDialog("#" + dialogName);					
				});
            }
                       
		    function NombreEmpleado(ctrlTxtNumeroEmpleado, ctrlLblNombreEmpleado) {
		        if (ctrlTxtNumeroEmpleado.value != "") {
					var objTopXmlDoc;
					var empleado;
                    var idRazonSocial = $('#IdRazonSocial').val();
				    var existe;
				    existe=false;
					 var oXml; 
                    if (idRazonSocial == '') {
	                      idRazonSocial = 0
	                }
                                  
            	    var path = '<%=Intelexion.Framework.ApplicationConfiguration.ConfigurationSettings.GetConfigurationSettings("ApplicationPath")%>/Nomina/Empleado/NombreEmpleado/NombreEmpleado.process?IdEmpleado=' + ctrlTxtNumeroEmpleado.value + '&IdRazonSocial=' + idRazonSocial;
		            objTopXmlDoc = new XMLHttpRequest();
		            objTopXmlDoc.open("GET", path, false);
		            objTopXmlDoc.setRequestHeader('Content-Type', 'text/xml');
		            objTopXmlDoc.send("");

                    if (objTopXmlDoc.responseXML != "") {
                        objTopXmlDoc = objTopXmlDoc.responseXML;
                         empleado = objTopXmlDoc.selectSingleNode("//Empleado");
                    }
					
	                if (empleado) {
	                    if (empleado.getAttribute("Nombre") == '') {
	                        alert('<%=Intelexion.Framework.SystemLabels.SystemLabels.getValueById(1401, Context.Session("LID"))%>');
	                        ctrlTxtNumeroEmpleado.value = "";
	                        ctrlLblNombreEmpleado.value = "";
	                        ctrlTxtNumeroEmpleado.focus();
	                    }
	                    else {
	                    ctrlLblNombreEmpleado.value = empleado.getAttribute("Nombre");
						 
						 for (i = 1; i < gridEmpleados.rows.length; i++)
				             if (gridEmpleados.rows[i].cells[0].innerText == ctrlTxtNumeroEmpleado.value)
				                {
					                existe = true;
					                break;
				                }
						if (existe == false)
				           {
								$(gridEmpleados).append("<tr><td>" + ctrlTxtNumeroEmpleado.value + "</td><td>" + empleado.getAttribute("Nombre") + "</td><td><i class='material-icons md-dark botondatagrid' ID='borrar' style='cursor:pointer;' onclick='Borrar(this);'>delete</i></td></tr>");
								$(gridEmpleados).find("tbody tr:odd").removeClass().addClass("RenglonNoSel"); // filas impares
								$(gridEmpleados).find("tbody tr:even").removeClass().addClass("RenglonNoSelAlt"); // filas pares    			      
								$(gridEmpleados).find(" tbody tr:last td img").wrap("<span class='boton-wrap-left'><span class='boton-wrap-right'></span></span>");
							}
							limpiarTextBoxPopup();  
						}
	                }
		        }
		    }	
		
		    
	        
	        
	        function limpiarTextBoxPopup() 
			{
		        $('#IdEmpleado').val('');
		        $('#Nombre').val('');
		    }	
	         
      </script>

    <div id="modalDialogArea" style="display: none;">
    </div>
</body>
</html>
