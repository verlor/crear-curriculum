
<%@ page import="org.noe.eseiza.domains.Habilidad" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'habilidad.label', default: 'Habilidad')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-habilidad" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-habilidad" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<th><g:message code="habilidad.certificacion.label" default="Certificacion" /></th>
					
						<g:sortableColumn property="descripcion" title="${message(code: 'habilidad.descripcion.label', default: 'Descripcion')}" />
					
						<g:sortableColumn property="habilidad" title="${message(code: 'habilidad.habilidad.label', default: 'Habilidad')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${habilidadInstanceList}" status="i" var="habilidadInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${habilidadInstance.id}">${fieldValue(bean: habilidadInstance, field: "certificacion")}</g:link></td>
					
						<td>${fieldValue(bean: habilidadInstance, field: "descripcion")}</td>
					
						<td>${fieldValue(bean: habilidadInstance, field: "habilidad")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${habilidadInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
