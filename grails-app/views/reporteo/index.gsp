<!--
  To change this template, choose Tools | Templates
  and open the template in the editor.
-->

<%@ page contentType="text/html;charset=UTF-8" %>


<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="layout" content="main">    
    
    <script type="text/javascript">
      function cleanInput(id){
        document.getElementById(id).innerHTML = '';
      }
    </script>
    <title>Curriculums</title>
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

      <h1>Buscar por idioma y nivel</h1>
      <g:form action="idiomaNivelPdf" >
        <g:textField name="idioma" required="" value="Idioma" onClick="cleanInput('idoma')"/>
        <g:textField name="nivel" required="" value="Nivel"/>
        <g:submitButton name="Buscar" class="save" value="Buscar" />         
      </g:form>
      
      <h1>Buscar por puesto</h1>
      <g:form action="puestoPdf" >
        <g:textField name="puesto" required="" value="Puesto" />
        <g:submitButton name="Buscar" class="save" value="Buscar" />         
      </g:form>
      
      <h1>Buscar por sueldo</h1>
      <g:form action="sueldoPdf" >
        <g:textField name="sueldo" required="" value="Sueldo" />
        <g:submitButton name="Buscar" class="save" value="Buscar" />         
      </g:form>
      
      <h1>Instituciones con mejores promedios</h1>
      <g:form action="promedioPdf" >        
        <g:submitButton name="Buscar" class="save" value="Buscar" />         
      </g:form>
      
      <h1>Buscar por habilidad</h1>
      <g:form action="habilidadPdf" >
        <g:textField name="habilidad" required="" value="Habilidad" />
        <g:submitButton name="Buscar" class="save" value="Buscar" />         
      </g:form>
      
    </div>
  </body>
</html>
