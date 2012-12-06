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

    <link rel="stylesheet" href="${resource(dir: 'css/button', file: 'style1.css')}" type="text/css">   
    <link href='http://fonts.googleapis.com/css?family=Oswald' rel='stylesheet' type='text/css' />
    <title>Curriculums</title>
    <script type="text/javascript">
      function dirigir(controller, action, elems) {
        window.location ="${createLink(controller:'Main', action: "vote", params: [recordId: id, where: request.context] )}";
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
    <div class="button-wrapper">
      <a href="${createLink(controller:'contacto', action: 'create')}" class="a-btn">
        <img src="${resource(dir: 'images/button/icons', file: '10.png')}" alt="Photos" />
        <span class="a-btn-text"><small>Crear</small>Curriculum</span> 
      </a>

      <a href="${createLink(controller:'wizard', action: 'curriculum')}" class="a-btn">
        <img src="${resource(dir: 'images/button/icons', file: '12.png')}" alt="Photos" />
        <span class="a-btn-text"><small>Modificar</small>Curriculum</span> 
      </a>

      <a href="/curriculums/wizard/curriculumAPdf?user=<sec:loggedInUserInfo field='id'/>" class="a-btn">
        <img src="${resource(dir: 'images/button/icons', file: '17.png')}" alt="Photos" />
        <span class="a-btn-text"><small>Descargar</small>Curriculum</span> 
      </a>
    </div>
  </body>
</html>
