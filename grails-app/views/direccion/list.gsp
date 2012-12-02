
<%@ page import="org.noe.eseiza.domains.Direccion" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'direccion.label', default: 'Direccion')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-direccion" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-direccion" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="codigoPostal" title="${message(code: 'direccion.codigoPostal.label', default: 'Codigo Postal')}" />
					
						<g:sortableColumn property="numero" title="${message(code: 'direccion.numero.label', default: 'Numero')}" />
					
						<g:sortableColumn property="calle" title="${message(code: 'direccion.calle.label', default: 'Calle')}" />
					
						<th><g:message code="direccion.estado.label" default="Estado" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${direccionInstanceList}" status="i" var="direccionInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${direccionInstance.id}">${fieldValue(bean: direccionInstance, field: "codigoPostal")}</g:link></td>
					
						<td>${fieldValue(bean: direccionInstance, field: "numero")}</td>
					
						<td>${fieldValue(bean: direccionInstance, field: "calle")}</td>
					
						<td>${fieldValue(bean: direccionInstance, field: "estado")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${direccionInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
