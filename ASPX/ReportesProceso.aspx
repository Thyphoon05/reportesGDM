<%@ Page Language="vb" AutoEventWireup="false" Codebehind="ReportesProceso.aspx.vb" Inherits="Nomina.ReportesProceso" enableViewStateMac = "False"%>
<%@ Register TagPrefix="cc1" Namespace="Intelexion.Framework.View.UI.Controles" Assembly="Intelexion.Framework.View.UI.Controles" %>
<%@ Register TagPrefix="anthem" Namespace="Anthem" Assembly="Anthem" %>
<%@ Register TagPrefix="org" Namespace="Intelexion.Organizacion" Assembly="Intelexion.Organizacion" %>




<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>

	<HEAD>
		<title><%=Intelexion.Framework.SystemLabels.SystemLabels.getValueById(6284, Context.Session("LID"))%></title>
		<meta content="Microsoft Visual Studio.NET 7.0" name="GENERATOR">
		<meta content="Visual Basic 7.0" name="CODE_LANGUAGE">
		<meta content="JavaScript" name="vs_defaultClientScript">
		<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">		
		<LINK href='<%=Intelexion.Framework.ApplicationConfiguration.ConfigurationSettings.GetConfigurationSettings("ApplicationPath")%>/intelexion.css' type=text/css rel=stylesheet>		
		<link href='<%=Intelexion.Framework.ApplicationConfiguration.ConfigurationSettings.GetConfigurationSettings("ApplicationPath")+ "/CSS/50/quickTabs.css"%>' type='text/css' rel='stylesheet'/>
		<script language="javascript">
		    var path;
		    path = '<%=Intelexion.Framework.ApplicationConfiguration.ConfigurationSettings.GetConfigurationSettings("ApplicationPath")%>'
		    var shortDatePattern = '<%= Formato().toLower() %>'
		    var CarpetaTemp;
		    CarpetaTemp = '<%=Intelexion.Framework.ApplicationConfiguration.ConfigurationSettings.GetConfigurationSettings("ArchivosTemporales")%>'
		</script>		
		<style type="text/css">

		    label{float:left;
		       display:block;}

		    /*alinea el boton del mensaje de error*/
		   .errButtonArea { text-align:right !important; }
			   
		</style>
	


		<script language="javascript" src='<%=Intelexion.Framework.ApplicationConfiguration.ConfigurationSettings.GetConfigurationSettings("PathJS")+"/Validacion.aspx"%>'></script>
		<script language="javascript" type="text/javascript" src='<%=Intelexion.Framework.ApplicationConfiguration.ConfigurationSettings.GetConfigurationSettings("ApplicationPath")%>/Calendario/popcalendar.js'></script>
		<link href='<%=Intelexion.Framework.ApplicationConfiguration.ConfigurationSettings.GetConfigurationSettings("ApplicationPath")+ "/CSS/50/filtroAtributos.css"%>' type='text/css' rel='stylesheet'/>
		<script language="javascript">
		    var Empleados = true;
		    var processCommand = "";
		    function Cambia_Reporte() {
		        val = parseInt($("#ListaReportes").val());
		        
		        $("#IdTipoNominaAsig").val(0);
		        $("#IdTipoNominaProc").val(0);
		        $("#Periodo").val(0);
		        $("#IdLugarPago").val(0);
		        $("#idTipoPersona").val(0);		        
		        $("#idTarjeta").val(0);
                $("#idPais").val(0);
                $("#idEstado").val(0);
                $("#idMunicipio").val(0);
                $("#idFormaPago").val(0); 
                $("#FechaPedido").val("");
		        $("#FechaDispersion").val("");	
		         $("#IdEmpleado").val("");
                $("#Nombre").val("");   
                $("#FechaDesde").val("");
                $("#FechaHasta").val("");
//                 Multibanco SIP
                $("#idBanco").val(0);
                
                
  
                $("#divTipoNominaAsig").css("display", "none");
                $("#divTipoNominaProc").css("display", "none");
                $("#divPeriodo").css("display", "none");
                $("#divEmpleado").css("display", "none");
                $("#divMsgRecibo").css("display", "none");
                
//                 Multibanco SIP
                $("#divBanco").css("display", "none");
                
                $("#divTodos").css("display", "none");
                $("#divMultiEmpleados").css("display", "none");
				$("#divMultiEmpleados2").css("display", "none");
                $("#LugarPago").css("display", "none");
                $("#divPeriodoDesdeHasta").css("display", "none");   
				$("#divPeriodoDesdeHasta2").css("display", "none");   				
                $("#divTarjetaProducto").css("display", "none");
		        $("#divCentroCosto").css("display", "none");
		        $("#divTIPO").css("display", "none");
		        $("#divSubPeriodo").css("display", "none");		        			        
		        $("#divConcepto").css("display", "none");
		        $("#divFolioDesdeHasta").css("display", "none");
				$("#divFolioDesdeHasta2").css("display", "none");
		        $("#divTipoPoliza").css("display", "none");
		        $("#divTipoArchivo").css("display", "none");
		        $("#divRangoMeses").css("display", "none");
		        $("#divFechaDesde").css("display", "none");
		        $("#divFechaHasta").css("display", "none");
		        $("#divAtributosPosicion").css("display", "none");
		        $("#divRegistrosPatronales").css("display", "none");
		        $("#divTipoArchivoSUA").css("display", "none");		      		       	        
		        $("#divTipoPersona").css("display", "none");		      
		        $("#divFechaPedido").css("display", "none");		      		       	        
		        $("#divTarjeta").css("display", "none");		       
		        $("#divConceptoPolizaContable ").css("display","none");
		        $("#divFechaDispersion").css("display","none");
                $(".divFormaPago").css("display", "none");                
                $("#btnEnviar").css("display", "none");
	            $("#btnEnviar").closest("span.boton-wrap-left").css("display", "none");
	            $("#btnEnviar").closest("span.boton-wrap-right").css("display", "none");
	            $("#FiltrosPolizaFiniquitosMasiva").css("display","none");
				$("#divTipoMovimiento").css("display", "none");
	            
	            $("#divFiniquitosMasivo").css("display","none");
//	            $("#btnSeleccionarTodos").css("display","none");
//	            $("#btnDesSeleccionar").css("display","none"); 
		         TipoExportacionIcono();
		         
		        switch (val) {		           
		            case 1:
		            case 2:
		            case 3:
		            case 4:
		            case 6:
		            case 7:
		            case 8:
		            case 9:
		            case 10:
		            case 11:
		            case 12:
		            case 13:
		            case 14:
		            case 15:
		                $("#divTipoNominaAsig").css("display", "");
		                $("#divTipoNominaProc").css("display", "");
		                $("#divPeriodo").css("display", "");
		             <%If Not Intelexion.Framework.SystemFlags.SystemFlags.getValueById(10117) Is Nothing AndAlso Intelexion.Framework.SystemFlags.SystemFlags.getValueById(10117) = "1" Then%>    
		                $("#btnEnviar").css("display", "inline");
			            $("#btnEnviar").closest("span.boton-wrap-left").css("display", "inline");
			            $("#btnEnviar").closest("span.boton-wrap-right").css("display", "inline");
					<%End If%>
		            break;
		            case 16:		               
		            case 17:		                
		            case 18:		                
		            case 19:		                
		            case 20:
		            case 21:		               		               		               
		            case 22:
		            case 24:		              		                
		            case 25:		                
		            case 26:		            		                
		            case 27:
		            case 29:
		             case 35: /*MOVIMIENTOS FONDO AHORRO BANORTE*/		             
		            case 36:		               
		            case 37:		               
		            case 38:		             
		            case 39:		           
		            case 40:		           
		            case 41:		               
		            case 42: /*Lista de Asistencia*/		          
		            case 43: /*Poliza Contable Solomon*/		             
		            case 44:  /*Layout Dispersion BAJIO*/		               
		            case 45:  /*Poliza Contable ARA*/		              
		            case 46:  /*Layout Dispersion Bancomer (Cash Windows)*/
		            case 50:  /*Layout Confirmación Odessa*/		            
		            case 51:  /*Layout HSBC Via Empresarial*/		              
		            case 52:  /*Layout Dispersion BANORTE Formato Integrado*/		               
		            case 53:  /*Poliza Contable Dynamics*/		               
		            case 54:  /*Layout Dispersion BANCOMER BPR*/
		            case 55:  /*Layout Contabilidad Integer*/
		            case 57:  /*Layout HSBC Jhonson*/		               
		            case 58: /*Layout BANAMEX TEF/INTELAR*/
		            case 60:  /*Poliza Contable Oracle*/		            
		            case 61: /*Layout Bancomer CashWindows Version 7.8.0*/		               
		            case 62: /*Layout Dispersion AFIRME*/		               
		            case 63: /*Layout Dispersion BANREGIO*/		                
		            case 64: /*Reporte Contable ORACLE*/		             
		            case 65: /*Reporte Contable LMX*/		          
		            case 66: /*Reporte Contable Datasul*/
		            case 68: /*Layout SiVale Electronico*/		         
		            case 69: /*Layout SiVale Papel*/		            
		            case 70: /*Layout Dispersion BANAMEX D*/		              
		            case 71: /*Layout Dispersion BANAMEX B*/		          
		            case 72: /*Layout Depositos Vales Sodexo*/		              
		            case 73: /*Layout Poliza Contable Baan 4*/		              
		            case 74: /*Layout Poliza Contable Baan 6*/
		            case 76: /*Reporte Contable Oracle AP*/		              
		            case 77: /*Layout Dispersión Bancaria Tradicional HSCB -GSS*/		              
		            case 78: /*Layout Dispersión Interbancaria HSCB - GSS*/		               
		            case 79: /*Layout Dispersión Tradicional Santander - GW*/		             
		            case 80: /*Layout Dispersión HSBC_EUK*/		              
		            case 81: /*Layout Dispersión Bancomer NetCash*/		              
		            case 83: /*Layout Dispersión Bancomer NetCash 108*/		               
		            case 84: /*ListadoContableGP*/		            
		            case 85: /*ListadoContableGPProv*/		              
		            case 86: /*Reporte_InterfazContableNavision*/		           
		            case 87: /*Reporte_InterfazValesDespensaEfectivale*/		              
		            case 88: /*Listado Pago Outsourcing*/		           
		            case 89: /*LayoutFondoAhorroBanorteAPORTACIONES*/		             
		            case 90: /*LayoutFondoAhorroBanorteBAJAS*/		              
		            case 91: /*LayoutFondoAhorroBanortePAGOPRESTAMOS*/		            
		            case 92: /*LayoutFondoAhorroBanorteRETIROS*/		             
		            case 93: /*LayoutFondoAhorroBanorteAltas*/		              
		            case 94: /*LayoutDepositosPorLugarDeTrabajoPorBanco*/		              
		            case 95: /*Layout Dispersion AFIRME GNL*/
		            case 99: /*PolizaContableAL*/		               
		            case 100: /*PolizaContableProvisionesAL*/
		            case 103: /*Por Manuel Alberto: Reporte Centro de Costos 26-Feb-2013*/		               
		            case 105: /*Por Manuel Alberto: Póliza Contable Forth Shift 27-Feb-2013*/		                
		            case 106: /*Por Manuel Alberto: Reporte de Cifras de Nómina(05-Abr-2013)*/
		            case 122: /*Layout de Creditos Out */
					case 137: /*Layout Dispersión Otros Bancos*/
                    case 145:/*Layot Dispersion SCOTIABANK[FIBRA INN]*/
		            case 139: /*Layout Dispersion HSBC (Asia - Pacific)*/
		            case 140: /*Reporte Payroll Run*/
		            case 141: /*Reporte Time Sheet*/	
		            case 143: /*Reporte Payroll Detail*/
		            case 150: /*Interfaz Fondo Ahorro Aportaciones*/
		                $("#divTipoNominaAsig").css("display", "");
		                $("#divTipoNominaProc").css("display", "");
		                $("#divPeriodo").css("display", "");
					break;								
					case 144:/*Transferencias Nómina*/
		                $("#divTipoNominaAsig").css("display", "");
		                $("#divTipoNominaProc").css("display","");
		                $("#divRangoMeses").css("display","none");//jas
		                $("#lblMesDesde").css("display","none");
		                $("#mesDesde").css("display","none");
		                $("#lblMesHasta").css("display","none");
		                $("#mesHasta").css("display","none");		                
		                $("#lblPeriodo").css("display","");
		                $("#divPeriodo").css("display", "");		                
		                $("#divEmpleado").css("display","none");
		                $("#divFormato").css("display","");//jas
		               break;	
                    case 146: /*Layout Dispersion Loyal Bank (UK) - LD*/
		            case 138: /*Layout Vales de Despensa*/	
		                $("#divTipoNominaAsig").css("display", "");
		                $("#divTipoNominaProc").css("display", "");
		                $("#divPeriodo").css("display", "");
		                <%If Not Intelexion.Framework.SystemFlags.SystemFlags.getValueById(4987) is Nothing AndAlso Intelexion.Framework.SystemFlags.SystemFlags.getValueById(4987) = "1" Then%> 
		                $("#divAtributosPosicion").css("display", "");	    		      
		                <%End if %>          		               		              		               
		                break;	
		            case 52:  /*Layout Dispersion BANORTE Formato Integrado*/    	          		                
                        $("#divTipoNominaAsig").css("display", "");
		                $("#divTipoNominaProc").css("display", "");
		                $("#divPeriodo").css("display", "");	
		                <%if Not Intelexion.Framework.SystemFlags.SystemFlags.getValueById(4941) Is Nothing AndAlso Intelexion.Framework.SystemFlags.SystemFlags.getValueById(4941) = "1" %>
		                $("#divAtributosPosicion").css("display", "");	                		               		              		              
		                <%End If %> 
		                break;      	          		                

						
						
		            case 5:
		                $("#divTipoNominaAsig").css("display", "");
		                $("#divTipoNominaProc").css("display", "");
		                $("#divPeriodo").css("display", "");			                
		                $("#divEmpleado").css("display", "");		                
		                $("#divMsgRecibo").css("display", "");
		                $("#divTodos").css("display", "");			               		              		                
		                break;	
		                	           		           		           		               
		            case 23:
		                $("#divTipoNominaAsig").css("display", "");
		                $("#divTipoNominaProc").css("display", "");
		                $("#divPeriodo").css("display", "");
		                $("#divFolioDesdeHasta").css("display", "");	
						$("#divFolioDesdeHasta2").css("display", "");	
		                break;	
		                	       
		            case 28:		               		            		                
		            case 30:		              
		            case 31:		                
		            case 32:		              
		            case 33: /*BANORTE ALTAS*/		            
		            case 34: /*ALTAS SKANDIA*/
		                $("#divTipoNominaAsig").css("display", "");
		                $("#divMultiEmpleados").css("display", "");
						$("#divMultiEmpleados2").css("display", "");
		                break;		                
		         
		            case 47:  /*Layout Dispersion HSBC Gerentes Empleados*/		              
		            case 48:  /*Layout Dispersion HSBC Gerentes Terceros*/		               
		            case 49:  /*Layout Poliza Contable Solomon 7*/
		                $("#divTipoNominaAsig").css("display", "");
		                $("#divTipoNominaProc").css("display", "");
		                $("#divPeriodo").css("display", "");		               
		                $("#divMultiEmpleados").css("display", "");
						$("#divMultiEmpleados2").css("display", "");		                
		                break;
		                
		            case 56:  /*Layout Contabilidad SAP*/
		                $("#divTipoNominaAsig").css("display", "");
		                $("#divTipoNominaProc").css("display", "");
		                $("#divPeriodo").css("display", "");
		                $("#divEmpleado").css("display", "");		              
		                $("#LugarPago").css("display", "");		              		                		              
		                break;
		                
		            case 59: /*Reporte Proyeccion Nomina*/
		                $("#divTipoNominaAsig").css("display", "");
		                $("#divTipoNominaProc").css("display", "");
		                $("#divCentroCosto").css("display", "");
		                $("#divPeriodoDesdeHasta").css("display", "");	
					    $("#divPeriodoDesdeHasta2").css("display", "");							
		                break;
		                		                
		            case 64: //Poliza contable SAP R3
		                $("#divTipoNominaAsig").css("display", "");
		                $("#divTipoNominaProc").css("display", "");
		                $("#divEmpleado").css("display", "none");
		                $("#lblPeriodo").css("display", "");
		                $("#divPeriodo").css("display", "");
		                $("#Periodo").css("display", "");
		                $("#divConcepto").css("display", "none");
		                $("#divPeriodoDesdeHasta").css("display", "none");
						$("#divPeriodoDesdeHasta2").css("display", "none");
		                $("#LugarPago").css("display", "none");
		                $("#divMultiEmpleados").css("display", "none");
						$("#divMultiEmpleados2").css("display", "none");
		                break;

		            case 67: /*Reporte Proyeccion Nomina Resumen*/
		                $("#divTIPO").css("display", "");
		                $("#divPeriodo").css("display", "");
		                $("#divCentroCosto").css("display", "");
		                break;
		                		            
		            case 75: /*Layout Poliza Contable Baan 6*/
		                $("#divTipoNominaAsig").css("display", "");
		                $("#divTipoNominaProc").css("display", "");
		                $("#divPeriodo").css("display", "");
		                $("#divConcepto").css("display", "");
		                break;
		                		            		               
		            case 96: /*Reporte Sobregiros de  Nomina*/
		                $("#divTipoNominaAsig").css("display", "");
		                $("#divTipoNominaProc").css("display", "");
		                $("#divEmpleado").css("display", "");
		                $("#divPeriodoDesdeHasta").css("display", "");	
						$("#divPeriodoDesdeHasta2").css("display", "");
		                break;
		                   
		            case 101: /*Poliza Contable ALIX*/
		            case 102: /*Poliza Contable ALIX Previa*/
		                $("#divTipoNominaAsig").css("display", "");
		                $("#divTipoNominaProc").css("display", "");
		                $("#divPeriodo").css("display", "");
		                $("#divTipoPoliza").css("display", "");		                	                		                
		                break;		                		            		               		           
		               
		            case 107: /*Por Manuel Alberto: Layout de Préstamo Fondo de Ahorro Banorte(08-Abr-2013)*/
		            		              
		            case 108: /*Por Manuel Alberto: Layout Caja de Ahorro Banorte (09-Abr-2013)*/		               
		            case 109: /*Por Manuel Alberto: Layout Fondo de Ahorro Banorte (10-Abr-2013)*/		              
		            case 110: /*Por Manuel Alberto: Layout Caja de Ahorro Banorte (10-Abr-2013)*/
		                $("#divTipoNominaAsig").css("display", "");
		                $("#divTipoNominaProc").css("display", "");
		                $("#divPeriodo").css("display", "");
		                $("#divTipoPersona").css("display", "");
		                break;
		                
		            case 111: /*Por Manuel Alberto: Layout Pedido de saldos(10-Abr-2013)*/
		            case 112:
		            case 113:
		            case 114:
		                $("#divTipoNominaAsig").css("display", "");
		                $("#divTipoNominaProc").css("display", "");
		                $("#divPeriodo").css("display", "");
		                $("#divFechaPedido").css("display", "");

		                //$("#divTarjeta").css("display", "");		                		                               
		                break;

		            //* GEGB 05082013
		            case 115: //Pedido de tarjetas		             
		            //* GEGB 05082013 
		            case 116: //Pedido de tarjetas
		                $("#divTipoNominaAsig").css("display", "");
		                $("#divTipoNominaProc").css("display", "");		               		                		               
		                $("#divTarjetaProducto").css("display", "");			                
		                break;
    
		            //* Gerardo Jaime 09012014 
		            case 119: //Póliza Contable por Concepto
		                $("#divTipoNominaAsig").css("display", "");
		                $("#divTipoNominaProc").css("display", "");
		                $("#divPeriodo").css("display", "");		                		                		                
		                $("#divConceptoPolizaContable ").css("display","");
		                	
		                $("#btnEnviar").css("display", "inline");
			            $("#btnEnviar").closest("span.boton-wrap-left").css("display", "inline");
			            $("#btnEnviar").closest("span.boton-wrap-right").css("display", "inline");    			                
		                break;
		                
		            case 118: //Poliza Contable Nomina Individual
		                $("#divTipoNominaAsig").css("display", "");
		                $("#divTipoNominaProc").css("display","");
		                $("#divPeriodo").css("display","");		                		                
		                $("#divEmpleado").css("display","");
		               	                
		                $("#btnEnviar").css("display", "inline");
			            $("#btnEnviar").closest("span.boton-wrap-left").css("display", "inline");
			            $("#btnEnviar").closest("span.boton-wrap-right").css("display", "inline");   
			            $(".divFormaPago").css("display", ""); 				            
		                break;
		            
		             case 117: //Poliza Contable Anticipo de Sueldo
		                $("#divTipoNominaAsig").css("display", "");
		                $("#divTipoNominaProc").css("display","");
		                $("#divPeriodo").css("display","");		                		                
		                $("#divEmpleado").css("display","");
		                		                	 
		                $("#btnEnviar").css("display", "inline");
			            $("#btnEnviar").closest("span.boton-wrap-left").css("display", "inline");
			            $("#btnEnviar").closest("span.boton-wrap-right").css("display", "inline");     			             
		                break;
		                
		            case 120: /*BANORTE ALTAS*/
		            case 125: /*Reporte vales de despensa Adicionales Excel*/
		            case 126: /*Reporte vales de despensa Bajas Excel*/
		            case 127: /*Reporte vales de despensa Reposicion Excel*/



		            case 128: /*Reporte vales de despensa Stock Excel*/
		            case 129: /*Reporte vales de despensa Titulares Excel*/	

		                 $("#divTipoNominaAsig").css("display", "");
		                break; 
		             
		            case 121: /*BANORTE Banorte A/B cuentas de terceros */
		                $("#divTipoNominaAsig").css("display", "");
		                $("#divRangoFechas").css("display", "");
		                $("#divAtributosPosicion").css("display", "");		               
		                break;       
		                		                
		            case 123: /*Reporte de Cuotas Obrero Patronales*/
		                $("#divTipoNominaAsig").css("display", "");
		                $("#divRangoFechas").css("display", "");
		                $("#divRegistrosPatronales").css("display", "");		                	                		               		                
		                break;             
		                
		            case 124: /*Exportar Archivo SUA a Excel*/		               
		                $("#divRegistrosPatronales").css("display", "");
		                $("#divTipoArchivoSUA").css("display", "");		                
		                break;   
		                		             	            		                		                		                		               		              		                
		            case 130: /*Reporte vales de despensa dispersion Excel*/	
		                $("#divTipoNominaAsig").css("display", "");
		                $("#divPeriodo").css("display", "");
		                $("#divFechaDispersion").css("display", "");		                	                		                		                               		                
		               break;                           
                            
                     case 131: /*Poliza Contable Nomina Finiquitos Masiva*/	
		                $("#divTipoNominaAsig").css("display", "");
		                $("#divPeriodo").css("display", "");
		               	$("#divTipoNominaProc").css("display","");
		               	$("#FiltrosPolizaFiniquitosMasiva").css("display","");		               		                              			               			               
		               break;   
		                   
		             case 132: /*Alta Incidencia Vacaciones*/
		                $("#divTipoNominaAsig").css("display", "");
		                $("#divPeriodo").css("display", "");
		               	$("#divTipoNominaProc").css("display",""); 		                   
		                break;   
		                
		             case 133:/*Alta Vales de Despensa EcoVale*/
		                $("#divTipoNominaAsig").css("display", "");
		                break;

					case 134:/*Póliza de Nómina*/
		                $("#divTipoNominaAsig").css("display", "");
		                $("#divTipoNominaProc").css("display", "");
		                $("#divPeriodo").css("display", "");
		                
		                $("#btnEnviar").css("display", "inline");
			            $("#btnEnviar").closest("span.boton-wrap-left").css("display", "inline");
			            $("#btnEnviar").closest("span.boton-wrap-right").css("display", "inline"); 
                        break;
//		                
		            case 135:/*Póliza de Hoteles*/
		                $("#divTipoNominaAsig").css("display", "");
		                $("#divTipoNominaProc").css("display", "");
		                $("#divPeriodo").css("display", "");
		                
		                $("#btnEnviar").css("display", "inline");
			            $("#btnEnviar").closest("span.boton-wrap-left").css("display", "inline");
			            $("#btnEnviar").closest("span.boton-wrap-right").css("display", "inline"); 
		                break;
  
		                
		             case 136:/*Layout de dispersion Fondo de Ahorro - ACTINVER*/
		                $("#divTipoNominaAsig").css("display", "");
		                $("#divPeriodo").css("display", "");
		               	$("#divTipoNominaProc").css("display","");
		                break;   
		                      
		            case 142: /*Reporte Sobregiros de  Nomina*/
		                $("#divRegistrosPatronales").css("display", "");
		                $("#divRangoFechas").css("display", "");
		                $("#divTipoMovimiento").css("display", "");
		                break;
		                
                    case 147: /*Layout Vales SODEXO Excel*/
                        $("#divTipoNominaAsig").css("display", "");
		                $("#divPeriodo").css("display", "");
		               	$("#divTipoNominaProc").css("display","");
		                break;
		            case 148: /*Layout Dispersión BANAMEX Prestamos*/
                        $("#divTipoNominaAsig").css("display", "");
		                $("#divPeriodo").css("display", "");
		               	$("#divTipoNominaProc").css("display","");
		                break;	
                    
		            case 149: 
		                $("#divTipoNominaAsig").css("display", "");
		                $("#divRangoFechas").css("display", "");
		                $("#divMultiEmpleados").css("display", "");
						$("#divMultiEmpleados2").css("display", "");
                        Limpiargrid();
		                break;
		            case 151:/*Contabilidad SAP CIESA*/
		                $("#divTipoNominaAsig").css("display", "");
		                $("#divTipoNominaProc").css("display","");		                
		                $("#lblPeriodo").css("display","");
		                $("#divPeriodo").css("display", "");    
		                break;
		            case 152:
		                 $("#divRangoMeses").css("display", "");
		                 $("#divTipoNominaAsig").css("display", "");
		                 $("#divTipoNominaProc").css("display","");
		                 $("#divAtributosPosicion").css("display", "");	
                        break;     		        
                     case 155://Poliza Contable OMA-SAP
		                  $("#divTipoNominaAsig").css("display", "");
		                  $("#divTipoNominaProc").css("display", "");
		                  $("#divPeriodo").css("display", "");
		                break;  
                    case 156: /*Layout en XML para pagos programados*/
		                $("#divTipoNominaAsig").css("display", "");
		                $("#divTipoNominaProc").css("display", "");
		                $("#divPeriodo").css("display", "");
		                $("#divFechaPago").css("display", "");
	                    $("#divHoraAplicacion").css("display","");
		                
						$("#btnEnviar").css("display", "inline");
			            $("#btnEnviar").closest("span.boton-wrap-left").css("display", "inline");
			            $("#btnEnviar").closest("span.boton-wrap-right").css("display", "inline");
						
						break;
                    case 157:/*Póliza de Nómina FMC*/
                        $("#divTipoNominaAsig").css("display", "");
                        $("#divTipoNominaProc").css("display", "");
                        $("#divPeriodo").css("display", "");

                        $("#btnEnviar").css("display", "inline");
                        $("#btnEnviar").closest("span.boton-wrap-left").css("display", "inline");
                        $("#btnEnviar").closest("span.boton-wrap-right").css("display", "inline");
                        break;
                    
		            // Layouts nuevos Ecovale, Sivale
		            case 100012: //LayoutGenerico
		            case 100013: //LayoutGenerico
		                $("#divTipoNominaAsig").css("display", "");
		                $("#divTipoNominaProc").css("display","");
		                //document.all("divPeriodo").style.display = "";
		                $("#lblPeriodo").css("display","");
		                $("#Periodo").css("display","");		                
		                break;

		            case 100090: //Reporte de Prestamos Edenred
		                $("#divTipoNominaAsig").css("display", "");
		                $("#divTipoNominaProc").css("display","");
		                $("#divEmpleado").css("display","");
		                $("#divPeriodo").css("display", "");
		                $("#lblPeriodo").css("display","");
		                $("#Periodo").css("display","");		                
		                $("#divConcepto").css("display", "");
		                break;
		            case 100091: //Dispersion HSBC Edenred
		                $("#divTipoNominaAsig").css("display", "");
		                $("#divTipoNominaProc").css("display","");
		                $("#divEmpleado").css("display","none");
		                $("#lblPeriodo").css("display","");
		                $("#divPeriodo").css("display", "");
		                $("#Periodo").css("display","");		                
		                $("#divConcepto").css("display", "none");
		                $("#divBanco").css("display","");
		                break;
		            case 100092: //Alta de Cuentas HSBC Edenred
		                $("#divTipoNominaAsig").css("display", "none");
		                $("#divTipoNominaProc").css("display","none");
		                $("#divEmpleado").css("display","none");
		                $("#lblPeriodo").css("display","none");
		                $("#divPeriodo").css("display", "none");
		                $("#Periodo").css("display","none");		                
		                $("#divConcepto").css("display", "none");
		                break;
					case 100005: // DLL ALIATEC MHZ Reporte Timbrado
							$("#divTipoNominaAsig").css("display", "");
							$("#divTipoNominaProc").css("display","");
							$("#lblPeriodo").css("display","");
							$("#divPeriodo").css("display", "");
							$("#Periodo").css("display","");
							
		                break;
		            case 101006: //LAYOUT VALES DESPENSA SODEXO TTQ
		                $("#divTipoNominaAsig").css("display","");
						$("#divTipoNominaProc").css("display","");
		                $("#divPeriodo").css("display", "");		                	                		                		                               		                
		               break;
					   
					    case 500001: //Vales de despensa Edenred
		             	$("#divTipoNominaAsig").css("display","");
						$("#divTipoNominaProc").css("display","");
		                $("#divPeriodo").css("display", "");
						$("#periodosCerradosAliatec").val(0);	
						//$("#divRangoMeses").css("display","block");//jas
		                //$("#lblMesDesde").css("display","none");
						//$("#mesDesde").css("display","none");
						//$("#lblMesHasta").css("display","none");
						//$("#mesHasta").css("display","none");
						$("#btnEnviar").closest("span.boton-wrap-left").css("display", "inline");
						$("#btnEnviar").closest("span.boton-wrap-right").css("display", "inline"); 		 		                	                		                		                               		                                	                		                		                               		                
		               break;
					   
					 case 500002: //PolizaContable 
		             	$("#divTipoNominaAsig").css("display","");
						$("#divTipoNominaProc").css("display","");
		                $("#divPeriodo").css("display", "");
						$("#periodosCerradosAliatec").val(2);	
						//$("#divRangoMeses").css("display","block");//jas
		                //$("#lblMesDesde").css("display","none");
						//$("#mesDesde").css("display","none");
						//$("#lblMesHasta").css("display","none");
						//$("#mesHasta").css("display","none");
						$("#btnEnviar").closest("span.boton-wrap-left").css("display", "inline");
						$("#btnEnviar").closest("span.boton-wrap-right").css("display", "inline"); 	 		                	                		                		                               		                                	                		                		                               		                
		               break;
					   
					   	case 500003: //Reporte de Costos 
		             	$("#divTipoNominaAsig").css("display","none");
						$("#divTipoNominaProc").css("display","none");
		                //$("#divPeriodo").css("display", "");
						//$("#periodosCerradosAliatec").val(2);	
						$("#divRangoMeses").css("display","block");//jas
		                $("#lblMesDesde").css("display","");
						$("#mesDesde").css("display","");
						//$("#lblMesHasta").css("display","");
						//$("#mesHasta").css("display","");
						$("#btnEnviar").closest("span.boton-wrap-left").css("display", "inline");
						$("#btnEnviar").closest("span.boton-wrap-right").css("display", "inline"); 	 		                	                		                		                               		                                	                		                		                               		                
		               break;

	 case 500004:/*ReporteMovimientosImss*/
		                $("#divTipoNominaAsig").css("display", "");
		                $("#divTipoNominaProc").css("display","");
		                $("#divRangoMeses").css("display","");//jas
		                $("#lblMesDesde").css("display","");
		                $("#mesDesde").css("display","");
		                $("#lblMesHasta").css("display","");
		                $("#mesHasta").css("display","");		                
		               break;
				   
					case 500006:/*Reporte UUID*/
		               $("#divTipoNominaAsig").css("display","");
						//$("#divTipoNominaProc").css("display","");
		                //$("#divPeriodo").css("display", "");
						//$("#periodosCerradosAliatec").val(2);	
						$("#divRangoMeses").css("display","");//jas
		                $("#lblMesDesde").css("display","");
		                $("#mesDesde").css("display","");
		                $("#lblMesHasta").css("display","");
		                $("#mesHasta").css("display","");	
						$("#btnEnviar").closest("span.boton-wrap-left").css("display", "inline");
						$("#btnEnviar").closest("span.boton-wrap-right").css("display", "inline"); 				                
		               break;   
					 
					case 500007:/*Reporte UUID*/
		                $("#divTipoNominaAsig").css("display","");
						$("#divTipoNominaProc").css("display","");
		                $("#divPeriodo").css("display", "");
						$("#periodosCerradosAliatec").val(2);
		                $("#divEmpleado").css("display","");	
					   break; 
					   
					case 500008:/*Reporte UUID*/
						$("#divFechaDesde").css("display", "");
						$("#divFechaHasta").css("display", "");
					   break;   					   
					   
		            default: ;
		        }
		    }
		    
		    function Limpiargrid() {
		    //debugger;
		        var grid = $("#gridEmpleados")[0];
			    var n = grid.rows.length;
		        
		        for (i = n-1; i > 0; i--) {
		            grid.deleteRow(i);
		        }
		    }
		    
		    function TipoExportacionIcono(){
                var reporte = parseInt($("#ListaReportes").val());
                $("#Archivo").attr("href","");
                
                if (reporte == 142 ){             
                    $("#muestraDialogo").attr("title",'Mostrar Texto ')
                    $("#ui-dialog-title-muestraDialogo").text('Mostrar Texto');                            
                    $("#imgArchivo").attr("src", path + '/UI/50/images/icons/documents-text.png'); 
                                                     
                    try{
                        parent.window.document.getElementById("imgArchivo").src = path +  '/UI/50/images/icons/documents-text.png';                                                      
                        parent.window.document.getElementById("imgArchivo").style.display = 'block' ;                     
                        parent.window.document.getElementById("imgArchivo").alt = 'Exportar' ;                        
                    }catch(err){
                    }
                }  
                else{
                    $("#ui-dialog-title-muestraDialogo").text('<%=Intelexion.Framework.SystemLabels.SystemLabels.getValueById(812, Context.Session("LID"))%>');
                    $("#imgArchivo").attr("src", path + '/UI/50/images/icons/document-excel-csv.png');
                        
                    try{
                        parent.window.document.getElementById("imgArchivo").src = path + '/UI/50/images/icons/document-excel-csv.png';
                        parent.window.document.getElementById("imgArchivo").alt = ' Exportar a Excel ' ;
                    }catch(err){
                    }  
                }  
            }
		    
		    function obtenTipoNominaPoliza(){		        
		        var TipoPoliza = ''
		        var idAccion  = 0;
		        val = parseInt($("#ListaReportes").val());
		        switch (val) {
		                case 119:
		                    TipoPoliza = 'CON'//Póliza Contable por Concepto
		                    <%If Intelexion.Framework.Security.PermissionV4Check.tienePermiso(2579, DirectCast(Context.Session.Item("usuario"), Intelexion.Inventario.Entities.Persona).idPersona) Then %>
		                    idAccion = <%=htTiposReporte.Item("119") %>;
		                    <%End If %>
		                    break;
		                case 118:
		                    TipoPoliza = 'FIN'//Póliza Contable Nómina Individual: Finiquitos
		                    <%If Intelexion.Framework.Security.PermissionV4Check.tienePermiso(2580, DirectCast(Context.Session.Item("usuario"), Intelexion.Inventario.Entities.Persona).idPersona) Then %>
		                    idAccion = <%=htTiposReporte.Item("118") %>;
		                    <%End If %>
		                    break;
		                case 117:
		                    TipoPoliza = 'ANT'//Póliza Contable Nómina Individual: Anticipos de Sueldo
		                    <%If Intelexion.Framework.Security.PermissionV4Check.tienePermiso(2578, DirectCast(Context.Session.Item("usuario"), Intelexion.Inventario.Entities.Persona).idPersona) Then %>
		                    idAccion = <%=htTiposReporte.Item("117") %>;
		                    <%End If %>
		                    break;
		                case 131:
		                    TipoPoliza = 'MSV'//Póliza Contable Nómina Finiquitos MASIVA
		                    <%If Intelexion.Framework.Security.PermissionV4Check.tienePermiso(2627, DirectCast(Context.Session.Item("usuario"), Intelexion.Inventario.Entities.Persona).idPersona) Then %>
		                    idAccion = <%=htTiposReporte.Item("131") %>;
		                    <%End If %>
		                    break;			                		                        	                
		                default://no es ninguna opcion de Poliza Contable, se carga info default
		                    TipoPoliza = 'DEF';
		                    
		        }
                if (TipoPoliza != ''){
//                  showWait();
                  Anthem_InvokePageMethod(
							    'ObtenTipoNominaPorPoliza',
									[TipoPoliza,idAccion],
							    function(result) {	
							        $("#IdTipoNominaProc").attr("disabled", "disabled");						    
//							        hideWait();								        						               
							    }
						    );		
				}				          
		    }

		    function LeeEmpleados() {
		        Empleados = true
		        var grid = $("#gridEmpleados")[0];
			    var n = grid.rows.length;
			    var strE = '';	        
		        
		        val = parseInt($("#ListaReportes").val());
		        if (val == 46 || val == 47) {
		            if (n == 1) {
		                alert('Tiene que especificar Empleados')
		                Empleados = false;
		                return;
		            }
		        }
		        for (i = 1; i < n; i++) {
		            if (i == n - 1) {
		                strE = strE + grid.rows(i).cells(0).innerText;
		            }
		            else {
		                strE = strE + grid.rows(i).cells(0).innerText + ",";
		            }
		        }
		        		      	        
		        $("#Empleados").val(strE);
		    }

		    function Ir_Reporte() {
		        //$("#Archivo").text();
		        clearErrors();
		        var esValido = true;
		        if ($("#ListaReportes").val() == 0) {
		            esValido = esValido && validacombo2($("#ListaReportes")[0], $("#lblListaReportes").text);
		            esValido = esValido && EsValida();
		        }

				 val = parseInt($("#ListaReportes").val());
                if(val == 142){
                                esValido = esValido && validacampo($("#FechaDesde")[0], true, $("#lblFechaDesde").text(), "fecha", 10, 9, '');
                                esValido = esValido && validacampo($("#FechaHasta")[0], true, $("#lblFechaHasta").text(), "fecha", 10, 9, '');
		                        esValido = esValido && comparaValorTipo($("#FechaDesde")[0], $("#FechaHasta")[0], 'fecha', 'menorIgual', '<%=Intelexion.Framework.SystemLabels.SystemLabels.getValueById(14298,context.Session("LID"))%>');
                                esValido = esValido && validacombo2($("#IdRegistroPatronal")[0], $("#lblIdRegistroPatronal").text());
                                esValido = esValido && validacombo2($("#tipoMovimiento")[0], $("#lblTipoMovimiento").text());
            }
                
                if(val == 150){
                    esValido = esValido && validacombo2(document.getElementById("IdTipoNominaAsig"), document.getElementById("lblIdTipoNominaAsig").innerText);
	                esValido = esValido && validacombo2(document.getElementById("IdTipoNominaProc"), document.getElementById("lblIdTipoNominaProc").innerText);
	                esValido = esValido && validacombo2(document.getElementById("Periodo"), document.getElementById("lblPeriodo").innerText);
	                esValido = esValido && validacombo2(document.getElementById("Banco"),document.getElementById("lblBanco").innerText);
	                            
                }

		        if (esValido) {
		            //Agregado reporte Sobregiros Nomina
		            var IdTipoNominaProc;
		            var IdEmpleado;
		            IdTipoNominaAsig = $("#IdTipoNominaAsig").val();
		            IdEmpleado = $("#IdEmpleado").val();
		            //===================================
		            var IdTipoNominaProc;
		            IdTipoNominaProc = $("#IdTipoNominaProc").val();		            
		            
		            
		            
		            
		            showWait();
		            val = parseInt($("#ListaReportes").val());
		            switch (val) {
		                case 0:
		                    break;
		                case 1:
		                    document.forms[0].__VIEWSTATE.name = 'ignore';
		                    document.forms[0].__VIEWSTATE.value = '';
		                    document.forms[0].action = path + '/Nomina/ReportesProceso/ReporteBancos/ReporteBancos.process?IdTipoNominaProc=' + IdTipoNominaProc;
		                    document.forms[0].submit();
		                    break;
		                case 2:
		                    document.forms[0].__VIEWSTATE.name = 'ignore';
		                    document.forms[0].__VIEWSTATE.value = '';
		                    document.forms[0].action = path + '/Nomina/ReportesProceso/ReporteFondoAhorro/ReporteFondoAhorro.process?IdTipoNominaProc=' + IdTipoNominaProc;
		                    document.forms[0].submit();
		                    break;
		                case 3:
		                    document.forms[0].__VIEWSTATE.name = 'ignore';
		                    document.forms[0].__VIEWSTATE.value = '';
		                    document.forms[0].action = path + '/Nomina/ReportesProceso/ReportePreNomina/ReportePreNomina.process?IdTipoNominaProc=' + IdTipoNominaProc;
		                    document.forms[0].submit();
		                    break;
		                case 4:
		                    document.forms[0].__VIEWSTATE.name = 'ignore';
		                    document.forms[0].__VIEWSTATE.value = '';
		                    document.forms[0].action = path + '/Nomina/ReportesProceso/ReportePreNominaSueldos/ReportePreNominaSueldos.process?IdTipoNominaProc=' + IdTipoNominaProc;
		                    document.forms[0].submit();
		                    break;
		                case 5:		                   
		                    document.forms[0].__VIEWSTATE.name = 'ignore';
		                    document.forms[0].__VIEWSTATE.value = '';
		                    document.forms[0].action = path + '/Nomina/ReportesProceso/ReporteReciboAsimilables/ReporteReciboAsimilables.process?IdTipoNominaProc=' + IdTipoNominaProc;
		                    document.forms[0].submit();
		                    break;
		                case 6:
		                    Anthem_InvokePageMethod(
							    'ListadoContable',
									['<%=htTiposReporte.Item("6") %>'],
							    function(result) {							    
							        hideWait();							               
							    }
						    );
		                    //document.forms[0].action=path + '/Nomina/ReportesProceso/ListadoContable/ListadoContable.process?IdTipoNominaProc='+IdTipoNominaProc;
		                    //document.forms[0].submit();
		                    break;
		                case 7:
		                    document.forms[0].__VIEWSTATE.name = 'ignore';
		                    document.forms[0].__VIEWSTATE.value = '';
		                    document.forms[0].action = path + '/Nomina/ReportesProceso/ReportePreNominaAsimilables/ReportePreNominaAsimilables.process?IdTipoNominaProc=' + IdTipoNominaProc;
		                    document.forms[0].submit();
		                    break;
		                case 8:
		                    document.forms[0].__VIEWSTATE.name = 'ignore';
		                    document.forms[0].__VIEWSTATE.value = '';
		                    document.forms[0].action = path + '/Nomina/ReportesProceso/ReportePolizaContableCEA/ReportePolizaContableCEA.process?IdTipoNominaProc=' + IdTipoNominaProc;
		                    document.forms[0].submit();
		                    break;
		                case 9:
		                    Anthem_InvokePageMethod(
							    'LayoutAltasPrudential',
									['<%=htTiposReporte.Item("9") %>'],
							    function(result) {
							        hideWait();
							    }
						    );
		                    //document.forms[0].action=path + '/Nomina/ReportesProceso/LayoutAltasPrudential/LayoutAltasPrudential.process?IdTipoNominaProc='+IdTipoNominaProc;
		                    //document.forms[0].submit();
		                    break;
		                case 10:
		                    Anthem_InvokePageMethod(
							    'LayoutGenerico',
									['LayoutAportacionesPrudential', '<%=htTiposReporte.Item("10") %>'],
							    function(result) {
							        hideWait();
							    }
						    );
		                    //document.forms[0].action=path + '/Nomina/ReportesProceso/LayoutAportacionesPrudential/LayoutAportacionesPrudential.process?IdTipoNominaProc='+IdTipoNominaProc;
		                    //document.forms[0].submit();
		                    break;
		                case 11:
		                    Anthem_InvokePageMethod(
							    'LayoutGenerico',
									['LayoutPagoPrestamoPrudential', '<%=htTiposReporte.Item("11") %>'],
							    function(result) {
							        hideWait();
							    }
						    );
		                    //document.forms[0].action=path + '/Nomina/ReportesProceso/LayoutPagoPrestamoPrudential/LayoutPagoPrestamoPrudential.process?IdTipoNominaProc='+IdTipoNominaProc;
		                    //document.forms[0].submit();
		                    break;
		                case 12:
		                    Anthem_InvokePageMethod(
							    'LayoutGenerico',
									['LayoutBajasPrudential', '<%=htTiposReporte.Item("12") %>'],
							    function(result) {
							        hideWait();
							    }
						    );
		                    //document.forms[0].action=path + '/Nomina/ReportesProceso/LayoutBajasPrudential/LayoutBajasPrudential.process?IdTipoNominaProc='+IdTipoNominaProc;
		                    //document.forms[0].submit();
		                    break;
		                case 13:
		                    Anthem_InvokePageMethod(
							    'LayoutGenerico',
									['LayoutDispersionBANORTE', '<%=htTiposReporte.Item("13") %>'],
							    function(result) {
							        hideWait();
							    }
						    );
		                    //document.forms[0].action=path + '/Nomina/ReportesProceso/LayoutDispersionBANORTE/LayoutDispersionBANORTE.process?IdTipoNominaProc='+IdTipoNominaProc;
		                    //document.forms[0].submit();
		                    break;
		                case 14:
		                    Anthem_InvokePageMethod(
							    'LayoutGenerico',
									['LayoutDispersionBANAMEX', '<%=htTiposReporte.Item("14") %>'],
							    function(result) {
							        hideWait();
							    }
						    );
		                    //document.forms[0].action=path + '/Nomina/ReportesProceso/LayoutDispersionBANAMEX/LayoutDispersionBANAMEX.process?IdTipoNominaProc='+IdTipoNominaProc;
		                    //document.forms[0].submit();
		                    break;
		                case 15:
		                    
		                   esValido = esValido && validacombo2($("#IdTipoNominaAsig")[0], $("#lblIdTipoNominaAsig").text());
                           esValido = esValido && validacombo2($("#IdTipoNominaProc")[0], $("#lblIdTipoNominaProc").text());
                           esValido = esValido && validacombo2($("#Periodo")[0], $("#lblPeriodo").text());
		                    
		                    Anthem_InvokePageMethod(
							    'LayoutGenerico',
									['LayoutDispersionHSBC', '<%=htTiposReporte.Item("15") %>'],
							    function(result) {
							        hideWait();
							    }
						    );
		                    //document.forms[0].action=path + '/Nomina/ReportesProceso/LayoutDispersionHSBC/LayoutDispersionHSBC.process?IdTipoNominaProc='+IdTipoNominaProc;
		                    //document.forms[0].submit();
		                    break;
		                case 16:
		                    Anthem_InvokePageMethod(
							    'LayoutGenerico',
									['LayoutDispersionSANTANDER', '<%=htTiposReporte.Item("16") %>'],
							    function(result) {
							        hideWait();
							    }
						    );
		                    //document.forms[0].action=path + '/Nomina/ReportesProceso/LayoutDispersionSANTANDER/LayoutDispersionSANTANDER.process?IdTipoNominaProc='+IdTipoNominaProc;
		                    //document.forms[0].submit();
		                    break;
		                case 17:
		                    Anthem_InvokePageMethod(
							    'LayoutGenerico',
									['LayoutDispersionSCOTIABANK', '<%=htTiposReporte.Item("17") %>'],
							    function(result) {
							        hideWait();
							    }
						    );
		                    //document.forms[0].action=path + '/Nomina/ReportesProceso/LayoutDispersionSCOTIABANK/LayoutDispersionSCOTIABANK.process?IdTipoNominaProc='+IdTipoNominaProc;
		                    //document.forms[0].submit();
		                    break;
		                case 18:
		                    Anthem_InvokePageMethod(
							    'LayoutGenerico',
									['LayoutVales', '<%=htTiposReporte.Item("18") %>'],
							    function(result) {
							        hideWait();
							    }
						    );
		                    //document.forms[0].action=path + '/Nomina/ReportesProceso/LayoutVales/LayoutVales.process?IdTipoNominaProc='+IdTipoNominaProc;
		                    //document.forms[0].submit();
		                    break;
		                case 19:
		                    Anthem_InvokePageMethod(
							    'LayoutGenerico',
									['LayoutValesServibonos', '<%=htTiposReporte.Item("19") %>'],
							    function(result) {
							        hideWait();
							    }
						    );
		                    //document.forms[0].action=path + '/Nomina/ReportesProceso/LayoutValesServibonos/LayoutValesServibonos.process?IdTipoNominaProc='+IdTipoNominaProc;
		                    //document.forms[0].submit();
		                    break;
		                case 20:
		                    Anthem_InvokePageMethod(
							    'LayoutGenerico',
									['LayoutValesAccor', '<%=htTiposReporte.Item("20") %>'],
							    function(result) {
							        hideWait();
							    }
						    );
		                    //document.forms[0].action=path + '/Nomina/ReportesProceso/LayoutValesAccor/LayoutValesAccor.process?IdTipoNominaProc='+IdTipoNominaProc;
		                    //document.forms[0].submit();
		                    break;
		                case 21:
		                    Anthem_InvokePageMethod(
							    'LayoutGenerico',
									['ValesDespensa', '<%=htTiposReporte.Item("21") %>'],
							    function(result) {
							        hideWait();
							    }
						    );
		                    //document.forms[0].__VIEWSTATE.name='ignore';
		                    //document.forms[0].__VIEWSTATE.value='';
		                    //document.forms[0].action=path + '/Nomina/ReportesProceso/ValesDespensa/ValesDespensa.process?IdTipoNominaProc='+IdTipoNominaProc;
		                    //document.forms[0].submit();
		                    break;
		                case 22:
		                    Anthem_InvokePageMethod(
							    'LayoutGenerico',
									['LayoutDispersionBANORTERafaga', '<%=htTiposReporte.Item("22") %>'],
							    function(result) {
							        hideWait();
							    }
						    );
		                    //document.forms[0].action=path + '/Nomina/ReportesProceso/LayoutDispersionBANORTERafaga/LayoutDispersionBANORTERafaga.process?IdTipoNominaProc='+IdTipoNominaProc;
		                    //document.forms[0].submit();
		                    break;
		                case 23:
		                    Anthem_InvokePageMethod(
							    'LayoutGenerico',
									['LayoutDispersionBANCOMER', '<%=htTiposReporte.Item("23") %>'],
							    function(result) {
							        hideWait();
							    }
						    );
		                    //document.forms[0].action=path + '/Nomina/ReportesProceso/LayoutDispersionBANCOMER/LayoutDispersionBANCOMER.process?IdTipoNominaProc='+IdTipoNominaProc;
		                    //document.forms[0].submit();
		                    break;
		                case 24:
		                    Anthem_InvokePageMethod(
							    'LayoutGenerico',
									['LayoutDispersionHSBCxModem', '<%=htTiposReporte.Item("24") %>'],
							    function(result) {
							        hideWait();
							    }
						    );
		                    //document.forms[0].action=path + '/Nomina/ReportesProceso/LayoutDispersionHSBCxModem/LayoutDispersionHSBCxModem.process?IdTipoNominaProc='+IdTipoNominaProc;
		                    //document.forms[0].submit();
		                    break;
		                case 25:
		                    $("#IdTipoNominaProc").attr("disabled", "");
		                    Anthem_InvokePageMethod(
							    'LayoutGenericoFondoAhorro',
									['LayoutAportacionesFASkandia', '<%=htTiposReporte.Item("25") %>'],
							    function(result) {
							        hideWait();
							        $("#IdTipoNominaProc").attr("disabled", "disabled");							        
							    }
						    );
		                    //document.forms[0].action=path + '/Nomina/ReportesProceso/LayoutAportacionesFASkandia/LayoutAportacionesFASkandia.process?IdTipoNominaProc='+IdTipoNominaProc;
		                    //document.forms[0].submit();
		                    break;
		                case 26:
		                    Anthem_InvokePageMethod(
							    'LayoutGenericoFondoAhorro',
									['LayoutAportacionesCASkandia', '<%=htTiposReporte.Item("26") %>'],
							    function(result) {
							        hideWait();
							    }
						    );
		                    //document.forms[0].action=path + '/Nomina/ReportesProceso/LayoutAportacionesCASkandia/LayoutAportacionesCASkandia.process?IdTipoNominaProc='+IdTipoNominaProc;
		                    //document.forms[0].submit();
		                    break;
		                case 27:
		                    Anthem_InvokePageMethod(
							    'LayoutGenericoFondoAhorro',
									['LayoutAportacionesPPSkandia', '<%=htTiposReporte.Item("27") %>'],
							    function(result) {
							        hideWait();
							    }
						    );
		                    //document.forms[0].action=path + '/Nomina/ReportesProceso/LayoutAportacionesPPSkandia/LayoutAportacionesPPSkandia.process?IdTipoNominaProc='+IdTipoNominaProc;
		                    //document.forms[0].submit();
		                    break;
		                case 28:
		                    LeeEmpleados();
		                    if (Empleados) {
		                        var e = $("#Empleados").val();
		                        processCommand = "LayoutValesAccorAltas";
		                        Anthem_InvokePageMethod(
							                    'ValesAccor',
									                [e, processCommand, '<%=htTiposReporte.Item("28") %>'],
							                    function(result) {
							                        hideWait();
							                    }
						                      );
		                        //document.forms[0].action=path + '/Nomina/ReportesProceso/LayoutValesAccorAltas/LayoutValesAccorAltas.process?IdTipoNominaProc='+IdTipoNominaProc+'&Empleados='+e;
		                        //document.forms[0].submit();
		                    }
		                    break;
		                case 29:
		                    var e = ""
		                    Anthem_InvokePageMethod(
							        'LayoutGenerico',
									    ['LayoutValesAccorSaldos', '<%=htTiposReporte.Item("29") %>'],
							        function(result) {
							            hideWait();
							        }
						        );
		                    //document.forms[0].action=path + '/Nomina/ReportesProceso/LayoutValesAccorSaldos/LayoutValesAccorSaldos.process?IdTipoNominaProc='+IdTipoNominaProc+'&Empleados='+e;
		                    //document.forms[0].submit();

		                    break;
		                case 30:
		                    LeeEmpleados();
		                    if (Empleados) {
		                        var e = $("#Empleados").val();
		                        processCommand = "LayoutValesAccorAdicionales";
		                        Anthem_InvokePageMethod(
							                    'ValesAccor',
									                [e, processCommand, '<%=htTiposReporte.Item("30") %>'],
							                    function(result) {
							                        hideWait();
							                    }
						                      );
		                        //document.forms[0].action=path + '/Nomina/ReportesProceso/LayoutValesAccorAdicionales/LayoutValesAccorAdicionales.process?IdTipoNominaProc='+IdTipoNominaProc+'&Empleados='+e;
		                        //document.forms[0].submit();
		                    }
		                    break;
		                case 31:
		                    LeeEmpleados();
		                    if (Empleados) {
		                        var e = $("#Empleados").val();
		                        processCommand = "LayoutValesAccorReposicion";
		                        Anthem_InvokePageMethod(
							                    'ValesAccor',
									                [e, processCommand, '<%=htTiposReporte.Item("31") %>'],
							                    function(result) {
							                        hideWait();
							                    }
						                      );
		                        //document.forms[0].action=path + '/Nomina/ReportesProceso/LayoutValesAccorReposicion/LayoutValesAccorReposicion.process?IdTipoNominaProc='+IdTipoNominaProc+'&Empleados='+e;
		                        //document.forms[0].submit();
		                    }
		                    break;
		                case 32:
		                    LeeEmpleados();
		                    if (Empleados) {
		                        var e = $("#Empleados").val();
		                        processCommand = "LayoutValesAccorBajas";
		                        Anthem_InvokePageMethod(
							                    'ValesAccor',
									                [e, processCommand, '<%=htTiposReporte.Item("32") %>'],
							                    function(result) {
							                        hideWait();
							                    }
						                      );
		                        //document.forms[0].action=path + '/Nomina/ReportesProceso/LayoutValesAccorBajas/LayoutValesAccorBajas.process?IdTipoNominaProc='+IdTipoNominaProc+'&Empleados='+e;
		                        //document.forms[0].submit();
		                    }
		                    break;
		                case 33: /*ALTAS BANORTE*/
		                    LeeEmpleados();
		                    if (Empleados) {
		                        var e = $("#Empleados").val();
		                        Anthem_InvokePageMethod(
							        'LayoutGenericoBancos',
									    ['LayoutBANORTEAltas', '<%=htTiposReporte.Item("33") %>'],
							        function(result) {
							            hideWait();
							        }
						        );
		                        //document.forms[0].action=path + '/Nomina/ReportesProceso/LayoutBANORTEAltas/LayoutBANORTEAltas.process?IdEmpleado='+e;
		                        //document.forms[0].submit();
		                    }                              
		                    break;
		                case 34: /*ALTAS SKANDIA*/
		                    LeeEmpleados();
		                    if (Empleados) {
		                        var e = $("#Empleados").val();
		                        Anthem_InvokePageMethod(
							        'LayoutGenericoFondoAhorro',
									    ['LayoutAltasSkandia', '<%=htTiposReporte.Item("34") %>'],
							        function(result) {
							            hideWait();
							        }
						        );
		                        //document.forms[0].action=path + '/Nomina/ReportesProceso/LayoutAltasSkandia/LayoutAltasSkandia.process?IdTipoNominaProc='+IdTipoNominaProc+'&IdEmpleado='+e;
		                        //document.forms[0].submit();
		                    }
		                    break;
		                case 35:
		                    Anthem_InvokePageMethod(
							    'LayoutGenericoFondoAhorro',
									['LayoutMovimientosBANORTE', '<%=htTiposReporte.Item("35") %>'],
							    function(result) {
							        hideWait();
							    }
							   );
		                    //document.forms[0].action=path + '/Nomina/ReportesProceso/LayoutMovimientosBANORTE/LayoutMovimientosBANORTE.process?IdTipoNominaProc='+IdTipoNominaProc;
		                    //document.forms[0].submit();
		                    break;
		                case 36:
		                    Anthem_InvokePageMethod(
							        'LayoutGenerico',
									    ['LayoutPolizaContable', '<%=htTiposReporte.Item("36") %>'],
							        function(result) {
							            hideWait();
							        }
						        );
		                    //document.forms[0].action=path + '/Nomina/ReportesProceso/LayoutPolizaContable/LayoutPolizaContable.process?IdTipoNominaProc='+IdTipoNominaProc;
		                    //document.forms[0].submit();
		                    break;
		                case 37:
		                    Anthem_InvokePageMethod(
							        'LayoutGenericoFondoAhorro',
									    ['LayoutFondoVECTOR', '<%=htTiposReporte.Item("37") %>'],
							        function(result) {
							            hideWait();
							        }
						        );
		                    //document.forms[0].action=path + '/Nomina/ReportesProceso/LayoutFondoVECTOR/LayoutFondoVECTOR.process?IdTipoNominaProc='+IdTipoNominaProc;
		                    //document.forms[0].submit();
		                    break;
		                case 38:
		                    Anthem_InvokePageMethod(
							        'LayoutGenericoFondoAhorro',
									    ['LayoutFondoVALMEX', '<%=htTiposReporte.Item("38") %>'],
							        function(result) {
							            hideWait();
							        }
						        );
		                    //document.forms[0].action=path + '/Nomina/ReportesProceso/LayoutFondoVALMEX/LayoutFondoVALMEX.process?IdTipoNominaProc='+IdTipoNominaProc;
		                    //document.forms[0].submit();
		                    break;
		                case 39:
		                    Anthem_InvokePageMethod(
							        'LayoutGenericoFondoAhorro',
									    ['LayoutFondoSCOTIABANK', '<%=htTiposReporte.Item("39") %>'],
							        function(result) {
							            hideWait();
							        }
						        );
		                    //document.forms[0].action=path + '/Nomina/ReportesProceso/LayoutFondoSCOTIABANK/LayoutFondoSCOTIABANK.process?IdTipoNominaProc='+IdTipoNominaProc;
		                    //document.forms[0].submit();
		                    break;
		                case 40:
		                    Anthem_InvokePageMethod(
							        'LayoutGenericoFondoAhorro',
									    ['LayoutAportacionesExtraordinariasCajadeahorro', '<%=htTiposReporte.Item("40") %>'],
							        function(result) {
							            hideWait();
							        }
						        );
		                    //document.forms[0].action=path + '/Nomina/ReportesProceso/LayoutAportacionesExtraordinariasCajadeahorro/LayoutAportacionesExtraordinariasCajadeahorro.process?IdTipoNominaProc='+IdTipoNominaProc;
		                    //document.forms[0].submit();
		                    break;
		                case 41:
		                    Anthem_InvokePageMethod(
							        'LayoutGenericoFondoAhorro',
									    ['LayoutAportacionesAPPSkandia', '<%=htTiposReporte.Item("41") %>'],
							        function(result) {
							            hideWait();
							        }
						        );
		                    //document.forms[0].action=path + '/Nomina/ReportesProceso/LayoutAportacionesAPPSkandia/LayoutAportacionesAPPSkandia.process?IdTipoNominaProc='+IdTipoNominaProc;
		                    //document.forms[0].submit();
		                    break;
		                case 42:
		                    processCommand = "ListadeAsistencia";
		                    var e = "";
		                    Anthem_InvokePageMethod(
							        'LayoutGenericodsLayout',
									    [e, processCommand, '<%=htTiposReporte.Item("42") %>'],
							        function(result) {
							            hideWait();
							        }
						        );
		                    //document.forms[0].action=path + '/Nomina/ReportesProceso/ListadeAsistencia/ListadeAsistencia.process?IdTipoNominaProc='+IdTipoNominaProc;
		                    //document.forms[0].submit();
		                    break;
		                case 43:
		                    Anthem_InvokePageMethod(
							        'LayoutGenerico',
									    ['PolizaContableSolomon', '<%=htTiposReporte.Item("43") %>'],
							        function(result) {
							            hideWait();
							        }
						        );
		                    //document.forms[0].action=path + '/Nomina/ReportesProceso/PolizaContableSolomon/PolizaContableSolomon.process?IdTipoNominaProc='+IdTipoNominaProc;
		                    //document.forms[0].submit();
		                    break;
		                case 44:
		                    Anthem_InvokePageMethod(
							        'LayoutGenerico',
									    ['LayoutDispersionBAJIO', '<%=htTiposReporte.Item("44") %>'],
							        function(result) {
							            hideWait();
							        }
						        );
		                    //document.forms[0].action=path + '/Nomina/ReportesProceso/LayoutDispersionBAJIO/LayoutDispersionBAJIO.process?IdTipoNominaProc='+IdTipoNominaProc;
		                    //document.forms[0].submit();
		                    break;
		                case 45:

		                    Anthem_InvokePageMethod(
							    'PolizaContableARA',
									['<%=htTiposReporte.Item("45") %>'],
							    function(result) {
							        hideWait();
							    }
						    );
		                    //document.forms[0].action=path + '/Nomina/ReportesProceso/PolizaContableARA/PolizaContableARA.process?IdTipoNominaProc='+IdTipoNominaProc;
		                    //document.forms[0].submit();
		                    break;
		                case 46:
		                    Anthem_InvokePageMethod(
							        'LayoutGenerico',
									    ['LayoutDispersionBANCOMERCashWindows', '<%=htTiposReporte.Item("46") %>'],
							        function(result) {
							            hideWait();
							        }
						        );
		                    //document.forms[0].action=path + '/Nomina/ReportesProceso/LayoutDispersionBANCOMERCashWindows/LayoutDispersionBANCOMERCashWindows.process?IdTipoNominaProc='+IdTipoNominaProc;
		                    //document.forms[0].submit();
		                    break;
		                case 47:
		                    LeeEmpleados();
		                    var e = $("#Empleados").val();
		                    processCommand = "LayoutDispersionHSBCGerentesEmpleados";
		                    Anthem_InvokePageMethod(
							    'LayoutdsLayoutSlk',
									[e, processCommand, '<%=htTiposReporte.Item("47") %>'],
							    function(result) {
							        hideWait();
							    }
						    );
		                    //document.forms[0].action=path + '/Nomina/ReportesProceso/LayoutDispersionHSBCGerentesEmpleados/LayoutDispersionHSBCGerentesEmpleados.process?IdTipoNominaProc='+IdTipoNominaProc+'&Empleados='+e;
		                    //document.forms[0].submit();
		                    break;
		                case 48:
		                    LeeEmpleados();
		                    var e = $("#Empleados").val();
		                    processCommand = "LayoutDispersionHSBCGerentesTerceros";
		                    Anthem_InvokePageMethod(
							    'LayoutdsLayoutSlk',
									[e, processCommand, '<%=htTiposReporte.Item("48") %>'],
							    function(result) {
							        hideWait();
							    }
						    );
		                    //document.forms[0].action=path + '/Nomina/ReportesProceso/LayoutDispersionHSBCGerentesTerceros/LayoutDispersionHSBCGerentesTerceros.process?IdTipoNominaProc='+IdTipoNominaProc+'&Empleados='+e;
		                    //document.forms[0].submit();
		                    break;
		                case 49:
		                    LeeEmpleados();
		                    var e = $("#Empleados").val();
		                    processCommand = 'PolizaContableSolomon7';
		                    Anthem_InvokePageMethod(
							        'LayoutGenericodsLayout',
									    [e, processCommand, '<%=htTiposReporte.Item("49") %>'],
							        function(result) {
							            hideWait();
							        }
						        );
		                    //document.forms[0].action=path + '/Nomina/ReportesProceso/PolizaContableSolomon7/PolizaContableSolomon7.process?IdTipoNominaProc='+IdTipoNominaProc+'&Empleados='+e;
		                    //document.forms[0].submit();
		                    break;
		                case 50:
		                    Anthem_InvokePageMethod(
							    'LayoutConfirmacionOdessa',
									['<%=htTiposReporte.Item("50") %>'],
							    function(result) {
							        hideWait();
							    }
						    );
		                    //document.forms[0].action=path + '/Nomina/ReportesProceso/LayoutConfirmacionOdessa/LayoutConfirmacionOdessa.process?IdTipoNominaProc='+IdTipoNominaProc;
		                    //document.forms[0].submit();
		                    break;
		                case 51:
		                    Anthem_InvokePageMethod(
							        'LayoutGenericoBancos',
									    ['LayoutDispersionHSBCviaEmpresarial', '<%=htTiposReporte.Item("51") %>'],
							        function(result) {
							            hideWait();
							        }
						        );
		                    //document.forms[0].action=path + '/Nomina/ReportesProceso/LayoutDispersionHSBCviaEmpresarial/LayoutDispersionHSBCviaEmpresarial.process?IdTipoNominaProc='+IdTipoNominaProc;
		                    //document.forms[0].submit();
		                    break;
		                case 52:
		                    Anthem_InvokePageMethod(
							        'LayoutGenericoBancos',
									    ['LayoutDispersionBANORTEFormatoIntegrado', '<%=htTiposReporte.Item("52") %>'],
							        function(result) {
							            hideWait();
							        }
						        );
		                    //document.forms[0].action=path + '/Nomina/ReportesProceso/LayoutDispersionBANORTEFormatoIntegrado/LayoutDispersionBANORTEFormatoIntegrado.process?IdTipoNominaProc='+IdTipoNominaProc;
		                    //document.forms[0].submit();
		                    break;
		                case 53:
		                    document.forms[0].action = path + '/Nomina/ReportesProceso/PolizaContableDynamics/PolizaContableDynamics.process?IdTipoNominaProc=' + IdTipoNominaProc;
		                    document.forms[0].submit();
		                    break;
		                case 54:
		                    Anthem_InvokePageMethod(
							        'LayoutGenericoBancos',
									    ['LayoutDispersionBANCOMER_BPR', '<%=htTiposReporte.Item("54") %>'],
							        function(result) {
							            hideWait();
							        }
						        );
		                    //document.forms[0].action=path + '/Nomina/ReportesProceso/LayoutDispersionBANCOMER_BPR/LayoutDispersionBANCOMER_BPR.process?IdTipoNominaProc='+IdTipoNominaProc;
		                    //document.forms[0].submit();
		                    break;
		                case 55:
		                    Anthem_InvokePageMethod(
							        'LayoutGenerico',
									    ['LayoutContabilidadInt', '<%=htTiposReporte.Item("55") %>'],
							        function(result) {
							            hideWait();
							        }
						        );
		                    //document.forms[0].action=path + '/Nomina/ReportesProceso/LayoutContabilidadInt/LayoutContabilidadInt.process?IdTipoNominaProc='+IdTipoNominaProc;
		                    //document.forms[0].submit();
		                    break;
		                case 56:
		                    Anthem_InvokePageMethod(
							        'LayoutGenerico',
									    ['LayoutContabilidadSAP', '<%=htTiposReporte.Item("56") %>'],
							        function(result) {
							            hideWait();
							        }
						        );
		                    //document.forms[0].action=path + '/Nomina/ReportesProceso/LayoutContabilidadSAP/LayoutContabilidadSAP.process?IdTipoNominaProc='+IdTipoNominaProc;
		                    //document.forms[0].submit();
		                    break;
		                case 57:
		                    var e = "";
		                    processCommand = "LayoutDispersionHSBCJhonson";
		                  
		                    Anthem_InvokePageMethod(
							    'LayoutdsLayoutSlk',
									[e, processCommand, '<%=htTiposReporte.Item("57") %>'],
							    function(result) {
							        hideWait();
							    }
						    );
		                    //document.forms[0].action=path + '/Nomina/ReportesProceso/LayoutDispersionHSBCJhonson/LayoutDispersionHSBCJhonson.process?IdTipoNominaProc='+IdTipoNominaProc;
		                    //document.forms[0].submit();
		                    break;
		                case 58:
		                    Anthem_InvokePageMethod(
                                'LayoutGenerico',
                                ['LayoutDispersionBANAMEX_TEF_INTELAR', '<%=htTiposReporte.Item("58") %>'],
                                function(result) {
                                    hideWait();
                                }
                            );
		                    /*document.forms[0].action = path + '/Nomina/ReportesProceso/LayoutDispersionBANAMEX_TEF_INTELAR/LayoutDispersionBANAMEX_TEF_INTELAR.process?IdTipoNominaProc=' + IdTipoNominaProc;
		                    document.forms[0].submit();*/
		                    break;
		                case 59:
		                    var periodoDesde = '';
		                    var periodoHasta = '';
		                    var pos1 = 0;
		                    var pos2 = 0;

		                    periodoDesde = $("#PeriodoDesde").val();
		                    periodoHasta = $("#PeriodoHasta").val();

		                    pos1 = periodoDesde.indexOf('-');
		                    pos2 = periodoHasta.indexOf('-');

		                    if (periodoDesde.substring(pos1 + 1, periodoDesde.lenght) > periodoHasta.substring(pos2 + 1, periodoHasta.lenght)) {
		                        alert('<%=Intelexion.Framework.SystemLabels.SystemLabels.getValueById(17715, Context.Session("LID"))%>')
		                        hideWait();
		                        break;
		                    }
		                    else {
		                        if (periodoDesde.substring(pos1 + 1, periodoDesde.lenght) == periodoHasta.substring(pos2 + 1, periodoHasta.lenght)) {
		                            if (periodoDesde.substring(0, pos1) > periodoHasta.substring(0, pos2)) {
		                                alert('<%=Intelexion.Framework.SystemLabels.SystemLabels.getValueById(17715, Context.Session("LID"))%>')
		                                hideWait();
		                                break;
		                            }
		                        }
		                    }
		                    $("#IdTipoNominaProc").attr("disabled", "disabled");

		                    document.forms[0].__VIEWSTATE.name = 'ignore';
		                    document.forms[0].__VIEWSTATE.value = '';
		                    document.forms[0].action = path + '/Nomina/ReportesProceso/ReporteProyeccionNomina/ReporteProyeccionNomina.process?IdTipoNominaProc=' + IdTipoNominaProc;
		                    document.forms[0].submit();
		                    break;
		                case 60:
		                    document.forms[0].action = path + '/Nomina/ReportesProceso/PolizaContableOracle/PolizaContableOracle.process?IdTipoNominaProc=' + IdTipoNominaProc;
		                    document.forms[0].submit();
		                    break;
		                case 61:
		                    Anthem_InvokePageMethod(
                                'LayoutGenericoBancos',
                                ['LayoutDispersionBANCOMERCashWindows780', '<%=htTiposReporte.Item("61") %>'],
                                function(result) {
                                    hideWait();
                                }
                            );
		                    break;
		                case 62:
		                    Anthem_InvokePageMethod(
                                'LayoutGenericoBancos',
                                ['LayoutDispersionAFIRME', '<%=htTiposReporte.Item("62") %>'],
                                function(result) {
                                    hideWait();
                                }
                            );
		                    break;
		                case 63:
		                    Anthem_InvokePageMethod(
                                'LayoutGenericoBancos',
                                ['LayoutDispersionBANREGIO', '<%=htTiposReporte.Item("63") %>'],
                                function(result) {
                                    hideWait();
                                }
                            );
		                    break;






		               // case 64:
		               //     document.forms[0].__VIEWSTATE.name = 'ignore';
		               //     document.forms[0].__VIEWSTATE.value = '';
		               //     document.forms[0].action = path + '/Nomina/ReportesProceso/ReporteContableOracle/ReporteContableOracle.process?IdTipoNominaProc=' + IdTipoNominaProc;
		                //    document.forms[0].submit();
		                //    break;
		                case 65:
		                    Anthem_InvokePageMethod(
                                'LayoutGenerico',
                                ['LayoutContableLmx', '<%=htTiposReporte.Item("65") %>'],
                                function(result) {
                                    hideWait();
                                }
                            );
		                    /*document.forms[0].action = path + '/Nomina/ReportesProceso/LayoutDispersionBANAMEX_TEF_INTELAR/LayoutDispersionBANAMEX_TEF_INTELAR.process?IdTipoNominaProc=' + IdTipoNominaProc;
		                    document.forms[0].submit();*/
		                    break;
		                case 66:
		                    Anthem_InvokePageMethod(
                                'LayoutGenerico',
                                ['LayoutContableDatasul', '<%=htTiposReporte.Item("66") %>'],
                                function(result) {
                                    hideWait();
                                }
                            );
		                    break;
		                case 67:
		                    var periodoDesde = '';
		                    var periodoHasta = '';
		                    var pos1 = 0;
		                    var pos2 = 0;

		                    periodoDesde = $("#PeriodoDesde").val();
		                    periodoHasta = $("#PeriodoHasta").val();

		                    pos1 = periodoDesde.indexOf('-');
		                    pos2 = periodoHasta.indexOf('-');

		                    if (periodoDesde.substring(pos1 + 1, periodoDesde.lenght) > periodoHasta.substring(pos2 + 1, periodoHasta.lenght)) {
		                        alert('<%=Intelexion.Framework.SystemLabels.SystemLabels.getValueById(17715, Context.Session("LID"))%>')
		                        hideWait();
		                        break;
		                    }
		                    else {
		                        if (periodoDesde.substring(pos1 + 1, periodoDesde.lenght) == periodoHasta.substring(pos2 + 1, periodoHasta.lenght)) {
		                            if (periodoDesde.substring(0, pos1) > periodoHasta.substring(0, pos2)) {
		                                alert('<%=Intelexion.Framework.SystemLabels.SystemLabels.getValueById(17715, Context.Session("LID"))%>')
		                                hideWait();
		                                break;
		                            }
		                        }
		                    }		                     

		                    document.forms[0].__VIEWSTATE.name = 'ignore';
		                    document.forms[0].__VIEWSTATE.value = '';
		                    document.forms[0].action = path + '/Nomina/ReportesProceso/ReporteProyeccionNominaResumen/ReporteProyeccionNominaResumen.process?IdTipoNominaProc=' + IdTipoNominaProc;
		                    document.forms[0].submit();
		                    break;
		                case 68:
		                    Anthem_InvokePageMethod(
                                'LayoutGenerico',
                                ['LayoutSiValeElectronico', '<%=htTiposReporte.Item("68") %>'],
                                function(result) {
                                    hideWait();
                                }
                                );
		                    break;
		                case 69:
		                    Anthem_InvokePageMethod(
                                'LayoutGenerico',
                                ['LayoutSiValePapel', '<%=htTiposReporte.Item("69") %>'],
                                function(result) {
                                    hideWait();
                                }
                                );
		                    break;
		                case 70:
		                    Anthem_InvokePageMethod(
                                'LayoutGenericoBancos',
                                ['LayoutDispersionBANAMEX_D', '<%=htTiposReporte.Item("70") %>'],
                                function(result) {
                                    hideWait();
                                }
                            );
		                    break;
		                case 71:
		                    Anthem_InvokePageMethod(
                                'LayoutGenericoBancos',
                                ['LayoutDispersionBANAMEX_B', '<%=htTiposReporte.Item("71") %>'],
                                function(result) {
                                    hideWait();
                                }
                            );
		                    break;
		                case 72:
		                    Anthem_InvokePageMethod(
                                'LayoutGenerico',
                                ['LayoutDepositosValesSodexo', '<%=htTiposReporte.Item("72") %>'],
                                function(result) {
                                    hideWait();
                                }
                            );
		                    break;
		                case 73:
		                    Anthem_InvokePageMethod(
                                    'LayoutGenerico',
                                    ['LayoutContableBaan4', '<%=htTiposReporte.Item("73") %>'],
                                    function(result) {
                                        hideWait();
                                    }
                                );
		                    break;
		                //                                    document.forms[0].action = path + '/Nomina/ReportesProceso/PolizaContableOracle/PolizaContableOracle.process?IdTipoNominaProc=' + IdTipoNominaProc; 
		                //                                    document.forms[0].submit(); 
		                case 74:
		                    Anthem_InvokePageMethod(
                                    'LayoutGenerico',
                                    ['LayoutContableBaan6', '<%=htTiposReporte.Item("74") %>'],
                                    function(result) {
                                        hideWait();
                                    }
                                );
		                    break;
		                case 75:
		                    document.forms[0].action = path + '/Nomina/ReportesProceso/PolizaContableOracleAP/PolizaContableOracleAP.process?IdTipoNominaProc=' + IdTipoNominaProc;
		                    document.forms[0].submit();
		                    break;
		                case 76:
		                    document.forms[0].__VIEWSTATE.name = 'ignore';
		                    document.forms[0].__VIEWSTATE.value = '';
		                    document.forms[0].action = path + '/Nomina/ReportesProceso/ReporteContableOracleAP/ReporteContableOracleAP.process?IdTipoNominaProc=' + IdTipoNominaProc;
		                    document.forms[0].submit();
		                    break;
		                case 77:

		                    Anthem_InvokePageMethod(
                                'LayoutGenerico',
                                ['LayoutDepositosGasolinaSodexo', '<%=htTiposReporte.Item("77") %>'],
                                function(result) {
                                    hideWait();
                                }
                            );
		                    break;
		                case 78:
		                    showWait();
		                    Anthem_InvokePageMethod(
                                'LayoutdsLayoutSlk',
                                ['', 'LayoutDispersionBancariaTradicionalHSCB-GGS', '<%=htTiposReporte.Item("78") %>'],
                                function(result) {
                                    hideWait();
                                }
                            );
		                    break;
		                case 79:
		                    showWait();
		                    Anthem_InvokePageMethod(
                                'LayoutdsLayoutSlk',
                                ['', 'LayoutDispersionInterbancariaHSCB-GGS', '<%=htTiposReporte.Item("79") %>'],
                                function(result) {
                                    hideWait();
                                }
                            );
		                    break;
		                case 80:

		                    Anthem_InvokePageMethod(
                                'LayoutGenericoBancos',
                                ['LayoutDispersionTradicionalSTD-GW', '<%=htTiposReporte.Item("80") %>'],
                                function(result) {
                                    hideWait();
                                }
                            );
		                    break;
		                case 81:
		                    showWait();
		                    Anthem_InvokePageMethod(
                                'LayoutdsLayoutSlk',
                                ['', 'LayoutDispersionHSCB_EUK', '<%=htTiposReporte.Item("81") %>'],
                                function(result) {
                                    hideWait();
                                }
                            );
		                    break;
		                case 82:

		                    Anthem_InvokePageMethod(
                                'LayoutGenericoBancos',
                                ['LayoutDispersionBANCOMER_NETCASH', '<%=htTiposReporte.Item("82") %>'],
                                function(result) {
                                    hideWait();
                                }
                            );
		                    break;
		                case 83:

		                    Anthem_InvokePageMethod(
                                'LayoutGenericoBancos',
                                ['LayoutDispersionBANCOMER_NETCASH108', '<%=htTiposReporte.Item("83") %>'],
                                function(result) {
                                    hideWait();
                                }
                            );
		                    break;
		                case 84:

		                    LeeEmpleados();
		                    var e = $("#Empleados").val();
		                    processCommand = "ListadoContableGP";
		                    Anthem_InvokePageMethod(
							    'LayoutGenericodsLayout',
									[e, processCommand, '<%=htTiposReporte.Item("84") %>'],
							    function(result) {
							        hideWait();
							    }
						    );
		                    break;
		                case 85:
		                    showWait();
		                    Anthem_InvokePageMethod(
                                'LayoutGenericodsLayout',
                                ['', 'ListadoContableGPProv', '<%=htTiposReporte.Item("85") %>'],
                                function(result) {
                                    hideWait();
                                }
                            );
		                    break;
		                case 86:

		                    Anthem_InvokePageMethod(
                                'LayoutGenerico',
                                ['Reporte_InterfazContableNavision', '<%=htTiposReporte.Item("86") %>'],
                                function(result) {
                                    hideWait();
                                }
                            );
		                    break;
		                case 87:

		                    Anthem_InvokePageMethod(
                                'LayoutGenerico',
                                ['Reporte_InterfazValesDespensaEfectivale', '<%=htTiposReporte.Item("87") %>'],
                                function(result) {
                                    hideWait();
                                }
                            );
		                    break;

		                case 88:
		                    showWait();
		                    Anthem_InvokePageMethod(
                                'LayoutGenericodsLayout',
                                ['', 'ListadoPagoOutsourcing', '<%=htTiposReporte.Item("88") %>'],
                                function(result) {
                                    hideWait();
                                }
                            );
		                    break;
		                case 89:
		                    showWait();
		                    Anthem_InvokePageMethod(
                                'LayoutFondoAhorroBanorteAPORTACIONES',
                                    ['<%=htTiposReporte.Item("89") %>'],
                                function(result) {
                                    hideWait();
                                }
                            );


		                    break;
		                case 90:
		                    showWait();
		                    Anthem_InvokePageMethod(
                                'LayoutFondoAhorroBanorteBAJAS',
                                    ['<%=htTiposReporte.Item("90") %>'],
                                function(result) {
                                    hideWait();
                                }
                            );
		                    break;
		                case 91:
		                    showWait();
		                    Anthem_InvokePageMethod(
                                'LayoutFondoAhorroBanortePAGOPRESTAMOS',
                                        ['<%=htTiposReporte.Item("91") %>'],
                                function(result) {
                                    hideWait();
                                }
                            );
		                    break;
		                case 92:
		                    showWait();
		                    Anthem_InvokePageMethod(
                                'LayoutGenerico', //'LayoutGenericodsLayout',
                                ['LayoutFondoAhorroBanorteRETIROS', '<%=htTiposReporte.Item("92") %>'],
                                function(result) {
                                    //alert(result.error)
                                    hideWait();
                                }
                            );
		                    break;
		                case 93:
		                    showWait();
		                    Anthem_InvokePageMethod(
                                'LayoutFondoAhorroBanorteALTAS',
                                        ['<%=htTiposReporte.Item("93") %>'],
                                function(result) {
                                    hideWait();
                                }
                            );
		                    break;

		                case 94:

		                    Anthem_InvokePageMethod(
                                'LayoutGenerico',
                                ['LayoutDepositosPorLugarDeTrabajoPorBanco', '<%=htTiposReporte.Item("94") %>'],
                                function(result) {
                                    hideWait();
                                }
                            );
		                    break;
		                case 95:
		                    Anthem_InvokePageMethod(
                                'LayoutGenericoBancos',
                                ['LayoutDispersionAFIRME_GNL', '<%=htTiposReporte.Item("95") %>'],
                                function(result) {
                                    hideWait();
                                }
                            );
		                    break;
		                //Agregado reporte Sobregiros Nomina 
		                case 96:
		                    hideWait();
		                    var periodoDesde = '';
		                    var periodoHasta = '';
		                    var pos1 = 0;
		                    var pos2 = 0;

		                    esValido = esValido && validacombo2($("#IdTipoNominaAsig")[0], $("#lblIdTipoNominaAsig").text());
		                    esValido = esValido && validacombo2($("#IdTipoNominaProc")[0], $("#lblIdTipoNominaProc").text());
		                    esValido = esValido && validacombo2($("#PeriodoDesde")[0], $("#lblPeriodoDesde").text());
		                    //esValido = esValido && validacombo2(document.getElementById("PeriodoHasta"), document.getElementById("lblPeriodoHasta").innerText);

		                    periodoDesde = $("#PeriodoDesde").val();
		                    periodoHasta = $("#PeriodoHasta").val();

		                    pos1 = periodoDesde.indexOf('-');
		                    pos2 = periodoHasta.indexOf('-');

		                    if (periodoDesde.substring(pos1 + 1, periodoDesde.lenght) > periodoHasta.substring(pos2 + 1, periodoHasta.lenght)) {
		                        alert('<%=Intelexion.Framework.SystemLabels.SystemLabels.getValueById(17715, Context.Session("LID"))%>')
		                        hideWait();
		                        break;
		                    }
		                    else {
		                        if (periodoDesde.substring(pos1 + 1, periodoDesde.lenght) == periodoHasta.substring(pos2 + 1, periodoHasta.lenght)) {
		                            if (periodoDesde.substring(0, pos1) > periodoHasta.substring(0, pos2)) {
		                                alert('<%=Intelexion.Framework.SystemLabels.SystemLabels.getValueById(17715, Context.Session("LID"))%>')
		                                hideWait();
		                                break;
		                            }
		                        }
		                    }

		                    if (esValido) {
		                        if (usarVista5 == '1') {
		                            window.parent.openNewTab(path + '/Nomina/EmpleadoMovto/ReporteSobregiros/ReporteSobregiros.process?IdTipoNominaProc=' + IdTipoNominaProc + '&IdTipoNominaAsig=' + IdTipoNominaAsig + '&IdEmpleado=' + IdEmpleado + '&PeriodoDesde=' + periodoDesde + '&PeriodoHasta=' + periodoHasta);
		                        }
		                        else {
		                            document.forms[0].__VIEWSTATE.name = 'ignore';
		                            document.forms[0].__VIEWSTATE.value = '';
		                            document.forms[0].action = path + '/Nomina/EmpleadoMovto/ReporteSobregiros/ReporteSobregiros.process?IdTipoNominaProc=' + value;
		                            document.forms[0].submit();
		                        }
		                    }
		                    break;
		                //==========================================

		                /*Comentado por Manuel Alberto: Las opciones 97 y 98 se acceden desde reportes historicos
		                 case 97:
		                    Anthem_InvokePageMethod(
                                'LayoutGenerico',
                                ['LayoutSuspensionSAT', '<%=htTiposReporte.Item("97") %>'],
                                function(result) {
                                    hideWait();
                                }
                            );
		                    break;

		                case 98:
		                    Anthem_InvokePageMethod(
                                'LayoutGenerico',
                                ['LayoutReanudacionSAT', '<%=htTiposReporte.Item("98") %>'],
                                function(result) {
                                    hideWait();
                                }
                            );
		                    break;
		                    */
		                case 99:

		                    LeeEmpleados();
		                    var e = $("#Empleados").val();
		                    processCommand = "PolizaContableAL";
		                    Anthem_InvokePageMethod(
							    'LayoutGenericodsLayout',
									[e, processCommand, '<%=htTiposReporte.Item("99") %>'],
							    function(result) {
							        hideWait();
							    }
						    );
							    break;
							    
						case 100:

							    LeeEmpleados();
							    var e = $("#Empleados").val();
							    processCommand = "PolizaContableProvisionesAL";
							    Anthem_InvokePageMethod(
							    'LayoutGenericodsLayout',
									[e, processCommand, '<%=htTiposReporte.Item("100") %>'],
							    function(result) {
							        hideWait();
							    }
						    );
							    break;

						case 101:
		                    Anthem_InvokePageMethod(
							    'PolizaContableALIX',
									['<%=htTiposReporte.Item("101") %>'],
							    function(result) {
							        hideWait();
							    }
						    );
							    break;

						case 102:
							    Anthem_InvokePageMethod(
							    'PolizaContableALIXPrevia',
									['<%=htTiposReporte.Item("102") %>'],
							    function(result) {
							        hideWait();
							    }
						    );
							    break;
							//Ecovale SiVale 
							
							case 103:
							    clearErrors();
							    $("#IdTipoNominaProc").attr("disabled", "");
							    Anthem_InvokePageMethod('ReporteCentroCostosConceptos', ['<%=htTiposReporte.Item("103") %>'],
                                    function(result) {
                                        if ($('#errorH').val() != "") {
                                            showError($("#errorH").val());
                                            $('#errorH').val("");
                                        }
                                        hideWait();
                                    }
                                );
                                break;



                            case 105:
                                clearErrors();
                                esValido = esValido && validacombo2($("#IdTipoNominaAsig")[0], $("#lblIdTipoNominaAsig").text());
                                esValido = esValido && validacombo2($("#IdTipoNominaProc")[0], $("#lblIdTipoNominaProc").text());
                                esValido = esValido && validacombo2($("#Periodo")[0], $("#lblPeriodo").text());
                                if (esValido) {                                    
                                    Anthem_InvokePageMethod('ReportePolizaContableForthShift', ['<%=htTiposReporte.Item("105") %>'],
                                        function(result) {
                                            if ($('#errorH').val() != "") {
                                                showError($("#errorH").val());
                                                $('#errorH').val("");
                                            }
                                            hideWait();
                                        }
                                    );
                                 }else {
                                    hideWait();
                                 }

                                 break;
                             case 106:
                                clearErrors();
                                esValido = esValido && validacombo2($("#IdTipoNominaAsig")[0], $("#lblIdTipoNominaAsig").text());
                                esValido = esValido && validacombo2($("#IdTipoNominaProc")[0], $("#lblIdTipoNominaProc").text());
                                esValido = esValido && validacombo2($("#Periodo")[0], $("#lblPeriodo").text());
                                 if (esValido) {
                                     Anthem_InvokePageMethod('ReporteCifrasDeNomina', ['<%=htTiposReporte.Item("106") %>'],
                                        function(result) {
                                            if ($('#errorH').val() != "") {
                                                showError($("#errorH").val());
                                                $('#errorH').val("");
                                            }
                                            hideWait();
                                        }
                                    );
                                 } else {
                                     hideWait();
                                 }

                                 break;
                             case 107:
                                 clearErrors();
                                 esValido = esValido && validacombo2($("#IdTipoNominaAsig")[0], $("#lblIdTipoNominaAsig").text());
                                 esValido = esValido && validacombo2($("#IdTipoNominaProc")[0], $("#lblIdTipoNominaProc").text());
                                 esValido = esValido && validacombo2($("#Periodo")[0], $("#lblPeriodo").text());
                                 esValido = esValido && validacombo2($("#idTipoPersona")[0], $("#lblidTipoPersona").text());
                                 if (esValido) {
                                     Anthem_InvokePageMethod('ReportePrestamoFondoAhorroBanorte', ['<%=htTiposReporte.Item("107") %>'],
                                        function(result) {
                                            if ($('#errorH').val() != "") {
                                                showError($("#errorH").val());
                                                $('#errorH').val("");
                                            }
                                            hideWait();
                                        }
                                    );
                                 } else {
                                     hideWait();
                                 }

                                 break;
                             case 108:
                                 clearErrors();
                                 esValido = esValido && validacombo2($("#IdTipoNominaAsig")[0], $("#lblIdTipoNominaAsig").text());
                                 esValido = esValido && validacombo2($("#IdTipoNominaProc")[0], $("#lblIdTipoNominaProc").text());
                                 esValido = esValido && validacombo2($("#Periodo")[0], $("#lblPeriodo").text());
                                 esValido = esValido && validacombo2($("#idTipoPersona")[0], $("#lblidTipoPersona").text());
                                 if (esValido) {
                                     Anthem_InvokePageMethod('ReportePrestamoCajaAhorroBanorte', ['<%=htTiposReporte.Item("108") %>'],
                                        function(result) {
                                            if ($('#errorH').val() != "") {
                                                showError($("#errorH").val());
                                                $('#errorH').val("");
                                            }
                                            hideWait();
                                        }
                                    );
                                 } else {
                                     hideWait();
                                 }

                                 break;

                             case 109:
                                 clearErrors();
                                 esValido = esValido && validacombo2($("#IdTipoNominaAsig")[0], $("#lblIdTipoNominaAsig").text());
                                 esValido = esValido && validacombo2($("#IdTipoNominaProc")[0], $("#lblIdTipoNominaProc").text());
                                 esValido = esValido && validacombo2($("#Periodo")[0], $("#lblPeriodo").text());
                                 esValido = esValido && validacombo2($("#idTipoPersona")[0], $("#lblidTipoPersona").text());
                                 if (esValido) {
                                     Anthem_InvokePageMethod('ReporteFondoAhorroBanorte', ['<%=htTiposReporte.Item("109") %>'],
                                        function(result) {
                                            if ($('#errorH').val() != "") {
                                                showError($("#errorH").val());
                                                $('#errorH').val("");
                                            }
                                            hideWait();
                                        }
                                    );
                                 } else {
                                     hideWait();
                                 }
                                 break;
                             case 110:
                                 clearErrors();
                                 esValido = esValido && validacombo2($("#IdTipoNominaAsig")[0], $("#lblIdTipoNominaAsig").text());
                                 esValido = esValido && validacombo2($("#IdTipoNominaProc")[0], $("#lblIdTipoNominaProc").text());
                                 esValido = esValido && validacombo2($("#Periodo")[0], $("#lblPeriodo").text());
                                 esValido = esValido && validacombo2($("#idTipoPersona")[0], $("#lblidTipoPersona").text());
                                 if (esValido) {
                                     Anthem_InvokePageMethod('ReporteCajaAhorroBanorte', ['<%=htTiposReporte.Item("110") %>'],
                                        function(result) {
                                            if ($('#errorH').val() != "") {
                                                showError($("#errorH").val());
                                                $('#errorH').val("");
                                            }
                                            hideWait();
                                        }
                                    );
                                 } else {
                                     hideWait();
                                 }
                                 break;
                             case 111: //Layout Pedido de saldos TAE
                                 clearErrors();
                                 esValido = esValido && validacombo2($("#IdTipoNominaAsig")[0], $("#lblIdTipoNominaAsig").text());
                                 esValido = esValido && validacombo2($("#IdTipoNominaProc")[0], $("#lblIdTipoNominaProc").text());
                                 esValido = esValido && validacombo2($("#Periodo")[0], $("#lblPeriodo").text());
                                 esValido = esValido && validacombo2($("#idTarjeta")[0], $("#lblidTarjeta").text());                                 
                                 esValido = esValido && validacampo($("#FechaPedido")[0], true, $("#lblFechaPedido").text(), "fecha", 10, 9, '');
                                 esValido = esValido && fechaRango($("#FechaPedido")[0], $("#lblFechaPedido").text(), 1900, 2050);

                                 if (esValido) {
                                     Anthem_InvokePageMethod('ReporteLayoutPedidoSaldoTAE', ['<%=htTiposReporte.Item("111") %>'],
                                        function(result) {
                                            if ($('#errorH').val() != "") {
                                                showError($("#errorH").val());
                                                $('#errorH').val("");
                                            }
                                            hideWait();
                                        }
                                    );
                                 } else {
                                     hideWait();
                                 }
                                 break;
                             case 112: //Layout Pedido de saldos TRE
                                 clearErrors();
                                 esValido = esValido && validacombo2($("#IdTipoNominaAsig")[0], $("#lblIdTipoNominaAsig").text());
                                 esValido = esValido && validacombo2($("#IdTipoNominaProc")[0], $("#lblIdTipoNominaProc").text());
                                 esValido = esValido && validacombo2($("#Periodo")[0], $("#lblPeriodo").text());
                                 esValido = esValido && validacombo2($("#idTarjeta")[0], $("#lblidTarjeta").text()); 
                                 esValido = esValido && validacampo($("#FechaPedido")[0], true, $("#lblFechaPedido").text(), "fecha", 10, 9, '');
                                 esValido = esValido && fechaRango($("#FechaPedido")[0], $("#lblFechaPedido").text(), 1900, 2050);

                                 if (esValido) {
                                     Anthem_InvokePageMethod('ReporteLayoutPedidoSaldoTRE', ['<%=htTiposReporte.Item("112") %>'],
                                        function(result) {
                                            if ($('#errorH').val() != "") {
                                                showError($("#errorH").val());
                                                $('#errorH').val("");
                                            }
                                            hideWait();
                                        }
                                    );
                                 } else {
                                     hideWait();
                                 }
                                 break;
                             case 113: //Layout Pedido de saldos TR
                                 clearErrors();
                                 esValido = esValido && validacombo2($("#IdTipoNominaAsig")[0], $("#lblIdTipoNominaAsig").text());
                                 esValido = esValido && validacombo2($("#IdTipoNominaProc")[0], $("#lblIdTipoNominaProc").text());
                                 esValido = esValido && validacombo2($("#Periodo")[0], $("#lblPeriodo").text());
                                 esValido = esValido && validacombo2($("#idTarjeta")[0], $("#lblidTarjeta").text()); 
                                 esValido = esValido && validacampo($("#FechaPedido")[0], true, $("#lblFechaPedido").text(), "fecha", 10, 9, '');
                                 esValido = esValido && fechaRango($("#FechaPedido")[0], $("#lblFechaPedido").text(), 1900, 2050);

                                 if (esValido) {
                                     Anthem_InvokePageMethod('ReporteLayoutPedidoSaldoTR', ['<%=htTiposReporte.Item("113") %>'],
                                        function(result) {
                                            if ($('#errorH').val() != "") {
                                                showError($("#errorH").val());
                                                $('#errorH').val("");
                                            }
                                            hideWait();
                                        }
                                    );
                                 } else {
                                     hideWait();
                                 }
                                 break;
                             case 114: //Layout Pedido de saldos VU
                                 clearErrors();
                                 esValido = esValido && validacombo2($("#IdTipoNominaAsig")[0], $("#lblIdTipoNominaAsig").text());
                                 esValido = esValido && validacombo2($("#IdTipoNominaProc")[0], $("#lblIdTipoNominaProc").text());
                                 esValido = esValido && validacombo2($("#Periodo")[0], $("#lblPeriodo").text());
                                 esValido = esValido && validacombo2($("#idTarjeta")[0], $("#lblidTarjeta").text()); 
                                 esValido = esValido && validacampo($("#FechaPedido")[0], true, $("#lblFechaPedido").text(), "fecha", 10, 9, '');
                                 esValido = esValido && fechaRango($("#FechaPedido")[0], $("#lblFechaPedido").text(), 1900, 2050);

                                 if (esValido) {
                                     Anthem_InvokePageMethod('ReporteLayoutPedidoSaldoVU', ['<%=htTiposReporte.Item("114") %>'],
                                        function(result) {
                                            if ($('#errorH').val() != "") {
                                                showError($("#errorH").val());
                                                $('#errorH').val("");
                                            }
                                            hideWait();
                                        }
                                    );
                                 } else {
                                     hideWait();
                                 }
                                 break;

                             case 115:
                                 clearErrors();
                                 esValido = esValido && validacombo2($("#IdTipoNominaAsig")[0], $("#lblIdTipoNominaAsig").text());
                                 esValido = esValido && validacombo2($("#IdTipoNominaProc")[0], $("#lblIdTipoNominaProc").text());
                                 esValido = esValido && validacombo2($("#idProductoTarjeta")[0], $("#lblIdProductoTarjeta").text());
                                                              
                                 $("#idRegistroCatalogo").val($("#idProductoTarjeta").val());
                                 
                                 if (esValido) {
                                     Anthem_InvokePageMethod('LayoutPedidoTarjetas', ['<%=htTiposReporte.Item("115") %>'],
                                        function(result) {
                                            if ($('#errorH').val() != "") {
                                                showError($("#errorH").val());
                                                $('#errorH').val("");
                                            }
                                            hideWait();
                                        }
                                    );
                                 } else {
                                     hideWait();
                                 }
                                 break;
                            <%if Not Intelexion.Framework.SystemFlags.SystemFlags.getValueById(3998) Is Nothing AndAlso Intelexion.Framework.SystemFlags.SystemFlags.getValueById(3998) = "1" %>
                             case 116:
                                 clearErrors();

                                 esValido = esValido && validacombo2($("#IdTipoNominaAsig")[0], $("#lblIdTipoNominaAsig").text());
                                 esValido = esValido && validacombo2($("#IdTipoNominaProc")[0], $("#lblIdTipoNominaProc").text());
                                 esValido = esValido && validacombo2($("#idProductoTarjeta")[0], $("#lblIdProductoTarjeta").text());

                                 $("#idRegistroCatalogo").val($("#idProductoTarjeta").val());

                                 Anthem_InvokePageMethod('LayoutCargaTarjetas', ['<%=htTiposReporte.Item("116") %>'],
                                    function(result) {
                                        if ($('#errorH').val() != "") {
                                            showError($("#errorH").val());
                                            $('#errorH').val("");
                                        }
                                        hideWait();

                                    });

                                 break;
                            <%End IF %>  
                            
                            case 119:
                                 clearErrors();

                                 esValido = esValido && validacombo2($("#IdTipoNominaAsig")[0], $("#lblIdTipoNominaAsig").text());
                                 esValido = esValido && validacombo2($("#IdTipoNominaProc")[0], $("#lblIdTipoNominaProc").text());
                                 esValido = esValido && validacombo2($("#Periodo")[0], $("#lblPeriodo").text());
                                 esValido = esValido && validacombo2($("#ConceptoPolizaContable")[0], $("#lblConceptoPolizaContable").text());
                                 
                                 if (esValido) {
                                     Anthem_InvokePageMethod('PolizaContableConcepto', ['<%=htTiposReporte.Item("119") %>','0'],
                                        function(result) {
                                            if ($('#errorH').val() != "") {
                                                showError($("#errorH").val());
                                                $('#errorH').val("");
                                            }
                                            hideWait();

                                        });                                                                     
                                }else {
                                    hideWait();
                                 }                                                       
                                break;
                            case 118:
                                clearErrors();
                                esValido = esValido && validacombo2($("#IdTipoNominaAsig")[0], $("#lblIdTipoNominaAsig").text());
                                esValido = esValido && validacombo2($("#IdTipoNominaProc")[0], $("#lblIdTipoNominaProc").text());
                                esValido = esValido && validacombo2($("#Periodo")[0], $("#lblPeriodo").text());                                 
                                esValido = esValido && validacampo($("#IdEmpleado")[0], true, $("#lblEmpleado").text(), "texto", 30, 1, '');
                                esValido = esValido && validacombo2($("#idFormaPago")[0], $("#lblFormaPago").text());
                                
                                if ($("#idFormaPago").val() == 1){
                                    showError("<%=Intelexion.Framework.SystemLabels.SystemLabels.getValueById(17783, Context.Session("LID"))%>");
                                    esValido = false                                 
                                }
                                if ($("#idFormaPago").val() == 6){	
                                    esValido = esValido && validacombo2($("#idPais")[0], $("#lblPais").text());    
                                    esValido = esValido && validacombo2($("#idEstado")[0], $("#lblEstado").text());    
                                    esValido = esValido && validacombo2($("#idMunicipio")[0], $("#lblMunicipio").text());    						          
							        esValido = esValido && validacampo($("#Comision")[0], true, $("#lblComision").text(), "decimal", '8', '1', '');
							        esValido = esValido && validacampo($("#ivaComision")[0], true, $("#lblivaComision").text(), "decimal", '8', '1', '');
							        esValido = esValido && validacampo($("#IDE")[0], true, $("#lblIDE").text(), "decimal", '8', '1', '');  							        							  
                                }
                                
                                if (esValido) {                                    
                                    Anthem_InvokePageMethod('PolizaContableNominaIndividual', ['<%=htTiposReporte.Item("118") %>','0'],
                                        function(result) {
                                            if ($('#errorH').val() != "") {
                                                showError($("#errorH").val());
                                                $('#errorH').val("");
                                            }
                                            hideWait();
                                        }
                                    );
                                 }else {
                                    hideWait();
                                 }
                                 break;
                                 
                            case 117:
                                clearErrors();
                                esValido = esValido && validacombo2($("#IdTipoNominaAsig")[0], $("#lblIdTipoNominaAsig").text());
                                esValido = esValido && validacombo2($("#IdTipoNominaProc")[0], $("#lblIdTipoNominaProc").text());
                                esValido = esValido && validacombo2($("#Periodo")[0], $("#lblPeriodo").text());                                 
                                esValido = esValido && validacampo($("#IdEmpleado")[0], true, $("#lblEmpleado").text(), "texto", 30, 1, '');
                                
                                if (esValido) {                                    
                                    Anthem_InvokePageMethod('PolizaContableAnticipoSueldos', ['<%=htTiposReporte.Item("117") %>','0'],
                                        function(result) {
                                            if ($('#errorH').val() != "") {
                                                showError($("#errorH").val());
                                                $('#errorH').val("");
                                            }
                                            hideWait();
                                        }
                                    );
                                 }else {
                                    hideWait();
                                 }
                                 break;
                            
                            case 131:
		                        showWait();
                                clearErrors();
                                CrearCategorias();
                                esValido = esValido && validacombo2($("#IdTipoNominaAsig")[0], $("#lblIdTipoNominaAsig").text());
                                esValido = esValido && validacombo2($("#IdTipoNominaProc")[0], $("#lblIdTipoNominaProc").text());
                                esValido = esValido && validacombo2($("#Periodo")[0], $("#lblPeriodo").text());
                        
	                            if (esValido) {	                     
	                                Anthem_InvokePageMethod('PolizaContableNominaFiniquitosMasiva',['<%=htTiposReporte.Item("131") %>','0'],
						                function(result) {
						                    if ($('#errorH').val() != "") {
                                                showError($("#errorH").val());
                                                $('#errorH').val("");
                                            }
        						            $('#divFiniquitosMasivo').css('display','block');						                                                                                         
                                            hideWait();
						                }
					                );	
					            }else {
                                    hideWait();
                                }    						   				    						    			   
	                            break;
	                  
                            case 120: /*ALTAS Cuentas y Reposiciones BANORTE*/
		                    
		                        
		                        Anthem_InvokePageMethod(
							        'LayoutGenericoBancos',
									    ['LayoutAltasReposicionesBANORTE_HD', '<%=htTiposReporte.Item("120") %>'],
							        function(result) {
							            hideWait();
							        }
						        );
		                         
		                    break;
		                    
		                    case 121: /*Layout Banorte A/B cuentas de terceros*/
		                    
		                        
		                        Anthem_InvokePageMethod(
							        'LayoutGenericoBancos',
									    ['LayoutBANORTE_AB_CuentasTerceros_HD', '<%=htTiposReporte.Item("121") %>'],
							        function(result) {
							            hideWait();
							        }
						        );
		                         
		                    break;    
		                    
		                    case 122: /*Layout de Creditos OUT*/
		                    		                        
		                        Anthem_InvokePageMethod(
							        'LayoutGenericoBancos',
									    ['LayoutCreditosOUT', '<%=htTiposReporte.Item("122") %>'],
							        function(result) {
							            hideWait();
							        }
						        );
		                         
		                    break; 
		                    
		                    case 123:
		                    Anthem_InvokePageMethod(
							    'ReporteCuotasObreroPatronalesIMSS',
									['ReporteCuotasObreroPatronalesIMSS', '<%=htTiposReporte.Item("123") %>'],
							    function(result) {
							        hideWait();
							    }
						    );		                    
		                    break;
		                    
		                    case 124:
		                    Anthem_InvokePageMethod(
							    'ReportePagoSUA',
									['ReportePagoSUA', '<%=htTiposReporte.Item("124") %>'],
							    function(result) {
							        hideWait();
							    }
						    );		                    
		                    break;
		                    //jmc agregar reportes vales despensa
		                    case 125:
		                    Anthem_InvokePageMethod(
							    'ReporteValesAdicionales',
									['ReporteValesDespensaAdicionales', '<%=htTiposReporte.Item("125") %>'],
							    function(result) {
							        hideWait();
							    }
						    );	
						    break;	
		                    case 126:
		                    Anthem_InvokePageMethod(
							    'ReporteValesBajas',
									['ReporteValesDespensaBajas', '<%=htTiposReporte.Item("126") %>'],
							    function(result) {
							        hideWait();
							    }
						    );	
						    break;	
		                    case 127:
		                    Anthem_InvokePageMethod(
							    'ReporteValesReposicion',
									['ReporteValesDespensaReposicion', '<%=htTiposReporte.Item("127") %>'],
							    function(result) {
							        hideWait();






















							    }
						    );
						    break;	
		                    case 128:
		                    Anthem_InvokePageMethod(
							    'ReporteValesStock',
									['ReporteValesDespensaStock', '<%=htTiposReporte.Item("128") %>'],
							    function(result) {
							        hideWait();
							    }
						    );	
						    break;	
		                    case 129:
		                        clearErrors();
		                        esValido = esValido && validacombo2($("#IdTipoNominaAsig")[0], $("#lblIdTipoNominaAsig").text());                                
		                                                               
                                if (esValido) {
		                            Anthem_InvokePageMethod(
							            'ReporteValesTitulares',
									        ['ReporteValesDespensaTitulares', '<%=htTiposReporte.Item("129") %>'],
							            function(result) {
							                if ($('#errorH').val() != "") {
                                                showError($("#errorH").val());
                                                $('#errorH').val("");
                                            }        
							                hideWait();
							            }
						            );				                                        
                                }else {
                                    hideWait();
                                }						        

		                    break
		                    case 130:
		                        clearErrors();
                                esValido = esValido && validacombo2($("#IdTipoNominaAsig")[0], $("#lblIdTipoNominaAsig").text());
                                esValido = esValido && validacombo2($("#Periodo")[0], $("#lblPeriodo").text());
                                          
                                if (esValido) {
		                            Anthem_InvokePageMethod(
							            'ReporteValesDispersion',
									        ['ReporteValesDespensaDispersion', '<%=htTiposReporte.Item("130") %>'],
							            function(result) {
							                if ($('#errorH').val() != "") {
                                                showError($("#errorH").val());
                                                $('#errorH').val("");
                                            }                                 
                                            if ($('#procesoOK').val() != "") {
                                                alert($("#procesoOK").val());
                                                $('#procesoOK').val("");
                                            } 
                                            hideWait();
							            }							    
						            );				                                        
						         }else {
                                    hideWait();
                                 }
		                    break;
		                    
		                    //fin jmc
		                    case 132:
		                     clearErrors();
                             esValido = esValido && validacombo2($("#IdTipoNominaAsig")[0], $("#lblIdTipoNominaAsig").text());
                             esValido = esValido && validacombo2($("#Periodo")[0], $("#lblPeriodo").text());
                             
                             if (esValido){
                                 Anthem_InvokePageMethod(
						            'ReporteIncidenciasVacaciones',
								        ['AltaIncidenciaVacaciones', '<%=htTiposReporte.Item("132") %>'],
						            function(result) {
						                if ($('#errorH').val() != "") {
                                            showError($("#errorH").val());
                                            $('#errorH').val("");
                                        }  
						                hideWait();
						            }
					            );                                                                                                                                                 
                             }else {
                                hideWait();                             
                             }		                    
					        break;	
					        
					        //inicio LGDLSS
					        case 133:
		                     clearErrors();
                             esValido = esValido && validacombo2($("#IdTipoNominaAsig")[0], $("#lblIdTipoNominaAsig").text());
                             if (esValido){
                                 Anthem_InvokePageMethod(
						            'ReporteEcoV',
								        ['AltaValesDespensaEcoVale', '<%=htTiposReporte.Item("133") %>'],
						            function(result) {
						                if ($('#errorH').val() != "") {
                                            showError($("#errorH").val());
                                            $('#errorH').val("");
                                        }else{
                                            alert('<%= Intelexion.Framework.SystemLabels.SystemLabels.getValueById(18388,context.Session("LID"))%>');
                                        } 
						                hideWait();
						            }
					            );                                                                                                                                                 
                             }else {
                                hideWait();                             
                             }		                    

					        break;
					        //fin LGDLSS	                   						    						   				    						    			   		                   		                    

							case 134:
                                esValido = esValido && validacombo2($("#IdTipoNominaAsig")[0], $("#lblIdTipoNominaAsig").text());
                                esValido = esValido && validacombo2($("#IdTipoNominaProc")[0], $("#lblIdTipoNominaProc").text());
                                esValido = esValido && validacombo2($("#Periodo")[0], $("#lblPeriodo").text());
		                    
		                    Anthem_InvokePageMethod(
							        'PolizaNomina',
									    ['PolizadeNomina', '<%=htTiposReporte.Item("134") %>'],
							        function(result) {
							            hideWait();
							        }
						        );

		                    break;
		                    
                            case 135:
                                 esValido = esValido && validacombo2($("#IdTipoNominaAsig")[0], $("#lblIdTipoNominaAsig").text());
                                esValido = esValido && validacombo2($("#IdTipoNominaProc")[0], $("#lblIdTipoNominaProc").text());
                                esValido = esValido && validacombo2($("#Periodo")[0], $("#lblPeriodo").text());
                                
		                    Anthem_InvokePageMethod(
							        'PolizaHoteles',
									    ['PolizadeHoteles', '<%=htTiposReporte.Item("135") %>'],
							        function(result) {
							            hideWait();
							        }
						        );

		                    break;

					        	                   						    						   				    						    			   		                   		                    
					        case 136:
		                        
                                clearErrors();                                
                                esValido = esValido && validacombo2($("#IdTipoNominaAsig")[0], $("#lblIdTipoNominaAsig").text());
                                esValido = esValido && validacombo2($("#IdTipoNominaProc")[0], $("#lblIdTipoNominaProc").text());
                                esValido = esValido && validacombo2($("#Periodo")[0], $("#lblPeriodo").text());
                        
	                            if (esValido) {	 
	                                showWait();                    
	                                Anthem_InvokePageMethod('LayoutDispersionFondoAhorroACTINVER',
	                                    ['LayoutDispersionFondoAhorroACTINVER', '<%=htTiposReporte.Item("136") %>','136'],
						                function(result) {
						                    
						                    if ($('#errorH').val() != "") {
                                                showError($("#errorH").val());
                                                $('#errorH').val("");
                                            }
        						            
                                            hideWait();
						                }
					                );	
					            }   						   				    						    			   
	                            break;
	                            
							case 137:

								Anthem_InvokePageMethod(
									'LayoutGenericoBancos',
									['LayoutDispersionOTROSBANCOS', '<%=htTiposReporte.Item("137") %>'],
									function(result) {
										hideWait();
									}
								);
								break;
		                    
		                    case 138:
		                        Anthem_InvokePageMethod(
		                        'LayoutValesDespensaInn',
		                        ['LayoutValesDespensa','<%=htTiposReporte.Item("138") %>'],
		                        function(result){
		                            hideWait();
		                        }
		                        );		                    
		                    break;
		                    case 139:
		                    Anthem_InvokePageMethod(
							    'LayoutGenerico',
									['LayoutDispersionHSBCAsiaPacific', '<%=htTiposReporte.Item("139") %>'],
							    function(result) {
							        hideWait();
							    }
						    );
						    break;
						    
						    case 140:
						    Anthem_InvokePageMethod(
							    'LayoutGenerico',
									['ReportePayrollRun', '<%=htTiposReporte.Item("140") %>'],
							    function(result) {
							        hideWait();
							    }
						    );
						    break;
						    
						    case 141:
						    Anthem_InvokePageMethod(
							    'LayoutGenerico',
									['ReporteTimeSheet', '<%=htTiposReporte.Item("141") %>'],
							    function(result) {
							        hideWait();
							    }
						    );
						    break;
		                    
					        case 142:
                                clearErrors();                                
                                 
	                            if (esValido) {	 
	                                showWait();                    
	                                Anthem_InvokePageMethod('AvisosPermanentesIMSS',
	                                    ['AvisosPermanentesIMSS', '<%=htTiposReporte.Item("142") %>','142'],
						                function(result) {
						                    
						                    if ($('#errorH').val() != "") {
                                                showError($("#errorH").val());
                                                $('#errorH').val("");
                                            }
                                            $('#Archivo').attr('target', '_blank'); 
                                            
                                            hideWait();
						                }
					                );	
					            }   						   				    						    			   
	                            break;
	                            
	                        case 143: 
	                             Anthem_InvokePageMethod(
							        'LayoutGenerico',
									    ['ReportePayrollDetail', '<%=htTiposReporte.Item("143") %>'],
							        function(result) {
							            hideWait();
							        }
						        );
						        
						     break;   
						     case 144:
                                showWait();
                                clearErrors();                                
                                esValido = esValido && validacombo2($("#IdTipoNominaAsig")[0], $("#lblIdTipoNominaAsig").text());
                                esValido = esValido && validacombo2($("#IdTipoNominaProc")[0], $("#lblIdTipoNominaProc").text());
                                //seValido = esValido && validacombo2($("#Anio")[0], $("#lblAnio").text()); //jas
                                esValido = esValido && validacombo2($("#Periodo")[0], $("#lblPeriodo").text());
                                esValido = esValido && validacombo2($("#IdEmpleado")[0], $("#lblEmpleado").text());
                                <%If Intelexion.Framework.SystemFlags.SystemFlags.getValueById(7291) = "1" Then%>
                                esValido = esValido && validacombo2($("#tFormato")[0], $("#tipoFormato").text());
                                <%End If%>
                        
                                if (esValido){
                                 Anthem_InvokePageMethod('TransferenciasNominaHSBC',
								        ['TransferenciasNomina', '<%=htTiposReporte.Item("144") %>'],
						            function(result) {
						                if ($('#errorH').val() != "") {
                                            showError($("#errorH").val());
                                            $('#errorH').val("");
                                        }else{
                                            alert('<%= Intelexion.Framework.SystemLabels.SystemLabels.getValueById(30117,context.Session("LID"))%>');
                                        } 
						                hideWait();
						            }
					             );                                                                                                                                                 
                                 }else {
                                    hideWait();                             
                                 }
                                 break;   
							
							case 145:/*Layout Dispersion SCOTIABANK[FIBRAINN]*/
								Anthem_InvokePageMethod(
							    'LayoutGenerico',
									['LayoutDispersionSCOTIABANKFibraInn', '<%=htTiposReporte.Item("145") %>'],
							    function(result) {
							        hideWait();
							    }
						    );
						    
								 
							case 146:/*Layout Dispersion Loyal Bank*/
								Anthem_InvokePageMethod(
							    'LayoutGenerico',
									['LayoutDispersionLoyalBank', '<%=htTiposReporte.Item("146") %>'],
							    function(result) {
							        hideWait();
							    }
						    );
						    
                            case 147:
		                        processCommand = "LayoutDepositosValesSodexoExcel";
		                        var e = "";
		                        Anthem_InvokePageMethod(
							            'LayoutGenericodsLayout',
									        [e, processCommand, '<%=htTiposReporte.Item("147") %>'],
							            function(result) {
							                hideWait();
							            }
						            );
		                        break;	
                            case 148: /*Layout Disperson Banamex Prestamos (Gerac)*/
			                    Anthem_InvokePageMethod(
                                'LayoutGenericoBancos',
                                ['LayoutDispersionBANAMEXPrestamos', '<%=htTiposReporte.Item("148") %>'],
                                function(result) {
                                    hideWait();
                                }
                                );
		                        break;	
		                        
		                case 149:
                            clearErrors();
                                esValido = esValido && validacampo($("#FechaDesde")[0], true, $("#lblFechaDesde").text(), "fecha", 10, 9, '');
                                esValido = esValido && validacampo($("#FechaHasta")[0], true, $("#lblFechaHasta").text(), "fecha", 10, 9, '');
		                        esValido = esValido && comparaValorTipo($("#FechaDesde")[0], $("#FechaHasta")[0], 'fecha', 'menorIgual', '<%=Intelexion.Framework.SystemLabels.SystemLabels.getValueById(14298,context.Session("LID"))%>');
                            esValido = esValido && validacombo2($("#IdTipoNominaAsig")[0], $("#lblIdTipoNominaAsig").text());
                            LeeEmpleados();
                            if (Empleados) {
		                        var e = $("#Empleados").val();
                                 if (esValido) {
                                     Anthem_InvokePageMethod('FondoAhorroAltaEmpleados', ['<%=htTiposReporte.Item("149") %>'],
                                        function(result) {
                                            if ($('#errorH').val() != "") {
                                                showError($("#errorH").val());
                                                $('#errorH').val("");
                                            }
                                            hideWait();

                                        });                                                                     
                                }else {
                                    hideWait();
                                 }        
                                 }                                               
                                break;
		                    
		                    case 150: /* Interfaz Fondo Ahorro Aportaciones(FO)*/
		                       showWait();
		                        Anthem_InvokePageMethod(
							        'FondoAhorroAportaciones',
							        ['<%=htTiposReporte.Item("150") %>'], 
							        function(result) {
                                        if ($('#errorH').val() != "") {
                                            showError($("#errorH").val());
                                            $('#errorH').val("");
                                        }
                                        hideWait();
                                    }
						        );
		                    break;
		                    
		                    case 151:
                                showWait();
                                clearErrors();                                
                                esValido = esValido && validacombo2($("#IdTipoNominaAsig")[0], $("#lblIdTipoNominaAsig").text());
                                esValido = esValido && validacombo2($("#IdTipoNominaProc")[0], $("#lblIdTipoNominaProc").text());
                                //seValido = esValido && validacombo2($("#Anio")[0], $("#lblAnio").text()); //jas
                                esValido = esValido && validacombo2($("#Periodo")[0], $("#lblPeriodo").text());
                        
                                if (esValido){
                                 Anthem_InvokePageMethod('LayoutSAP',
								        ['ContabilidadSAP', '<%=htTiposReporte.Item("151") %>'],
						            function(result) {
						                if ($('#errorH').val() != "") {
                                            showError($("#errorH").val());
                                            $('#errorH').val("");
                                        }else{
                                            alert('<%= Intelexion.Framework.SystemLabels.SystemLabels.getValueById(30789,context.Session("LID"))%>');
                                        } 
						                hideWait();
						            }
					             );                                                                                                                                                 
                                 }else {
                                    hideWait();                             
                                 }
                                 break;
                                
                            case 152:
                                showWait();
                                clearErrors();                                
                                esValido = esValido && validacombo2($("#IdTipoNominaAsig")[0], $("#lblIdTipoNominaAsig").text());
                                esValido = esValido && validacombo2($("#IdTipoNominaProc")[0], $("#lblIdTipoNominaProc").text());
                                esValido = esValido && validacombo2($("#Anio")[0], $("#lblAnio").text()); 
                                esValido = esValido && validacombo2($("#mesDesde")[0], $("#lblMesDesde").text()); 
                                esValido = esValido && validacombo2($("#mesHasta")[0], $("#lblMesHasta").text()); 
                        
                                if (esValido){
                                document.getElementById("IdTipoNominaProc").disabled = false;
                                 Anthem_InvokePageMethod('ListadoMaestroMensual',
								        ['ListadoMaestroMensual', '<%=htTiposReporte.Item("152") %>'],
						            function(result) {
						                document.getElementById("IdTipoNominaProc").disabled = true;
						                if ($('#errorH').val() != "") {
                                            showError($("#errorH").val());
                                            $('#errorH').val("");
                                        }else{
                                            alert('Se ha generado el Listado Maestro Mensual Exitosamente');
                                        } 
						                hideWait();
						            }
					             );                                                                                                                                                 
                                 }else {
                                    hideWait();                             
                                 }
                            break;
                         case 155:
                                showWait();
                                clearErrors();                                
                                                                
                                esValido = esValido && validacombo2($("#IdTipoNominaAsig")[0], $("#lblIdTipoNominaAsig").text());
                                esValido = esValido && validacombo2($("#IdTipoNominaProc")[0], $("#lblIdTipoNominaProc").text());
                                //seValido = esValido && validacombo2($("#Anio")[0], $("#lblAnio").text()); //jas
                                esValido = esValido && validacombo2($("#Periodo")[0], $("#lblPeriodo").text());
                        
                            if (esValido) {
                                Anthem_InvokePageMethod('EjecutarPolizaWSCreateAccountEntry',
                                    [document.getElementById("Periodo").value, document.getElementById("IdTipoNominaAsig").value, document.getElementById("IdTipoNominaProc").value],
                                    function (result) {
                                        console.log(result);
                                        if (document.getElementById("errorH").value != "") {
                                            showError(document.getElementById("errorH").value);
                                        } else {
                                            alert("Se ha enviado la poliza correctamente");
                                        }
                                        hideWait();
                                    }
                                );
                            }
                                 break;

                            case 156:
                                clearErrors();                                
                                
                                esValido = esValido && validacombo2($("#IdTipoNominaAsig")[0], $("#lblIdTipoNominaAsig").text());
                                esValido = esValido && validacombo2($("#IdTipoNominaProc")[0], $("#lblIdTipoNominaProc").text());
                                esValido = esValido && validacombo2($("#Periodo")[0], $("#lblPeriodo").text());            
                                esValido = esValido && validacampo($("#FechaPago")[0], true, $("#lblFechaPago").text(), "texto", 10, 10, '');
                               
                                if(esValido){
                                    var fechaPago = $("#FechaPago").val(),
                                        arrFechaPago = fechaPago.split('/');
                                        
                                      if(arrFechaPago.length < 3){
                                        hideWait();
                                        showError('<%=Intelexion.Framework.SystemLabels.SystemLabels.getValueById(33445, Context.Session("LID"))%>')
                                        return false;
                                      }  
                                        
                                     var fechaPago = arrFechaPago[1] + '/' + arrFechaPago[0] + '/' + arrFechaPago[2],
                                        oFechaPago = new Date(fechaPago),
                                        fechaActual = new Date();
                                        
                                     var diasFechaPago = "<%=Intelexion.Framework.SystemFlags.SystemFlags.getValueById(9042).ToString %>",
                                        diasFechaPago = parseInt(diasFechaPago);
                                        
                                     fechaActual.setDate(fechaActual.getDate() + diasFechaPago);
                                   
                                    if(oFechaPago > fechaActual){
                                        hideWait();
                                        var mensaje = '<%=Intelexion.Framework.SystemLabels.SystemLabels.getValueById(33446, Context.Session("LID"))%>'
                                        mensaje = mensaje.replace('#numDias#', diasFechaPago);
                                        showError(mensaje)
                                        return false;
                                    }
                                    
                                     var horaAplicada = $('#HoraAplicacion').val();
                                     var re = /^([8-9]|0[8-9]|1[0-9]|2[0-0]):[0-5][0-9]$/;
                                
                                    if (re.test(horaAplicada)) {    
                                        var arr = horaAplicada.toString().split(":");
                                    
                                        if(arr[0] == "20" && arr[1] != "00"){
                                            hideWait();
                                            showError('<%=Intelexion.Framework.SystemLabels.SystemLabels.getValueById(33440, Context.Session("LID"))%>')
                                            return false;   
                                        }                                    
                                    
                                        Anthem_InvokePageMethod('LayoutPagosProgramados',[$("#IdTipoNominaProc").val(),horaAplicada],
						                function(result) {
						                        
						                        var mensaje = $('#errorH').val()
						                        
						                        if (mensaje.length > 0) {
						                            mensaje = $("#errorH").val() 
                                                    $('#errorH').val("");
                                                }
                                                else{
                                                
                                                    $('#muestraDialogo #DescargarArchivo').show()
                                                    mensaje = '<%=Intelexion.Framework.SystemLabels.SystemLabels.getValueById(33441, Context.Session("LID"))%>'  
                                                }
                                                    
						                        hideWait();
						                        showError(mensaje)
						                        
						                    }
					                    );	
                                    
                                    } else {
                                        hideWait();
                                        showError('<%=Intelexion.Framework.SystemLabels.SystemLabels.getValueById(33440, Context.Session("LID"))%>')
                                        return false;
                                    }
                                }
                             
							break;

                        case 157:
                            esValido = esValido && validacombo2($("#IdTipoNominaAsig")[0], $("#lblIdTipoNominaAsig").text());
                            esValido = esValido && validacombo2($("#IdTipoNominaProc")[0], $("#lblIdTipoNominaProc").text());
                            esValido = esValido && validacombo2($("#Periodo")[0], $("#lblPeriodo").text());

                            Anthem_InvokePageMethod(
                                'PolizaNominaFMC',
                                ['PolizadeNominaFMC', '<%=htTiposReporte.Item("157") %>'],
								function (result) {
									console.log(result)
                                    hideWait();
                                }
                            );

                            break;
		                    
							case 100012:
							    showWait();
							    Anthem_InvokePageMethod(
							    //siempre es este es generico
                                'LayoutGenericodsLayout',
							    //nombre en el DAO y formato de salida
                                ['', 'LayoutGenericodsLayout', '<%=htTiposReporte.Item("100012") %>', 'sqlLayoutEcoVale'],
							    //     salida de formato                                   nombre en el DAO
                                function(result) {
                                    hideWait();
                                }
                            );


							    break;

							case 100013:
							    showWait();
							    Anthem_InvokePageMethod(
							    //siempre es este es generico
                                'LayoutGenericodsLayout',
							    //nombre en el DAO y formato de salida
                                ['', 'LayoutGenericodsLayout', '<%=htTiposReporte.Item("100013") %>', 'sqlLayoutSiVale'],
							    //     salida de formato                                   nombre en el DAO
                                function(result) {
                                    hideWait();
                                }
                            );
							    break;

							case 100090:
							    showWait();
							    Anthem_InvokePageMethod(
							    //siempre es este es generico
                                'LayoutGenericodsLayout',
							    //nombre en el DAO y formato de salida
                                ['', 'LayoutGenericodsLayout', '<%=htTiposReporte.Item("100090") %>', 'sqlReportePrestamos'],
							    //     salida de formato                                   nombre en el DAO
                                function(result) {
                                    hideWait();
                                }
                            );
                             break;
		                    case 100091:
		                        Anthem_InvokePageMethod(
							        'LayoutGenerico',
                                        ['LayoutGenerico', '<%=htTiposReporte.Item("100091") %>', 'LayoutHSBCDispersion'],
							        function(result) {
							            hideWait();
							        }
						        );
		                        //document.forms[0].action=path + '/Nomina/ReportesProceso/LayoutAportacionesPrudential/LayoutAportacionesPrudential.process?IdTipoNominaProc='+IdTipoNominaProc;
		                        //document.forms[0].submit();
		                        break;
		                    case 100092:
		                        Anthem_InvokePageMethod(
							        'LayoutGenerico',
                                        ['LayoutGenerico', '<%=htTiposReporte.Item("100092") %>', 'LayoutHSBCAltas'],
							        function(result) {
							            hideWait();
							        }
						        );
		                        //document.forms[0].action=path + '/Nomina/ReportesProceso/LayoutAportacionesPrudential/LayoutAportacionesPrudential.process?IdTipoNominaProc='+IdTipoNominaProc;
		                        //document.forms[0].submit();
		                        break;
		                        
//		                        //Dispersion Multibanco SIP Edenred(Buscar por #Case)
//		                        case 100093:
//		                        
//		                        showWait();
//                                clearErrors();                                
//                              
//		                        Anthem_InvokePageMethod(
//							        'LayoutGenerico',
//                                        ['LayoutGenerico', '<%=htTiposReporte.Item("100093") %>', 'LayoutDispersionMultibancoSIP'],
//							        function(result) {
//							            hideWait();
//							        }
//						        );
//		                        document.forms[0].action=path + '/Nomina/ReportesProceso/LayoutAportacionesPrudential/LayoutAportacionesPrudential.process?IdTipoNominaProc='+IdTipoNominaProc;
//		                       document.forms[0].submit();
//		                        break;
		                        
		                        
							case 64:
							    document.getElementById("IdTipoNominaProc").disabled=false;	
							    document.forms[0].__VIEWSTATE.name = 'ignore';
							    document.forms[0].__VIEWSTATE.value = '';
							    //document.forms[0].action = path + '/Interfaz/LayoutTimbradoRFacil.aspx';
							    document.forms[0].action = path + '/Interfaz/PresidenteSAPR3.aspx';
							    document.forms[0].submit();
							    break;
								
							case 100005://MHZ Reporte Timbrado
								 showWait();
								Anthem_InvokePageMethod(
								'LayoutGenericodsLayout', // 'LayoutGenericodsLayout' da como resultado archivo de excel
											 // se abre corchete, para salida en excel son 4 parametros
											 // el primero es texto vacio, despues es la palabra reservada, despues en código servidor con el id
											 // por último el nombre del stored a ejecutar
								['','LayoutGenericodsLayout', '<%=htTiposReporte.Item("100005")%>', 'sp_reporteTimbradoCFDI'],
											 //     salida de formato                                   nombre en el DAO
								function(result) {
									hideWait();
								}
							);
							break;
							
							case 101006:
                                showWait();
                                Anthem_InvokePageMethod(
                                'LayoutGenericodsLayout',
                                 ['', 'LayoutGenericodsLayout', '<%=htTiposReporte.Item("101006") %>', 'spq_nomValesSodexo'],
                                             //     salida de formato                                   nombre en el DAO
                                function(result) {
                                    hideWait();
                                }
                            );
                            break;
							
							
							case 500001:
                                showWait();
                                Anthem_InvokePageMethod(
                                'LayoutGenericodsLayout',
                                 ['', 'LayoutGenericodsLayout', '<%=htTiposReporte.Item("500001") %>', 'spq_ValesDespensaEdenred'],
                                             //     salida de formato                                   nombre en el DAO
                                function(result) {
                                    hideWait();
                                }
                            );
                            break;
							
							case 500002:
                                showWait();
                                Anthem_InvokePageMethod(
                                'LayoutGenericodsLayout',
                                 ['', 'LayoutGenericodsLayout', '<%=htTiposReporte.Item("500002") %>', 'spq_PolizaTertius'],
                                             //     salida de formato                                   nombre en el DAO
                                function(result) {
                                    hideWait();
                                }
                            );
                            break;
							
							case 500003:
                                showWait();
                                Anthem_InvokePageMethod(
                                'LayoutGenericodsLayout',
                                 ['', 'LayoutGenericodsLayout', '<%=htTiposReporte.Item("500003") %>', 'spq_ReporteCostos'],
                                             //     salida de formato                                   nombre en el DAO
                                function(result) {
                                    hideWait();
                                }
                            );
                            break;

					case 500004:
                                showWait();
                                Anthem_InvokePageMethod(
                                'LayoutGenericodsLayout',
                                 ['', 'LayoutGenericodsLayout', '<%=htTiposReporte.Item("500004") %>', 'spq_ReporteMovimientosImss'],
                                             //     salida de formato                                   nombre en el DAO
                                function(result) {
                                    hideWait();
                                }
                            );
                            break;
							
							case 500006:
                                showWait();
                                Anthem_InvokePageMethod(
                                'LayoutGenericodsLayout',
                                 ['', 'LayoutGenericodsLayout', '<%=htTiposReporte.Item("500006") %>', 'SP_Reporte_UUID'],
                                             //     salida de formato                                   nombre en el DAO
                                function(result) {
                                    hideWait();
                                }
                            );
                            break;
							
							case 500007:
							var IdTipoNominaAsig;
							var IdTipoNominaProc;
							var IdRazonSocial;
	
							IdTipoNominaAsig=document.all("IdTipoNominaAsig").values;
							IdRazonSocial=<%=context.Session("IdRazonSocial")%>;
							
												document.forms[0].__VIEWSTATE.name = 'ignore';
												document.forms[0].__VIEWSTATE.value = '';
												document.forms[0].action = path + '/nomina/reportes/ReportePolizaSAP.aspx?IdRazonSocial='+IdRazonSocial
												document.forms[0].submit();
							break;

							case 500008:
							var IdRazonSocial;
							var FechaDesde = '';
		                    var FechaHasta = '';
							FechaDesde = $("#FechaDesde").val();
		                    FechaHasta = $("#FechaHasta").val();
							
							
                            clearErrors();
                                esValido = esValido && validacampo($("#FechaDesde")[0], true, $("#lblFechaDesde").text(), "fecha", 10, 9, '');
                                esValido = esValido && validacampo($("#FechaHasta")[0], true, $("#lblFechaHasta").text(), "fecha", 10, 9, '');
		                        esValido = esValido && comparaValorTipo($("#FechaDesde")[0], $("#FechaHasta")[0], 'fecha', 'menorIgual', '<%=Intelexion.Framework.SystemLabels.SystemLabels.getValueById(14298,context.Session("LID"))%>');
                        
						
							IdRazonSocial=<%=context.Session("IdRazonSocial")%>;
                                if (esValido) { 
												window.location.href =path + '/nomina/reportes/DatosdeAcceso.aspx?IdRazonSocial='+IdRazonSocial+'&FechaDesde='+FechaDesde+'&FechaHasta='+FechaHasta
											  }
											else 
											{
												hideWait();
											}
												
							break;

							
							default: hideWait();
		            }
		        }
		    }

            function Enviar_Poliza(){
                clearErrors();
		        var esValido = true;
                val = parseInt($("#ListaReportes").val());
		        switch (val) {
					<%If Not Intelexion.Framework.SystemFlags.SystemFlags.getValueById(10117) Is Nothing AndAlso Intelexion.Framework.SystemFlags.SystemFlags.getValueById(10117) = "1" Then%> 
                    case 15:
		            
		                showWait();
                        clearErrors();               
                        esValido = esValido && validacombo2($("#IdTipoNominaAsig")[0], $("#lblIdTipoNominaAsig").text());
                        esValido = esValido && validacombo2($("#IdTipoNominaProc")[0], $("#lblIdTipoNominaProc").text());
                        esValido = esValido && validacombo2($("#Periodo")[0], $("#lblPeriodo").text());
                        
	                    if (esValido) 
	                    {	                     
	                        Anthem_InvokePageMethod('EnviarLayoutDispercionHSBC',[],
						        function(result) 
						        {
						            if ($('#errorH').val() != "") 
						            {
                                        showError($("#errorH").val());
                                        $('#errorH').val("");
                                        
                                    }
                                    else
                                        alert('Ocurrio un error en el proceso');
                                                              
                                    hideWait();
						        }
					        );	
					    }
					    else 
					    {
                            hideWait();
                        }    
                        
		            break;
					<%End If%>
                    case 119:
                        showWait();
                        clearErrors();
                        esValido = esValido && validacombo2($("#IdTipoNominaAsig")[0], $("#lblIdTipoNominaAsig").text());
                        esValido = esValido && validacombo2($("#IdTipoNominaProc")[0], $("#lblIdTipoNominaProc").text());
                        esValido = esValido && validacombo2($("#Periodo")[0], $("#lblPeriodo").text());
                        esValido = esValido && validacombo2($("#ConceptoPolizaContable")[0], $("#lblConceptoPolizaContable").text());
                   
                        if (esValido) {
                         Anthem_InvokePageMethod('PolizaContableConcepto', ['<%=htTiposReporte.Item("119") %>','1'],
                            function(result) {
                                if ($('#errorH').val() != "") {
                                    showError($("#errorH").val());
                                    $('#errorH').val("");
                                }
                                if ($('#enviado').val() != "") {
                                    alert($("#enviado").val());
                                    $('#enviado').val("");
                                }                                
                                hideWait();

                            });                                                                     
                        }else {
                            hideWait();
                        }         
                    break;                                                                                            
                    case 118:
                        showWait();
                        clearErrors();
                        esValido = esValido && validacombo2($("#IdTipoNominaAsig")[0], $("#lblIdTipoNominaAsig").text());
                        esValido = esValido && validacombo2($("#IdTipoNominaProc")[0], $("#lblIdTipoNominaProc").text());
                        esValido = esValido && validacombo2($("#Periodo")[0], $("#lblPeriodo").text());                                 
                        esValido = esValido && validacampo($("#IdEmpleado")[0], true, $("#lblEmpleado").text(), "texto", 30, 1, '');
                        esValido = esValido && validacombo2($("#idFormaPago")[0], $("#lblFormaPago").text());                                                
                                
                        if ($("#idFormaPago").val() == 1){
                            showError("<%=Intelexion.Framework.SystemLabels.SystemLabels.getValueById(17783, Context.Session("LID"))%>");
                            esValido = false                                 
                        }
                        if ($("#idFormaPago").val() == 6){	
                            esValido = esValido && validacombo2($("#idPais")[0], $("#lblPais").text());    
                            esValido = esValido && validacombo2($("#idEstado")[0], $("#lblEstado").text());    
                            esValido = esValido && validacombo2($("#idMunicipio")[0], $("#lblMunicipio").text());    
							esValido = esValido && validacampo($("#IdEmpleadoPago")[0], true, $("#lblordenPago").text(), "texto", '20', '1', '');
                            esValido = esValido && validacampo($("#Comision")[0], true, $("#lblComision").text(), "decimal", '8', '1', '');
							esValido = esValido && validacampo($("#ivaComision")[0], true, $("#lblivaComision").text(), "decimal", '8', '1', '');
							esValido = esValido && validacampo($("#IDE")[0], true, $("#lblIDE").text(), "decimal", '8', '1', ''); 						          					        
                        }
                                
                        if (esValido) {                                    
                        Anthem_InvokePageMethod('PolizaContableNominaIndividual', ['<%=htTiposReporte.Item("118") %>','1'],
                            function(result) {
                                if ($('#errorH').val() != "") {
                                    showError($("#errorH").val());
                                    $('#errorH').val("");
                                }
                                if ($('#enviado').val() != "") {
                                    alert($("#enviado").val());
                                    $('#enviado').val("");
                                }
                                hideWait();
                            }
                        );
                        }else {
                            hideWait();
                        }
                    break;                                 
                    case 117:
                        showWait();    
                        clearErrors();
                        esValido = esValido && validacombo2($("#IdTipoNominaAsig")[0], $("#lblIdTipoNominaAsig").text());
                        esValido = esValido && validacombo2($("#IdTipoNominaProc")[0], $("#lblIdTipoNominaProc").text());
                        esValido = esValido && validacombo2($("#Periodo")[0], $("#lblPeriodo").text());                                 
                        esValido = esValido && validacampo($("#IdEmpleado")[0], true, $("#lblEmpleado").text(), "texto", 30, 1, '');
                        if (esValido) {                                    
                        Anthem_InvokePageMethod('PolizaContableAnticipoSueldos', ['<%=htTiposReporte.Item("117") %>','1'],
                            function(result) {
                                if ($('#errorH').val() != "") {
                                    showError($("#errorH").val());
                                    $('#errorH').val("");
                                }
                                if ($('#enviado').val() != "") {
                                    alert($("#enviado").val());
                                    $('#enviado').val("");
                                }
                                hideWait();
                            }
                        );
                        }else {
                            hideWait();
                        }
                    break;
                    case 131:
		                showWait();
                        clearErrors();                        
                        $("#EmpleadosPoliza").val(CadenaEmpleados());	
                        esValido = esValido && validacombo2($("#IdTipoNominaAsig")[0], $("#lblIdTipoNominaAsig").text());
                        esValido = esValido && validacombo2($("#IdTipoNominaProc")[0], $("#lblIdTipoNominaProc").text());
                        esValido = esValido && validacombo2($("#Periodo")[0], $("#lblPeriodo").text());
                        
                        if ($("#EmpleadosPoliza").val() == ''){
                            alert('<%=Intelexion.Framework.SystemLabels.SystemLabels.getValueById(17876, Context.Session("LID"))%>');
                            esValido = false
                        }
	                    if (esValido) {	                     
	                        Anthem_InvokePageMethod('PolizaContableNominaFiniquitosMasiva',['<%=htTiposReporte.Item("131") %>','1'],
						        function(result) {
						            if ($('#errorH').val() != "") {
                                        showError($("#errorH").val());
                                        $('#errorH').val("");
                                    }
                                    else{
                                        alert('<%=Intelexion.Framework.SystemLabels.SystemLabels.getValueById(17875, Context.Session("LID"))%>');
                                        $("#EmpleadosPoliza").val("");
                                    }                          
                                    hideWait();
						        }
					        );	
					    }else {
                            hideWait();
                        }    						   				    						    			   
	                break;

					case 134:
		                showWait();
                        clearErrors();                        
                                esValido = esValido && validacombo2($("#IdTipoNominaAsig")[0], $("#lblIdTipoNominaAsig").text());
                                esValido = esValido && validacombo2($("#IdTipoNominaProc")[0], $("#lblIdTipoNominaProc").text());
                                esValido = esValido && validacombo2($("#Periodo")[0], $("#lblPeriodo").text());

	                    if (esValido) 
	                    {	                     
	                        Anthem_InvokePageMethod('ActualizaPolizaNomina',['ActualizaPolizaNomina','<%=htTiposReporte.Item("134") %>'],
						        function(result) 
						        {
						            if ($('#errorH').val() != "") 
						            {
                                        showError($("#errorH").val());
                                        $("#errorH").val('')
                                        
                                    }
                                    else
                                    {
                                        alert('<%=Intelexion.Framework.SystemLabels.SystemLabels.getValueById(17875, Context.Session("LID"))%>');
                                    }                          
                                    hideWait();
						        }
					        );	
					    }
					    else 
					    {
                            hideWait();
                        }    						   				    						    			   
	                break;
	                
	                case 135:
		                showWait();
                        clearErrors();                        
                                esValido = esValido && validacombo2($("#IdTipoNominaAsig")[0], $("#lblIdTipoNominaAsig").text());
                                esValido = esValido && validacombo2($("#IdTipoNominaProc")[0], $("#lblIdTipoNominaProc").text());
                                esValido = esValido && validacombo2($("#Periodo")[0], $("#lblPeriodo").text());
                 
	                    if (esValido) 
	                    {	                     
	                        Anthem_InvokePageMethod('ActualizaPolizaHoteles',['ActualizaPolizaHoteles','<%=htTiposReporte.Item("135") %>'],
						        function(result) 
						        {
						            if ($('#errorH').val() != "") 
						            {
                                        showError($("#errorH").val());
                                        $('#errorH').val("");
                                    }
                                    else
                                    {
                                        alert('<%=Intelexion.Framework.SystemLabels.SystemLabels.getValueById(17875, Context.Session("LID"))%>');
                                    }                          
                                    hideWait();
						        }
					        );	
					    }
					    else 
					    {
                            hideWait();
                        }    						   				    						    			   
	                break;
                    case 156:				
						showWait();
                        clearErrors();               
                        esValido = esValido && validacombo2($("#IdTipoNominaAsig")[0], $("#lblIdTipoNominaAsig").text());
                        esValido = esValido && validacombo2($("#IdTipoNominaProc")[0], $("#lblIdTipoNominaProc").text());
                        esValido = esValido && validacombo2($("#Periodo")[0], $("#lblPeriodo").text());
                        esValido = esValido && validacampo($("#FechaPago")[0], true, $("#lblFechaPago").text(), "texto", 10, 10, '');
						
	                    if (esValido) 
	                    {
										var fechaPago = $("#FechaPago").val(),
                                        arrFechaPago = fechaPago.split('/');
                                        
                                      if(arrFechaPago.length < 3){
                                        hideWait();
                                        showError('<%=Intelexion.Framework.SystemLabels.SystemLabels.getValueById(33445, Context.Session("LID"))%>')
                                        return false;
                                      }  
                                        
                                     var fechaPago = arrFechaPago[1] + '/' + arrFechaPago[0] + '/' + arrFechaPago[2],
                                        oFechaPago = new Date(fechaPago),
                                        fechaActual = new Date();
                                        
                                     var diasFechaPago = "<%=Intelexion.Framework.SystemFlags.SystemFlags.getValueById(9042).ToString %>",
                                        diasFechaPago = parseInt(diasFechaPago);
                                        
                                     fechaActual.setDate(fechaActual.getDate() + diasFechaPago);
									 
									 if(oFechaPago > fechaActual){
                                        hideWait();
                                        var mensaje = '<%=Intelexion.Framework.SystemLabels.SystemLabels.getValueById(33446, Context.Session("LID"))%>'
                                        mensaje = mensaje.replace('#numDias#', diasFechaPago);
                                        showError(mensaje)
                                        return false;
                                    }
                                    
                                     var horaAplicada = $('#HoraAplicacion').val();
                                     var re = /^([8-9]|0[8-9]|1[0-9]|2[0-0]):[0-5][0-9]$/;
									 
								if (re.test(horaAplicada)){
								
										var arr = horaAplicada.toString().split(":");
                                    
                                        if(arr[0] == "20" && arr[1] != "00"){
                                            hideWait();
                                            showError('<%=Intelexion.Framework.SystemLabels.SystemLabels.getValueById(33440, Context.Session("LID"))%>')
                                            return false;   
                                        }    
										
									Anthem_InvokePageMethod('LayoutParaPagosProgramados',[],
										function(result) 
										{
											if ($('#errorH').val() != "") 
											{
												showError($("#errorH").val());
												$('#errorH').val("");
												
											}
											else
												alert('Ocurrio un error en el proceso');
																	  
											hideWait();
										}
									);	
							 }
							 else{
							alert("Error en el formato de hora"); 
						  }
					    }
					    else 
					    {
                            hideWait();
                        }    
                    	
						$("#divFechaPago").css("display", "");
	                    $("#divHoraAplicacion").css("display","");	
						
						break;

                    case 157:
                        showWait();
                        clearErrors();
                        esValido = esValido && validacombo2($("#IdTipoNominaAsig")[0], $("#lblIdTipoNominaAsig").text());
                        esValido = esValido && validacombo2($("#IdTipoNominaProc")[0], $("#lblIdTipoNominaProc").text());
                        esValido = esValido && validacombo2($("#Periodo")[0], $("#lblPeriodo").text());

                        if (esValido) {
                            Anthem_InvokePageMethod('ActualizaPolizaNomina', ['ActualizaPolizaNomina','<%=htTiposReporte.Item("134") %>'],
						        function(result) 
						        {
						            if ($('#errorH').val() != "") 
						            {
                                        showError($("#errorH").val());
                                        $("#errorH").val('')
                                        
                                    }
                                    else
                                    {
                                        alert('<%=Intelexion.Framework.SystemLabels.SystemLabels.getValueById(17875, Context.Session("LID"))%>');
                                    }
                                    hideWait();
                                }
                            );
                        }
                        else {
                            hideWait();
                        }
                        break;

                      
				       
                }
            }
            
		    function Cambiar_NomAsignacion() {		   
		        $("#IdTipoNominaProc").val($("#IdTipoNominaAsig").val());
//		        document.all("IdTipoNominaProc").selectedIndex = document.all("IdTipoNominaAsig").selectedIndex
//		        $("#IdTipoNominaProc").attr("disabled", "");                
		        Cambiar_NomProceso();		        
		    }
		    
		       

		    function Cambiar_NomProceso() {
				//MHZ Reporte Timbrado
				if($("#ListaReportes").val()=='100005' || $("#ListaReportes").val()=='101006'|| $("#ListaReportes").val()=='23' || $("#ListaReportes").val()=='15'){
		            $("#periodosCerradosAliatec").val('2');    // valor 2 para Periodos Cerrados abiertos y cerrados
		        }
		        var value = $("#IdTipoNominaProc").val();
		        Anthem_InvokePageMethod(
							    'Cambiar_NomProceso',
									[],
							    function(result) {
							        $("#IdTipoNominaProc").attr("disabled", "disabled");							        
							        $("#Edita").css("display", "");
							        $("#Cancela").css("display", "none");							        
							        mostrarFormaPago();
							    }
						    );

		        //document.forms[0].action=path + '/Nomina/ReportesProceso/Periodos/Periodos.process?IdTipoNominaProc='+value;
		        //document.forms[0].submit();
		    }

		    function Habilitar() {
		        $("#IdTipoNominaProc").attr("disabled", "");							        
				$("#Edita").css("display", "none");
				$("#Cancela").css("display", "");		      
		    }

		    function DesHabilitar() {
//		        $("#IdTipoNominaProc option:selected").index() == $("#IdTipoNominaAsig option:selected").index();	
		        $("#IdTipoNominaProc").val($("#IdTipoNominaAsig").val());	        
		        $("#IdTipoNominaProc").attr("disabled", "disabled");
		        $("#Edita").css("display", "");
				$("#Cancela").css("display", "none");			     
		    }

		    function chkTodos() {
		        if ($("#todos").is(":checked")){
		            $("#divEmpleado").css("display", "none");
		            $("#IdEmpleado").val("");
		        }
		        else {
		            $("#divEmpleado").css("display", "");
		            $("#IdEmpleado").val("");
		            $("#Nombre").val("");		            
		        }
		    }

		    function cambiarPeriodoTipo() {

		        Anthem_InvokePageMethod(
                        'periodoProcesoTIPO',
                         function(result) {
                             hideWait();
                         }
                );

		    }
		    function Borrar(ind) {

		        var indice = $(ind).closest("tr")[0].rowIndex - 1;
		        var grid = $("#gridEmpleados")[0];
//			    var cant = grid.rows.length - 1;		        
//		        var grid = $(ind).closest("table")[0];

		        grid.deleteRow(indice + 1);

		    }
		    
		    function NombreEmpleado(ctrlTxtNumeroEmpleado, ctrlLblNombreEmpleado) {
		        if (ctrlTxtNumeroEmpleado.value != "") {
		            var oXml;
		            var path = '<%=Intelexion.Framework.ApplicationConfiguration.ConfigurationSettings.GetConfigurationSettings("ApplicationPath")%>/Nomina/Empleado/NombreEmpleado/NombreEmpleado.process?IdEmpleado=' + ctrlTxtNumeroEmpleado.value;	
                    	            		            
//		            oXml = new ActiveXObject("Microsoft.XMLDOM");
//		            oXml.async = false;
//		            oXml.load(path);

                    oXml = loadXMLDoc(path);
                    
		            var empleado;
		            empleado = oXml.selectSingleNode("//Empleado");		           
		            
		            if (empleado) {		                
		                if (empleado.getAttribute("Nombre") == '') {
		                    alert('<%=Intelexion.Framework.SystemLabels.SystemLabels.getValueById(12853, Context.Session("LID"))%>');
		                    ctrlTxtNumeroEmpleado.value = "";
		                    ctrlLblNombreEmpleado.value = "";
		                    ctrlTxtNumeroEmpleado.focus();
		                }
		                else {
		                    ctrlLblNombreEmpleado.value = empleado.getAttribute("Nombre");
		                }
		            }
		        }
		    }
		    function loadXMLDoc(path) {
                try //Internet Explorer
                {
                    xmlDoc = new ActiveXObject("Microsoft.XMLDOM");
                    xmlDoc .async=false;
                    xmlDoc .load(path); 
                } catch (e) {
                    try //Firefox, Mozilla, Opera, etc.
                    {
                        var xmlhttp = new XMLHttpRequest();
                        xmlhttp.open("GET", path, false);
                        xmlhttp.setRequestHeader('Content-Type', 'text/xml');
                        xmlhttp.send("");
                        xmlDoc = xmlhttp.responseXML;
                    } catch (e) {
                        alert(e.message)
                    }
                }
                try {
                    return (xmlDoc);
                } catch (e) {
                    alert(e.message)
                }
                return (null);
            }

		    function subPeriodos() {

		        if ($("#ListaReportes").val() == "73" || $("#ListaReportes").val() == "74") {
		            $("#divSubPeriodo").css("display", "");
		            Anthem_InvokePageMethod(
                        'getSubPeriodos',
                         function(result) {

                         }
                );
		        }
		    }
		    
            
		    function Cancelar() {
                document.forms[0].__VIEWSTATE.name = 'ignore';
                document.forms[0].__VIEWSTATE.value = '';
                document.forms[0].action = path + '/Nomina/ReportesProceso/Mostrar/Mostrar.process';
                document.forms[0].submit();
		    }
		    
		    function mostrarFormaPago(){
		        val = parseInt($("#ListaReportes").val());
		        switch (val) {
		            case 118:		            
		                if($("#IdTipoNominaAsig").val() == "QNC" && $("#IdTipoNominaProc").val() == "FIE"){
		                    $("#trFormaPago").css("display", "");
		                }else{
		                    $("#trFormaPago").css("display", "none");
		                }		            
		            break
		        }		       		    
		    }
		    function CambioFormaPago(){
		        if ($("#idFormaPago").val() == 6){                               
                    $("#trPaisEstado").css("display", "");
                    $("#trMunicipio").css("display", "");
                    $(".OrdenPago").css("display", "");                                                                                                              
                } 
                else {
                    $("#trPaisEstado").css("display", "none");
                    $("#trMunicipio").css("display", "none");
                    $(".OrdenPago").css("display", "none"); 
                }
		    }
		    
		    function CambiarPais()
			{				
			    $("#idPais").focus()
			    $("#idMunicipio").val(0);
		        $("#idMunicipio").attr("disabled", "disabled");
				
				Anthem_InvokePageMethod(
							    'CambiarPais',
									[], 
							    function(result) 
							    {										      
							    }
						    );	
				
			}
			function CambiarEstado()
			{
				$("#idEstado").focus()
				
				Anthem_InvokePageMethod(
							    'CambiarEstado',
									[], 
							    function(result) 
							    {							
							    }
						    );	
			}
			
			function chkAtributos(obj)
			{	
			    fnAttr_ResetFiltroAtributos();
			    $("#filtroidElementoCategoria").val("");
			    switch (obj){
			    case 1:
			        $("input[name=selecAtributos]").attr("checked", false);
			        $("input[name=TodosAsociados]").attr("checked", true);
			        $("#divAtributosPosicion").css("display","none");
			    break;
			    case 2:
			        $("input[name=selecAtributos]").attr("checked", true); 
			        $("input[name=TodosAsociados]").attr("checked", false);
			        $("#divAtributosPosicion").css("display","");
			     
			    break;
			    			    			    			    
			    } 			    			   			    			  
			}
			
		    function seleccionar_todo(check) {
		        if (check == false){
                    $("#EmpleadosPoliza").val("");
                }
                $(".chkSeleccion").each(function() {
                    if ($(this).find('input:checkbox')) {
                      this.checked = check                                            
                    }
                });
            }
            
            function CadenaEmpleados(){               
                var cadenaEmpleados = '';
                var boolComma = false;
                $(".chkSeleccion").each(function() {  
                    if ($(this).attr("checked") == true) {
	                    if (boolComma == true) {
	                        cadenaEmpleados += ',';
	                    }
	                    cadenaEmpleados += $(this).attr("IdEmpleadoH");
	                    boolComma = true;
	                }              	                        
                });
                return cadenaEmpleados;
            }
        
            function PolizaFiniquitoEmpleado(idEmpleado) {
		        $('#divArchivoPoliza').css('display','none');	
		        $('#muestraDialogo').dialog({ autoOpen: false, width: 400, resizable: true, modal: true });
			    $("#muestraDialogo").css('display', 'block');
			    $("#muestraDialogo").dialog("open");	     		      
		        if (idEmpleado != "") {		       
		            var oXml;
					var objTopXmlDoc;
					var empleado;
		            var path = '<%=Intelexion.Framework.ApplicationConfiguration.ConfigurationSettings.GetConfigurationSettings("ApplicationPath")%>/Nomina/ReportesProceso/ExcelPolizaFiniquitoEmpleado/ExcelPolizaFiniquitoEmpleado.process?IdEmpleado=' + idEmpleado + '&IdTipoNominaProc=' + $("#IdTipoNominaProc").val() + '&IdTipoNominaAsig=' + $("#IdTipoNominaAsig").val() + '&Periodo=' + $("#Periodo").val() ;
                   
				   objTopXmlDoc = new XMLHttpRequest();
		           objTopXmlDoc.open("GET", path, false);
		           objTopXmlDoc.setRequestHeader('Content-Type', 'text/xml');
		           objTopXmlDoc.send("");

                    if (objTopXmlDoc.responseXML != "") {
                        objTopXmlDoc = objTopXmlDoc.responseXML;
                         empleado = objTopXmlDoc.selectSingleNode("//PolizaEmpleado");	
                    }
		           
		            if (empleado) {	
		                if (empleado.getAttribute("nombreArchio") != '') {		                 
		                    var RutaCompleta = '<%=Intelexion.Framework.ApplicationConfiguration.ConfigurationSettings.GetConfigurationSettings("ApplicationPath")%>' + CarpetaTemp + '/' + empleado.getAttribute("nombreArchio")			                    
		                     $('#ArchivoPoliza').attr("href",RutaCompleta);
		                     $('#divArchivoPoliza').css("display","");		                     
			                 $('#divArchivoPoliza').appendTo("#LigaExportar");			                 
		                }
		            }
		        }
		    }		                             
		    
		    function DescargarArchivo() {
		            var token = $('#hToken_DescargarArchivo').val(),
		                nombreArchivo = $('#hNombre_DescargarArchivo').val();
		                
		                window.open('<%=Intelexion.Framework.ApplicationConfiguration.ConfigurationSettings.GetConfigurationSettings("ApplicationPath")%>/DownloadFile.aspx?token='+token+'&name='+ nombreArchivo, "", "");    
//		                $('#hToken_DescargarArchivo,#hNombre_DescargarArchivo').val()  
		    }
		    
		    function AbrirArchivo(archivo,nombre)
		    {	
		        alert(archivo)
		        window.open('<%=Intelexion.Framework.ApplicationConfiguration.ConfigurationSettings.GetConfigurationSettings("ApplicationPath")%>/DownloadFile.aspx?token='+archivo+'&name='+nombre,"","");
		    }		
		                                          
        </script>			              														                     													   
	</HEAD>
	<body >
		<form id="Form1" method="post" runat="server">
		  <script language="javascript" src='<%=Intelexion.Framework.ApplicationConfiguration.ConfigurationSettings.GetConfigurationSettings("PathJS")+"/Nomina/PopupEmpleado.js"%>'></script>
	       <cc1:errordisplay id="ErrorDisplay1" runat="server" Text="Numero 1"></cc1:errordisplay>
			<script type="text/javascript">
			    $(document).ready(function() {
			        $(".scroller").css("background-color", $(".formArea").css("background-color"))

			        $("#btnEnviar").css("display", "none");
			        $("#btnEnviar").closest("span.boton-wrap-left").css("display", "none");
			        $("#btnEnviar").closest("span.boton-wrap-right").css("display", "none");
					Cambia_Reporte();	

			    });
			</script>
			<script type="text/javascript">
			    var opcionAccionn = 0
			    $(document).ready(function() {
			        var ancho
			        if (usarVista5 == '1') {
			            $('#divArchivo').appendTo("#LigaExportar");
			            $("#divArchivoSecundario").appendTo("#LigaExportar");
			            $("#Archivo").css("text-align", "center");
			            $("#Archivo").text('<%=Intelexion.Framework.SystemLabels.SystemLabels.getValueById(4384, Context.Session("LID"))%>');
			            $("#divArchivo").css("text-align", "center");
			            $("#divArchivoSecundario").css("text-align", "center");
			            $("#ArchivoSecundario").css("text-align", "center");
			            $("#ArchivoSecundario").text('<%=Intelexion.Framework.SystemLabels.SystemLabels.getValueById(4384, Context.Session("LID"))%>');
			        }
			    });

			    function cierraDialogo() {
			        $('#muestraDialogo').dialog('close')
			    }


			    function cuadroDialogo() {
			        if ($("#ListaReportes").val() != "6" && $("#ListaReportes").val() != "9" && $("#ListaReportes").val() != "10" &&
			        $("#ListaReportes").val() != "11" && $("#ListaReportes").val() != "12" && $("#ListaReportes").val() != "13" && $("#ListaReportes").val() != "14" && $("#ListaReportes").val() != "15" && $("#ListaReportes").val() != "16" && $("#ListaReportes").val() != "17" && $("#ListaReportes").val() != "18" && $("#ListaReportes").val() != "19" &&
			        $("#ListaReportes").val() != "20" && $("#ListaReportes").val() != "21" && $("#ListaReportes").val() != "22" && $("#ListaReportes").val() != "23" && $("#ListaReportes").val() != "24" && $("#ListaReportes").val() != "25" && $("#ListaReportes").val() != "26" && $("#ListaReportes").val() != "27" && $("#ListaReportes").val() != "28" &&
			        $("#ListaReportes").val() != "29" && $("#ListaReportes").val() != "30" && $("#ListaReportes").val() != "31" && $("#ListaReportes").val() != "32" && $("#ListaReportes").val() != "33" && $("#ListaReportes").val() != "34" && $("#ListaReportes").val() != "35" && $("#ListaReportes").val() != "36" && $("#ListaReportes").val() != "37" &&
			        $("#ListaReportes").val() != "38" && $("#ListaReportes").val() != "39" && $("#ListaReportes").val() != "40" && $("#ListaReportes").val() != "41" && $("#ListaReportes").val() != "42" && $("#ListaReportes").val() != "43" && $("#ListaReportes").val() != "44" && $("#ListaReportes").val() != "45" && $("#ListaReportes").val() != "46" &&
			        $("#ListaReportes").val() != "47" && $("#ListaReportes").val() != "48" && $("#ListaReportes").val() != "49" && $("#ListaReportes").val() != "50" && $("#ListaReportes").val() != "51" && $("#ListaReportes").val() != "52" && $("#ListaReportes").val() != "54" && $("#ListaReportes").val() != "55" && $("#ListaReportes").val() != "56" &&
			        $("#ListaReportes").val() != "57" && $("#ListaReportes").val() != "58" && $("#ListaReportes").val() != "61" && $("#ListaReportes").val() != "62" && $("#ListaReportes").val() != "63" && $("#ListaReportes").val() != "64" && $("#ListaReportes").val() != "65" && $("#ListaReportes").val() != "66" && $("#ListaReportes").val() != "68" &&
			        $("#ListaReportes").val() != "69" && $("#ListaReportes").val() != "70" && $("#ListaReportes").val() != "71" && $("#ListaReportes").val() != "72" && $("#ListaReportes").val() != "73" && $("#ListaReportes").val() != "74" && $("#ListaReportes").val() != "78" && $("#ListaReportes").val() != "79" && $("#ListaReportes").val() != "80" &&
			        $("#ListaReportes").val() != "81" && $("#ListaReportes").val() != "82" && $("#ListaReportes").val() != "83" && $("#ListaReportes").val() != "84" && $("#ListaReportes").val() != "85" && $("#ListaReportes").val() != "86" && $("#ListaReportes").val() != "87" && $("#ListaReportes").val() != "88" && $("#ListaReportes").val() != "89" &&
			        $("#ListaReportes").val() != "90" && $("#ListaReportes").val() != "91" && $("#ListaReportes").val() != "92" && $("#ListaReportes").val() != "93" && $("#ListaReportes").val() != "94" && $("#ListaReportes").val() != "99" && $("#ListaReportes").val() != "100" && $("#ListaReportes").val() != "101" && $("#ListaReportes").val() != "102" &&
			        $("#ListaReportes").val() != "103" && $("#ListaReportes").val() != "105" && $("#ListaReportes").val() != "106" && $("#ListaReportes").val() != "107" && $("#ListaReportes").val() != "108" && $("#ListaReportes").val() != "109" && $("#ListaReportes").val() != "110" && $("#ListaReportes").val() != "111" && $("#ListaReportes").val() != "112" 
			        && $("#ListaReportes").val() != "113" && $("#ListaReportes").val() != "114" && $("#ListaReportes").val() != "115" &&

			        $("#ListaReportes").val() != "125" && $("#ListaReportes").val() != "126" && $("#ListaReportes").val() != "127" && $("#ListaReportes").val() != "128" && $("#ListaReportes").val() != "129" && $("#ListaReportes").val() != "130" && $("#ListaReportes").val() != "136" && 
			        $("#ListaReportes").val() != "116" && $("#ListaReportes").val() != "117" && $("#ListaReportes").val() != "119" && $("#ListaReportes").val() != "120" && $("#ListaReportes").val() != "118" && $("#ListaReportes").val() != "120" && $("#ListaReportes").val() != "121" && $("#ListaReportes").val() != "122" && $("#ListaReportes").val() != "123" && 
			        $("#ListaReportes").val() != "124" && $("#ListaReportes").val() != "132" && $("#ListaReportes").val() != "133" && $("#ListaReportes").val() != "134" && $("#ListaReportes").val() != "135" && $("#ListaReportes").val() != "100012" && $("#ListaReportes").val() != "100013" && $("#ListaReportes").val() != "100090" && $("#ListaReportes").val() != "100091" && 
			        $("#ListaReportes").val() != "100092" && $("#ListaReportes").val() != "137" && $("#ListaReportes").val() != "138" && $("#ListaReportes").val() != "139" && $("#ListaReportes").val() != "140" && $("#ListaReportes").val() != "141" && $("#ListaReportes").val() != "142" && $("#ListaReportes").val() != "143" && $("#ListaReportes").val() != "144" && 
                    $("#ListaReportes").val() != "145" && $("#ListaReportes").val() != "146" && $("#ListaReportes").val() != "147" && $("#ListaReportes").val() != "148" && $("#ListaReportes").val() != "149" && $("#ListaReportes").val() != "150" && $("#ListaReportes").val() != "151" && $("#ListaReportes").val() != "152" && $("#ListaReportes").val() != "155" &&
                        $("#ListaReportes").val() != "100005" && $("#ListaReportes").val() != "101006" && $("#ListaReportes").val() != "156" && $("#ListaReportes").val() != "157" 
						&& $("#ListaReportes").val() != "500001" && $("#ListaReportes").val() != "500002" && $("#ListaReportes").val() != "500003" && $("#ListaReportes").val() != "500004" && $("#ListaReportes").val() != "500006" 
						)
					{ //&& document.getElementById("ListaReportes").value != "97" && document.getElementById("ListaReportes").value != "98": 97 y 98 se accede desde Reportes historicos

			            if ($("#ListaReportes").val() != "0") {
			                alert('<%=Intelexion.Framework.SystemLabels.SystemLabels.getValueById(12879, Context.Session("LID"))%>');
			            } else { alert('<%=Intelexion.Framework.SystemLabels.SystemLabels.getValueById(12880, Context.Session("LID"))%>'); }
			        }
			        else {			            
			        
			            $('#muestraDialogo').dialog({ autoOpen: false, width: 400, resizable: true, modal: true });
			            $("#muestraDialogo").css('display', 'block');
			            $("#muestraDialogo").dialog("open");
						$("#muestraDialogo").css('width', '92%');
                        $("#muestraDialogo").css('min-height', 'auto');
                        $("#muestraDialogo").css('height', 'auto');
                        $("#muestraDialogo").closest('div.ui-dialog', 'auto').css("height","auto");
			        }
			    }

			    function OcultarDivLiga() {
			        $("#divArchivoSecundario").css("display", "none");
			        $("#divArchivo").css("display", "none");
			        $("#muestraDialogo").css('display', 'none');
			        $("#divArchivoPoliza").css("display", "none");
			    }

			    function MostrarDivLiga() {

			        if ($("#ListaReportes").val() == "6" || $("#ListaReportes").val() == "9" || $("#ListaReportes").val() == "10" || $("#ListaReportes").val() == "11" || $("#ListaReportes").val() == "12" || $("#ListaReportes").val() == "13" || $("#ListaReportes").val() == "14" || $("#ListaReportes").val() == "15" || $("#ListaReportes").val() == "16" || $("#ListaReportes").val() == "17" || $("#ListaReportes").val() == "18" || $("#ListaReportes").val() == "19" ||
			        $("#ListaReportes").val() == "20" || $("#ListaReportes").val() == "21" || $("#ListaReportes").val() == "22" || $("#ListaReportes").val() == "23" || $("#ListaReportes").val() == "24" || $("#ListaReportes").val() == "25" || $("#ListaReportes").val() == "26" || $("#ListaReportes").val() == "27" || $("#ListaReportes").val() == "28" ||
			        $("#ListaReportes").val() == "29" || $("#ListaReportes").val() == "30" || $("#ListaReportes").val() == "31" || $("#ListaReportes").val() == "32" || $("#ListaReportes").val() == "33" || $("#ListaReportes").val() == "34" || $("#ListaReportes").val() == "35" || $("#ListaReportes").val() == "36" || $("#ListaReportes").val() == "37" ||
			        $("#ListaReportes").val() == "38" || $("#ListaReportes").val() == "39" || $("#ListaReportes").val() == "40" || $("#ListaReportes").val() == "41" || $("#ListaReportes").val() == "42" || $("#ListaReportes").val() == "43" || $("#ListaReportes").val() == "44" || $("#ListaReportes").val() == "45" || $("#ListaReportes").val() == "46" ||
			        $("#ListaReportes").val() == "47" || $("#ListaReportes").val() == "48" || $("#ListaReportes").val() == "49" || $("#ListaReportes").val() == "50" || $("#ListaReportes").val() == "51" || $("#ListaReportes").val() == "52" || $("#ListaReportes").val() == "54" || $("#ListaReportes").val() == "55" || $("#ListaReportes").val() == "56" ||
			        $("#ListaReportes").val() == "57" || $("#ListaReportes").val() == "58" || $("#ListaReportes").val() == "61" || $("#ListaReportes").val() == "62" || $("#ListaReportes").val() == "63" || $("#ListaReportes").val() == "64" || $("#ListaReportes").val() == "65" || $("#ListaReportes").val() == "66" || $("#ListaReportes").val() == "68" ||
			        $("#ListaReportes").val() == "69" || $("#ListaReportes").val() == "70" || $("#ListaReportes").val() == "71" || $("#ListaReportes").val() == "72" || $("#ListaReportes").val() == "73" || $("#ListaReportes").val() == "74" || $("#ListaReportes").val() == "77" || $("#ListaReportes").val() == "78" || $("#ListaReportes").val() == "79" || $("#ListaReportes").val() == "80" || $("#ListaReportes").val() == "81" || $("#ListaReportes").val() == "82" ||
			        $("#ListaReportes").val() == "83" || $("#ListaReportes").val() == "84" || $("#ListaReportes").val() == "85" || $("#ListaReportes").val() == "86" || $("#ListaReportes").val() == "87" || $("#ListaReportes").val() == "88" || $("#ListaReportes").val() == "89" || $("#ListaReportes").val() == "90" || $("#ListaReportes").val() == "91" || $("#ListaReportes").val() == "92" || $("#ListaReportes").val() == "93" || $("#ListaReportes").val() == "94" ||
			        $("#ListaReportes").val() == "99" || $("#ListaReportes").val() == "100" || $("#ListaReportes").val() == "101" || $("#ListaReportes").val() == "102" || $("#ListaReportes").val() == "100012" || $("#ListaReportes").val() == "100013" || $("#ListaReportes").val() == "103" || $("#ListaReportes").val() == "105" || $("#ListaReportes").val() == "106" || 
			        $("#ListaReportes").val() == "125" || $("#ListaReportes").val() == "126" || $("#ListaReportes").val() == "127" || $("#ListaReportes").val() == "128" || $("#ListaReportes").val() == "129" || $("#ListaReportes").val() == "130" || $("#ListaReportes").val() == "132" || $("#ListaReportes").val() == "133" || $("#ListaReportes").val() == "136" ||
			        $("#ListaReportes").val() == "107" || $("#ListaReportes").val() == "108" || $("#ListaReportes").val() == "109" || $("#ListaReportes").val() == "110" || $("#ListaReportes").val() == "111" || $("#ListaReportes").val() == "112" || $("#ListaReportes").val() == "113" || $("#ListaReportes").val() == "114" || $("#ListaReportes").val() == "115" || 
			        $("#ListaReportes").val() == "116" || $("#ListaReportes").val() == "117" || $("#ListaReportes").val() == "119" || $("#ListaReportes").val() == "120" || $("#ListaReportes").val() == "118" || $("#ListaReportes").val() == "120" || $("#ListaReportes").val() == "121" || $("#ListaReportes").val() == "122" || $("#ListaReportes").val() == "123" || 
			        $("#ListaReportes").val() == "124" || $("#ListaReportes").val() == "134" || $("#ListaReportes").val() == "135" || $("#ListaReportes").val() == "100090" || $("#ListaReportes").val() == "100091" || $("#ListaReportes").val() == "100092" || $("#ListaReportes").val() == "137" || $("#ListaReportes").val() == "138" || $("#ListaReportes").val() == "139" || $("#ListaReportes").val() == "140" || $("#ListaReportes").val() == "141" || 
			        $("#ListaReportes").val() == "142" || $("#ListaReportes").val() == "143"|| $("#ListaReportes").val() == "144" || $("#ListaReportes").val() == "145" || $("#ListaReportes").val() == "146" || $("#ListaReportes").val() == "147" || $("#ListaReportes").val() == "148" || $("#ListaReportes").val() == "149" || $("#ListaReportes").val() == "150" || $("#ListaReportes").val() == "151" || $("#ListaReportes").val() == "152" || $("#ListaReportes").val() == "155" ||
                    $("#ListaReportes").val() == "156" || $("#ListaReportes").val() == "157" || $("#ListaReportes").val() == "100005" || $("#ListaReportes").val() == "101006"
					|| $("#ListaReportes").val() == "500001" || $("#ListaReportes").val() == "500002" || $("#ListaReportes").val() == "500003" || $("#ListaReportes").val() == "500004" || $("#ListaReportes").val() == "500006"
					
					)
			        
					{ ///document.getElementById("ListaReportes").value == "97" || document.getElementById("ListaReportes").value == "98": 97 y 98 se accede desde Reportes Historicos

			            $("#divArchivo").css("display", "");
			            if ($("#ListaReportes").val() == 120) {
			                $("#divArchivoSecundario").css("display", "");
			            }
			        }
			    }
                
                function CrearCategorias(){
			    cadenaID = "";
			    cadenaNOMBRE = "";
		        <%If Not(Intelexion.Framework.ApplicationConfiguration.ConfigurationSettings.GetConfigurationSettings("usarVista5") = "1") Then%>
				    document.getElementById("filtroidElementoCategoria").value = "";
				    <%If Not p.getResultCollection("CategoriasValidasTodos") Is Nothing Then
						    results = p.getResultCollection("CategoriasValidasTodos")
						    Dim i As Integer
						    Dim Categoria As Intelexion.Organizacion.Entities.Categoria						
						    For i = 0 To results.Count - 1
							    Categoria = results.getByIndex(i)%>
    							
							    if (document.getElementById("filtroidElementoCategoria").value == ""){
								    if (document.getElementById("filtroid<%=Categoria.idCategoria%>").value != "")	{
									    document.getElementById("filtroidElementoCategoria").value = document.getElementById("filtroid<%=Categoria.idCategoria%>").value;
									    cadenaID = "<%=Categoria.idCategoria%>" + "-" + document.getElementById("filtroid<%=Categoria.idCategoria%>").value;
									    cadenaNOMBRE = "<%=Categoria.idCategoria%>" + "-" + document.getElementById("filtronombre<%=Categoria.idCategoria%>").innerText;
								    }
							    }
							    else{
								    if (document.getElementById("filtroid<%=Categoria.idCategoria%>").value != "")	{
									    document.getElementById("filtroidElementoCategoria").value += "," + document.getElementById("filtroid<%=Categoria.idCategoria%>").value;
									    cadenaID += "|" + "<%=Categoria.idCategoria%>" + "-" + document.getElementById("filtroid<%=Categoria.idCategoria%>").value;
									    cadenaNOMBRE += "|" + "<%=Categoria.idCategoria%>" + "-" + document.getElementById("filtronombre<%=Categoria.idCategoria%>").innerText;
								    }
							    }
    							
						    <%Next i
					    End If
				    %>
		        <%End If %>								
		    }		    		    
                                                                                                                         
            </script>    
			<div id="navigation">
				<ul>
					<li idOpcion="50" id="Nav1">
						 <%=Intelexion.Framework.SystemLabels.SystemLabels.getValueById(5934,context.Session("LID"))%>
						</li>
					<li idOpcion="94">
						 <%=Intelexion.Framework.SystemLabels.SystemLabels.getValueById(5935,context.Session("LID"))%>
						</li>
					<li >
						» <%=Intelexion.Framework.SystemLabels.SystemLabels.getValueById(5936,context.Session("LID"))%>
					</li>
				</ul>
			</div>
	        <div id="menuOpciones" class="optionsMenu">
		        <ul>
			        <% If (Intelexion.Framework.ApplicationConfiguration.ConfigurationSettings.GetConfigurationSettings("usarVista5") = "1") Then%>
			            <li id="exportarXL">
			            <a href="#" onclick="cuadroDialogo()">
			             <img id="imgArchivo" alt="" src="<%=Intelexion.Framework.ApplicationConfiguration.ConfigurationSettings.GetConfigurationSettings("ApplicationPath")%>/UI/50/images/icons/document-excel-csv.png" />
				         <%=Intelexion.Framework.SystemLabels.SystemLabels.getValueById(812, Context.Session("LID"))%>
			            </a>
			            </li>
                    <% End If%>		
		        </ul>
	        </div>
			<SPAN id="Header" runat="server"><%=Intelexion.Framework.SystemLabels.SystemLabels.getValueById(5936, Context.Session("LID"))%></SPAN>
			<div class="formArea" id="divFiltros" style="width:100%">
				<table>
					<tr id="divListaReportes">
						<td><label id="lblListaReportes" for="ListaReportes" runat="server"><%=Intelexion.Framework.SystemLabels.SystemLabels.getValueById(4736, Context.Session("LID"))%></label></td>
						<td><asp:DropDownList ID="ListaReportes" Runat="server"  onchange="Cambia_Reporte();obtenTipoNominaPoliza();Cambiar_NomAsignacion();OcultarDivLiga();"></asp:DropDownList>
						</td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
					</tr>
					<tr id="divTipoNominaAsig">
						<td><label id="lblIdTipoNominaAsig" for="IdTipoNominaAsig" Runat="server"><%=Intelexion.Framework.SystemLabels.SystemLabels.getValueById(2376, Context.Session("LID"))%></label></td>						
						<td><anthem:DropDownList id="IdTipoNominaAsig"  Runat="server"  CssClass="dList"></anthem:DropDownList></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
					</tr>				
					<tr id="divTipoNominaProc">
						<td><label id="lblIdTipoNominaProc" for="IdTipoNominaProc" Runat="server"><%=Intelexion.Framework.SystemLabels.SystemLabels.getValueById(2377, Context.Session("LID"))%></label></td>						
						<td><anthem:DropDownList id="IdTipoNominaProc"  Runat="server"  CssClass="dList"></anthem:DropDownList></td>
						<td><a onclick="Habilitar();" id="Edita"><img src='<%=Intelexion.Framework.ApplicationConfiguration.ConfigurationSettings.GetConfigurationSettings("ApplicationPath")%>/images/edititem.gif'></a>
							<a onclick="DesHabilitar();" id="Cancela"><img style="DISPLAY:none" src='<%=Intelexion.Framework.ApplicationConfiguration.ConfigurationSettings.GetConfigurationSettings("ApplicationPath")%>/images/delitem.gif'></a></td>
						<td></td>
						<td></td>
						<td></td>						
					</tr>				
					<tr id="divTIPO" style="display:none;">
						<td><label id="lblTipo" for="TIPO" Runat="server"><%=Intelexion.Framework.SystemLabels.SystemLabels.getValueById(17716, Context.Session("LID"))%></label>
						</td>
						<td><asp:dropdownlist id="TIPO" Runat="server" onchange="cambiarPeriodoTipo();" ></asp:dropdownlist></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
					</tr>
					<tr id="divPeriodo">
						<td><label id="lblPeriodo" for="Periodo" Runat="server"><%=Intelexion.Framework.SystemLabels.SystemLabels.getValueById(2378, Context.Session("LID"))%></label></td>
						<td><anthem:DropDownList id="Periodo"  Runat="server"  onchange="subPeriodos();"  CssClass="dList"></anthem:DropDownList></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
					</tr>
				<%--jas--%>
			<%If Intelexion.Framework.SystemFlags.SystemFlags.getValueById(7291) = "1" Then%>
			        <tr id="divFormato" style="display:none;">
			            <td><label id="tipoFormato" for="Formato" Runat="server"><%=Intelexion.Framework.SystemLabels.SystemLabels.getValueById(30567, Context.Session("LID"))%></label></td>
			            <td><anthem:DropDownList id="tFormato" Runat="server" ></anthem:DropDownList></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
			        </tr>
			 <%End If%>
			<%--jas--%>
					<tr id="divSubPeriodo">
						<td><label id="lbldiasProporcion" for="subPeriodo" Runat="server"><%=Intelexion.Framework.SystemLabels.SystemLabels.getValueById(17717, Context.Session("LID"))%></label></td>
						<td><anthem:DropDownList id="diasProporcion" Runat="server" ></anthem:DropDownList></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
					</tr>				
				    <tr id="divPeriodoDesdeHasta">
						<td><label id="lblPeriodoDesde" for="PeriodoDesde" Runat="server"><%=Intelexion.Framework.SystemLabels.SystemLabels.getValueById(7910, Context.Session("LID"))%></label></td>
						<td><anthem:DropDownList id="PeriodoDesde" Runat="server"  CssClass="dList"></anthem:DropDownList></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
					</tr>
					<tr id="divPeriodoDesdeHasta2">
						<td><label id="lblPeriodoHasta" for="PeriodoHasta" Runat="server"><%=Intelexion.Framework.SystemLabels.SystemLabels.getValueById(7911, Context.Session("LID"))%></label></td>
						<td><anthem:DropDownList id="PeriodoHasta" Runat="server"  CssClass="dList"></anthem:DropDownList></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
					</tr>
				<%--Dispersion Multibanco SIP Edenred--%>				
					<tr id="divBanco"  style="display:none;">
						<td><label id="lblBanco" for="idBanco" Runat="server"><%=Intelexion.Framework.SystemLabels.SystemLabels.getValueById(31417, Context.Session("LID"))%></label></td>
						<td><anthem:DropDownList id="idBanco" Runat="server" ></anthem:DropDownList></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
					</tr>				
					<%--Aqui Termina Dispersion Multibanco SIP Edenred--%>			
					<tr id="LugarPago" style="display:none;">
                        <td><label id="lblIdLugarPago"><%=Intelexion.Framework.SystemLabels.SystemLabels.getValueById(1885,context.Session("LID"))%></label></td>
                        <td><asp:dropdownlist id="IdLugarPago" Runat="server" ></asp:dropdownlist></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
					</tr>
				
					<tr id="divCentroCosto" style="display:none;">
                        <td><label id="lblIdCentroCosto"><%=Intelexion.Framework.SystemLabels.SystemLabels.getValueById(1, Context.Session("LID"))%></label></td>
                        <td><asp:dropdownlist id="IdCentroCosto" Runat="server" ></asp:dropdownlist></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
					</tr>
					<tr id="divConcepto" style="display:none;">
                        <td><label id="lblConcepto"><%=Intelexion.Framework.SystemLabels.SystemLabels.getValueById(11001, Context.Session("LID"))%></label></td>
                        <td><asp:dropdownlist id="Concepto" Runat="server" ></asp:dropdownlist></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
					</tr>
					<tr id="divMsgRecibo" style="display:none;">
						<td><label id="lblmensajeRecibo" for="mensajeRecibo" Runat="server"><%=Intelexion.Framework.SystemLabels.SystemLabels.getValueById(12797, Context.Session("LID"))%></label></td>					
						<td><textarea id="mensajeRecibo" Runat="server"  NAME="txtMensaje"></textarea></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
					</tr>
					<tr id="divRangoMeses" style="display:none;">
                        <td><label id="lblAnio"><%=Intelexion.Framework.SystemLabels.SystemLabels.getValueById(4270, Context.Session("LID"))%></label></td>
                        <td><asp:dropdownlist id="Anio" Runat="server" ></asp:dropdownlist></td>
                        <td><label id="lblMesDesde"><%=Intelexion.Framework.SystemLabels.SystemLabels.getValueById(4762, Context.Session("LID"))%></label></td>
                        <td><asp:dropdownlist id="mesDesde" Runat="server" ></asp:dropdownlist></td>
                        <td><label id="lblMesHasta"><%=Intelexion.Framework.SystemLabels.SystemLabels.getValueById(4763, Context.Session("LID"))%></label></td>
                        <td><asp:dropdownlist id="mesHasta" Runat="server" ></asp:dropdownlist></td>
					</tr>
					<tr id="divTodos" style="display:none;">
						<td ><label id="lblTodos" ><%=Intelexion.Framework.SystemLabels.SystemLabels.getValueById(12807, Context.Session("LID"))%></label></td>
						<td><input type="checkbox" id="todos" name="todos" runat="server" align="left" onclick="chkTodos();"></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
					</tr>
					<tr id="divEmpleado" style="display:none;">
						<td><label id="lblEmpleado" for="IdEmpleado" Runat="server"><%=Intelexion.Framework.SystemLabels.SystemLabels.getValueById(17718, Context.Session("LID"))%></label></td>
						<td><asp:textbox id="IdEmpleado" onblur="NombreEmpleado($('#IdEmpleado')[0],$('#Nombre')[0]);" Runat="server" Width="100"></asp:textbox></td>
						<td><asp:textbox id="Nombre" Runat="server"  Enabled="false"></asp:textbox></td>
						<td><a id="linkPopupEmpleado" onclick="PopupEmpleado(IdTipoNominaAsig.value,IdEmpleado,Nombre)"><IMG src='<%=Intelexion.Framework.ApplicationConfiguration.ConfigurationSettings.GetConfigurationSettings("ApplicationPath")%>/images/tb_ViewReport.GIF' border="0"></a></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
					</tr>
					<tr id="divFolioDesdeHasta">
						<td><label id="lblfolioDesde" for="folioDesde" Runat="server"><%=Intelexion.Framework.SystemLabels.SystemLabels.getValueById(11628, Context.Session("LID"))%></label></td>
						<td><asp:textbox id="folioDesde" Runat="server" ></asp:textbox></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
					</tr>
					<tr id="divFolioDesdeHasta2">
						<td><label id="lblfolioHasta" for="folioHasta" Runat="server"><%=Intelexion.Framework.SystemLabels.SystemLabels.getValueById(11629, Context.Session("LID"))%></label></td>
						<td><asp:textbox  id="folioHasta" Runat="server" Width="100"></asp:textbox></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
					</tr>
					<tr id="divTipoPoliza" style="DISPLAY: none">
						<td><label id="lblTipoPoliza" for="TipoPoliza" Runat="server"><%=Intelexion.Framework.SystemLabels.SystemLabels.getValueById(17719, Context.Session("LID"))%></label></td>
						<td><anthem:DropDownList id="idTipoPoliza"  Runat="server"  CssClass="dList"></anthem:DropDownList></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
					</tr>
					<tr id="divTipoArchivo" style="DISPLAY: none">
						<td><label id="lblTipoArchivo" for="TipoArchivo" Runat="server"><%=Intelexion.Framework.SystemLabels.SystemLabels.getValueById(17720, Context.Session("LID"))%></label></td>
						<td><anthem:DropDownList id="tipoArchivo"  Runat="server"  CssClass="dList"></anthem:DropDownList></td>
						<td></td>
						<td></td>
						<td></td>
					</tr>
				    <tr id="divFechaDesde" style="display:none">
			            <td><label id="lblFechaDesde"><%=Intelexion.Framework.SystemLabels.SystemLabels.getValueById(17724, Context.Session("LID"))%></label></td>
			            <td><input id="FechaDesde" type="text" runat="server" /></td>
                         <td><A onclick='javascript:str="<%=FormatoNormal() %>";showCalendar(this, document.getElementById("FechaDesde"),str.toLowerCase(),null,1,380,80)'>
								<IMG src='<%=Intelexion.Framework.ApplicationConfiguration.ConfigurationSettings.GetConfigurationSettings("ApplicationPath")%>/images/calendar.gif' border="0"></A>
			            </td>
					</tr>	
					<tr id="divFechaHasta" style="display:none">	
			            <td><label id="lblFechaHasta"><%=Intelexion.Framework.SystemLabels.SystemLabels.getValueById(17723, Context.Session("LID"))%></label></td>
			            <td><input id="FechaHasta" type="text" runat="server" /></td>
                        <td><A onclick='javascript:str="<%=FormatoNormal() %>";showCalendar(this, document.getElementById("FechaHasta"),str.toLowerCase(),null,1,380,80)'>
								<IMG src='<%=Intelexion.Framework.ApplicationConfiguration.ConfigurationSettings.GetConfigurationSettings("ApplicationPath")%>/images/calendar.gif' border="0"></A> 
			            </td>
			        </tr>			    
					<tr id="divMultiEmpleados" style="display:none;">
							<td><label id="lblIdEmpleado" for="PopupEmpleado" Runat="server"><%=Intelexion.Framework.SystemLabels.SystemLabels.getValueById(17718, Context.Session("LID"))%></label></td>
							<td><a id="PopupEmpleado" onclick='PopupEmpleado(IdTipoNominaAsig.value,$("#IdEmpleado")[0],"", 1, gridEmpleados)'>
									<IMG src='<%= Intelexion.Framework.ApplicationConfiguration.ConfigurationSettings.GetConfigurationSettings("ApplicationPath")%>/images/tb_ViewReport.GIF' border="0"></a></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>		
					</tr>
					<tr id="divMultiEmpleados2" class="scroller">
						 <td colspan="6">
						 <Table ID="gridEmpleados" style="border-collapse:collapse;" Runat="server">
							<thead>
								<tr>
									<td class="headerTabla"><b><%=Intelexion.Framework.SystemLabels.SystemLabels.getValueById(7340, Context.Session("LID"))%></b></td>
									<td class="headerTabla" ><b><%=Intelexion.Framework.SystemLabels.SystemLabels.getValueById(8895, Context.Session("LID"))%></b></td>
									<td class="headerTabla" ></td>
								</tr>
							</thead>
						</Table>
						</td>
					</tr>
			        <tr id="divTipoPersona" style="display:none">
			            <td><label id="lblidTipoPersona""><%=Intelexion.Framework.SystemLabels.SystemLabels.getValueById(14681, Context.Session("LID"))%></label></td>
			            <td><asp:DropDownList id="idTipoPersona" runat="server"  ></asp:DropDownList></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
			        </tr>
			        <tr id="divTarjeta" style="display:none">
			            <td><label id="lblidTarjeta"><%=Intelexion.Framework.SystemLabels.SystemLabels.getValueById(14746,context.Session("LID"))%></label></td>
			            <td><asp:DropDownList ID="idTarjeta" runat="server" ></asp:DropDownList></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
			        </tr>
			        <tr id="divTarjetaProducto" style="display:none">
			            <td><label id="lblIdProductoTarjeta"><%=Intelexion.Framework.SystemLabels.SystemLabels.getValueById(14746,context.Session("LID"))%></label></td>
			            <td><asp:DropDownList ID="idProductoTarjeta" runat="server" ></asp:DropDownList></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
			        </tr>			   
			        <tr id="divFechaPedido" style="display:none">
			            <td><label id="lblFechaPedido"><%=Intelexion.Framework.SystemLabels.SystemLabels.getValueById(14734, Context.Session("LID"))%></label></td>
			            <td><input id="FechaPedido" type="text" runat="server" /></td>
						<td><A onclick='javascript:str="<%=FormatoNormal() %>";showCalendar(this, document.getElementById("FechaPedido"),str.toLowerCase(),null,1,380,80)'>
								<IMG src='<%=Intelexion.Framework.ApplicationConfiguration.ConfigurationSettings.GetConfigurationSettings("ApplicationPath")%>/images/calendar.gif' border="0"></A> 
			            </td>
						<td></td>
						<td></td>
						<td></td>
			        </tr>			   
			        <tr id="divFechaDispersion" style="display:none">
			            <td><label id="LblFechaDispersion"><%=Intelexion.Framework.SystemLabels.SystemLabels.getValueById(17366, Context.Session("LID"))%></label></td>
			            <td><input id="FechaDispersion" type="text" runat="server" /></td>
                        <td><A onclick='javascript:str="<%=FormatoNormal() %>";showCalendar(this, document.getElementById("FechaDispersion"),str.toLowerCase(),null,1,380,80)'>
								<IMG src='<%=Intelexion.Framework.ApplicationConfiguration.ConfigurationSettings.GetConfigurationSettings("ApplicationPath")%>/images/calendar.gif' border="0"></A>
			            </td>
						<td></td>
						<td></td>
						<td></td>
			        </tr>
			        <tr id="divConceptoPolizaContable" style="display:none">
			            <td><label id="lblConceptoPolizaContable"><%=Intelexion.Framework.SystemLabels.SystemLabels.getValueById(16996, Context.Session("LID"))%></label></td>
			            <td><asp:DropDownList ID="ConceptoPolizaContable" runat="server" ></asp:DropDownList></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
			        </tr>
			        <tr id="divRegistrosPatronales" style="display:none">
			            <td><label id="lblIdRegistroPatronal"><%=Intelexion.Framework.SystemLabels.SystemLabels.getValueById(17721, Context.Session("LID"))%></label></td>
			            <td><asp:DropDownList ID="IdRegistroPatronal" runat="server" ></asp:DropDownList></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
			        </tr>
			        <tr id="divTipoArchivoSUA" style="display:none">
			            <td><label id="lblTipoReporteSUA"><%=Intelexion.Framework.SystemLabels.SystemLabels.getValueById(17722, Context.Session("LID"))%></label></td>
			            <td><asp:DropDownList ID="tipoReporteSUA" runat="server"></asp:DropDownList></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
			        </tr>
			        <tr id="FiltrosPolizaFiniquitosMasiva"  style="display:none">			       
		                <td><input type="checkbox" id="TodosAsociados" name="Mostrartodos" runat="server" onclick="chkAtributos(1);" checked></td>
			        	<td><label><%=Intelexion.Framework.SystemLabels.SystemLabels.getValueById(17797, Context.Session("LID"))%></label></td>
			        	<td><input type="checkbox" id="NoEnviados" name="MostrarNoEnviados" runat="server"/></td>
			            <td ><label><%=Intelexion.Framework.SystemLabels.SystemLabels.getValueById(17798, Context.Session("LID"))%></label></td>
			            <td><input type="checkbox" id="selecAtributos" name="seleccionarPorAtributos" runat="server" onclick="chkAtributos(2);"/></td>
			            <td><label><%=Intelexion.Framework.SystemLabels.SystemLabels.getValueById(17799, Context.Session("LID"))%></label></td>
			        </tr>		     			      			          		           
			        <tr id="divTipoMovimiento" style="DISPLAY: none">
						<td><label id="lblTipoMovimiento" for="TipoMovimiento" Runat="server"><%=Intelexion.Framework.SystemLabels.SystemLabels.getValueById(18816, Context.Session("LID"))%></label></td>
						<td><anthem:DropDownList id="tipoMovimiento"  Runat="server" CssClass="dList"></anthem:DropDownList></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
					</tr>
					<tr id="divAtributosPosicion" style="display:none">
					<td></td>
					<td colspan="5">
								<org:filtroAtributos ID="attr" runat="server" />                        
					</td>
					</tr>					
					<tr id="trFormaPago" Style="display:none" class="divFormaPago">
						<td><label id="lblFormaPago" for="FormaPago" Runat="server"><%=Intelexion.Framework.SystemLabels.SystemLabels.getValueById(17775, Context.Session("LID"))%></label></td>
						<td><anthem:DropDownList id="idFormaPago" onchange="CambioFormaPago();" Runat="server"   CssClass="dList"></anthem:DropDownList></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
					</tr>
					<tr id="trPaisEstado"  Style="display:none" class="divFormaPago">
						<td><label id="lblPais" for="idPais" Runat="server"><%=Intelexion.Framework.SystemLabels.SystemLabels.getValueById(17776, Context.Session("LID"))%></label></td>
						<td><anthem:DropDownList id="idPais" onchange="CambiarPais();" Runat="server"    CssClass="dList"></anthem:DropDownList></td>
						<td><label id="lblEstado" for="idEstado" Runat="server"><%=Intelexion.Framework.SystemLabels.SystemLabels.getValueById(17777, Context.Session("LID"))%></label></td>
						<td><anthem:DropDownList id="idEstado" onchange="CambiarEstado();" Runat="server"    CssClass="dList"></anthem:DropDownList></td>
						<td></td>
						<td></td>
					</tr>
					<tr id="trMunicipio" Style="display:none" class="divFormaPago">
						<td><label id="lblMunicipio" for="idMunicipio" Runat="server"><%=Intelexion.Framework.SystemLabels.SystemLabels.getValueById(17778, Context.Session("LID"))%></label></td>
						<td><anthem:DropDownList id="idMunicipio"  Runat="server"   CssClass="dList"></anthem:DropDownList></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
					</tr>
					<tr class="OrdenPago" Style="display:none">
						<td><label id="lblordenPago" for="IdEmpleadoPago" Runat="server"><%=Intelexion.Framework.SystemLabels.SystemLabels.getValueById(17779, Context.Session("LID"))%></label></td>
						<td><asp:textbox id="IdEmpleadoPago" onblur="NombreEmpleado($('#IdEmpleadoPago')[0],$('#NombreEmpleadoPago')[0]);" Runat="server" ></asp:textbox></td>
						<td><asp:textbox id="NombreEmpleadoPago" Runat="server"  Enabled="false"></asp:textbox></td>
						<td><a id="A1" onclick="PopupEmpleado(IdTipoNominaAsig.value,IdEmpleadoPago,NombreEmpleadoPago)"><IMG src='<%=Intelexion.Framework.ApplicationConfiguration.ConfigurationSettings.GetConfigurationSettings("ApplicationPath")%>/images/tb_ViewReport.GIF' border="0"></a></td>
						<td></td>
						<td></td>
					</tr>
					<tr class="OrdenPago" Style="display:none">
					    <td><label id="lblComision" for="Comision" Runat="server"><%=Intelexion.Framework.SystemLabels.SystemLabels.getValueById(17780, Context.Session("LID"))%></label></td>
						<td><asp:textbox id="Comision" Runat="server" ></asp:textbox></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
					</tr>
					<tr class="OrdenPago" Style="display:none">
					    <td><label id="lblivaComision" for="ivaComision" Runat="server"><%=Intelexion.Framework.SystemLabels.SystemLabels.getValueById(17781, Context.Session("LID"))%></label></td>
						<td><asp:textbox id="ivaComision" Runat="server" ></asp:textbox></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
					</tr>
					<tr class="OrdenPago" Style="display:none">
					    <td><label id="lblIDE" for="IDE" Runat="server"><%=Intelexion.Framework.SystemLabels.SystemLabels.getValueById(17782, Context.Session("LID"))%></label></td>
						<td><asp:textbox id="IDE" Runat="server"></asp:textbox></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
					</tr>
				 
			        <tr id="divFechaPago" style="display:none">
			            <td><label id="lblFechaPago"><%=Intelexion.Framework.SystemLabels.SystemLabels.getValueById(33442, Context.Session("LID"))%></label></td>
			            <td>
			                <input id="FechaPago" type="text" runat="server"  />
                            <a onclick='javascript:if ($("#FechaPago").is(":disabled") == false) showCalendar(this, $("#FechaPago")[0], "<%=FormatoNormal().ToLower%>",null,1,275,135)'>
                                <img alt="" src='<%=Intelexion.Framework.ApplicationConfiguration.ConfigurationSettings.GetConfigurationSettings("ApplicationPath")%>/images/calendar.gif' border="0" />
                            </a>  
			            </td>
			        </tr>
			  
			        <tr id="divHoraAplicacion" style="display:none">
			            <td><label id="lblHoraAplicacion"><%=Intelexion.Framework.SystemLabels.SystemLabels.getValueById(33443, Context.Session("LID"))%></label></td>
			            <td>
			                <input id="HoraAplicacion" type="text" runat="server" title="HH:MM" /> <%=Intelexion.Framework.SystemLabels.SystemLabels.getValueById(33444, Context.Session("LID"))%>
			            </td>
			        </tr>
			     
				</table>
			</div>
			<div id="divArchivo">				
				<anthem:HyperLink id="Archivo" runat="server" Visible="false"><%=Intelexion.Framework.SystemLabels.SystemLabels.getValueById(17029, Context.Session("LID"))%></anthem:HyperLink>
			</div>
			<div id="divArchivoPoliza" style="display:none">	
			    <a id="ArchivoPoliza" ><%=Intelexion.Framework.SystemLabels.SystemLabels.getValueById(17029, Context.Session("LID"))%></a>							
			</div>
			<div id="divArchivoSecundario">
			    <anthem:HyperLink ID="ArchivoSecundario" runat="server" Visible="false"><%=Intelexion.Framework.SystemLabels.SystemLabels.getValueById(17029, Context.Session("LID"))%></anthem:HyperLink>
			</div>
										    	        
	      														
			<div class="botonArea">
			<input class="boton boton-nuevo" id="Aceptar" onclick="Ir_Reporte();MostrarDivLiga();" type="button" value="<%=Intelexion.Framework.SystemLabels.SystemLabels.getValueById(86,context.Session("LID"))%>" name="Aceptar">
			<input class="boton boton-nuevo" runat="server" id="btnEnviar" onclick="Enviar_Poliza();" type="button" value="Enviar" name="Enviar">
			<input class="boton" id="btnCancelar" type="button" value="<%=Intelexion.Framework.SystemLabels.SystemLabels.getValueById(16,context.Session("LID"))%>" name="btnCancelar" onClick="Cancelar();"/>
			</div>
			   
		  <div  class="noscroller" id="divFiniquitosMasivo" style="display:none"  width="100%">
		     <div width="50%" style="text-align:center">
		        <input class="boton" id="btnSeleccionarTodos" type="button" value="Seleccionar Todos" name="SeleccionarTodos" onclick="seleccionar_todo(true);"/>
		        <input class="boton" id="btnDesSeleccionar" type="button" value="Des-Seleccionar Todos" name="DesSelecionarTodos" onclick="seleccionar_todo(false);"/>
		        <input class="boton" id="btnEnviarAsoc" type="button" value="Enviar" onclick="Enviar_Poliza();"/>
		     </div>	
		     <br/>		  		  		  
	            <anthem:DataGrid id="gridDetalleFiniquitos"  runat="server" AutoGenerateColumns="false" PagerStyle-Mode="NumericPages"  OnPageIndexChanged="gridDetalle_PageChanger" AllowPaging="true">
	                <SelectedItemStyle CssClass="RenglonSel"></SelectedItemStyle>
	                <AlternatingItemStyle CssClass="RenglonNoSeAlt"></AlternatingItemStyle>
	                <ItemStyle CssClass="RenglonNoSel"></ItemStyle>
	                <Columns>
	                     <asp:TemplateColumn>
	                        <HeaderStyle CssClass="HeaderTabla"></HeaderStyle >
	                        <ItemTemplate>
	                            <div>                                
	                            <%#IIf(DataBinder.Eval(Container.DataItem, "Estatus") = 0, "<input id='idAsociadosCheck' type='checkbox' class='chkSeleccion' IdEmpleadoH='" & DataBinder.Eval(Container.DataItem, "IdEmpleado") & "' />", "")%>	                             	 
	                            </div>
	                        </ItemTemplate>
	                    </asp:TemplateColumn>
	                    <asp:TemplateColumn>
	                        <HeaderStyle Width="10%" CssClass="HeaderTabla"></HeaderStyle >
	                        <ItemTemplate>
	                            <div id="divNumasociado" style="text-align:center"><%#DataBinder.Eval(Container.DataItem, "IdEmpleado")%></div>
	                        </ItemTemplate>
	                    </asp:TemplateColumn>
	                    <asp:TemplateColumn>
					        <HeaderStyle Width="30%" CssClass="headerTabla"></HeaderStyle>
					        <ItemTemplate>
						        <div id="divNombreCompleto" style="text-align:center"><%#DataBinder.Eval(Container.DataItem, "NombrePila")%></div>						        
					        </ItemTemplate>
				        </asp:TemplateColumn>
				        <asp:TemplateColumn>
					        <HeaderStyle Width="10%" CssClass="headerTabla"></HeaderStyle>
					        <ItemTemplate>
						        <div id="divRFC"><%#DataBinder.Eval(Container.DataItem, "RFC")%></div>
					        </ItemTemplate>
				        </asp:TemplateColumn>
				        <asp:TemplateColumn>
					        <HeaderStyle Width="10%" CssClass="headerTabla"></HeaderStyle>
					        <ItemTemplate>
						        <div id="divFechaFiniquito"><%#DataBinder.Eval(Container.DataItem, "FechaFiniquito")%></div>
					        </ItemTemplate>
				        </asp:TemplateColumn>
				         <asp:TemplateColumn>
					        <HeaderStyle Width="20%" CssClass="headerTabla"></HeaderStyle>
					        <ItemTemplate>
						        <div id="divPosicion" style="text-align:center"><%#DataBinder.Eval(Container.DataItem, "nombrePosicion")%></div>
					        </ItemTemplate>
				        </asp:TemplateColumn>
				         <asp:TemplateColumn>
					        <HeaderStyle Width="30%" CssClass="headerTabla"></HeaderStyle>
					        <ItemTemplate>
						        <div id="divTienda" style="text-align:center"><%#DataBinder.Eval(Container.DataItem, "Tienda")%></div>
					        </ItemTemplate>
				        </asp:TemplateColumn>
				         <asp:TemplateColumn>
					        <HeaderStyle Width="10%" CssClass="headerTabla"></HeaderStyle>
					        <ItemTemplate>					            
						        <div id="divStatus" style="text-align:center"><%#IIf(DataBinder.Eval(Container.DataItem, "Estatus") = 0, "No Enviado", "Enviado")%></div>
					        </ItemTemplate>
				        </asp:TemplateColumn>
				        <asp:TemplateColumn>
	                        <HeaderStyle CssClass="HeaderTabla"></HeaderStyle >
	                        <ItemTemplate>	                                                 
	                             <div id="exportarXL"  style="text-align:center"><img alt="" src="<%=Intelexion.Framework.ApplicationConfiguration.ConfigurationSettings.GetConfigurationSettings("ApplicationPath")%>/UI/50/images/icons/document-excel-csv.png" onclick="PolizaFiniquitoEmpleado('<%#DataBinder.Eval(Container.DataItem, "IdEmpleado")%>');" /></div>
	                        </ItemTemplate>
	                    </asp:TemplateColumn>				                        
	                </Columns>
	              </anthem:DataGrid>
	        </div>	       
		
		<% If (Intelexion.Framework.ApplicationConfiguration.ConfigurationSettings.GetConfigurationSettings("usarVista5") = "1") Then%>
					 
                 <div id="muestraDialogo" title="<%=Intelexion.Framework.SystemLabels.SystemLabels.getValueById(8878,context.Session("LID"))%>" style="display:none" >
                    <div style="text-align:Center" id="LigaExportar" >
                     <br />
                    <%=Intelexion.Framework.SystemLabels.SystemLabels.getValueById(17030, Context.Session("LID"))%>
                     
                     <a id="DescargarArchivo" onclick="DescargarArchivo()" style="display:none;">Archivo</a>       
                    </div>
                    <div class='errButtonArea botonArea' >
                        <button class='boton boton-cancel' onclick='cierraDialogo()'> <% =Intelexion.Framework.SystemLabels.SystemLabels.getValueById(16, Context.Session("LID"))%></button>
                    </div>
                </div>
	                        
	        <%End If%>
	        <anthem:HiddenField ID="errorH" runat="server" AutoUpdateAfterCallBack="true" />
	        <anthem:HiddenField ID="enviado" runat="server" AutoUpdateAfterCallBack="true" />
	        <anthem:HiddenField ID="procesoOK" runat="server" AutoUpdateAfterCallBack="true" />	        
	        <input type="hidden" id="idRegistroCatalogo" runat="server" name="idRegistroCatalogo"/>
	        <input type=hidden id="EmpleadosPoliza" name="EmpleadosPoliza" runat=server/> 
	        <input type="hidden" id="Empleados" runat="server">
		    <input type="hidden" id="MultipleNominaProceso" runat="server">
		    <input type="hidden" id="filtroidElementoCategoria" runat="server" name="filtroElementoCategoria" />   
		     <input type="hidden" id="periodosCerradosAliatec" runat="server" />  
		    <anthem:HiddenField ID="hToken_DescargarArchivo" runat="server" AutoUpdateAfterCallBack="true"  />
	        <anthem:HiddenField ID="hNombre_DescargarArchivo" runat="server" AutoUpdateAfterCallBack="true" />
	         
		</form>		     
		<script language="javascript">
		    $("#IdTipoNominaProc").attr("disabled", "disabled");
		    $("#idMunicipio").val(0);
		    $("#idMunicipio").attr("disabled", "disabled");
		    $("#idEstado").val(0);
		    $("#idEstado").attr("disabled", "disabled");
		</script>
	</body>
</HTML>