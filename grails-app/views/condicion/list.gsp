
<%@ page import="org.noe.eseiza.domains.Condicion" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'condicion.label', default: 'Condicion')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-condicion" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-condicion" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="prestaciones" title="${message(code: 'condicion.prestaciones.label', default: 'Prestaciones')}" />
					
						<g:sortableColumn property="sueldo" title="${message(code: 'condicion.sueldo.label', default: 'Sueldo')}" />
					
						<g:sortableColumn property="puesto" title="${message(code: 'condicion.puesto.label', default: 'Puesto')}" />
					
						<g:sortableColumn property="diasLaborables" title="${message(code: 'condicion.diasLaborables.label', default: 'Dias Laborables')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${condicionInstanceList}" status="i" var="condicionInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${condicionInstance.id}">${fieldValue(bean: condicionInstance, field: "prestaciones")}</g:link></td>
					
						<td>${fieldValue(bean: condicionInstance, field: "sueldo")}</td>
					
						<td>${fieldValue(bean: condicionInstance, field: "puesto")}</td>
					
						<td>${fieldValue(bean: condicionInstance, field: "diasLaborables")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${condicionInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
