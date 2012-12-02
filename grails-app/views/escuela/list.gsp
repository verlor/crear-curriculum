
<%@ page import="org.noe.eseiza.domains.Escuela" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'escuela.label', default: 'Escuela')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-escuela" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-escuela" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
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
				<g:each in="${escuelaInstanceList}" status="i" var="escuelaInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${escuelaInstance.id}">${fieldValue(bean: escuelaInstance, field: "escuela")}</g:link></td>
					
						<td>${fieldValue(bean: escuelaInstance, field: "tiempoCursado")}</td>
					
						<td>${fieldValue(bean: escuelaInstance, field: "grado")}</td>
					
						<td>${fieldValue(bean: escuelaInstance, field: "promedio")}</td>
					
						<td>${fieldValue(bean: escuelaInstance, field: "institucion")}</td>
					
						<td><g:formatDate date="${escuelaInstance.graduacion}" /></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${escuelaInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
