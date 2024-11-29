<%@ Register TagPrefix="cc1" Namespace="Intelexion.Framework.View.UI.Controles" Assembly="Intelexion.Framework.View.UI.Controles" %>
<%@ Register TagPrefix="anthem" Namespace="Anthem" Assembly="Anthem" %>
<%@ Register TagPrefix="org" Namespace="Intelexion.Organizacion" Assembly="Intelexion.Organizacion" %>
<html>
	<head>
		<title>Timbrado de recibos de nómina</title>
		<meta content="Microsoft Visual Studio.NET 7.0" name="GENERATOR" />
		<meta content="Visual Basic 7.0" name="CODE_LANGUAGE" />
		<meta content="JavaScript" name="vs_defaultClientScript" />
		<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge">

		<link href='<%=Intelexion.Framework.ApplicationConfiguration.ConfigurationSettings.GetConfigurationSettings("ApplicationPath")%>/intelexion.css' type="text/css" rel="stylesheet" />
		<link href='<%=Intelexion.Framework.ApplicationConfiguration.ConfigurationSettings.GetConfigurationSettings("ApplicationPath")%>/jqueryTimbrado.dataTables.css' type="text/css" rel="stylesheet" />
		<link href='<%=Intelexion.Framework.ApplicationConfiguration.ConfigurationSettings.GetConfigurationSettings("ApplicationPath")%>/jquery-ui-itx.css' type="text/css" rel="stylesheet" />
		<link href='<%=Intelexion.Framework.ApplicationConfiguration.ConfigurationSettings.GetConfigurationSettings("ApplicationPath") + "/CSS/50/filtroAtributos.css"%>'
        type='text/css' rel='stylesheet' />
		<script language="javascript" type="text/javascript">
			var path;
			var usarVista5;
			path = '<%=Intelexion.Framework.ApplicationConfiguration.ConfigurationSettings.GetConfigurationSettings("ApplicationPath")%>'
			usarVista5 = '<%=Intelexion.Framework.ApplicationConfiguration.ConfigurationSettings.GetConfigurationSettings("usarVista5")%>';
		</script>
		<script language="javascript" type="text/javascript" src='<%=Intelexion.Framework.ApplicationConfiguration.ConfigurationSettings.GetConfigurationSettings("PathJS") + "/Validacion.aspx"%>'></script>
		<script language="javascript" type="text/javascript" src='<%=Intelexion.Framework.ApplicationConfiguration.ConfigurationSettings.GetConfigurationSettings("PathJS") + "/JQuery/jquery-1.7.2.min.js"%>'></script>
		<script language="javascript" type="text/javascript" src='<%=Intelexion.Framework.ApplicationConfiguration.ConfigurationSettings.GetConfigurationSettings("PathJS") + "/JQuery/json2.min.js"%>'></script>
		<script language="javascript" type="text/javascript" src='<%=Intelexion.Framework.ApplicationConfiguration.ConfigurationSettings.GetConfigurationSettings("PathJS") + "/JQuery/jquery.glob.js"%>'></script>
		<script language="javascript" type="text/javascript" src='<%=Intelexion.Framework.ApplicationConfiguration.ConfigurationSettings.GetConfigurationSettings("PathJS") + "/JQuery/globinfo/jQuery.glob." + context.Session("LID") + ".min.js"%>'></script>
		<script language="javascript" type="text/javascript" src='<%=Intelexion.Framework.ApplicationConfiguration.ConfigurationSettings.GetConfigurationSettings("PathJS") + "/JQuery/jquery.dataTables.js"%>'></script>
		<script language="javascript" type="text/javascript" src='<%=Intelexion.Framework.ApplicationConfiguration.ConfigurationSettings.GetConfigurationSettings("PathJS") + "/JQuery/localization/jquery.dataTables." + context.Session("LID").toString().replace("-", "_") + ".js"%>'></script>
		<%IF Intelexion.Framework.ApplicationConfiguration.ConfigurationSettings.GetConfigurationSettings("usarVista5") = "1" THEN%>
			<script language="javascript" type="text/javascript" src='<%=Intelexion.Framework.ApplicationConfiguration.ConfigurationSettings.GetConfigurationSettings("PathJS") + "/50/jQueryInclude.js"%>'></script>
		  <%ELSE%>
			<script language="javascript" type="text/javascript" src='<%=Intelexion.Framework.ApplicationConfiguration.ConfigurationSettings.GetConfigurationSettings("PathJS") + "/50/jQueryIncludeV4.js"%>'></script>
		  <%END IF%>		  
	</head>
	<body>
		<form id="Form1" method="post" runat="server">
		<cc1:errordisplay id="ErrorDisplay1" runat="server" Text="No Hay Errores"></cc1:errordisplay>
			<div id="navigation">
				<ul>
					<li idOpcion="50" id="Nav1">
						<%=Intelexion.Framework.SystemLabels.SystemLabels.getValueById(5884,context.Session("LID"))%>
						</li>
					<li idOpcion="89">
						<%=Intelexion.Framework.SystemLabels.SystemLabels.getValueById(5885,context.Session("LID"))%>
						</li>
					<li>
						» Timbrado de recibos de nómina
					</li>
				</ul>
			</div>
			<span id="Header" runat="server">Timbrado de recibos de nómina</span>
			<div class="formArea" id="divFiltros" style="width:auto">
				<table style="width:100%;">
					<tr>
						<td style="vertical-align: top;">
							<div>
							<table>
								<tr>
									<td><label id="lblRazonSocial" for="RazonSocial">Razón social</label></td>
									<td><span class="labelRequerido"><%=Intelexion.Framework.SystemLabels.SystemLabels.getValueById(87,context.Session("LID"))%></span></td>
									<td class="td_combo"><select id="RazonSocial" name="RazonSocial"></select>
									</td>
								</tr>
								<tr>
									<td><label id="lblTipoNominaAsig" for="TipoNominaAsig">Tipo de nómina de asignación</label></td>
									<td><span class="labelRequerido"><%=Intelexion.Framework.SystemLabels.SystemLabels.getValueById(87,context.Session("LID"))%></span></td>
									<td class="td_combo"><select id="TipoNominaAsig" name="TipoNominaAsig"><option value="">Selecciona</option></select>
									</td>
								</tr>
								<tr>
									<td><label id="lblTipoNominaProc" for="TipoNominaProc">Tipo de nómina de proceso</label></td>
									<td><span class="labelRequerido"><%=Intelexion.Framework.SystemLabels.SystemLabels.getValueById(87,context.Session("LID"))%></span></td>
									<td class="td_combo">
										<select id="TipoNominaProc" name="TipoNominaProc"><option value="">Selecciona</option></select>
									</td>
								</tr>
								<tr>
									<td><label id="lblAnio" for="Anio">Año</label></td>
									<td><span class="labelRequerido"><%=Intelexion.Framework.SystemLabels.SystemLabels.getValueById(87,context.Session("LID"))%></span></td>
									<td class="td_combo">
										<select id="Anio" name="Anio"><option value="">Selecciona</option></select>
									</td>
								</tr>
								<tr>
									<td><label id="lblPeriodo" for="Periodo">Periodo</label></td>
									<td><span class="labelRequerido"><%=Intelexion.Framework.SystemLabels.SystemLabels.getValueById(87,context.Session("LID"))%></span></td>
									<td class="td_combo">
										<select id="Periodo" name="Periodo"><option value="">Selecciona</option></select>
									</td>
								</tr>
							</table>
							</div>						
						</td>
						<%If Not Intelexion.Framework.SystemFlags.SystemFlags.getValueById(7336) Is Nothing AndAlso Intelexion.Framework.SystemFlags.SystemFlags.getValueById(7336) = "1" Then%>
						<td style="width: 40%; padding: 0px; vertical-align: top;">
                            <div id="divOpcion7">
                                <Label ID="lblopcion7"><%=Intelexion.Framework.SystemLabels.SystemLabels.getValueById(2192,context.Session("LID"))%>
                                </Label>
                                <org:filtroAtributos ID="attr" runat="server" />
                                
                            </div>
                        </td>
                        <%End If%>
						<td style="padding:0px; vertical-align:top;">
							<div style="float:right;">
								<label id="lblEstatus" style="font-size:14px;font-weight:bold;" ></label>
								<div>
									<table style="float:right;">
										<tr>
											<td><Label  ID="Pendientes">Pendientes:</Label></td>
											<td class="tdContadores" id="tdPendientes">0</td>
										</tr>
										<tr>
											<td ><label id="enproces">En proceso:</label></td>
											<td class="tdContadores" id="tdProceso">0</td>
										</tr>
										<tr>
											<td><Label  ID="Timbra">Timbrados:</Label></td>
											<td class="tdContadores" id="tdTimbrados">0</td>
										</tr>
										<tr>
											<td ><Label  ID="err">Con error:</Label></td>
											<td class="tdContadores" id="tdConError">0</td>
										</tr>
										<tr>
											<td ><Label  ID="tot">TOTAL:</Label></td>
											<td class="tdContadores" id="tdTotal">0</td>
										</tr>
									</table>
								</div>
							</div>						
						</td>
					</tr>
				</table>
				
				<div id="ultimoIntento">
					<table>
						<tr>
							<td><label id="lblUltimoIntento" for="tdUltimoIntento">Último Intento: </label></td>
							<td></td>
							<td id="tdUltimoIntento" style="font-weight: bold;"></td>
						</tr>
					</table>
				</div>

				<div class="botonArea">
					<input class="boton boton-nuevo" id="btnFiltrar" type="button" value='Filtrar'/>
					<input class="boton boton-nuevo" id="btnTimbrar" disabled="disabled" type="button" value='Timbrar'/>
					<input class="boton" id="btnCancelar" type="button" value='Cancelar'/>
				</div>			
			</div>
                <div style="display:none;" id="DialogoPrincipal" >
                <div id="dialogoCuerpo">
	            <div class="progress-label"><%=Intelexion.Framework.SystemLabels.SystemLabels.getValueById(2535, Context.Session("LID"))%></div>	          
                    <div class="preloader"></div> 
                </div>
	            </div>
			<div id="datatable" style="width:116%;"><table cellpadding="0" cellspacing="0" border="0" class="display" id="gridNominas"></table></div>
			<input type="hidden" id="filtroidElementoCategoria" runat="server" name="filtroidElementoCategoria" />
			<input type="hidden" id="EstatusTimbrado" runat="server" name="EstatusTimbrado" />
			<input type="hidden" id="TipoLote" runat="server" name="TipoLote" />

		</form>
		<script type="text/javascript" language="javascript">		
			//jQuery.preferCulture('<%=Context.Session("LID")%>');
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
            var marcados = [];
            var ignorados = [];
			
			var CadenaFoliosCancelacion = [];
			var CadenaXMLCancelacion = [];
			var CadenaFoliosTimbrado = [];
			var CadenaXMLTimbrado = [];
			
            var TipoNominaAsigFiltrado = "";
            var TipoNominaProcFiltrado = "";
			var RazonSocialFiltrado=0;
			var PeriodoFiltrado =0;
            var AnioFiltrado = 0;
            var IdAtributosFiltrados = "";
            var totalFaltantes=0;
            var totalR = 0;	
            var totalTimb = 0;
			var OrigenInf = '<%=context.Request.QueryString("OrigenFilter")%>';
			var ObtenerInfCont = false;
			if(OrigenInf != "")
			  ObtenerInfCont = true;
			  
             var strChkAll = '';
				        strChkAll += '<div id="gridNominas_chkAll" class="dataTables_chkAll" style="float:right;width: 80px;margin-top:8px;">';
				        strChkAll += '<label for="chkAll" class="dt_center" style="float:right;margin: 3px 0px 0px 0px;padding:0px;color:black;font-weight:bold;" >Seleccionar <br/> todos</label><input disabled="disabled"  type="checkbox" id="chkAll" />';
				        strChkAll += '</div>';
			
			$(document).ready(function(){
                jQuery.support.cors = true;
				$('#btnFiltrar').click(function(){
					$('#lblEstatus').text('');
					$('.tdContadores').text('0');			
					$('#tdUltimoIntento').text('');
					clearTimeout(objTime);
					
					var IdRazonSocial = $('#RazonSocial').find('option:selected').val();
					var IdTipoNominaAsig = $('#TipoNominaAsig').find('option:selected').val();
					var IdTipoNominaProc = $('#TipoNominaProc').find('option:selected').val(); 
					var Anio = $('#Anio').find('option:selected').val();
					var Periodo = $('#Periodo').find('option:selected').val();
					var IdAtributos =   $('#filtroidElementoCategoria').val() ;
					
					<%If Not Intelexion.Framework.SystemFlags.SystemFlags.getValueById(8326) Is Nothing AndAlso Intelexion.Framework.SystemFlags.SystemFlags.getValueById(8326) = "4.0" Then%>
					ConsultaEstatus(IdRazonSocial, IdTipoNominaAsig, IdTipoNominaProc, Anio, Periodo, '', IdAtributos);
					<%ElseIf Not Intelexion.Framework.SystemFlags.SystemFlags.getValueById(8326) Is Nothing AndAlso Intelexion.Framework.SystemFlags.SystemFlags.getValueById(8326) = "3.3" Then%>
					ConsultaEstatus(IdRazonSocial, IdTipoNominaAsig, IdTipoNominaProc, Anio, Periodo, '', IdAtributos);
					<%Else%>
					Filtrar(IdRazonSocial, IdTipoNominaAsig, IdTipoNominaProc, Anio, Periodo, '', IdAtributos);
					<%End If%>
				});
				$('#btnTimbrar').click(function(){
					<%If Not Intelexion.Framework.SystemFlags.SystemFlags.getValueById(8326) Is Nothing AndAlso Intelexion.Framework.SystemFlags.SystemFlags.getValueById(8326) = "4.0" Then%>
					var IdRazonSocial = $('#RazonSocial').find('option:selected').val();
					var IdTipoNominaAsig = $('#TipoNominaAsig').find('option:selected').val();
					var IdTipoNominaProc = $('#TipoNominaProc').find('option:selected').val(); 
					var Anio = $('#Anio').find('option:selected').val();
					var Periodo = $('#Periodo').find('option:selected').val();
					var IdAtributos =   $('#filtroidElementoCategoria').val() ;
					TimbrarDirecto(IdRazonSocial, IdTipoNominaAsig, IdTipoNominaProc, Anio, Periodo, IdAtributos);
					<%ElseIf Not Intelexion.Framework.SystemFlags.SystemFlags.getValueById(8326) Is Nothing AndAlso Intelexion.Framework.SystemFlags.SystemFlags.getValueById(8326) = "3.3" Then%>
					var IdRazonSocial = $('#RazonSocial').find('option:selected').val();
					var IdTipoNominaAsig = $('#TipoNominaAsig').find('option:selected').val();
					var IdTipoNominaProc = $('#TipoNominaProc').find('option:selected').val(); 
					var Anio = $('#Anio').find('option:selected').val();
					var Periodo = $('#Periodo').find('option:selected').val();
					var IdAtributos =   $('#filtroidElementoCategoria').val() ;
					TimbrarDirecto(IdRazonSocial, IdTipoNominaAsig, IdTipoNominaProc, Anio, Periodo, IdAtributos);
					<%Else%>
					ValidaCertificado();					
					<%End If%>
				});
				$('#btnCancelar').click(function(){
					ObtenerInfCont = false;
					Cancelar();
				});
				cargarRazonesSociales();
				
			});
			function Cancelar(){
				$('#TipoNominaAsig, #TipoNominaProc, #Anio, #Periodo').html('<option value="">Selecciona</option>');
				CadenaFoliosCancelacion = [];
				CadenaXMLCancelacion = [];
				CadenaFoliosTimbrado = [];
				CadenaXMLTimbrado = [];
				//limpiar control de filtro atributos
                if (usarVista5=='1'){
				    fnAttr_ResetFiltroAtributos();
				    $('#txtFiltroAutocomplete').val('');	    				    
				}
				$('#filtroidElementoCategoria').val('');				
				<%If Not Intelexion.Framework.SystemFlags.SystemFlags.getValueById(7336) Is Nothing AndAlso Intelexion.Framework.SystemFlags.SystemFlags.getValueById(7336) = "1" Then%>
                $("#filtroAtributos")[0].selectedIndex = -1;
				<%End If %>
                $('#elems').html('')
				$('#lblEstatus').text('');
				$('.tdContadores').text('0');
				$('#tdUltimoIntento').text('');
				if(tablaCreada == 1){
					tablaCreada = 0;
					$('#gridNominas').dataTable().fnDestroy();
					$('#gridNominas').empty();
				}				
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
            data: JSON.stringify({ userId: "123", languageId: "1" }), // Valores de ejemplo
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (response) {
                $('#IdRazonSocial').empty();
                
                // La respuesta está en response.d, que es una cadena JSON, así que hacemos una doble deserialización
                var data = JSON.parse(response.d);

                // Agrega la opción predeterminada
                var str = '<option value="" attr-rfc="">Selecciona</option>';

                // Procesa los datos JSON y los agrega al combo box
                data.forEach(function (item) {
                    var rfc = item.RFCRazonSocial.replace('-', '');
                    str += '<option value="' + item.IdRazonSocial + '" attr-rfc="' + rfc + '">' + item.DescripcionRazonSocial + ' (' + item.IdRazonSocial + ')</option>';
                });

                $('#IdRazonSocial').append(str);
            },
            error: function (xhr, textStatus, errorThrown) {
                console.error("Error en la llamada AJAX:", textStatus, errorThrown);
                console.log(xhr.responseText);
            }
        });

                hideWait();
            }			
			
			function ConsultaRazones(){
				var args = {
					userId: '<%=Context.Session("UID").replace("\", "\\")%>',
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
						$('#RazonSocial').empty();
						var str = '<option value="" attr-rfc="">Selecciona</option>';
						if(data.ConsultaRazonSocialResult){
							if(data.ConsultaRazonSocialResult.WithError){
								alert(data.ConsultaRazonSocialResult.ErrorMsg);
							} else {
								if(data.ConsultaRazonSocialResult.Items.length > 0){
									for(var x= 0; x < data.ConsultaRazonSocialResult.Items.length; x++){
										var obj = data.ConsultaRazonSocialResult.Items[x];
										var rfc = obj.RFCRazonSocial.toString().replace('-','');
										if(obj.IdRazonSocial == '<%=context.Request.QueryString("rs")%>' && ObtenerInfCont){
										str += '<option selected value="' + obj.IdRazonSocial + '" attr-rfc="' + rfc + '">' + obj.DescripcionRazonSocial + ' (' + obj.IdRazonSocial + ')</option>';
										}
										else{
										str += '<option value="' + obj.IdRazonSocial + '" attr-rfc="' + rfc + '">' + obj.DescripcionRazonSocial + ' (' + obj.IdRazonSocial + ')</option>';
										}
									}									
								}
							}
						}
						$('#RazonSocial').append(str).change(function(){
							ObtenerInfCont = false;
							$('#btnTimbrar').attr('disabled', true);
							$('#TipoNominaAsig, #TipoNominaProc, #Anio, #Periodo').html('<option value="">Selecciona</option>');
							if($(this).find('option:selected').val() != ''){								
								ConsultaTipoNominaAsig($(this).find('option:selected').val());
								ConsultaTipoNominaProc($(this).find('option:selected').val());
							}
						});
						hideWait();
						if('<%=context.Request.QueryString("rs")%>' != "" && ObtenerInfCont)
						  ConsultaTipoNominaAsig('<%=context.Request.QueryString("rs")%>');
					},
					error: function (xhr, textStatus, e) {
						//default error handler para funciones de AJAX
						//AjaxErrorHandler(xhr, textStatus, e);
						hideWait();
						alert('Error al consultar las razones sociales');
					}
				});	
			}
			function ConsultaTipoNominaAsig(idRazonSocial){
				var args = {
					IdRazonSocial: idRazonSocial,
					userId: '<%=Context.Session("UID").replace("\", "\\")%>',
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
						$('#TipoNominaAsig').empty();
						var str = '<option value="">Selecciona</option>';
						if(data.ConsultaTiposNominaResult){
							if(data.ConsultaTiposNominaResult.WithError){
								alert(data.ConsultaTiposNominaResult.ErrorMsg);
							} else {
								if(data.ConsultaTiposNominaResult.Items.length > 0){
									for(var x= 0; x < data.ConsultaTiposNominaResult.Items.length; x++){
										var obj = data.ConsultaTiposNominaResult.Items[x];										
										if(obj.IdTipoNomina == '<%=context.Request.QueryString("na")%>' && ObtenerInfCont)
										str += '<option selected value="' + obj.IdTipoNomina + '">' + obj.IdTipoNomina + ' - ' + obj.Descripcion + '</option>';
										else
										str += '<option value="' + obj.IdTipoNomina + '">' + obj.IdTipoNomina + ' - ' + obj.Descripcion + '</option>';
									}									
								}							
							}
						}

						$('#TipoNominaAsig').append(str).change(function(){
							ObtenerInfCont = false;
							$('#btnTimbrar').attr('disabled', true);
							$('#TipoNominaProc').find('option[value="' + $(this).find('option:selected').val() + '"]').attr('selected', true);
							$('#Anio, #Periodo').html('<option value="">Selecciona</option>');
							if($('#TipoNominaProc').find('option:selected').val() != '' && $('#TipoNominaAsig').find('option:selected').val() != ''){
								ConsultaAnios();
							}
						});
						hideWait();
						if('<%=context.Request.QueryString("rs")%>' != "" && ObtenerInfCont)
						ConsultaTipoNominaProc('<%=context.Request.QueryString("rs")%>')
					},
					error: function (xhr, textStatus, e) {
						//default error handler para funciones de AJAX
						//AjaxErrorHandler(xhr, textStatus, e);
						hideWait();
						alert('Error al consultar los tipos de nomina');
					}
				});	
			}
			function ConsultaTipoNominaProc(idRazonSocial){
				var args = {
					IdRazonSocial: idRazonSocial,
					userId: '<%=Context.Session("UID").replace("\", "\\")%>',
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
						$('#TipoNominaProc').empty();
						var str = '<option value="">Selecciona</option>';
						if(data.ConsultaTiposNominaResult){
							if(data.ConsultaTiposNominaResult.WithError){
								alert(data.ConsultaTiposNominaResult.ErrorMsg);
							} else {
								if(data.ConsultaTiposNominaResult.Items.length > 0){
									for(var x= 0; x < data.ConsultaTiposNominaResult.Items.length; x++){
										var obj = data.ConsultaTiposNominaResult.Items[x];
										if(obj.IdTipoNomina == '<%=context.Request.QueryString("np")%>' && ObtenerInfCont)
										str += '<option selected value="' + obj.IdTipoNomina + '">' + obj.IdTipoNomina + ' - ' + obj.Descripcion + '</option>';
										else
										str += '<option value="' + obj.IdTipoNomina + '">' + obj.IdTipoNomina + ' - ' + obj.Descripcion + '</option>';
									}									
								}
							}
						}

						$('#TipoNominaProc').append(str).change(function(){
							ObtenerInfCont = false;
							$('#btnTimbrar').attr('disabled', true);
							$('#Anio, #Periodo').html('<option value="">Selecciona</option>');
							if($(this).find('option:selected').val() != '' && $('#TipoNominaAsig').find('option:selected').val() != ''){
								ConsultaAnios();
							}
						});
						hideWait();
						if('<%=context.Request.QueryString("Year")%>' != "" && ObtenerInfCont)
						   ConsultaAnios();
					},
					error: function (xhr, textStatus, e) {
						//default error handler para funciones de AJAX
						//AjaxErrorHandler(xhr, textStatus, e);
						hideWait();
						alert('Error al consultar los tipos de nomina');
					}
				});	
			}
			function ConsultaAnios(){
				var args = {
					IdRazonSocial: $('#RazonSocial').find('option:selected').val(), 
					IdTipoNominaProc: $('#TipoNominaProc').find('option:selected').val(), 
					IdTipoNominaAsig: $('#TipoNominaAsig').find('option:selected').val()
				}
				
				showWait();
				jQuery.ajax({
					type: "POST",
					url: "<%=Intelexion.Framework.ApplicationConfiguration.ConfigurationSettings.GetConfigurationSettings("ITXCFDIConnectorPath")%>ITXCFDIConnectorService.svc/ConsultaAniosParaTimbrado",
					data: JSON.stringify(args),
					contentType: "application/json; charset=utf-8",
					dataType: "json",
					async: true,
					success: function (data) {
						$('#Periodo').html('<option value="">Selecciona</option>');
						$('#Anio').empty();
						var str = '<option value="">Selecciona</option>';
						if(data.ConsultaAniosParaTimbradoResult){
							if(data.ConsultaAniosParaTimbradoResult.WithError){
								alert(data.ConsultaAniosParaTimbradoResult.ErrorMsg);
							} else {
								if(data.ConsultaAniosParaTimbradoResult.Items.length > 0){
									for(var x= 0; x < data.ConsultaAniosParaTimbradoResult.Items.length; x++){
									
										var obj = data.ConsultaAniosParaTimbradoResult.Items[x];
										if(obj.AnioPeriodo == '<%=context.Request.QueryString("Year")%>' && ObtenerInfCont)
										str += '<option selected value="' + obj.AnioPeriodo + '">' + obj.AnioPeriodo + '</option>';
										else
										str += '<option value="' + obj.AnioPeriodo + '">' + obj.AnioPeriodo + '</option>';
									}
									
								}
							}
						}
						$('#Anio').append(str).change(function(){
							ObtenerInfCont = false;
							$('#btnTimbrar').attr('disabled', true);
							$('#Periodo').html('<option value="">Selecciona</option>');
							if($(this).find('option:selected').val() != ''){
								ConsultaPeriodos($(this).find('option:selected').val());
							}
						});
						hideWait();
						if('<%=context.Request.QueryString("Year")%>' !="" && ObtenerInfCont)
						ConsultaPeriodos('<%=context.Request.QueryString("Year")%>');
					},
					error: function (xhr, textStatus, e) {
						//default error handler para funciones de AJAX
						//AjaxErrorHandler(xhr, textStatus, e);
						hideWait();
						alert('Error al consultar los años');
					}
				});	
			}
			function ConsultaPeriodos(Anio){
				var args = {
					IdRazonSocial: $('#RazonSocial').find('option:selected').val(), 
					IdTipoNominaProc: $('#TipoNominaProc').find('option:selected').val(),
					IdTipoNominaAsig: $('#TipoNominaAsig').find('option:selected').val(),
					Anio: Anio
				}
				showWait();
				jQuery.ajax({
					type: "POST",
					url: "<%=Intelexion.Framework.ApplicationConfiguration.ConfigurationSettings.GetConfigurationSettings("ITXCFDIConnectorPath")%>ITXCFDIConnectorService.svc/ConsultaPeriodosParaTimbrado",
					data: JSON.stringify(args),
					contentType: "application/json; charset=utf-8",
					dataType: "json",
					async: true,
					success: function (data) {
						$('#Periodo').empty();
						var str = '<option value="">Selecciona</option>';
						if(data.ConsultaPeriodosParaTimbradoResult){
							if(data.ConsultaPeriodosParaTimbradoResult.WithError){
								alert(data.ConsultaPeriodosParaTimbradoResult.ErrorMsg);
							} else {
								if(data.ConsultaPeriodosParaTimbradoResult.Items.length > 0){							
								
									for(var x= 0; x < data.ConsultaPeriodosParaTimbradoResult.Items.length; x++){
										var obj = data.ConsultaPeriodosParaTimbradoResult.Items[x];
										if(obj.Periodo == '<%=context.Request.QueryString("Per")%>' && ObtenerInfCont)
										str += '<option selected value="' + obj.Periodo + '">' + obj.Periodo + ' - ' + obj.FechaInicioFormato + ' - ' + obj.FechaFinFormato + '</option>';
										else
										str += '<option value="' + obj.Periodo + '">' + obj.Periodo + ' - ' + obj.FechaInicioFormato + ' - ' + obj.FechaFinFormato + '</option>';
									}
								}
							}
						}
						$('#Periodo').append(str).change(function(){
							$('#btnTimbrar').attr('disabled', true);
						});
						hideWait();
						if(ObtenerInfCont)
						ConsultaEstatus('<%=context.Request.QueryString("rs")%>', '<%=context.Request.QueryString("na")%>', '<%=context.Request.QueryString("np")%>','<%=context.Request.QueryString("Year")%>','<%=context.Request.QueryString("Per")%>', "", "")
					},
					error: function (xhr, textStatus, e) {
						//default error handler para funciones de AJAX
						//AjaxErrorHandler(xhr, textStatus, e);
						hideWait();
						alert('Error al consultar los periodos');
					}
				});	
			}
			function ValidaCertificado(){
				
				if($('#RazonSocial').val() == '' || $('#TipoNominaAsig').val() == '' || $('#TipoNominaProc').val() == '' || $('#Anio').val() == '' || $('#Periodo').val() == ''){
					alert('Todos los campos son obligatorios');
					hideWait();
					return;				
				}				
				
				var args = {
					RFC: $('#RazonSocial').find('option:selected').attr('attr-rfc'),
					UserId: '<%=Context.Session("UID").replace("\", "\\")%>'
				}
				showWait();
				jQuery.ajax({
					type: "POST",
					url: "<%=Intelexion.Framework.ApplicationConfiguration.ConfigurationSettings.GetConfigurationSettings("ITXCFDIConnectorPath")%>ITXCFDIConnectorService.svc/ValidaCertificado",
					data: JSON.stringify(args),
					contentType: "application/json; charset=utf-8",
					dataType: "json",
					async: true,
					success: function (data) {
						if(data.ValidaCertificadoResult){
							if(data.ValidaCertificadoResult.Error.WithErrors){
								alert(data.ValidaCertificadoResult.Error.MsgError);
								hideWait();
							} else {								
								var obj = data.ValidaCertificadoResult;
								hideWait();
								if(obj.Error.WithErrors){
									VentanaSinCertificado();
								} else {
									VentanaConCertificado(obj.CertName, obj.InitDate, obj.EndDate);
								}				
							}
						} else {
							alert('	No se pudo establecer comunicación con el servicio de timbrado. Una de las posibles causas es que no cuentas con un certificado de sello digital válido o los datos de acceso son incorrectos. Favor de contactar a tu administrador');
							hideWait();
						}
					},
					error: function (xhr, textStatus, e) {
						//default error handler para funciones de AJAX
						hideWait();
						//AjaxErrorHandler(xhr, textStatus, e);
						alert('Error al validar elcertificado');
					}
				});
			}
			function Timbrar(pass, dialogName){
				CancelarDialog("#" + dialogName);			
				if($('#RazonSocial').val() == '' || $('#TipoNominaAsig').val() == '' || $('#TipoNominaProc').val() == '' || $('#Anio').val() == '' || $('#Periodo').val() == ''){
					alert('Todos los campos son obligatorios');
					hideWait();
					return;				
                }

                if($('#chkAll').is(':checked')){
                    if(ignorados.length == totalR){
                        alert('Debes seleccionar por lo menos un registro para enviar a timbrar');
                        return;
                    }
                } else {
                    if(marcados.length < 1){
                        alert('Debes seleccionar por lo menos un registro para enviar a timbrar');
                        return;
                    }
                }		
				var args = {
					Password: pass,
					IdRazonSocial: $('#RazonSocial').find('option:selected').val(), 
					IdTipoNominaAsig: $('#TipoNominaAsig').find('option:selected').val(), 
					IdTipoNominaProc: $('#TipoNominaProc').find('option:selected').val(), 
					Anio: $('#Anio').find('option:selected').val(), 
					Periodo: $('#Periodo').find('option:selected').val(),
					UserId: '<%=Context.Session("UID").replace("\", "\\")%>',
                    languageId: '<%=Context.Session("LID")%>',
                    cadenaEmpleados: marcados,
					cadenaIgnorados: ignorados,
                    checkAll: $('#chkAll').is(':checked'),
					IdAtributos: $('#filtroidElementoCategoria').val()
				}
				showWait();
				jQuery.ajax({
					type: "POST",
					url: "<%=Intelexion.Framework.ApplicationConfiguration.ConfigurationSettings.GetConfigurationSettings("ITXCFDIConnectorPath")%>ITXCFDIConnectorService.svc/Timbrado",
					data: JSON.stringify(args),
					contentType: "application/json; charset=utf-8",
					dataType: "json",
					async: true,
					success: function (data) {
						if(data.TimbradoResult){
							if(data.TimbradoResult.WithError){
								alert(data.TimbradoResult.ErrorMsg);
							} else {								
								if(data.TimbradoResult.Mensaje != ''){
									alert(data.TimbradoResult.Mensaje);
								}else{
									$('#btnTimbrar').attr('disabled', true);
									clearTimeout(objTime);
									var idT = data.TimbradoResult.IdTransaction;
									var idR = idT.split('-')[0];
									var idA = idT.split('-')[1];
									var idP = idT.split('-')[2];
									var Pe = idT.split('-')[3];
									var An = idT.split('-')[4];
									var Sts = ($('#gridNominas_status select').length > 0) ? $('#gridNominas_status select').find('option:selected').val() : '';
									var IdAt = $('#filtroidElementoCategoria').val();
									Filtrar(idR, idA, idP, An, Pe, Sts, IdAt);
								}
							}
						}
						hideWait();
					},
					error: function (xhr, textStatus, e) {
						//default error handler para funciones de AJAX
						//AjaxErrorHandler(xhr, textStatus, e);
						hideWait();
						alert('Error al procesar el timbrado');
					}
                });
                marcados=[];
				ignorados=[];
				$('#chkAll').attr('checked',false);
			}
			function ConsultaDatosUnitarios(idRazon, IdAsig, IdProc, Anio, Per, IdAtributos){
				if(idRazon == '' || IdAsig == '' || IdProc == '' || Anio == '' || Per == ''){
					alert('Todos los campos son obligatorios');
					hideWait();
					return;				
				}	
				var args = {
					IdRazonSocial: parseInt(idRazon), 
					IdTipoNominaAsig: IdAsig, 
					IdTipoNominaProc: IdProc, 
					Anio: parseInt(Anio), 
					Periodo: parseInt(Per),
					IdAtributos: IdAtributos
				}	
				jQuery.ajax({
					type: "POST",
					url: "<%=Intelexion.Framework.ApplicationConfiguration.ConfigurationSettings.GetConfigurationSettings("ITXCFDIConnectorPath")%>ITXCFDIConnectorService.svc/FiltraTimbradoDatosUnitarios",
					data: JSON.stringify(args),
					contentType: "application/json; charset=utf-8",
					dataType: "json",
					async: false,
					success: function (data) {
						if(data.FiltraTimbradoDatosUnitariosResult){
							if(data.FiltraTimbradoDatosUnitariosResult.WithError){
								alert(data.FiltraTimbradoDatosUnitariosResult.ErrorMsg);
							} else {
								if(data.FiltraTimbradoDatosUnitariosResult){
									
									var objeto = data.FiltraTimbradoDatosUnitariosResult;
									
                                    if(objeto.EmpleadosEnProceso > 0 || objeto.EmpleadosPendientes > 0){
	                                    $('#lblEstatus').text('En proceso de timbrado');
	                                    var Sts = ($('#gridNominas_status select').length > 0) ? $('#gridNominas_status select').find('option:selected').val() : '';
                                        $('#btnTimbrar').attr('disabled', true);
										clearTimeout(objTime);
	                                    objTime = setTimeout(function(){Filtrar(idRazon, IdAsig, IdProc, Anio, Per, Sts, IdAtributos)}, 60 * 1000);										
                                    } else {
										if(objeto.EmpleadosTotal == 0){
											$('#lblEstatus').text('Sin Empleados');
											$('#btnTimbrar').attr('disabled', true);
										} else if(objeto.EmpleadosTotal == objeto.EmpleadosNoTimbrados){
											$('#lblEstatus').text('No timbrado');
											$('#btnTimbrar').attr('disabled', false);
										} else if(objeto.EmpleadosTotal == objeto.EmpleadosTimbrados){
											$('#lblEstatus').text('Timbrado');
											$('#btnTimbrar').attr('disabled', true);
										} else if(objeto.EmpleadosTimbrados > 0 && (objeto.EmpleadosNoTimbrados > 0 || objeto.EmpleadosCancelados > 0)){
											$('#lblEstatus').text('Reabierto');
											$('#btnTimbrar').attr('disabled', false);
										} else if(objeto.EmpleadosConError > 0){
											$('#lblEstatus').text('Con error');
											$('#btnTimbrar').attr('disabled', false);
										} else if(objeto.EmpleadosCancelados>0){
											$('#lblEstatus').text('Reabierto');
											$('#btnTimbrar').attr('disabled', false);
										} 
									}
									
									$('#tdPendientes').text(objeto.EmpleadosPendientes);
									$('#tdProceso').text(objeto.EmpleadosEnProceso);
									$('#tdTimbrados').text(objeto.EmpleadosTimbrados);
									$('#tdConError').text(objeto.EmpleadosConError);
                                    $('#tdTotal').text(objeto.EmpleadosTotal);
                                    totalFaltantes = objeto.EmpleadosPendientes + objeto.EmpleadosEnProceso + objeto.EmpleadosTimbrados
									
									totalFaltantes=objeto.EmpleadosTotal - totalFaltantes;
									
									if (totalFaltantes == 0 || totalFaltantes != 0){
									$('#btnTimbrar').attr('disabled', true)} else{$('#btnTimbrar').attr('disabled', false)}
									
									var stsPeriodo = data.FiltraTimbradoDatosUnitariosResult.EstatusTimbradoPeriodo;
									
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
						//default error handler para funciones de AJAX
						//AjaxErrorHandler(xhr, textStatus, e);
						alert('Error Datos unitarios');
					}
				});					
			}
            function Filtrar(idRazon, IdAsig, IdProc, Anio, Per, status, IdAtributos) {
                if (idRazon != RazonSocialFiltrado || IdAsig != TipoNominaAsigFiltrado ||  IdProc != TipoNominaProcFiltrado || Per !=PeriodoFiltrado || Anio != AnioFiltrado)
				    {
					 marcados=[];
					 ignorados=[];
					 $('#chkAll').attr('checked',false);
					}
				historial = {};
				CadenaFoliosCancelacion = [];
				CadenaXMLCancelacion = [];
				CadenaFoliosTimbrado = [];
				CadenaXMLTimbrado = [];
				
				if(idRazon == '' || IdAsig == '' || IdProc == '' || Anio == '' || Per == ''){
					alert('Todos los campos son obligatorios');
					hideWait();
					return;				
				}				
				ConsultaDatosUnitarios(idRazon, IdAsig, IdProc, Anio, Per, IdAtributos);				
				
				if(tablaCreada == 1){
					$('#gridNominas').dataTable().fnDestroy();
					$('#gridNominas').empty();
				}
				fullData = {};
				 var oTable = $('#gridNominas').dataTable({
					//"aaData": data.FiltraTimbradoResult.ListaNominas.Items,
					"bDeferRender": true,
					"bFilter": true,
					"bServerSide": true,
					"sAjaxSource": "<%=Intelexion.Framework.ApplicationConfiguration.ConfigurationSettings.GetConfigurationSettings("ITXCFDIConnectorPath")%>ITXCFDIConnectorService.svc/FiltraTimbrado",
					"fnServerData": function (sSource, aoData, fnCallback, oSettings) {
						aoData.push({ "name": "IdRazonSocial", "value": parseInt(idRazon) });
						aoData.push({ "name": "IdTipoNominaAsig", "value": IdAsig });
						aoData.push({ "name": "IdTipoNominaProc", "value": IdProc });
						aoData.push({ "name": "Anio", "value":  parseInt(Anio) });
						aoData.push({ "name": "Periodo", "value": parseInt(Per) });
						aoData.push({ "name": "languageId", "value": '<%=Context.Session("LID")%>' });
						aoData.push({ "name": "orderBy", "value": 'IdEmpleado' });
						aoData.push({ "name": "Status", "value": status });
						aoData.push({ "name": "IdAtributos", "value": IdAtributos });
						aoData.push({ "name": "cacheToken", "value": (new Date()).getTime() });
						oSettings.jqXHR = $.ajax({
							"dataType": 'json',
							"type": "GET",
							"url": sSource,
							"data": aoData,
							"async": false,
							"success": fnCallback
						});
                    },
                    "fnCreatedRow": function( nRow, aData, iDataIndex) {
						
						                                        
                        if(marcados.indexOf(aData.NumEmpleado) >= 0 || $('#chkAll').is(':checked')){
                            if(ignorados.indexOf(aData.NumEmpleado) == -1){
                                var checkaux = $('td:eq(0)', nRow).find('#chk_' + aData.NumEmpleado)
                               if($(checkaux).attr('disabled') != "disabled"){
                                 $(checkaux).attr('checked', true);
                                }
                            }
                        }
                        
                        $('td:eq(0)', nRow).find('#chk_' + aData.NumEmpleado).unbind('click').click(function(){
                            if($(this).is(':checked')){
                                marcados.push($(this).attr('attr-NumEmpleado'));
                                var idx = ignorados.indexOf($(this).attr('attr-NumEmpleado'));
                                ignorados.splice(idx, 1);
                            } else {
                                var idx = marcados.indexOf($(this).attr('attr-NumEmpleado'));
                                marcados.splice(idx, 1);
                                ignorados.push($(this).attr('attr-NumEmpleado'));
                            }
                        });

                    },
					"fnInitComplete" : function() { //Esta funcion es importante para que se ajusten las columnas correctamente.
						this.fnAdjustColumnSizing();
						this.fnDraw();
					},
                    "aoColumns": [
                    { "sTitle": strChkAll, 'sClass': 'dt_center', "mData": function (source, type, val) { 
					        if( totalFaltantes > 0 ){$("#chkAll").removeAttr('disabled',''); $('#btnTimbrar').attr('disabled', false);}
                            var cadena = '<input type="checkbox" id="chk_' + source.NumEmpleado + '" attr-NumEmpleado="' + source.NumEmpleado +'"';
                             var EstatusC = 0;
							//debugger
                              if(source.ListaCancelacion.Items != null){
							   if(source.ListaCancelacion.Items.length > 0){
                                   for(var x = 0; x < source.ListaCancelacion.Items.length ; x++){								   
                                    if (source.ListaCancelacion.Items[x].EstatusCancelacion == 2){
									//debugger
										if(CadenaFoliosCancelacion.indexOf(source.ListaCancelacion.Items[x].FolioFiscal) == -1){
											CadenaFoliosCancelacion.push(source.ListaCancelacion.Items[x].FolioFiscal);
											CadenaXMLCancelacion.push(source.ListaCancelacion.Items[x].XMLCancelacion);
										}
										$("#btnTimbrar").attr('disabled', false);
										 EstatusC =2;
										 $("#chkAll").removeAttr('disabled','');
										}        
									} 
								  }
                                }
                            if (EstatusC == 2){
                            if(source.EstatusTimbrado ==0 || source.EstatusTimbrado ==3 || source.EstatusTimbrado ==4 || source.EstatusTimbrado==5 ) {
                                totalTimb += 1;
                                cadena += ' ';
                             }
							 else {
                                totalTimb += 1;
                                cadena += ' disabled="disabled" ';
                             } 
							 
							}
							else
							{
								if(source.EstatusTimbrado ==1 || source.EstatusTimbrado ==2 || source.EstatusTimbrado== 5 ) {
                                totalTimb += 1;
                                cadena += ' disabled="disabled" ';
                             }
							}
                            
                                                      
                            cadena +=  ' />'; 
                            
                            return cadena;
                        } },
						{ "sTitle": 'Número de empleado', 'sClass': 'dt_center', "mData": "NumEmpleado" },
						{ "sTitle": 'Nombre de la persona', "mData": "NombrePersona" },
						{ "sTitle": 'Folio fiscal', "mData": "FolioFiscal" },
                        { "sTitle": 'Cancelaciones', 'sClass': 'dt_center', "mData": function (source, type, val) {
                            if(source.ListaCancelacion.Items != null){
								if(source.ListaCancelacion.Items.length > 0){									
									historial["obj_" + source.NumEmpleado] = source;
									return '<a href="javascript: VentanaHistorial(\'' + source.NumEmpleado + '\')" >Ver</a>';
								}
							}
                            return '';
                        } },
						{ "sTitle": 'Fecha/hora de la certificación', 'sClass': 'dt_center', "mData": "FechaHoraCertificacionFormato" },
						{ "sTitle": 'No. certificado digital', "mData": "NumeroCertificadoDigital" },
						<%If Not Intelexion.Framework.SystemFlags.SystemFlags.getValueById(10098) Is Nothing AndAlso Intelexion.Framework.SystemFlags.SystemFlags.getValueById(10098) = "1" Then%>
						{ "sTitle": 'Total Percepciones',
						  'sClass': 'dt_center',
						  "mData": function(source, type, val) {							 
							  let FormatCant = Intl.NumberFormat('en-US');
							  if (source.TotalPercepciones != "") {
								  return "$ " + FormatCant.format(source.TotalPercepciones);
								  }
								 else{
								 return "$ " + FormatCant.format("0.00");
							  }
						  }
					  
					    },
						{ "sTitle": 'Total Deducciones',
						  'sClass': 'dt_center',
						  "mData": function(source, type, val) {							  
							  let FormatCant = Intl.NumberFormat('en-US');
							  if (source.TotalDeducciones != "") {
								  return "$ " + FormatCant.format(source.TotalDeducciones);
								  }
								 else{
								 return "$ " + FormatCant.format("0.00");
							  }
						  }					  
					    },
						<%End if%>
						{ "sTitle": 'Estatus del timbrado', 'sClass': 'dt_center', "mData": function (source, type, val) {

							switch(source.EstatusTimbrado){
								case 0:	return 'No timbrado';
								case 1: return 'Enviado a timbrar';
								case 2:	return 'En proceso de timbrado';
								case 3:	return 'Cancelado';
								case 4:	
									<%If Not Intelexion.Framework.SystemFlags.SystemFlags.getValueById(10400) Is Nothing AndAlso Intelexion.Framework.SystemFlags.SystemFlags.getValueById(10400) = "1" Then%>										
										return 'Con error';
									<%Else%>
										fullData["error_" + source.NumEmpleado] = source.MensajeTimbrado;
										return '<a href="javascript: VentanaErrores(\'' + source.NumEmpleado + '\')">Con error</a>';
									<%End if%>
								case 5:	return 'Timbrado';
								case 6:	return 'En proceso de timbrado';
								default: return '';
							}
						} },
						{ "sTitle": 'XML del timbrado', 'sClass': 'dt_center', "mData": function (source, type, val) {
							var str = ''
							var fileName = idRazon.toString() + '|' + IdAsig + '|' + IdProc + '|' + Anio.toString() + '|' + Per.toString() + '|' + source.NumEmpleado;
							//var fileName = source.key;
							if(source.EstatusTimbrado == 5){
								if(CadenaFoliosTimbrado.indexOf(source.FolioFiscal) == -1){
									CadenaFoliosTimbrado.push(source.FolioFiscal);
									CadenaXMLTimbrado.push(source.XMLTimbrado);
								}
								str = '<a href="#" onclick="DescargarXml(&apos;' + fileName + '|' +source.FolioFiscal + '&apos;,0);">XML</a>';
								//str = '<a href="<%=Intelexion.Framework.ApplicationConfiguration.ConfigurationSettings.GetConfigurationSettings("ITXCFDIConnectorPath")%>ITXCFDIConnectorService.svc/XMLFile/' + source.FolioFiscal + '">xml</a>';
							}
							
							return str;
						
						} },
						{ "sTitle": 'Recibo', 'sClass': 'dt_center', "mData": function (source, type, val) {
							var str = ''
							//var fileName = idRazon.toString() + '-' + IdAsig + '-' + IdProc + '-' + Anio.toString() + '-' + Per.toString() + '-' + source.NumEmpleado;
							var fileName = source.key;
							if(source.EstatusTimbrado == 5){
								str = '<a href="<%=Intelexion.Framework.ApplicationConfiguration.ConfigurationSettings.GetConfigurationSettings("ITXCFDIConnectorPath")%>ITXCFDIConnectorService.svc/PDFFile/' + fileName + '">pdf</a>';
							}
							
							return str;
						
						} },
						{ "sTitle": 'Estatus Correo',
						  'sClass': 'dt_center',
						  "mData": function(source, type, val) {

							  switch (source.statusEnvioCorreo) {
								  case 0:
									  return 'Pendiente Enviar';
								  case 1:
									  return 'Enviado';                                
								  default:
									  return '';
							  }
						    }
						}
						<%If Not Intelexion.Framework.SystemFlags.SystemFlags.getValueById(10400) Is Nothing AndAlso Intelexion.Framework.SystemFlags.SystemFlags.getValueById(10400) = "1" Then%>
						,{ "sTitle": 'Error', 
							'sClass': '',
							"mData": function(source, type, val) {
							//debugger
								return source.EstatusTimbrado != 4 ? "" : '<textarea rows="3" cols="100" style="min-height:20px;min-width:700px;resize: none;">' + source.MensajeTimbrado.replace(/[\r\n]/g, "") + '</textarea>';							  
						    }
						}								
						<%End if%>
					  ],
					"oLanguage":dtLanguage // el objeto dtLanguage fue creado en el archivo localization/jquery.datatables.es_MX.js
				});					
				tablaCreada = 1;	
				
				$('#gridNominas_status, #gridNominas_imprimir, #gridNominas_enviarcorreo, #gridNominas_regenerar, #gridNominas_xmlfull').remove();
				totalR = oTable.fnSettings().fnRecordsTotal();
				var strControlEstatus = '';				
				strControlEstatus += '<div id="gridNominas_status" class="dataTables_status">';
				strControlEstatus += '<label>';
				strControlEstatus += 'Estatus: '; 
				strControlEstatus += '<select size="1" name="gridNominas_status" aria-controls="gridNominas">';
				strControlEstatus += '<option value="" selected="selected">Todos</option>';
				strControlEstatus += '<option value="0">No timbrado</option>';
				strControlEstatus += '<option value="2">En proceso</option>';
				strControlEstatus += '<option value="3">Cancelado</option>';
				strControlEstatus += '<option value="4">Con error</option>';
				strControlEstatus += '<option value="5">Timbrado</option>';
				strControlEstatus += '</select>';
				strControlEstatus += '</label>';
				strControlEstatus += '</div>';
				
				var strControlXMLFull = '';
				strControlXMLFull += '<div id="gridNominas_xmlfull" class="dataTables_xmlfull" style="float:right;">';
				strControlXMLFull += '<input style="background: url(<%=Intelexion.Framework.ApplicationConfiguration.ConfigurationSettings.GetConfigurationSettings("ApplicationPath")%>/ui/50/images/icons/documents-stack.png) no-repeat center left;border:0px;" title="Descargar todos los XML en un archivo comprimido" type="button" class="boton" id="btnXMLFull" value="Generar XML masivo" attr-idrazonsocial="' + idRazon + '" attr-idtiponominaasig="' + IdAsig + '" attr-idtiponominaproc="' + IdProc + '" attr-anio="' + Anio + '" attr-periodo="' + Per + '" attr-IdAtributos="' + IdAtributos + '" />';
				strControlXMLFull += '</div>';
				
				var strControlXMLPDF = '';
				strControlXMLPDF += '<div id="gridNominas_xmlpdf" class="dataTables_xmlpdf" style="float:right;">';
				strControlXMLPDF += '<input style="background: url(<%=Intelexion.Framework.ApplicationConfiguration.ConfigurationSettings.GetConfigurationSettings("ApplicationPath")%>/ui/60/material-design-icons-3.0.1/action/1x_web/ic_system_update_alt_black_24dp.png) no-repeat center left;border:0px;width:160px;" title="Descargar todos los recibos en formato PDF con su respectivo cfdi en un archivo comprimido" type="button" class="boton" id="btnXMLPDF" value="Descargar Todos" attr-idrazonsocial="' + idRazon + '" attr-idtiponominaasig="' + IdAsig + '" attr-idtiponominaproc="' + IdProc + '" attr-anio="' + Anio + '" attr-periodo="' + Per + '" attr-IdAtributos="' + IdAtributos + '" />';
				strControlXMLPDF += '</div>';
				
				var strControlImprimir = '';
				strControlImprimir += '<div id="gridNominas_imprimir" class="dataTables_imprimir" style="float:right;">';
				strControlImprimir += '<input style="background: url(<%=Intelexion.Framework.ApplicationConfiguration.ConfigurationSettings.GetConfigurationSettings("ApplicationPath")%>/ui/60/material-design-icons-3.0.1/action/1x_web/ic_chrome_reader_mode_black_24dp.png) no-repeat center left;border:0px;width:190px;" title="Generar un solo archivo PDF con los recibos CFDI de todos los empleados" type="button" class="boton" id="btnImprimir" value="Generar PDF masivo" attr-idrazonsocial="' + idRazon + '" attr-idtiponominaasig="' + IdAsig + '" attr-idtiponominaproc="' + IdProc + '" attr-anio="' + Anio + '" attr-periodo="' + Per + '" attr-IdAtributos="' + IdAtributos + '" />';
				strControlImprimir += '</div>';
				
				var strControlEnviar = '';
				strControlEnviar += '<div id="gridNominas_enviarcorreo" class="dataTables_enviarcorreo" style="float:right;">';
				strControlEnviar += '<input style="background: url(<%=Intelexion.Framework.ApplicationConfiguration.ConfigurationSettings.GetConfigurationSettings("ApplicationPath")%>/ui/60/material-design-icons-3.0.1/action/1x_web/ic_markunread_mailbox_black_24dp.png) no-repeat center left;border:0px;width:160px;" title="Enviar archivos PDF y XML a cada empleado que cuente con correo electrónico" type="button" class="boton" id="btnEnviarCorreo" value="Enviar por correo" attr-idrazonsocial="' + idRazon + '" attr-idtiponominaasig="' + IdAsig + '" attr-idtiponominaproc="' + IdProc + '" attr-anio="' + Anio + '" attr-periodo="' + Per + '" attr-IdAtributos="' + IdAtributos + '" />';
				strControlEnviar += '</div>';
				
				var strControlRegenerar = '';
				strControlRegenerar += '<div id="gridNominas_regenerar" class="dataTables_regenerar" style="float:right;">';
				strControlRegenerar += '<input style="background: url(<%=Intelexion.Framework.ApplicationConfiguration.ConfigurationSettings.GetConfigurationSettings("ApplicationPath")%>/ui/60/material-design-icons-3.0.1/action/1x_web/ic_autorenew_black_24dp.png) no-repeat center left;border:0px;width:160px;" title="Regenerar individualmente cada recibo CFDI" type="button" class="boton" id="btnRegenerar" value="Regenerar todos" attr-idrazonsocial="' + idRazon + '" attr-idtiponominaasig="' + IdAsig + '" attr-idtiponominaproc="' + IdProc + '" attr-anio="' + Anio + '" attr-periodo="' + Per + '" attr-IdAtributos="' + IdAtributos + '" />';
				strControlRegenerar += '</div>';
				
				<%If Not Intelexion.Framework.SystemFlags.SystemFlags.getValueById(10401) Is Nothing AndAlso Intelexion.Framework.SystemFlags.SystemFlags.getValueById(10401) = "1" Then%>
				var strControlGenerarExcel = '';
				strControlGenerarExcel += '<div id="gridNominas_reporteExcel" class="dataTables_reporteExcel" style="float:right;">';
				strControlGenerarExcel += '<input style="background: url(<%=Intelexion.Framework.ApplicationConfiguration.ConfigurationSettings.GetConfigurationSettings("ApplicationPath")%>/ui/60/material-design-icons-3.0.1/action/1x_web/ic_view_quilt_black_24dp.png) no-repeat center left;border:0px;width:160px;" title="Genera reporte de timbres con errores en formato excel" type="button" class="boton" id="btnGeneralExcel" value="General Excel" attr-idrazonsocial="' + idRazon + '" attr-idtiponominaasig="' + IdAsig + '" attr-idtiponominaproc="' + IdProc + '" attr-anio="' + Anio + '" attr-periodo="' + Per + '" attr-IdAtributos="' + IdAtributos + '" />';
				strControlGenerarExcel += '</div>';				
				<%End If%>
               $('#chkAll').click(function(){
                    ignorados = [];
                    marcados = [];
                    //if($('#chkAll').is(':checked')){
                    var checados = $('#chkAll').is(':checked')
                  $('#gridNominas').find('input[id^="chk_"]').each(function(){
                      
                      if( $(this).attr('disabled') != "disabled"){
                      
                      $(this).attr('checked', checados);
                        if(checados){
                          marcados.push($(this).attr('attr-NumEmpleado'));
                        } else {
                          ignorados.push($(this).attr('attr-NumEmpleado'));
                        }
                      }
                      
                  });
                    
                });

				$('#gridNominas_wrapper').prepend(strControlEstatus);
				if((EmpleadosPendientes == 0) && EmpleadosTimbrados > 0){
					$('#gridNominas_wrapper').prepend(strControlXMLPDF);
					$('#gridNominas_wrapper').prepend(strControlImprimir);
					<%If Not Intelexion.Framework.SystemFlags.SystemFlags.getValueById(8041) Is Nothing AndAlso Intelexion.Framework.SystemFlags.SystemFlags.getValueById(8041) = "1" Then%>
						$('#gridNominas_wrapper').prepend(strControlXMLFull);
					<%End If%>
					$('#gridNominas_wrapper').prepend(strControlEnviar);
					$('#gridNominas_wrapper').prepend(strControlRegenerar);
				}
				<%If Not Intelexion.Framework.SystemFlags.SystemFlags.getValueById(10401) Is Nothing AndAlso Intelexion.Framework.SystemFlags.SystemFlags.getValueById(10401) = "1" Then%>
				if(EmpleadosConError > 0 || EmpleadosTimbrados > 0 || EmpleadosEnProceso > 0){
					$('#gridNominas_wrapper').prepend(strControlGenerarExcel);
				}
				<%End If%>
				
				$('#gridNominas_status select').find('option[value="' + status + '"]').attr('selected', true);
				$('#gridNominas_status select').change(function(){
					Filtrar(idRazon, IdAsig, IdProc, Anio, Per, $(this).val(), IdAtributos)
				});
				$('#gridNominas_xmlpdf input[type="button"]').click(function(){
					var idRazonSocialImprimir = $(this).attr('attr-idrazonsocial');
					var idTipoNominaAsigImprimir = $(this).attr('attr-idtiponominaasig');
					var idTipoNominaProcImprimir = $(this).attr('attr-idtiponominaproc');
					var AnioImprimir = $(this).attr('attr-anio');
					var PeriodoImprimir = $(this).attr('attr-periodo');
					var idAtributosImprimir = $(this).attr('attr-IdAtributos');			
											
                    RevisarPdfEnProceso(idRazonSocialImprimir, idTipoNominaAsigImprimir, idTipoNominaProcImprimir, AnioImprimir, PeriodoImprimir, idAtributosImprimir,"ZIP")
                    									   
				});
				
				$('#gridNominas_reporteExcel input[type="button"]').click(function(){
					var idRazonSocialImprimir = $(this).attr('attr-idrazonsocial');
					var idTipoNominaAsigImprimir = $(this).attr('attr-idtiponominaasig');
					var idTipoNominaProcImprimir = $(this).attr('attr-idtiponominaproc');
					var AnioImprimir = $(this).attr('attr-anio');
					var PeriodoImprimir = $(this).attr('attr-periodo');
					var idAtributosImprimir = $(this).attr('attr-IdAtributos');			
											
                    RevisarPdfEnProceso(idRazonSocialImprimir, idTipoNominaAsigImprimir, idTipoNominaProcImprimir, AnioImprimir, PeriodoImprimir, idAtributosImprimir,"xlsx")
                    									   
				});
				
				$('#gridNominas_imprimir input[type="button"]').click(function(){
					var idRazonSocialImprimir = $(this).attr('attr-idrazonsocial');
					var idTipoNominaAsigImprimir = $(this).attr('attr-idtiponominaasig');
					var idTipoNominaProcImprimir = $(this).attr('attr-idtiponominaproc');
					var AnioImprimir = $(this).attr('attr-anio');
					var PeriodoImprimir = $(this).attr('attr-periodo');
					var idAtributosImprimir = $(this).attr('attr-IdAtributos');
					ResumenImprimir(idRazonSocialImprimir, idTipoNominaAsigImprimir, idTipoNominaProcImprimir, AnioImprimir, PeriodoImprimir,idAtributosImprimir);
				});
				$('#gridNominas_xmlfull input[type="button"]').click(function(){
					var idRazonSocialImprimir = $(this).attr('attr-idrazonsocial');
					var idTipoNominaAsigImprimir = $(this).attr('attr-idtiponominaasig');
					var idTipoNominaProcImprimir = $(this).attr('attr-idtiponominaproc');
					var AnioImprimir = $(this).attr('attr-anio');
					var PeriodoImprimir = $(this).attr('attr-periodo');
					var idAtributosImprimir = $(this).attr('attr-IdAtributos');
					window.open('<%=Intelexion.Framework.ApplicationConfiguration.ConfigurationSettings.GetConfigurationSettings("ITXCFDIConnectorPath")%>ITXCFDIConnectorService.svc/XMLFull/' + idRazonSocialImprimir + '-' + idTipoNominaAsigImprimir + '-' + idTipoNominaProcImprimir + '-' + AnioImprimir + '-' + PeriodoImprimir + '-' + idAtributosImprimir, '', '_parent');
					//idRazonSocialImprimir + '-' + idTipoNominaAsigImprimir + '-' + idTipoNominaProcImprimir + '-' + AnioImprimir + '-' + PeriodoImprimir + '-' + idAtributosImprimir
					
				});
				$('#gridNominas_enviarcorreo input[type="button"]').click(function(){
					let idRazonSocialImprimir = $(this).attr('attr-idrazonsocial');
					let idTipoNominaAsigImprimir = $(this).attr('attr-idtiponominaasig');
					let idTipoNominaProcImprimir = $(this).attr('attr-idtiponominaproc');
					let AnioImprimir = $(this).attr('attr-anio');
					let PeriodoImprimir = $(this).attr('attr-periodo');
					let idAtributosImprimir = $(this).attr('attr-IdAtributos');
					//ResumenEnvioCorreo(idRazonSocialImprimir, idTipoNominaAsigImprimir, idTipoNominaProcImprimir, AnioImprimir, PeriodoImprimir);
					
					EnviarCorreoListado(idRazonSocialImprimir, idTipoNominaAsigImprimir, idTipoNominaProcImprimir, AnioImprimir, PeriodoImprimir, idAtributosImprimir);
					//RevisarPdfEnProceso(idRazonSocialImprimir, idTipoNominaAsigImprimir, idTipoNominaProcImprimir, AnioImprimir, PeriodoImprimir, idAtributosImprimir,"email");																																	   
				});
				$('#gridNominas_regenerar input[type="button"]').click(function(){
					var idRazonSocialImprimir = $(this).attr('attr-idrazonsocial');
					var idTipoNominaAsigImprimir = $(this).attr('attr-idtiponominaasig');
					var idTipoNominaProcImprimir = $(this).attr('attr-idtiponominaproc');
					var AnioImprimir = $(this).attr('attr-anio');
					var PeriodoImprimir = $(this).attr('attr-periodo');
					var idAtributosImprimir = $(this).attr('attr-IdAtributos');
					
					var args = {
						IdRazonSocial: parseInt(idRazonSocialImprimir), 
						IdTipoNominaAsig: idTipoNominaAsigImprimir, 
						IdTipoNominaProc: idTipoNominaProcImprimir, 
						Anio: parseInt(AnioImprimir), 
						Periodo: parseInt(PeriodoImprimir),
						IdAtributos: idAtributosImprimir
                    }	
                    //var fileName = parseInt(idRazonSocialImprimir) +"-"+ idTipoNominaAsigImprimir + "-" + idTipoNominaProcImprimir +"-"+ parseInt(AnioImprimir) +"-"+ parseInt(PeriodoImprimir) +"-"+idAtributosImprimir
                    var NombreArchivo = parseInt(idRazonSocialImprimir) + '-' + idTipoNominaAsigImprimir + '-' + idTipoNominaProcImprimir + '-' + parseInt(AnioImprimir) + '-' + parseInt(PeriodoImprimir) + '-' + IdAtributos;
                    <%--showWait();
					jQuery.ajax({
						type: "GET",
						url: "<%=Intelexion.Framework.ApplicationConfiguration.ConfigurationSettings.GetConfigurationSettings("ITXCFDIConnectorPath")%>ITXCFDIConnectorService.svc/DownloadPDFFileAll",
						data: JSON.stringify(args),
						contentType: "application/json; charset=utf-8",
						dataType: "json",
						async: true,
						success: function (data) {
							hideWait();
						},
						error: function (xhr, textStatus, e) {
							hideWait();
							alert('Error al regenerar');
						}
					});	--%>

                     IniciarProceso("Regenerando PDF",NombreArchivo,"PDFS"); 
						
                });
				
                RazonSocialFiltrado = $('#RazonSocial').find('option:selected').val();
				TipoNominaAsigFiltrado = $('#TipoNominaAsig').find('option:selected').val();
				TipoNominaProcFiltrado = $('#TipoNominaProc').find('option:selected').val(); 
				AnioFiltrado= $('#Anio').find('option:selected').val();
				PeriodoFiltrado= $('#Periodo').find('option:selected').val();
			}
			function ResumenImprimir(idRazonSocialImprimir, idTipoNominaAsigImprimir, idTipoNominaProcImprimir, AnioImprimir, PeriodoImprimir, IdAtributos){	
				var args = {
					IdRazonSocial: parseInt(idRazonSocialImprimir), 
					IdTipoNominaAsig: idTipoNominaAsigImprimir, 
					IdTipoNominaProc: idTipoNominaProcImprimir, 
					Anio: parseInt(AnioImprimir), 
					Periodo: parseInt(PeriodoImprimir),
					IdAtributos: IdAtributos
				}	
				showWait();
				jQuery.ajax({
					type: "POST",
					url: "<%=Intelexion.Framework.ApplicationConfiguration.ConfigurationSettings.GetConfigurationSettings("ITXCFDIConnectorPath")%>ITXCFDIConnectorService.svc/ResumenImprimir",
					data: JSON.stringify(args),
					contentType: "application/json; charset=utf-8",
					dataType: "json",
					async: true,
					success: function (data) {	
						if(data.ResumenImprimirResult){
							if(data.ResumenImprimirResult.WithError){
								alert(data.ResumenImprimirResult.ErrorMsg);
							} else {
								if(data.ResumenImprimirResult){
									var obj = data.ResumenImprimirResult;
									if(obj.TotalTimbrados == 0){
										alert('No hay recibos timbrados');
										hideWait();
										return;
									}
									if(confirm('Total de recibos del periodo: ' + obj.TotalRecibos + ' \nTotal de recibos ya timbrados: ' + obj.TotalTimbrados + ' \nSe generara(n) ' + obj.TotalTimbrados + ' recibo(s) en un solo archivo PDF.')){
										hideWait();	
										RevisarPdfEnProceso(idRazonSocialImprimir, idTipoNominaAsigImprimir, idTipoNominaProcImprimir, AnioImprimir, PeriodoImprimir, IdAtributos,"PDF");
											//alert("El PDF se está procesando");
										//}else{
											//window.open('<%=Intelexion.Framework.ApplicationConfiguration.ConfigurationSettings.GetConfigurationSettings("ITXCFDIConnectorPath")%>ITXCFDIConnectorService.svc/PDFFull/' + idRazonSocialImprimir + '-' + idTipoNominaAsigImprimir + '-' + idTipoNominaProcImprimir + '-' + AnioImprimir + '-' + PeriodoImprimir + '-' + IdAtributos, '', '_parent');
										//}
									}
								}
							}
						}
						hideWait();
					},
					error: function (xhr, textStatus, e) {
						//default error handler para funciones de AJAX
						//AjaxErrorHandler(xhr, textStatus, e);
						alert('Error al imprimir');
					}
				});	
			}
			function ResumenEnvioCorreo(idRazonSocialImprimir, idTipoNominaAsigImprimir, idTipoNominaProcImprimir, AnioImprimir, PeriodoImprimir){	
				var args = {
					IdRazonSocial: parseInt(idRazonSocialImprimir), 
					IdTipoNominaAsig: idTipoNominaAsigImprimir, 
					IdTipoNominaProc: idTipoNominaProcImprimir, 
					Anio: parseInt(AnioImprimir), 
					Periodo: parseInt(PeriodoImprimir)
				}	
				showWait();
				jQuery.ajax({
					type: "POST",
					url: "<%=Intelexion.Framework.ApplicationConfiguration.ConfigurationSettings.GetConfigurationSettings("ITXCFDIConnectorPath")%>ITXCFDIConnectorService.svc/ResumenEnvioCorreo",
					data: JSON.stringify(args),
					contentType: "application/json; charset=utf-8",
					dataType: "json",
					async: true,
					success: function (data) {
						if(data.ResumenEnvioCorreoResult){
							if(data.ResumenEnvioCorreoResult.WithError){
								alert(data.ResumenEnvioCorreoResult.ErrorMsg);
							} else {
								if(data.ResumenEnvioCorreoResult){
									var obj = data.ResumenEnvioCorreoResult;
									if(obj.TotalConCorreo == 0){
										alert('No hay empleados con correo electrónico configurado');
										hideWait();
										return;
									}
									if(confirm('Total de recibos del periodo: ' + obj.TotalRecibos + ' \nTotal de recibos ya timbrados: ' + obj.TotalTimbrados + ' \nTotal de empleados con correo electronico: ' + obj.TotalConCorreo + ' \nSe enviará la información por correo a ' + obj.TotalConCorreo + ' empleado(s).')){
										var args = {
											IdRazonSocial: parseInt(idRazonSocialImprimir), 
											IdTipoNominaAsig: idTipoNominaAsigImprimir, 
											IdTipoNominaProc: idTipoNominaProcImprimir, 
											Anio: parseInt(AnioImprimir), 
											Periodo: parseInt(PeriodoImprimir)
										}		
										jQuery.ajax({
											type: "POST",
											url: "<%=Intelexion.Framework.ApplicationConfiguration.ConfigurationSettings.GetConfigurationSettings("ITXCFDIConnectorPath")%>ITXCFDIConnectorService.svc/SendMailFull",
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
								}
							}
						}
						hideWait();
					},
					error: function (xhr, textStatus, e) {
						//default error handler para funciones de AJAX
						//AjaxErrorHandler(xhr, textStatus, e);
						alert('Error en envio de correo');
					}
				});	
			}
			
			function EnviarCorreoListado(idRazonSocial, idTipoNominaAsig, idTipoNominaProc, Anio, Periodo, IdAtributos){
			   ////debugger;
			    var pos = 0;
          var url = 'Nomina/Procesos/EnviarCorreoTimbrado.aspx';
          var width = 1000;
          var height = 500;
          var scroll = 'yes';          
          
          var opciones = {
              url: url,
              height: height,
              width: width,
              scrollable: scroll,
              dialogArguments: {
                  arg1: idRazonSocial,
                  arg2: idTipoNominaAsig,
                  arg3: idTipoNominaProc,
                  arg4: Anio,
                  arg5: Periodo,
                  arg6: IdAtributos
              }              
          };

          // Validamos si no existe un popup ya existente
          if ($(top.window.document).find('#iframeDialog').length > 0) {
              // si existe un popup nuevo, se abre con este metodo
              $.showModalDialogPopUp(opciones);
          }
          else {
              // si no existe uno previo se abre de la ventan padre para que funcione correctametne el modal
              window.parent.$.showModalDialog(opciones);
          }
			
			}
			
			function VentanaSinCertificado() {
				width = 650;
				height = 150;
				title = 'No hay certificados activos';
				var dialogName = 'dlg' + getNewUniqueId();
				var strHTML = "";
				var curYear = new Date().getFullYear();
				var rfc = $('#RazonSocial').find('option:selected').attr('attr-rfc');

				strHTML += "<div id='" + dialogName + "'>";
				strHTML += '<form id="dialogForm' + dialogName + '" action="#">';
				strHTML += '<p>';
				strHTML += 'Para timbrar recibos de nómina se requiere que la razón social tenga asociado un certificado de sello digital vigente';
				strHTML += '</p>';
				strHTML += "<div class='botonArea'>";
				strHTML += '<input type="button" class="boton boton-nuevo" id="btnSave' + dialogName + '" value="Cargar / Activar certificado" />';
				strHTML += '<input type="button" class="boton boton-cancel" id="btnCancel' + dialogName + '" value="Cancelar" />';
				strHTML += "</div>";			
				strHTML += "</form>";
				strHTML += "</div>";

				$("#modalDialogArea").append(strHTML);
				//$('#btnSave' + dialogName + ', #btnCancel' + dialogName + '').wrap("<span class='boton-wrap-left'><span class='boton-wrap-right'></span></span>");
				$("#" + dialogName).dialog({
					modal: true,
					title: title,
					width: width,
					autoOpen: false,
					resizable: false
				});
                $("#" + dialogName).dialog('open');
                $("#" + dialogName).css('display', 'block');
                $("#" + dialogName).css('width', 'auto');
                $("#" + dialogName).css('min-height', '100px');
                $("#" + dialogName).css('height', 'auto');
                $("#" + dialogName).closest('div.ui-dialog', 'auto').css("height", "auto");
				$("#btnCancel" + dialogName).click(function () {
					CancelarDialog("#" + dialogName);					
				});
				$("#btnSave" + dialogName).click(function () {
					rsParams = 'INVALID';
					var url = '<%=Intelexion.Framework.ApplicationConfiguration.ConfigurationSettings.GetConfigurationSettings("ITXCFDIServicePath")%>Certificate/Certificate?id='
					ConsultaPermisosAltaCert(rfc);					
					window.open(url + rsParams, '_blank');
					CancelarDialog("#" + dialogName);					
					alert('En la pestaña que se acaba de abrir en el navegador, es necesario que cargue o active un certificado de sello digital vigente. Una vez cargado el certificado, regresar a esta pantalla y continuar con su proceso');
				});
			}
            function ConsultaPermisosAltaCert(rfc){
				var args = {
				   "rfc": rfc,
				   "userId": '<%=context.Session("UID").replace("\", "\\")%>'
				}
				jQuery.ajax({
				   type: "POST",
				   url: "<%=Intelexion.Framework.ApplicationConfiguration.ConfigurationSettings.GetConfigurationSettings("ITXCFDIConnectorPath")%>ITXCFDIConnectorService.svc/ConsultaPermisosAltaCert",
				   data: JSON.stringify(args),
				   contentType: "application/json; charset=utf-8",
				   dataType: "json",
				   async: false,
				   success: function (data) {
					   if (data){
						   rsParams = data.ConsultaPermisosAltaCertResult;
						   return;
					   }                                              
					   rsParams = "INVALID";
				   }
				});
            }
			function VentanaConCertificado(CSD, FechaIni, FechaFin) {
				width = 650;				
				title = 'Teclea la contraseña del certificado';
				var dialogName = 'dlg' + getNewUniqueId();
				var strHTML = "";
				var curYear = new Date().getFullYear();

				strHTML += "<div id='" + dialogName + "'>";
				strHTML += '<form id="dialogForm' + dialogName + '" action="#">';
				strHTML += '<table>';
				
				strHTML += '<tr>';
				strHTML += '<td><label>Certificado de sello digital activo</label></td>';
				strHTML += '<td></td>';
				strHTML += '<td><b>' + CSD + '.cer</b></td>';
				strHTML += '<td></td>';
				strHTML += '<td></td>';
				strHTML += '<td></td>';
				strHTML += '</tr>';
				
				strHTML += '<tr>';
				strHTML += '<td><label>Fecha de inicio de vigencia</label></td>';
				strHTML += '<td></td>';
				strHTML += '<td><b>' + FechaIni + '</b></td>';
				strHTML += '<td><label>Fecha de fin de vigencia</label></td>';
				strHTML += '<td></td>';
				strHTML += '<td><b>' + FechaFin + '</b></td>';
				strHTML += '</tr>';
				
				strHTML += '<tr>';
				strHTML += '<td><label>Contraseña</label></td>';
				strHTML += '<td><span class="labelRequerido"><%=Intelexion.Framework.SystemLabels.SystemLabels.getValueById(87, context.Session("LID"))%></span></td>';
				strHTML += '<td><input type="password" id="pass' + dialogName + '" /></td>';
				strHTML += '<td></td>';
				strHTML += '<td></td>';
				strHTML += '<td></td>';
				strHTML += '</tr>';
				
				strHTML += '</table>';
				strHTML += "<div class='botonArea'>";
				strHTML += '<input type="button" class="boton" id="btnSave' + dialogName + '" value="Timbrar" />';
				strHTML += '<input type="button" class="boton boton-cancel" id="btnCancel' + dialogName + '" value="Cancelar" />';
				strHTML += "</div>";			
				strHTML += "</form>";
				strHTML += "</div>";

				$("#modalDialogArea").append(strHTML);
				//$('#btnSave' + dialogName + ', #btnCancel' + dialogName + '').wrap("<span class='boton-wrap-left'><span class='boton-wrap-right'></span></span>");
				$("#" + dialogName).dialog({
					modal: true,
					title: title,
					width: width,
					autoOpen: false,
					resizable: false
				});
                $("#" + dialogName).dialog('open');
                $("#" + dialogName).css('display', 'block');
                $("#" + dialogName).css('width', 'auto');
                $("#" + dialogName).css('min-height', '100px');
                $("#" + dialogName).css('height', 'auto');
                $("#" + dialogName).closest('div.ui-dialog', 'auto').css("height", "auto");
				$("#btnCancel" + dialogName).click(function () {
					CancelarDialog("#" + dialogName);					
				});
				$("#btnSave" + dialogName).click(function () {
					if($('#pass' + dialogName).val() == ''){
						alert('Es necesario capturar la contraseña del certificado');
						return;
					}
					Timbrar($('#pass' + dialogName).val(), dialogName);					
				});
				$("#pass" + dialogName).keydown(function (e) {
					if(e.keyCode == 13){
						e.stopPropagation();
						e.preventDefault();
						$("#btnSave" + dialogName).click();
					}					
				});
			}
			
			function TimbrarDirecto(IdRazonSocial, IdTipoNominaAsig, IdTipoNominaProc, Anio, Periodo, IdAtributos) {
				if(IdRazonSocial == '' || IdTipoNominaAsig == '' || IdTipoNominaProc == '' || Anio == '' || Periodo == ''){
					alert('Todos los campos son obligatorios');
					return;				
				}
				<%If Not Intelexion.Framework.SystemFlags.SystemFlags.getValueById(7336) Is Nothing AndAlso Intelexion.Framework.SystemFlags.SystemFlags.getValueById(7336) = "1" Then%>
				if(IdAtributos == ''){
					if(tablaCreada == 1){
						tablaCreada = 0;
						$('#gridNominas').dataTable().fnDestroy();
						$('#gridNominas').empty();
					}	
					alert('Debe de seleccionar al menos un atributo');
					return;
				}
				
				if(tablaCreada == 0){
					alert('No hay empleados para timbrar\nPor favor realice el filtro nuevamente');
					return;
				}
				<%End If%>				
				
				width = 600;
				height = 250;
				title = 'Teclea la contraseña del certificado';
				var dialogName = 'dlg' + getNewUniqueId();
				var strHTML = "";
				var curYear = new Date().getFullYear();

				strHTML += "<div id='" + dialogName + "'>";
				strHTML += '<form id="dialogForm' + dialogName + '" action="#">';
				strHTML += '<table>';
				
				strHTML += '<tr>';
				strHTML += '<td><label>Contraseña</label></td>';
				strHTML += '<td><span class="labelRequerido"><%=Intelexion.Framework.SystemLabels.SystemLabels.getValueById(87, context.Session("LID"))%></span></td>';
				strHTML += '<td><input type="password" id="pass' + dialogName + '" /></td>';
				strHTML += '<td></td>';
				strHTML += '<td></td>';
				strHTML += '<td></td>';
				strHTML += '</tr>';
				
				strHTML += '</table>';
                strHTML += "<div class='botonArea'>";
                strHTML += "</br>";
				strHTML += '<input type="button" class="boton boton-nuevo" id="btnSave' + dialogName + '" value="Timbrar" />';
				strHTML += '<input type="button" class="boton boton-cancel" id="btnCancel' + dialogName + '" value="Cancelar" />';
				strHTML += "</div>";			
				strHTML += "</form>";
				strHTML += "</div>";

				$("#modalDialogArea").append(strHTML);
				//$('#btnSave' + dialogName + ', #btnCancel' + dialogName + '').wrap("<span class='boton-wrap-left'><span class='boton-wrap-right'></span></span>");
				$("#" + dialogName).dialog({
					modal: true,
					title: title,
					width: 500,
					
					autoOpen: false,
					resizable: false
                });
                $("#" + dialogName).dialog('open');
                $("#" + dialogName).css('display', 'block');
                $("#" + dialogName).css('width', '94%');
                $("#" + dialogName).css('min-height', '100px');
                $("#" + dialogName).css('height', '100px');
                $("#" + dialogName).closest('div.ui-dialog', '170px').css("height", "170px");
				$("#btnCancel" + dialogName).click(function () {
					CancelarDialog("#" + dialogName);					
				});
				$("#btnSave" + dialogName).click(function () {
					if($('#pass' + dialogName).val() == ''){
						alert('Es necesario capturar la contraseña del certificado');
						return;
					}
					Timbrar($('#pass' + dialogName).val(), dialogName);					
				});
				$("#pass" + dialogName).keydown(function (e) {
					if(e.keyCode == 13){
						e.stopPropagation();
						e.preventDefault();
						$("#btnSave" + dialogName).click();
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
			
			function AjaxErrorHandler(xhr, textStatus, e){
				var r = jQuery.parseJSON(xhr.responseText);
				if (r.LocalizedErrorMessage)
					alert(r.LocalizedErrorMessage);
				else
					alert(r.Message);
				//showNotification(true, r.LocalizedErrorMessage, "Error");
			}
			
            function VentanaHistorial(emp){
                var obj = historial["obj_" + emp].ListaCancelacion.Items;				
				title = 'Historial de cancelación';
				var dialogName = 'dlg' + getNewUniqueId();
				var strHTML = "";
				var curYear = new Date().getFullYear();
				var MostrarMotivosCancelacion = false;
				<%If Not Intelexion.Framework.SystemFlags.SystemFlags.getValueById(8326) Is Nothing AndAlso Intelexion.Framework.SystemFlags.SystemFlags.getValueById(8326) = "4.0" Then%>
				 MostrarMotivosCancelacion = true;
				 width = 850;
				<%Else%>
				 width = 800;
				<%End If%>

				strHTML += "<div id='" + dialogName + "'>";
				strHTML += '<form id="dialogForm' + dialogName + '" action="#">';
				strHTML += '<div>';
				strHTML += '<div class="clearfix"></div>';
				strHTML += '<div class="anthemscroller anthemscroller' + dialogName + '" style="width: 750px;">';
                strHTML += '<div>';
                strHTML += '<table cellspacing="0" rules="all" border="1" style="border-collapse:collapse; width: 750px;">';
                strHTML += '<tbody>';
				if(MostrarMotivosCancelacion)
                 strHTML += '<tr><td class="headerTabla">Folio fiscal</td><td class="headerTabla">Estatus cancelación</td><td class="headerTabla">XML</td><td class="headerTabla">Motivo</td><td class="headerTabla">Descripcion motivo</td></tr>';
				else
				 strHTML += '<tr><td class="headerTabla">Folio fiscal</td><td class="headerTabla">Estatus cancelación</td><td class="headerTabla">XML</td></tr>';
                
				for(var x = 0; x < obj.length; x++){
                    strHTML += '<tr>';
                    
                    strHTML += '<td>';
                    strHTML += '<div>' + obj[x].FolioFiscal + '</div>';
                    strHTML += '</td>';

                    strHTML += '<td>';
                    switch(obj[x].EstatusCancelacion){
                        case '0':
                            strHTML += '<div><label>Por cancelar</label></div>';
                            break;
                        case '1':
                            strHTML += '<div><label>En proceso</label></div>';
                            break;
                        case '2':
                            strHTML += '<div><label>Cancelado</label></div>';
                            break;
                        case '3':
                            strHTML += '<div><label><a href="javascript: VentanaErrores(\'' + obj[x].IdEmpleado + '\', \'' + obj[x].FolioFiscal + '\')">Con error</a></label></div>';
                            break;
                        default:
                            strHTML += '<div></div>';
                            break;
                    }                    
                    strHTML += '</td>';

                    strHTML += '<td>';
                    if(obj[x].XMLCancelacion.length > 0){                    
                        //var params = obj[x].IdRazonSocial + '| |' + obj[x].IdTipoNominaAsig + '|' + obj[x].IdTipoNominaProc + '|' + obj[x].Anio + '|' + obj[x].Periodo + '|' + obj[x].IdEmpleado + '|' + obj[x].FolioFiscal;
                        //strHTML += '<div><a href="<%=Intelexion.Framework.ApplicationConfiguration.ConfigurationSettings.GetConfigurationSettings("ITXCFDIConnectorPath")%>ITXCFDIConnectorService.svc/XMLCancelacion/' + params + '">xml</a></div>';
						strHTML += '<div><a  onclick="DescargarXml(&apos;' + obj[x].FolioFiscal + '&apos;,1);">xml</a></div>';
                    }                    
                    strHTML += '</td>';
					if(MostrarMotivosCancelacion){
					  strHTML += '<td>';
                      strHTML += '<div><label>' + obj[x].IdMotivo + '</label></div>';
                      strHTML += '</td>';
					  
					  strHTML += '<td>';
                      strHTML += '<div><label>' + obj[x].MotivoDescripcion + '</label></div>';
                      strHTML += '</td>';
                    }
                    strHTML += '</tr>';
					
                }

                strHTML += '</tbody>';
                strHTML += '</table>';
                strHTML += '</div>'; // content
                strHTML += '</div>'; // listbox-full-width listbox

				
				strHTML += '</div>';
				strHTML += "<div class='botonArea'>";
				strHTML += '<input type="button" class="boton boton-nuevo" id="btnCancel' + dialogName + '" value="Cerrar" />';
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
                $("#" + dialogName).css('width', 'auto');
                $("#" + dialogName).css('min-height', '100px');
                $("#" + dialogName).css('height', 'auto');
                $("#" + dialogName).closest('div.ui-dialog', 'auto').css("height", "auto");
                $('#' + dialogName).closest('div').css('height', $('#' + dialogName).closest('div').height() + $('.anthemscroller' + dialogName).height());

				$("#btnCancel" + dialogName).click(function () {
					CancelarDialog("#" + dialogName);					
				});
            }
			
			function ConsultaEstatus(IdRazonConsulta, IdAsigConsulta, IdProcConsulta, AnioConsulta, PeriodoConsulta, status, IdAtributosConsulta){
				showWait();
				if(IdRazonConsulta == '' || IdAsigConsulta == '' || IdProcConsulta == '' || AnioConsulta == '' || PeriodoConsulta == ''){
					alert('Todos los campos son obligatorios');
					hideWait();
					return;				
				}		
				
				<%If Not Intelexion.Framework.SystemFlags.SystemFlags.getValueById(7336) Is Nothing AndAlso Intelexion.Framework.SystemFlags.SystemFlags.getValueById(7336) = "1" Then%>
				if(IdAtributosConsulta == '' && ObtenerInfCont == false){
					if(tablaCreada == 1){
						tablaCreada = 0;
						$('#gridNominas').dataTable().fnDestroy();
						$('#gridNominas').empty();
					}	
					alert('Debe de seleccionar al menos un atributo');
					hideWait();
					return;
				}
				<%End If%>
				
				var EstatusId = 0;
				var TipoLoteId = '';
				var args = {
					IdRazonSocial : IdRazonConsulta,
					IdTipoNominaAsig : IdAsigConsulta,
					IdTipoNominaProc : IdProcConsulta,
					Anio : AnioConsulta,
					Periodo : PeriodoConsulta,
					UserId: '<%=Context.Session("UID").replace("\", "\\")%>',
					IdAtributos: IdAtributosConsulta
				}
				showWait();
				jQuery.ajax({
					type: "POST",
					url: "<%=Intelexion.Framework.ApplicationConfiguration.ConfigurationSettings.GetConfigurationSettings("ITXCFDIConnectorPath")%>ITXCFDIConnectorService.svc/ConsultaEstatusIdFiltro",
					dataType: "json",
					data: JSON.stringify(args),
					contentType: "application/json; charset=utf-8",
					async: true,
					success: function (data) {						
						if(data.ConsultaEstatusIdFiltroResult){
							if(data.ConsultaEstatusIdFiltroResult.WithError){
								alert(data.ConsultaEstatusIdFiltroResult.ErrorMsg);
							}else{
								var idT = data.ConsultaEstatusIdFiltroResult.IdTransaction;
								/*EstatusId = idT.split('-')[0];
								TipoLoteId = idT.split('-')[1];								
								if( (EstatusId == '1' || EstatusId == '2') && TipoLoteId == 'TIMBRADO' ){															
									alert("El periodo se encuentra en proceso de timbrado");
								}*/
								Filtrar(IdRazonConsulta, IdAsigConsulta, IdProcConsulta, AnioConsulta, PeriodoConsulta, status, IdAtributosConsulta);
								hideWait();
								
								$('#tdUltimoIntento').text(idT);
								/*$('#EstatusTimbrado').val(EstatusId);
								$('#TipoLote').val(TipoLoteId);*/
							}
						}

						/*if( (EstatusId == '1' || EstatusId == '2') && TipoLoteId == 'TIMBRADO' ){
							ConsultaContinuaEstatus(IdRazonConsulta, IdAsigConsulta, IdProcConsulta, AnioConsulta, PeriodoConsulta, status, IdAtributos);
						}		*/				
						
					},
					error: function (xhr, textStatus, e) {
						//default error handler para funciones de AJAX
						//AjaxErrorHandler(xhr, textStatus, e);
						hideWait();
						alert('Error al consultar el estatus de la solicitud');
					}
				});					
			}
			
			function RevisarPdfEnProceso(idRazonSocialImprimir, idTipoNominaAsigImprimir, idTipoNominaProcImprimir, AnioImprimir, PeriodoImprimir, IdAtributos,extension){

                var fileName = idRazonSocialImprimir + '-' + idTipoNominaAsigImprimir + '-' + idTipoNominaProcImprimir + '-' + AnioImprimir + '-' + PeriodoImprimir + '-' + IdAtributos;
                var TituloDialogo = ""
				var mensajeAlerta = "El recibo PDF se está procesando";
				var IniciarProcesoReporte = false;				
				let isSendEmail = false; 

				switch (extension) {
				case "ZIP":
					TituloDialogo = "Generando Archivo ZIP";
					break;
				case "PDF":
					TituloDialogo = "Generando PDF";
					break;
				case "xlsx":
						TituloDialogo = "Generando reporte excel";
						mensajeAlerta = "El reporte excel se está procesando";
					break;
				case "email":
					TituloDialogo = "Preparando archivos"
					mensajeAlerta = "Los archivos se estan procesando";
					isSendEmail = true;
					extension = "ZIP";
					break;
				default:
    				TituloDialogo = "Regenerando PDF";
				}
                var args = {
                    fileName: fileName,
                    extension: extension
				}
				var urlEndPointDefault = "<%=Intelexion.Framework.ApplicationConfiguration.ConfigurationSettings.GetConfigurationSettings("ITXCFDIConnectorPath")%>ITXCFDIConnectorService.svc/RevisarPDFFull";
				if(extension == "xlsx"){
					urlEndPointDefault = "<%=Intelexion.Framework.ApplicationConfiguration.ConfigurationSettings.GetConfigurationSettings("ITXCFDIConnectorPath")%>ITXCFDIConnectorService.svc/RevisarReporte";
				}
				
				showWait();
				jQuery.ajax({
					type: "POST",
					url: urlEndPointDefault,
					data: JSON.stringify(args),
					contentType: "application/json; charset=utf-8",
					dataType: "json",
					async: true,
					success: function (data) {
						hideWait();
						debugger
						try {
							//pdfs
							if(data.RevisarPDFFullResult != null)
							 IniciarProcesoReporte = data.RevisarPDFFullResult;
							 //excel
							 if(data.RevisarReporteResult != null)
							 IniciarProcesoReporte = data.RevisarReporteResult;
						}
						catch (e) {
						IniciarProcesoReporte =false;
						}
						if(IniciarProcesoReporte == false){	
							extension = (isSendEmail == true) ? "email":extension;
                            IniciarProceso(TituloDialogo,fileName,extension);
						}else{
							alert(mensajeAlerta);
						}
					},
					error: function (xhr, textStatus, e) {
						//default error handler para funciones de AJAX
                        //AjaxErrorHandler(xhr, textStatus, e);
                        hideWait();
						alert('Error al consultar el recibo PDF');
					}
				});
            }

            function IniciarProceso(TituloDialogo,fileName,extension) {

                $("#dialogoCuerpo").css("display", "block");
				$('#DialogoPrincipal').dialog({ title: TituloDialogo,
				autoOpen: false, width: 450, resizable: false, modal: true,
				open: function( event, ui ) {
												
					GeneracionArchivosGlobales(fileName,extension);
				} 
				});                            
				$("#DialogoPrincipal").css('display', '');
				$("#DialogoPrincipal").dialog("open");
				$("#DialogoPrincipal").css('width', '93%');
				$("#DialogoPrincipal").css('min-height', '100px');
				$("#DialogoPrincipal").css('max-height', '100px');
                $("#DialogoPrincipal").css('height', '175px');
                $("#DialogoPrincipal").closest('div.ui-dialog', '175px').css("height","175px");
				$(".ui-dialog div").css("margin","auto");

            }
            function GeneracionArchivosGlobales(fileName,extension){	
				let isSendEmail = (extension == "email") ? true:false;
                var args = {
                    fileName: fileName,
                    extension: (extension == "email") ? "ZIP":extension
				}
                jQuery.ajax({
					type: "POST",
					url: "<%=Intelexion.Framework.ApplicationConfiguration.ConfigurationSettings.GetConfigurationSettings("ITXCFDIConnectorPath")%>ITXCFDIConnectorService.svc/GenerarArchivosGlobales",
					data: JSON.stringify(args),
					contentType: "application/json; charset=utf-8",
					dataType: "json",
					async: true,
					success: function (data) {
                        $("#DialogoPrincipal").dialog("close");
                        if (data.GenerarArchivosGlobalesResult == "") {
                            fileName = fileName + "-" + extension
                            if (extension != "PDFS" && !isSendEmail) {
                                document.location.href = '<%=Intelexion.Framework.ApplicationConfiguration.ConfigurationSettings.GetConfigurationSettings("ITXCFDIConnectorPath")%>ITXCFDIConnectorService.svc/ObtenerArchivos/' + fileName;
                            }
					   if(isSendEmail){
							let idRazonSocialImprimir = $("#btnEnviarCorreo").attr('attr-idrazonsocial');
							let idTipoNominaAsigImprimir = $("#btnEnviarCorreo").attr('attr-idtiponominaasig');
							let idTipoNominaProcImprimir = $("#btnEnviarCorreo").attr('attr-idtiponominaproc');
							let AnioImprimir = $("#btnEnviarCorreo").attr('attr-anio');
							let PeriodoImprimir = $("#btnEnviarCorreo").attr('attr-periodo');
							let idAtributosImprimir = $("#btnEnviarCorreo").attr('attr-IdAtributos');							
							EnviarCorreoListado(idRazonSocialImprimir, idTipoNominaAsigImprimir, idTipoNominaProcImprimir, AnioImprimir, PeriodoImprimir, idAtributosImprimir);
						}																		
                        } else {
                            alert(data.GenerarArchivosGlobalesResult);
                        }
                        
					},
					error: function (xhr, textStatus, e) {						
                         $("#DialogoPrincipal").dialog("close");
						alert('Error al consultar el recibo PDF');
					}
				});
            }

			function DescargarXml(FolioTimbrado,EsXmlCancelacion){
					  var FolioSplit = FolioTimbrado.split("|");
					  var Nombrexml = EsXmlCancelacion == 1 ? FolioTimbrado + ".xml" : FolioSplit[0]+ '-' + FolioSplit[1] + '-' + FolioSplit[2]+ '-' + FolioSplit[3]+ '-' + FolioSplit[4] + '-' + FolioSplit[5] + '.xml' ;
					  
					  var indexFolio = EsXmlCancelacion == 1 ? CadenaFoliosCancelacion.indexOf(FolioTimbrado) : CadenaFoliosTimbrado.indexOf(FolioSplit[6]) ;
					  const link = document.createElement("a");
					  link.href = "data:text/xml;charset=utf-8," + encodeURIComponent(EsXmlCancelacion == 1 ? CadenaXMLCancelacion[indexFolio] : CadenaXMLTimbrado[indexFolio]);					 
					  link.download = Nombrexml;
					  link.click();
					  document.body.removeChild(link);
					  delete link;
			};		
			
		</script>
		<div id="modalDialogArea" style="display:none;"></div>
	</body>
</html>
