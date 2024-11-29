<%@ Page Language="vb" AutoEventWireup="true" Codebehind="Login.aspx.vb" Inherits="ITXV5.Login" %>
<%@ Register TagPrefix="uc1" TagName="MultiLenguaje" Src="Multilenguaje/MultiLenguaje.ascx" %>
<%@ Register TagPrefix="anthem" Namespace="Anthem" Assembly="Anthem" %>
<!DOCTYPE html>
<html>
	<head>
		<title>Login</title>
		<meta content="Microsoft Visual Studio.NET 7.0" name="GENERATOR" />
		<meta content="Visual Basic 7.0" name="CODE_LANGUAGE" />
		<meta content="JavaScript" name="vs_defaultClientScript" />
		<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema" />
		
        <link rel="stylesheet"  href='<%=Intelexion.Framework.ApplicationConfiguration.ConfigurationSettings.GetConfigurationSettings("ApplicationPath") %>/CSS/Login.css' type="text/css" /> 
        <link rel="shortcut icon" href="<%=Intelexion.Framework.ApplicationConfiguration.ConfigurationSettings.GetConfigurationSettings("ApplicationPath") %>/UI/60/images/favico.png" />
      <%--  <meta http-equiv="Content-type" content="text/html; charset=utf-8" />--%>
 	
 
<%  If Mensaje.Text <> "" Then
        Session.Abandon()
    End If
    %>

		<script language="javascript" type="text/javascript">
			if (parent.frames.length != 0)
				top.location=document.location;
			var path = '<%= Intelexion.Framework.ApplicationConfiguration.ConfigurationSettings.GetConfigurationSettings("ApplicationPath")%>'
			var shortDatePattern='<%= FormatoNormal().toLower() %>'
		</script>
		<script language="javascript" type="text/javascript" src='<%=Intelexion.Framework.ApplicationConfiguration.ConfigurationSettings.GetConfigurationSettings("PathJS")+"/Validacion.aspx"%>'></script>
		<script language="javascript" type="text/javascript">
				
 			<% If not (request.querystring("ReturnURL") is nothing) Then%>
			var stepValidar= '/Sistema/Validar/ValidarLogin/validaLogin.process?ReturnURL=<%=request.querystring("ReturnURL")%>';
			<% else%>
			var stepValidar= '/Sistema/Validar/ValidarLogin/validaLogin.process';
			<% End If %>		
			
function Enviar(returnURL){
//     <%If Intelexion.Framework.ApplicationConfiguration.ConfigurationSettings.GetConfigurationSettings("usarVista5") = "1" AndAlso 0 = 1 Then%>
//        //$('#izqControles,#derControles').fadeOut('fast');
//        showWait();
//     <%End If %>
    showWait();
     document.getElementById("lblpassword").focus();
     
	document.forms[0].action = path + stepValidar //+ "?ReturnURL="+returnURL;
	document.forms[0].submit();
}

function fEnter() {
				var keycode = event.keyCode
				var realkey = String.fromCharCode(event.keyCode)
			
					if (keycode == 13) {
						Enviar('Nothing');
					}
					
			}

    <%If Not Intelexion.Framework.SystemFlags.SystemFlags.getValueById(3854) Is Nothing AndAlso Intelexion.Framework.SystemFlags.SystemFlags.getValueById(3854) = "1" Then %>
    function vacio(){}

    function EnviarPassword()
    {
	    <%If Not Intelexion.Framework.SystemFlags.SystemFlags.getValueById(3161) Is Nothing AndAlso Intelexion.Framework.SystemFlags.SystemFlags.getValueById(3161) = "0" Then %>
	    if($("#userId").val() != ""){
            Anthem_InvokePageMethod
            (
                'RecuperarPassword', ['EnviarNuevoPasswordAjax'],
                function (result)
                {
                    $('.mensaje').css('display', 'inline');
                }
            )
        }else{
            $('.mensaje').css('display', 'block');
            $("#Mensaje").text("");
            
            $("#Mensaje").text("<%=Intelexion.Framework.SystemLabels.SystemLabels.getValueById(14661, Context.Session("LID"))%>");
        }
        <%Else%>
        if($("#userId").val() != ""){
        
                var dualScreenLeft = window.screenLeft != undefined ? window.screenLeft : window.screenX;
                var dualScreenTop = window.screenTop != undefined ? window.screenTop : window.screenY;

                var width = window.innerWidth ? window.innerWidth : document.documentElement.clientWidth ? document.documentElement.clientWidth : screen.width;
                var height = window.innerHeight ? window.innerHeight : document.documentElement.clientHeight ? document.documentElement.clientHeight : screen.height;

                var left = ((width / 2) - (650 / 2)) + dualScreenLeft;
                var top = ((height / 2) - (450 / 2)) + dualScreenTop;
                
             window.open(path + '/Sistema/Validar/CambiarPasswordPopup/ValidarUsuarioExistente.process?userId=' + $("#userId").val(), '', 'top='+ top +',left='+ left +',height=350,width=650,toolbar=no,directories=no,status=no,menubar=no,scrollbars=no,resizable=no,modal=no');
          }else{
            $('.mensaje').css('display', 'block');
            $("#Mensaje").text("");
            
            $("#Mensaje").text("<%=Intelexion.Framework.SystemLabels.SystemLabels.getValueById(14661,context.Session("LID"))%>");
        }  
        <%End  If %>
    }
    <%End  If %>
<%If Intelexion.Framework.ApplicationConfiguration.ConfigurationSettings.GetConfigurationSettings("usarVista5") = "1" AndAlso 0 = 1 Then%>
function MostrarInstruccionesSoporte(){
    $('#instruccionesSoporte').fadeIn();
}

function OcultarInstruccionesSoporte(){
    $('#instruccionesSoporte').fadeOut();
}

<%End If %>

function CursorFocus(){
	if (document.getElementById("userId").value=='')
		document.getElementById("userId").focus();
	else
		document.getElementById("Password").focus();				
}

<%if Intelexion.Framework.ApplicationConfiguration.ConfigurationSettings.GetConfigurationSettings("usarVista5") = "1" AndAlso 0 = 1 Then %>
function EncuestaAplicacion(idProcesoCL){
    
    var valorpopup = '';
    var url = '';
    var width = 700;
    var height = 400;
    var scroll = 'no';

    url = path + '/ClimaLaboral/MostrarAsignacionDeAtributos/MostrarAtributos/MostrarAtributos.process?idProcesoCL='+idProcesoCL;

    // arreglo de las opciones seleccionados
    var opciones = {
        url: url,
        height: height,
        width: width,
        scrollable: scroll
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

function cambiarValorRadio()
{
    $('input[name="Opciones"]')[0].checked =false;
    $('input[name="Opciones"]')[1].checked =false;
    
    if(document.getElementById("recordarUser").checked==true)
    {
        $('input[name="Opciones"]')[1].checked =true;
    }
    else
    {
        $('input[name="Opciones"]')[0].checked =true;
    }
}

function MostrarRecuperaPassword()
{
    // controles a ocultar
    $('#recordarUser').css('display', 'none');
    $('#lblrecordarUser').css('display', 'none');
    $('#DoLogin').css('display', 'none');
    $('.imgClass').css('display', 'none');
    $('.dList').css('display', 'none');
    $('#recPassword').css('display', 'none');
    $('.boton-wrap-left').css('display', 'none');
    $('.boton-wrap-right').css('display', 'none');
    $('.mensaje').css('display', 'none');
    $('#Password').css('display', 'none');
    $('#MultiLenguaje1_dlstIdioma_input').css('display', 'none');
    
    // controles a mostrar
    $('#divAccesoUsuarios').html('<%=Intelexion.Framework.SystemLabels.SystemLabels.getValueById(11072, Context.Session("LID"))%>').css('text-transform', 'uppercase');
    $('#lblRecuperarPassword').css('display', 'inline');
    <%          If Intelexion.Framework.SystemFlags.SystemFlags.getValueById(3161) = "1" Then %>
        $('#lblpassword').html('<%=Intelexion.Framework.SystemLabels.SystemLabels.getValueById(11078, Context.Session("LID"))%>');
    <%Else %>
        $('#lblpassword').css('display', 'none');
    <%End If %>
    $('#btnEnviarPassword').css('display', 'inline').addClass('boton');
    $('#btnCancelar').css('display', 'inline').addClass('boton');
    $(".boton").wrap("<span class='boton-wrap-left'><span class='boton-wrap-right'></span></span>");
    $('#tdContieneBotones').attr('align', 'right');
    $('#tdContieneBotones').css('padding-right', '0px');
    $('#controlesAccesoUsuarios').css('padding-right', '15px');
    
    <%If Intelexion.Framework.SystemFlags.SystemFlags.getValueById(3161) = "1" Then %>
        $('#cadena').css('display', 'inline');
        // limpiar control
        document.getElementById('cadena').value = '';
    <%End If %>
   
    // posicionar cursor
    document.getElementById("userId").focus();
}

<%End If %>

		</script>
	</head>
	<body class="animsition page-login-v2 layout-full page-dark" style="opacity: 1; animation-duration: 800ms;">
        <!--[if lt IE 8]>
        <p class="browserupgrade">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade your browser</a> to improve your experience.</p>
    <![endif]-->


    <style>
      body {
        background: transparent;
      }
    </style>
   
<script runat="server">
	const cQUIENES_SOMOS = 398
	const cSOPORTE = 399
	const cREGISTRARSE = 400
	const cPERDIO_PASSWORD = 401
	const cAQUI = 402
	const cATENCION = 403
	const cPEDIRUSUARIO = 404
	const cRECORDARUSUARIO = 405
	const cIDUSUARIO = 406
	const cCONTRASENA = 407
	const cCOPYRIGHT = 408	
	Dim version As System.Version = Intelexion.Framework.Utilities.Functions.Version 
</script>

	<form id="Form1" runat="server"    >
        <%

%>  
	 <!-- Page -->
    <div class="page" data-animsition-in="fade-in" data-animsition-out="fade-out">
      <div class="page-content">
        <div class="page-brand-info">
          <div class="brand  <%= Intelexion.Framework.SystemFlags.SystemFlags.getValueById(9851)%>">
            <img class="brand-img" src="<%=Intelexion.Framework.ApplicationConfiguration.ConfigurationSettings.GetConfigurationSettings("ApplicationPath") %>/logos/logoClienteLogin.png" alt="...">
            <div class="slogan"><%=Intelexion.Framework.SystemLabels.SystemLabels.getValueById(34535, Context.Session("LID"))%></div>
            <div class="bienvenida"><%=Intelexion.Framework.SystemLabels.SystemLabels.getValueById(34536, Context.Session("LID"))%></div>
          </div>
            <img class="cover" src="<%=Intelexion.Framework.ApplicationConfiguration.ConfigurationSettings.GetConfigurationSettings("ApplicationPath") %>/images/login.png">
          <!--<p class="font-size-16"><%=Intelexion.Framework.SystemLabels.SystemLabels.getValueById(cATENCION, context.Session("LID"))%></p>-->
        </div>

        <div class="page-login-main animation-slide-right animation-duration-1">
          <div class="brand hidden-md-up">
            <img class="brand-img" src="images/logoItxBlanco.gif" alt="...">
            <h3 class="brand-text font-size-40">HR Corporate 6.0</h3>
          </div>
          <h3 class="font-size-24">Sign In</h3>
          <p>Capture su usuario y contraseña</p>

          <form method="post" class="formLogin" action="login-v2.html">
            <div class="form-group">
              <label class="sr-only" for="userId"><%=Intelexion.Framework.SystemLabels.SystemLabels.getValueById(cIDUSUARIO, context.Session("LID"))%></label>
                <input id="userId" type="text" runat="server" name="userId" onkeyup="fEnter();" class="form-control"  placeholder="Usuario" />
            </div>
            <div class="form-group">
              <label class="sr-only" for="inputPassword"><%=Intelexion.Framework.SystemLabels.SystemLabels.getValueById(cCONTRASENA, Context.Session("LID"))%></label>
              <input id="Password" type= "password" runat="server" name="Password" onkeyup="fEnter();" class="form-control"  placeholder="Contraseña"  />
           <anthem:Label id="Mensaje" runat="server" cssclass="mensaje" />
                </div>
            <div class="form-group">
              
                <uc1:MultiLenguaje id="MultiLenguaje1" runat="server"></uc1:MultiLenguaje>
            </div>
            <div class="form-group clearfix">
              <div class="checkbox-custom checkbox-inline checkbox-primary float-left">
                <input type="checkbox" id="rememberMe" name="rememberMe">
                <label for="rememberMe"><%=Intelexion.Framework.SystemLabels.SystemLabels.getValueById(405, Context.Session("LID")) %></label>
              </div>
              <%--<a class="float-right" href="forgot-password.html"></a>--%>
            </div>
           
              <input type ="button" runat="server" id="DoLogin" class="btn btn-primary btn-block " value="Login" />
          </form>

         <p class="txtOlvidaste">Olvidaste tu contraseña? <a class="<%= Intelexion.Framework.SystemFlags.SystemFlags.getValueById(9851)%>" href="javascript:vacio()" onclick="javascript:EnviarPassword();"><%=Intelexion.Framework.SystemLabels.SystemLabels.getValueById(11072, Context.Session("LID"))%></a></p> 	

          <footer class="page-copyright">
			  <p class="avisoPrivacidad"><%=Intelexion.Framework.SystemLabels.SystemLabels.getValueById(35087, Context.Session("LID")) %> <a href="<%= Intelexion.Framework.ApplicationConfiguration.ConfigurationSettings.GetConfigurationSettings("ApplicationPath")%>/AvisoPrivacidad.aspx"><%=Intelexion.Framework.SystemLabels.SystemLabels.getValueById(35088, Context.Session("LID")) %></a></p>
               <p>&copy; 2020. HR Corporate. Reservados todos los derechos.</p>
              <p class="powered"><img src="<%=Intelexion.Framework.ApplicationConfiguration.ConfigurationSettings.GetConfigurationSettings("ApplicationPath") %>/images/poweredbyitx.png" /></p>
               <p>&nbsp;</p>
               <p>&nbsp;</p>
         <%--   <p>WEBSITE BY <a href="<%= Intelexion.Framework.SystemFlags.SystemFlags.getValueById(1034)%>"><%=Intelexion.Framework.SystemLabels.SystemLabels.getValueById(2456, context.Session("LID"))%></a> </p>
            <p>� 2019. All RIGHT RESERVED.</p>
              <p><a href="<%= Intelexion.Framework.SystemFlags.SystemFlags.getValueById(109)%>" ><%=Intelexion.Framework.SystemLabels.SystemLabels.getValueById(cQUIENES_SOMOS, context.Session("LID"))%></a> | <a href="<%= Intelexion.Framework.SystemFlags.SystemFlags.getValueById(428)%>"><%=Intelexion.Framework.SystemLabels.SystemLabels.getValueById(cSOPORTE, Context.Session("LID"))%></a></p>
        --%>    <%--<div class="social">
              <a class="btn btn-icon btn-round social-twitter mx-5" href="javascript:void(0)">
            <i class="icon bd-twitter" aria-hidden="true"></i>
          </a>
              <a class="btn btn-icon btn-round social-facebook mx-5" href="javascript:void(0)">
            <i class="icon bd-facebook" aria-hidden="true"></i>
          </a>
              <a class="btn btn-icon btn-round social-google-plus mx-5" href="javascript:void(0)">
            <i class="icon bd-google-plus" aria-hidden="true"></i>
          </a>
            </div>--%>
          </footer>
        </div>

      </div>
    </div>
    <!-- End Page -->

 	
 	    <!--
 	    JAMD - Imagen superior exclusiva de V5.
 	    -->			
 	   
 	    
		<div id="loginwindow" align="center" style = "margin:0px 0px 0px 0px;display:none">
			<table border="0" cellpadding="0" cellspacing="0" >
				<tr><td style="padding:0px 0px 0px 0px;" colspan="2">
				</td></tr>
				<tr>
				<!--
				JAMD - Sin bordes en V5.
				-->
			 
			
				<!-- borde -->
					<table >
					 
						<td class="headImage" colspan="2">
							<div class="menuHeadImage">
							    <!--
							    JAMD - Bandera 1668 en "1", bandera 1035 en "0" para V5.
							    -->
							<%If Intelexion.Framework.SystemFlags.SystemFlags.getValueById(3484) = "0" Then%>
								<%--<%if Intelexion.Framework.SystemFlags.SystemFlags.getValueById(1668)<>"1" Then%>--%>
									<%     If Intelexion.Framework.SystemFlags.SystemFlags.getValueById(1035) = "1" Then%>
										<!-- (NS) liga generica -->
										|
									<%End If%>
									
								<%--<%End If%>--%>
							<%End If%>
							</div>
							<%If Intelexion.Framework.SystemFlags.SystemFlags.getValueById(3484) = "1" Then%>
							<br />
							<%End If%>
							<div id="version" <%if Intelexion.Framework.SystemFlags.SystemFlags.getValueById(1668)="1" Then%> style="display:none"<%End If%>>Version <%= version.Major & "." & version.Minor %>&nbsp;&nbsp;Build:<%= version.Build %></div>
                            
							<br/>
							
						</td>
						<%If Intelexion.Framework.SystemFlags.SystemFlags.getValueById(3484) = "1" Then%>
						<tr style="padding:0px 0px 0px 0px">
						    <td style="padding:0px 0px 0px 15px" colspan="2">
						        <div >
							        <!--
							        JAMD - Bandera 1668 en "1", bandera 1035 en "0" para V5.
							        -->
								    <%if Intelexion.Framework.SystemFlags.SystemFlags.getValueById(1668)<>"1" Then%>
									    <%if Intelexion.Framework.SystemFlags.SystemFlags.getValueById(1035)="1" Then%>
										    <!-- (NS) liga generica -->
										    <a style="color:Black; font-weight:bold" href="<%= Intelexion.Framework.SystemFlags.SystemFlags.getValueById(1034)%>"><%=Intelexion.Framework.SystemLabels.SystemLabels.getValueById(2456, context.Session("LID"))%></a> |
									    <%End If%>
									    <a style="color:Black; font-weight:bold" href="<%= Intelexion.Framework.SystemFlags.SystemFlags.getValueById(109)%>" ><%=Intelexion.Framework.SystemLabels.SystemLabels.getValueById(cQUIENES_SOMOS, context.Session("LID"))%></a> | <a style="color:Black; font-weight:bold" href="<%= Intelexion.Framework.SystemFlags.SystemFlags.getValueById(428)%>"><%=Intelexion.Framework.SystemLabels.SystemLabels.getValueById(cSOPORTE, context.Session("LID"))%></a>
								    <%End If%>
							    </div>
						    </td>
					    </tr>
					    <%End If%>
					</tr>
					<tr>
					<!--
					JAMD- Controles distintos en V5.
					-->
					<%If Intelexion.Framework.ApplicationConfiguration.ConfigurationSettings.GetConfigurationSettings("usarVista5") = "1" AndAlso 0 = 1 Then%>
					    <td id = "izqControles" style ="padding-bottom: 0px; padding-left:0px; padding-right:0px; padding-top:0px; width:50%;" valign = "top">
					        <table>
					            <tr valign = "top">
					                <td align = "left"  valign = "top" style ="padding-bottom: 0px; padding-left:0px; padding-right:0px; padding-top:0px; width:50%;">
					                    <h3 style = "text-align:left; margin-left:10px; padding-left:0px;padding-top:0px;margin-top:0px;"><%=Intelexion.Framework.SystemLabels.SystemLabels.getValueById(1434, Context.Session("LID"))%></h3>
					                </td>
                                    <td align = "right" valign = "bottom" style ="padding-bottom: 0px; padding-left:0px; padding-right:25px; padding-top:0px; width:50%;">
	                                    <img class = 'prev' src='<%= Intelexion.Framework.ApplicationConfiguration.ConfigurationSettings.GetConfigurationSettings("ApplicationPath")%>/UI/50/images/icons/arrow-180.png'/><img class = 'next' src='<%= Intelexion.Framework.ApplicationConfiguration.ConfigurationSettings.GetConfigurationSettings("ApplicationPath")%>/UI/50/images/icons/arrow.png'/>
                                    </td>					                
					            </tr>
					            <tr>
					                <td style ="padding-bottom: 0px; padding-left:0px; padding-right:0px; padding-top:0px; width:100%; border:solid 1px #dae3ec" colspan="2">
					                    <div class="carousel" style ="padding-bottom: 5px; padding-left:0px; padding-right:0px; padding-top:0px; width:100%">
					                        <%
					                            Dim connNoticias As Intelexion.Framework.Model.SQLDataConnection = Nothing
					                            Dim noticias As System.Data.SqlClient.SqlDataReader = Nothing
					                            Try
					                                connNoticias = New Intelexion.Framework.Model.SQLDataConnection(Intelexion.Framework.Model.SQLConnectionProvider.getConnection("framework").getConnection)
					                                connNoticias.getConnection.Open()
					                            Catch ex As Exception
					                            End Try
					                            If Not (connNoticias Is Nothing) AndAlso Not (connNoticias.getConnection Is Nothing) AndAlso connNoticias.getConnection.State = System.Data.ConnectionState.Open Then
					                                Try
					                                    Dim noticiasData As New Intelexion.Organizacion.DAOS.NoticiaDAO(connNoticias)
					                                    noticias = noticiasData.ConsultaGeneralesLogin(New Intelexion.Organizacion.Entities.Noticia)
					                                Catch ex As Exception
					                                End Try
					                            End If
					                            
					                            If (Not ClimaLaboral Is Nothing AndAlso ClimaLaboral.HasRows) OrElse (Not noticias Is Nothing AndAlso noticias.HasRows) Then%>
					                                <ul style="width:300px;height:110px;">
					                                <%
					                                If Not ClimaLaboral Is Nothing AndAlso ClimaLaboral.HasRows Then
					                                    While ClimaLaboral.Read()
					                                    %>
					                                        <li style="font-size:9px; width:300px; text-align:justify; vertical-align:text-top; padding-top:5px;"><img src='<%= Intelexion.Framework.ApplicationConfiguration.ConfigurationSettings.GetConfigurationSettings("ApplicationPath")%>/UI/50/images/icons/document-task.png'/><a style="color:#12b2f0;font-weight:bolder;" href = "#" onclick = "EncuestaAplicacion(<%=ClimaLaboral.Item("idProcesoCL") %>);"><%=Intelexion.Framework.SystemLabels.SystemLabels.getValueById(11364, context.Session("LID")) & " " & UCase(ClimaLaboral.Item("nombreProceso"))%></a></li> 
					                                    <%
					                                    End While
					                                End If
					                                If Not noticias Is Nothing AndAlso noticias.HasRows Then
					                                    Dim i As Integer
					                                    Dim results As New Intelexion.Framework.Model.ResultCollection
					                                    Dim noticia As New Intelexion.Organizacion.Entities.Noticia
					                                    results.getEntitiesFromDataReader(noticia, noticias)
					                                    For i = 0 To results.Count - 1
					                                        noticia = results.getByIndex(i)
					                                        If Not noticia Is Nothing Then
					                                        %>
					                                            <li style="font-size:9px; width:300px; text-align:justify; vertical-align:text-top; padding-top:5px;"><img class = 'prev' src='<%= Intelexion.Framework.ApplicationConfiguration.ConfigurationSettings.GetConfigurationSettings("ApplicationPath")%>/UI/50/images/icons/newspaper.png'/><span style="color:#12b2f0;font-weight:bolder;"><%=noticia.titulo%></span><br /><span style="font-style:italic;"><%=noticia.fechaInicio.ToString("dddd, dd MMM, yyyy")%></span><br /><%=Left(noticia.tema, 415) & "..."%></li> 
					                                        <%
					                                        End If
					                                    Next
					                                End If%>
					                                </ul>
					                                <%
					                            Else%>
					                                <ul style="width:300px;height:110px">
					                                    <li style="font-size:9px; width:300px; text-align:justify; vertical-align:text-top; padding-top:5px;"><img class = 'prev' src='<%= Intelexion.Framework.ApplicationConfiguration.ConfigurationSettings.GetConfigurationSettings("ApplicationPath")%>/UI/50/images/icons/imagenNews.jpg'/>&nbsp<%=Intelexion.Framework.SystemLabels.SystemLabels.getValueById(11116, context.Session("LID"))%></li> 
					                                </ul>
					                            <%
					                            End If
					                            %>
                                         </div>
				                    </td>
					            </tr>
					            <tr>
					                <td style="white-space:normal; width:323px; text-align:justify; padding-bottom: 0px; padding-left:0px; padding-right:10px; padding-top:5px" colspan="2">
					                    <input onmouseover = "MostrarInstruccionesSoporte();" onmouseout = "OcultarInstruccionesSoporte();" onclick = "MostrarInstruccionesSoporte();" onblur = "OcultarInstruccionesSoporte();" tabIndex="0" class="selectbox" id="AtencionUsuarios_input" style="background-color:white; width: 323px; color: #5e5e5e; font-size: 8pt; font-weight: bold;" readOnly="readonly" autocomplete="off" value="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=Intelexion.Framework.SystemLabels.SystemLabels.getValueById(11365, context.Session("LID")) %>"/>
                                        <div id = "instruccionesSoporte" style = "display:none;"><%=Intelexion.Framework.SystemLabels.SystemLabels.getValueById(cATENCION,context.Session("LID"))%></div>					                    
					                </td>
					            </tr>
					        </table>
					    </td>
					<%Else%>
					<!-- mensaje atencion -->
					    <%If Intelexion.Framework.SystemFlags.SystemFlags.getValueById(3485) = "1" Then%>
						    <td style="width:30em; text-align:justify; padding-left:15px; padding-right:0" width="50%" class="mensajeAtencion">
							    <%=Intelexion.Framework.SystemLabels.SystemLabels.getValueById(cATENCION,context.Session("LID"))%>
						    </td>
					    <%Else%>
					        <td width="50%" class="mensajeAtencion">
							    <%=Intelexion.Framework.SystemLabels.SystemLabels.getValueById(cATENCION,context.Session("LID"))%>
						    </td>
						<%End If%>
						
					<%End If%>
						<td id = "derControles" width="50%" <%If Intelexion.Framework.ApplicationConfiguration.ConfigurationSettings.GetConfigurationSettings("usarVista5") = "1" AndAlso 0 = 1 Then%>valign="top" style="padding:0px 0px;margin:0px 0px; vertical-align : top; text-align:right; border-collapse:collapse;" <%Else %> align = "center"<%End if %>>
						        <%If Intelexion.Framework.ApplicationConfiguration.ConfigurationSettings.GetConfigurationSettings("usarVista5") = "1" AndAlso 0 = 1 Then%>
						            <h3 id = "divAccesoUsuarios" style = "text-align:left; margin-left:15px; padding-left:10px; padding-top:0px; margin-top:3px;"><%=Intelexion.Framework.SystemLabels.SystemLabels.getValueById(11055, Context.Session("LID"))%></h3>
						            <div id = "controlesAccesoUsuarios" class = "formArea" style = "padding-right:5px;">
						        <%End If %>
								<table class=loginBox style="padding-top:0px;padding-bottom:0px;"  cellpadding="0" cellspacing="0">
								     <%If Intelexion.Framework.ApplicationConfiguration.ConfigurationSettings.GetConfigurationSettings("usarVista5") = "1" AndAlso 0 = 1 Then%>
					                    <tr>
					                        <td colspan = "2" style=" height:10px;padding-top:5px;padding-bottom:5px" class="labelLogin"><label id='lblRecuperarPassword' class = 'etiquetaLogin' style="display:none"><%=Intelexion.Framework.SystemLabels.SystemLabels.getValueById(11076,context.Session("LID"))%></label></td>
					                    </tr>					     
								     <%End If%>
									<tr>
										<td class="etiquetaLogin"></td>
										<td <%If Intelexion.Framework.ApplicationConfiguration.ConfigurationSettings.GetConfigurationSettings("usarVista5") = "1" AndAlso 0 = 1 Then%>style =" padding-left:10px"<%End If%>></td>
									</tr>
									<%If Intelexion.Framework.SystemFlags.SystemFlags.getValueById(1434)= "1" AndAlso Intelexion.Framework.SystemLabels.SystemLabels.getValueById(3869, context.Session("LID")) <> "" Then%>
										<tr>
											<td></td>
											<td>
												<%=Intelexion.Framework.SystemLabels.SystemLabels.getValueById(3869, context.Session("LID"))%>
											</td>
										</tr>
									<%End If%>
									<tr>
										<td class="etiquetaLogin" id = 'lblpassword' <%If Intelexion.Framework.ApplicationConfiguration.ConfigurationSettings.GetConfigurationSettings("usarVista5") = "1" AndAlso 0 = 1 Then%>style="padding-top:5px"<%End If %>></td>
										<td <%If Intelexion.Framework.ApplicationConfiguration.ConfigurationSettings.GetConfigurationSettings("usarVista5") = "1" AndAlso 0 = 1 Then%>style =" padding-left:10px;padding-top:5px"<%End If%>><%If Intelexion.Framework.SystemFlags.SystemFlags.getValueById(3161) = "1" Then %><input id="cadena" type= "text" runat="server" name="cadena" class="texto"/><%End If %></td>
									</tr>
									<%If Intelexion.Framework.SystemFlags.SystemFlags.getValueById(1434)= "1" AndAlso Intelexion.Framework.SystemLabels.SystemLabels.getValueById(3870, context.Session("LID")) <> "" Then%>
										<tr>
											<td></td>
											<td>
												<%=Intelexion.Framework.SystemLabels.SystemLabels.getValueById(3870, context.Session("LID"))%>
											</td>
										</tr>
									<%End If%>
									<tr <%if Intelexion.Framework.SystemFlags.SystemFlags.getValueById(181)<>"1" Then%> style="display:none;" <%End If%>>
										<td><span id="Pais" class="EtCaptura" style="font-weight:bold;"><%=Intelexion.Framework.SystemLabels.SystemLabels.getValueById(4302, context.Session("LID"))%></span></td>
										<td><asp:DropDownList ID="idPaisResidencia" Runat="server"></asp:DropDownList></td>
									</tr>
									<tr>
									    <%If Intelexion.Framework.ApplicationConfiguration.ConfigurationSettings.GetConfigurationSettings("usarVista5") = "1" AndAlso 0 = 1 Then%>
									        <td style="padding-left:0px;  padding-right:10px; padding-top:10px" class="labelLogin" colspan = "2" id="tdContieneBotones"><input type="checkbox" id="recordarUser" onclick="cambiarValorRadio();"/><label class = "etiquetaLogin" id = 'lblrecordarUser'><%=Intelexion.Framework.SystemLabels.SystemLabels.getValueById(11056, Context.Session("LID"))%></label>
									        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									    <%Else%>
									        <td></td>
									    <%End If%>
									    <%If Intelexion.Framework.ApplicationConfiguration.ConfigurationSettings.GetConfigurationSettings("usarVista5") <> "1" OrElse 1 = 1 Then%>
									        <td>
									    <%End If%>
									   <%-- <asp:button text="Iniciar Sesion" runat="server" ID="DoLogin" CssClass = "boton"/>--%>
									    
									    <!--<input name = "btnEnviarPassword" style="display:none" id="btnEnviarPassword" onclick = "EnviarPassword();" type = "button" value="<%=Intelexion.Framework.SystemLabels.SystemLabels.getValueById(130, Context.Session("LID"))%>" />
									    <input name = "btnCancelar" style="display:none" id="btnCancelar" onclick = "" type = "submit" value="<%=Intelexion.Framework.SystemLabels.SystemLabels.getValueById(16, Context.Session("LID"))%>" />-->
									    </td>
									</tr>
									<%If Not Intelexion.Framework.SystemFlags.SystemFlags.getValueById(3854) Is Nothing AndAlso Intelexion.Framework.SystemFlags.SystemFlags.getValueById(3854) = "1" Then%>
									<tr>
									    <td colspan="2">
                                            <div class='logOut' style="display:inline;margin-right:20px">
                                                <a href="javascript:vacio()" id="linkCambioPassword" onclick="javascript:EnviarPassword();"></a>
                                            </div>
									    </td>
									    <td></td>
									</tr>
									<%End If%>
									<tr>
										<td colspan="2" align="center"></td>
									</tr>	
									<%If Intelexion.Framework.ApplicationConfiguration.ConfigurationSettings.GetConfigurationSettings("usarVista5") <> "1" OrElse 1 = 1 Then%>								
									    <tr>
										    <td colspan="2">
											    <hr/>
										    </td>
									    </tr>
									<%End If%>
									<tr>
										<td <%If Intelexion.Framework.ApplicationConfiguration.ConfigurationSettings.GetConfigurationSettings("usarVista5") = "1" AndAlso 0 = 1 Then%>style="padding-top:5px"<%End If%> colspan = "2">
											    <asp:RadioButtonList id="Opciones" textalign="Right" RepeatLayout="Flow" RepeatDirection="Vertical" runat="server"
												    Visible="True" CssClass="opcion" Width="300">
												    <asp:ListItem Value="0" Selected="True">Pedir user</asp:ListItem>
												    <asp:ListItem Value="1">recordar user</asp:ListItem>
											    </asp:RadioButtonList>
											    <%If Intelexion.Framework.ApplicationConfiguration.ConfigurationSettings.GetConfigurationSettings("usarVista5") <> "1" OrElse 1 = 1 Then%>
											        <hr/>
											    <%End If%>
											
											
										</td>
										
									</tr>
									
								</table>
						        <%If Intelexion.Framework.ApplicationConfiguration.ConfigurationSettings.GetConfigurationSettings("usarVista5") = "1" AndAlso 0 = 1 Then%>
						            </div>
						        <%End If %>								
						</td>
						<%If Intelexion.Framework.SystemFlags.SystemFlags.getValueById(3481) = "1" AndAlso Intelexion.Framework.SystemLabels.SystemLabels.getValueById(3481, Context.Session("LID")) <> "" Then%>
						<tr>
						    <td colspan="2"   >
						        <div style="width:650px; text-align:justify;">
	                                <p><strong><%=Intelexion.Framework.SystemLabels.SystemLabels.getValueById(13118, Context.Session("LID"))%></strong><%=Intelexion.Framework.SystemLabels.SystemLabels.getValueById(13119, Context.Session("LID"))%>
	                                <a href="#"  onclick="window.open('<%=Intelexion.Framework.SystemLabels.SystemLabels.getValueById(13120, Context.Session("LID"))%>','window','width=640,height=480,resizable,scrollbars,toolbar,menubar') ;return false;"><%=Intelexion.Framework.SystemLabels.SystemLabels.getValueById(13121, Context.Session("LID"))%></a></p>
                                </div>
                            </td>
                        </tr>
                        <%End If%>
				</tr>
				
				</table>
			</td>
			</tr>
			    <!--
			    JAMD - Elementos que no van en login V5.
			    -->
			    <%  If Intelexion.Framework.ApplicationConfiguration.ConfigurationSettings.GetConfigurationSettings("usarVista5") <> "1" Then%>
				<tr>
					<td style="padding:0px 0px 0px 15px;" class="copyright"><%=Intelexion.Framework.SystemLabels.SystemLabels.getValueById(cCOPYRIGHT, context.Session("LID"))%>
					
					</td>
					<td style="padding:0px 0px 0px 0px;text-align:right;">
						<img alt="" src='<%= Intelexion.Framework.ApplicationConfiguration.ConfigurationSettings.GetConfigurationSettings("ApplicationPath")%>/images/MSCertifiedLogo.gif' width="150" />
					</td>
				</tr>
				<%End If%>
				
				
			</table>
		</div>	
        <%  If Intelexion.Framework.ApplicationConfiguration.ConfigurationSettings.GetConfigurationSettings("usarVista5") = "1" AndAlso 0 = 1 Then%>	
            <script language="javascript" type="text/javascript" src='<%=Intelexion.Framework.ApplicationConfiguration.ConfigurationSettings.GetConfigurationSettings("PathJS")%>/jQuery/jcarousellite_1.0.1.js'></script>
        <% End if%>			
		<script language="javascript" type="text/javascript">

        $(document).ready(function() {
		   
		    CursorFocus();
            $("#DoLogin").addClass('<%=Intelexion.Framework.SystemFlags.SystemFlags.getValueById(9851)%>');
		});	

        /*
		$(document).ready(function() {
		    <%if Intelexion.Framework.SystemFlags.SystemFlags.getValueById(3161) = "1" Then %>
		        $('#cadena').css('display', 'none');
		    <%End If %>
		    
		    CursorFocus();

		    if (usarVista5 == '1') {
		        $(".carousel").jCarouselLite
                (
                    {
                        btnNext: ".next",
                        btnPrev: ".prev",
                        visible: 1
                    }
                );

		        $("#Opciones").css("display", "none");
		        if ($('input[name="Opciones"]')[1].checked == true) {
		            document.getElementById("recordarUser").checked = true;
		        }

		        $("#tdLabelIdioma").html('');
		        $('<img class = "imgClass" src="<%= Intelexion.Framework.ApplicationConfiguration.ConfigurationSettings.GetConfigurationSettings("ApplicationPath")%>/ui/50/images/icons/idioma_' + $(".dList").val() + '.png" />').appendTo("#tdLabelIdioma");

		        $('.formArea-wrap-left,.formArea-wrap-right').css('width', '323px');
		        $('.formArea-wrap-left').css('margin', '0px 0px 0px 0px');
		    }
		});	
		*/
		
		</script>
		
	</form>
	
</body>
</html>
