<!--
  To change this template, choose Tools | Templates
  and open the template in the editor.
-->

<%@ page contentType="text/html;charset=UTF-8" %>

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Sample title</title>
    <meta name="layout" content="main">
  </head>
  <body>
    <table>
      <thead>
        <tr>

          <g:sortableColumn property="telefonoCelular" title="Persona" />

          <g:sortableColumn property="telefonoLocal" title="Escuela" />

          
          <g:sortableColumn property="mail" title="Gradp" />
          
          <g:sortableColumn property="mail" title="Prommedio" />
          
          <g:sortableColumn property="mail" title="Sueldo" />

        </tr>
    </thead>
    <tbody>
      <g:each in="${reporte}" status="i" var="campo">
        <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

          <td>${campo.nombre}</td>

          <td>${campo.escuela}</td>
          
          <td>${campo.grado}</td>
          
          <td>${campo.promedio}</td>
          
          <td>${campo.sueldo}</td>

        </tr>
      </g:each>
    </tbody>
  </table>
</body>
</html>
