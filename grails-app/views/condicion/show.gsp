
<%@ page import="org.noe.eseiza.domains.Condicion" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'condicion.label', default: 'Condicion')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-condicion" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-condicion" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list condicion">
			
				<g:if test="${condicionInstance?.prestaciones}">
				<li class="fieldcontain">
					<span id="prestaciones-label" class="property-label"><g:message code="condicion.prestaciones.label" default="Prestaciones" /></span>
					
						<span class="property-value" aria-labelledby="prestaciones-label"><g:fieldValue bean="${condicionInstance}" field="prestaciones"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${condicionInstance?.sueldo}">
				<li class="fieldcontain">
					<span id="sueldo-label" class="property-label"><g:message code="condicion.sueldo.label" default="Sueldo" /></span>
					
						<span class="property-value" aria-labelledby="sueldo-label"><g:fieldValue bean="${condicionInstance}" field="sueldo"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${condicionInstance?.puesto}">
				<li class="fieldcontain">
					<span id="puesto-label" class="property-label"><g:message code="condicion.puesto.label" default="Puesto" /></span>
					
						<span class="property-value" aria-labelledby="puesto-label"><g:fieldValue bean="${condicionInstance}" field="puesto"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${condicionInstance?.diasLaborables}">
				<li class="fieldcontain">
					<span id="diasLaborables-label" class="property-label"><g:message code="condicion.diasLaborables.label" default="Dias Laborables" /></span>
					
						<span class="property-value" aria-labelledby="diasLaborables-label"><g:fieldValue bean="${condicionInstance}" field="diasLaborables"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${condicionInstance?.id}" />
					<g:link class="edit" action="edit" id="${condicionInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
