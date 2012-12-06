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

          <g:sortableColumn property="telefonoLocal" title="Puesto" />

          
          <g:sortableColumn property="mail" title="Mail" />
          
          <g:sortableColumn property="mail" title="Telefono movil" />
          
          <g:sortableColumn property="mail" title="Telefono local" />

        </tr>
    </thead>
    <tbody>
      <g:each in="${reporte}" status="i" var="campo">
        <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

          <td>${campo.nombre}</td>

          <td>${campo.puesto}</td>
          
          <td>${campo.mail}</td>
          
          <td>${campo.telefonoCelular}</td>
          
          <td>${campo.telefonoLocal}</td>

        </tr>
      </g:each>
    </tbody>
  </table>
</body>
</html>
