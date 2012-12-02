
<%@ page import="org.noe.eseiza.domains.Certificacion" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'certificacion.label', default: 'Certificacion')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-certificacion" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-certificacion" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list certificacion">
			
				<g:if test="${certificacionInstance?.nivel}">
				<li class="fieldcontain">
					<span id="nivel-label" class="property-label"><g:message code="certificacion.nivel.label" default="Nivel" /></span>
					
						<span class="property-value" aria-labelledby="nivel-label"><g:fieldValue bean="${certificacionInstance}" field="nivel"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${certificacionInstance?.realizacion}">
				<li class="fieldcontain">
					<span id="realizacion-label" class="property-label"><g:message code="certificacion.realizacion.label" default="Realizacion" /></span>
					
						<span class="property-value" aria-labelledby="realizacion-label"><g:formatDate date="${certificacionInstance?.realizacion}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${certificacionInstance?.termino}">
				<li class="fieldcontain">
					<span id="termino-label" class="property-label"><g:message code="certificacion.termino.label" default="Termino" /></span>
					
						<span class="property-value" aria-labelledby="termino-label"><g:formatDate date="${certificacionInstance?.termino}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${certificacionInstance?.nombre}">
				<li class="fieldcontain">
					<span id="nombre-label" class="property-label"><g:message code="certificacion.nombre.label" default="Nombre" /></span>
					
						<span class="property-value" aria-labelledby="nombre-label"><g:fieldValue bean="${certificacionInstance}" field="nombre"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${certificacionInstance?.id}" />
					<g:link class="edit" action="edit" id="${certificacionInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
