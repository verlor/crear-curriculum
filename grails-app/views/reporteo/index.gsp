<!--
  To change this template, choose Tools | Templates
  and open the template in the editor.
-->

<%@ page contentType="text/html;charset=UTF-8" %>


<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="layout" content="main">
    <link rel="stylesheet" href="${resource(dir: 'css/button', file: 'demo.css')}" type="text/css">

    <link rel="stylesheet" href="${resource(dir: 'css/button', file: 'style3.css')}" type="text/css">   
    <link href='http://fonts.googleapis.com/css?family=Oswald' rel='stylesheet' type='text/css' />
    <title>Curriculums</title>
    <script type="text/javascript">
      function dirigir(controller, action, elems) {
        var idioma = document.getElementById('idioma').innerHTML;
        var nivel = document.getElementById('nivel').innerHTML;
        if(nivel != '' && nivel != '')
          window.location ="${createLink(controller:'reporteo', action: "buscarPorIdiomaYNivel", params: [idioma: idioma, nivel: nivel] )}";
      }
    </script>
  </head>
  <body>
    <div class="nav" role="navigation">
      <ul>        
        <li style="margin-top: 3px;">Bienvenido <sec:username/>!</li>
        <sec:access expression="hasRole('ROLE_ADMIN')">
          <li style="margin-top: 3px;"><a href="${createLink(controller:'reporteo', action: 'index')}">Ver reportes</a></li>
        </sec:access>
        <li style="position: relative; float: right;"><g:link controller="Logout">Salir</g:link></li>
      </ul>
    </div>

    <div class="button-wrapper-large">

      <a href="#" onClick="dirigir('wizard','reportUno',['idioma','nivel'])" class="a-btn">          
        <span class="a-btn-text">Buscar por idioma</span>         
        <span class="a-btn-icon-right"></span><br />
        <input id="idioma" type="text" />
        <br />
        <input id="nivel" type="text" />        
      </a>

      <a href="#" class="a-btn">
        <span class="a-btn-text">Get an account</span>
        <span class="a-btn-slide-text">Register now!</span>
        <span class="a-btn-icon-right"><span></span></span>
      </a>
      <div class="clr"></div>
    </div>
    <div class="button-wrapper-large">	
      <a href="#" class="a-btn">
        <span class="a-btn-text">Become a member</span>
        <span class="a-btn-slide-text">No hidden costs</span>
        <span class="a-btn-icon-right"><span></span></span>
      </a>
      <a href="#" class="a-btn">
        <span class="a-btn-text">Join the cause</span>
        <span class="a-btn-slide-text">Join the rest</span>
        <span class="a-btn-icon-right"><span></span></span>
      </a>
      <div class="clr"></div>
    </div>
  </body>
</html>
