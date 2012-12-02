
<%@ page import="org.noe.eseiza.domains.Certificacion" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'certificacion.label', default: 'Certificacion')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-certificacion" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-certificacion" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="nivel" title="${message(code: 'certificacion.nivel.label', default: 'Nivel')}" />
					
						<g:sortableColumn property="realizacion" title="${message(code: 'certificacion.realizacion.label', default: 'Realizacion')}" />
					
						<g:sortableColumn property="termino" title="${message(code: 'certificacion.termino.label', default: 'Termino')}" />
					
						<g:sortableColumn property="nombre" title="${message(code: 'certificacion.nombre.label', default: 'Nombre')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${certificacionInstanceList}" status="i" var="certificacionInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${certificacionInstance.id}">${fieldValue(bean: certificacionInstance, field: "nivel")}</g:link></td>
					
						<td><g:formatDate date="${certificacionInstance.realizacion}" /></td>
					
						<td><g:formatDate date="${certificacionInstance.termino}" /></td>
					
						<td>${fieldValue(bean: certificacionInstance, field: "nombre")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${certificacionInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
