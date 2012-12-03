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
  </head>
  <body>
    <div class="button-wrapper">
      <a href="#" class="a-btn">
        <img src="${resource(dir: 'images/button/icons', file: '10.png')}" alt="Photos" />
        <span class="a-btn-text"><small>Crear</small>Curriculum</span> 
      </a>
      
      <a href="#" class="a-btn">
        <img src="${resource(dir: 'images/button/icons', file: '12.png')}" alt="Photos" />
        <span class="a-btn-text"><small>Modificar</small>Curriculum</span> 
      </a>
      
      <a href="#" class="a-btn">
        <img src="${resource(dir: 'images/button/icons', file: '17.png')}" alt="Photos" />
        <span class="a-btn-text"><small>Descargar</small>Curriculum</span> 
      </a>
    </div>
  </body>
</html>
