
<%@ page import="org.noe.eseiza.domains.Contacto" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'contacto.label', default: 'Contacto')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-contacto" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-contacto" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="telefonoCelular" title="${message(code: 'contacto.telefonoCelular.label', default: 'Telefono Celular')}" />
					
						<g:sortableColumn property="telefonoLocal" title="${message(code: 'contacto.telefonoLocal.label', default: 'Telefono Local')}" />
					
						<g:sortableColumn property="mail" title="${message(code: 'contacto.mail.label', default: 'Mail')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${contactoInstanceList}" status="i" var="contactoInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${contactoInstance.id}">${fieldValue(bean: contactoInstance, field: "telefonoCelular")}</g:link></td>
					
						<td>${fieldValue(bean: contactoInstance, field: "telefonoLocal")}</td>
					
						<td>${fieldValue(bean: contactoInstance, field: "mail")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${contactoInstanceTotal}" />
			</div>
		</div>
	</body>
</html>