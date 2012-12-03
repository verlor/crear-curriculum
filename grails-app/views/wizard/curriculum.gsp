<!--
  To change this template, choose Tools | Templates
  and open the template in the editor.
-->

<%@ page contentType="text/html;charset=UTF-8" %>

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Curriculum</title>
    <meta name="layout" content="main">
    <style>
      h2{
        padding: 21px 25px 22px 25px;
        border-top: 1px solid #FAFAFA;
        border-bottom: 1px solid #E0E0E0;
        background: #EDEDED;
        background: -webkit-gradient(linear, left top, left bottom, from(#EDEDED), to(#EBEBEB));
        background: -moz-linear-gradient(top, #EDEDED, #EBEBEB);  
      }
    </style>
  </head>
  <body>
    <h2>${user.nombre}</h2>
    <h1>Contacto</h1>
    <table>
      <thead>
        <tr>

      <g:sortableColumn property="telefonoCelular" title="${message(code: 'contacto.telefonoCelular.label', default: 'Telefono Celular')}" />

      <g:sortableColumn property="telefonoLocal" title="${message(code: 'contacto.telefonoLocal.label', default: 'Telefono Local')}" />

      <g:sortableColumn property="mail" title="${message(code: 'contacto.mail.label', default: 'Mail')}" />

    </tr>
  </thead>
  <tbody>
  <g:each in="${user.contacto}" status="i" var="contactoInstance">
    <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

      <td><g:link action="edit" controller="contacto" id="${contactoInstance.id}">${fieldValue(bean: contactoInstance, field: "telefonoCelular")}</g:link></td>

    <td>${fieldValue(bean: contactoInstance, field: "telefonoLocal")}</td>

    <td>${fieldValue(bean: contactoInstance, field: "mail")}</td>

    </tr>
  </g:each>
</tbody>
</table>
<h1>Direcci&oacute;n</h1>
<table>
  <thead>
    <tr>

  <g:sortableColumn property="codigoPostal" title="${message(code: 'direccion.codigoPostal.label', default: 'Codigo Postal')}" />

  <g:sortableColumn property="calle" title="${message(code: 'direccion.calle.label', default: 'Calle')}" />

  <th><g:message code="direccion.estado.label" default="Estado" /></th>

<g:sortableColumn property="numero" title="${message(code: 'direccion.numero.label', default: 'Numero')}" />

</tr>
</thead>
<tbody>
<g:each in="${user.direccion}" status="i" var="direccionInstance">
  <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

    <td><g:link action="edit" controller="direccion" id="${direccionInstance.id}">${fieldValue(bean: direccionInstance, field: "codigoPostal")}</g:link></td>

  <td>${fieldValue(bean: direccionInstance, field: "calle")}</td>

  <td>${fieldValue(bean: direccionInstance, field: "estado")}</td>

  <td>${fieldValue(bean: direccionInstance, field: "numero")}</td>

  </tr>
</g:each>
</tbody>
</table>
<h1>Educaci&oacute;n</h1>

<table>
  <thead>
    <tr>

  <g:sortableColumn property="escuela" title="${message(code: 'escuela.escuela.label', default: 'Escuela')}" />

  <g:sortableColumn property="tiempoCursado" title="${message(code: 'escuela.tiempoCursado.label', default: 'Tiempo Cursado')}" />

  <g:sortableColumn property="grado" title="${message(code: 'escuela.grado.label', default: 'Grado')}" />

  <g:sortableColumn property="promedio" title="${message(code: 'escuela.promedio.label', default: 'Promedio')}" />

  <th><g:message code="escuela.institucion.label" default="Institucion" /></th>

<g:sortableColumn property="graduacion" title="${message(code: 'escuela.graduacion.label', default: 'Graduacion')}" />

</tr>
</thead>
<tbody>
<g:each in="${user.escuelas}" status="i" var="escuelaInstance">
  <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

    <td><g:link controller="escuela" action="edit" id="${escuelaInstance.id}">${fieldValue(bean: escuelaInstance, field: "escuela")}</g:link></td>

  <td>${fieldValue(bean: escuelaInstance, field: "tiempoCursado")}</td>

  <td>${fieldValue(bean: escuelaInstance, field: "grado")}</td>

  <td>${fieldValue(bean: escuelaInstance, field: "promedio")}</td>

  <td>${fieldValue(bean: escuelaInstance, field: "institucion")}</td>

  <td><g:formatDate date="${escuelaInstance.graduacion}" /></td>

  </tr>
</g:each>
</tbody>
</table>
<h1>Idioma(s)</h1>
<table>
  <thead>
    <tr>

  <g:sortableColumn property="idioma" title="${message(code: 'idioma.idioma.label', default: 'Idioma')}" />

  <th><g:message code="idioma.certificacion.label" default="Certificacion" /></th>

</tr>
</thead>
<tbody>
<g:each in="${user.idiomas}" status="i" var="idiomaInstance">
  <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

    <td><g:link controller="idioma" action="edit" id="${idiomaInstance.id}">${fieldValue(bean: idiomaInstance, field: "idioma")}</g:link></td>

  <td>${fieldValue(bean: idiomaInstance, field: "certificacion")}</td>

  </tr>
</g:each>
</tbody>
</table>

<h1>Buscando</h1>
<table>
  <thead>
    <tr>

  <g:sortableColumn property="prestaciones" title="${message(code: 'condicion.prestaciones.label', default: 'Prestaciones')}" />

  <g:sortableColumn property="puesto" title="${message(code: 'condicion.puesto.label', default: 'Puesto')}" />

  <g:sortableColumn property="diasLaborables" title="${message(code: 'condicion.diasLaborables.label', default: 'Dias Laborables')}" />

  <g:sortableColumn property="sueldo" title="${message(code: 'condicion.sueldo.label', default: 'Sueldo')}" />

</tr>
</thead>
<tbody>
<g:each in="${user.condicion}" status="i" var="condicionInstance">
  <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

    <td><g:link controller="condicion" action="edit" id="${condicionInstance.id}">${fieldValue(bean: condicionInstance, field: "prestaciones")}</g:link></td>

  <td>${fieldValue(bean: condicionInstance, field: "puesto")}</td>

  <td>${fieldValue(bean: condicionInstance, field: "diasLaborables")}</td>

  <td>${fieldValue(bean: condicionInstance, field: "sueldo")}</td>

  </tr>
</g:each>
</tbody>
</table>
<h1>Nacionalidad</h1>
<table>
  <thead>
    <tr>

  <g:sortableColumn property="nacionalidad" title="${message(code: 'nacionalidad.nacionalidad.label', default: 'Nacionalidad')}" />

</tr>
</thead>
<tbody>
<g:each in="${user.nacionalidades}" status="i" var="nacionalidadInstance">
  <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

    <td><g:link controller="nacionalidad" action="edit" id="${nacionalidadInstance.id}">${fieldValue(bean: nacionalidadInstance, field: "nacionalidad")}</g:link></td>

  </tr>
</g:each>
</tbody>
</table>
</body>
</html>
