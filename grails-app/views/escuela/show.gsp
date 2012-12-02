
<%@ page import="org.noe.eseiza.domains.Escuela" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'escuela.label', default: 'Escuela')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-escuela" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-escuela" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list escuela">
			
				<g:if test="${escuelaInstance?.logros}">
				<li class="fieldcontain">
					<span id="logros-label" class="property-label"><g:message code="escuela.logros.label" default="Logros" /></span>
					
						<g:each in="${escuelaInstance.logros}" var="l">
						<span class="property-value" aria-labelledby="logros-label"><g:link controller="logro" action="show" id="${l.id}">${l?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${escuelaInstance?.escuela}">
				<li class="fieldcontain">
					<span id="escuela-label" class="property-label"><g:message code="escuela.escuela.label" default="Escuela" /></span>
					
						<span class="property-value" aria-labelledby="escuela-label"><g:fieldValue bean="${escuelaInstance}" field="escuela"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${escuelaInstance?.tiempoCursado}">
				<li class="fieldcontain">
					<span id="tiempoCursado-label" class="property-label"><g:message code="escuela.tiempoCursado.label" default="Tiempo Cursado" /></span>
					
						<span class="property-value" aria-labelledby="tiempoCursado-label"><g:fieldValue bean="${escuelaInstance}" field="tiempoCursado"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${escuelaInstance?.grado}">
				<li class="fieldcontain">
					<span id="grado-label" class="property-label"><g:message code="escuela.grado.label" default="Grado" /></span>
					
						<span class="property-value" aria-labelledby="grado-label"><g:fieldValue bean="${escuelaInstance}" field="grado"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${escuelaInstance?.promedio}">
				<li class="fieldcontain">
					<span id="promedio-label" class="property-label"><g:message code="escuela.promedio.label" default="Promedio" /></span>
					
						<span class="property-value" aria-labelledby="promedio-label"><g:fieldValue bean="${escuelaInstance}" field="promedio"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${escuelaInstance?.institucion}">
				<li class="fieldcontain">
					<span id="institucion-label" class="property-label"><g:message code="escuela.institucion.label" default="Institucion" /></span>
					
						<span class="property-value" aria-labelledby="institucion-label"><g:link controller="institucion" action="show" id="${escuelaInstance?.institucion?.id}">${escuelaInstance?.institucion?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${escuelaInstance?.graduacion}">
				<li class="fieldcontain">
					<span id="graduacion-label" class="property-label"><g:message code="escuela.graduacion.label" default="Graduacion" /></span>
					
						<span class="property-value" aria-labelledby="graduacion-label"><g:formatDate date="${escuelaInstance?.graduacion}" /></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${escuelaInstance?.id}" />
					<g:link class="edit" action="edit" id="${escuelaInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
