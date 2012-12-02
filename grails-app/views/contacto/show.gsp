
<%@ page import="org.noe.eseiza.domains.Contacto" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'contacto.label', default: 'Contacto')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-contacto" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-contacto" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list contacto">
			
				<g:if test="${contactoInstance?.telefonoCelular}">
				<li class="fieldcontain">
					<span id="telefonoCelular-label" class="property-label"><g:message code="contacto.telefonoCelular.label" default="Telefono Celular" /></span>
					
						<span class="property-value" aria-labelledby="telefonoCelular-label"><g:fieldValue bean="${contactoInstance}" field="telefonoCelular"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${contactoInstance?.telefonoLocal}">
				<li class="fieldcontain">
					<span id="telefonoLocal-label" class="property-label"><g:message code="contacto.telefonoLocal.label" default="Telefono Local" /></span>
					
						<span class="property-value" aria-labelledby="telefonoLocal-label"><g:fieldValue bean="${contactoInstance}" field="telefonoLocal"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${contactoInstance?.mail}">
				<li class="fieldcontain">
					<span id="mail-label" class="property-label"><g:message code="contacto.mail.label" default="Mail" /></span>
					
						<span class="property-value" aria-labelledby="mail-label"><g:fieldValue bean="${contactoInstance}" field="mail"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${contactoInstance?.redesSociales}">
				<li class="fieldcontain">
					<span id="redesSociales-label" class="property-label"><g:message code="contacto.redesSociales.label" default="Redes Sociales" /></span>
					
						<g:each in="${contactoInstance.redesSociales}" var="r">
						<span class="property-value" aria-labelledby="redesSociales-label"><g:link controller="redSocial" action="show" id="${r.id}">${r?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${contactoInstance?.id}" />
					<g:link class="edit" action="edit" id="${contactoInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
