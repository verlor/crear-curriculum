
<%@ page import="org.noe.eseiza.domains.Persona" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'persona.label', default: 'Persona')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-persona" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-persona" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list persona">
			
				<g:if test="${personaInstance?.condicion}">
				<li class="fieldcontain">
					<span id="condicion-label" class="property-label"><g:message code="persona.condicion.label" default="Condicion" /></span>
					
						<span class="property-value" aria-labelledby="condicion-label"><g:link controller="condicion" action="show" id="${personaInstance?.condicion?.id}">${personaInstance?.condicion?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${personaInstance?.contacto}">
				<li class="fieldcontain">
					<span id="contacto-label" class="property-label"><g:message code="persona.contacto.label" default="Contacto" /></span>
					
						<span class="property-value" aria-labelledby="contacto-label"><g:link controller="contacto" action="show" id="${personaInstance?.contacto?.id}">${personaInstance?.contacto?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${personaInstance?.direccion}">
				<li class="fieldcontain">
					<span id="direccion-label" class="property-label"><g:message code="persona.direccion.label" default="Direccion" /></span>
					
						<span class="property-value" aria-labelledby="direccion-label"><g:link controller="direccion" action="show" id="${personaInstance?.direccion?.id}">${personaInstance?.direccion?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${personaInstance?.nombre}">
				<li class="fieldcontain">
					<span id="nombre-label" class="property-label"><g:message code="persona.nombre.label" default="Nombre" /></span>
					
						<span class="property-value" aria-labelledby="nombre-label"><g:fieldValue bean="${personaInstance}" field="nombre"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${personaInstance?.companias}">
				<li class="fieldcontain">
					<span id="companias-label" class="property-label"><g:message code="persona.companias.label" default="Companias" /></span>
					
						<g:each in="${personaInstance.companias}" var="c">
						<span class="property-value" aria-labelledby="companias-label"><g:link controller="compania" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${personaInstance?.escuelas}">
				<li class="fieldcontain">
					<span id="escuelas-label" class="property-label"><g:message code="persona.escuelas.label" default="Escuelas" /></span>
					
						<g:each in="${personaInstance.escuelas}" var="e">
						<span class="property-value" aria-labelledby="escuelas-label"><g:link controller="escuela" action="show" id="${e.id}">${e?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${personaInstance?.habilidades}">
				<li class="fieldcontain">
					<span id="habilidades-label" class="property-label"><g:message code="persona.habilidades.label" default="Habilidades" /></span>
					
						<g:each in="${personaInstance.habilidades}" var="h">
						<span class="property-value" aria-labelledby="habilidades-label"><g:link controller="habilidad" action="show" id="${h.id}">${h?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${personaInstance?.idiomas}">
				<li class="fieldcontain">
					<span id="idiomas-label" class="property-label"><g:message code="persona.idiomas.label" default="Idiomas" /></span>
					
						<g:each in="${personaInstance.idiomas}" var="i">
						<span class="property-value" aria-labelledby="idiomas-label"><g:link controller="idioma" action="show" id="${i.id}">${i?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${personaInstance?.nacionalidades}">
				<li class="fieldcontain">
					<span id="nacionalidades-label" class="property-label"><g:message code="persona.nacionalidades.label" default="Nacionalidades" /></span>
					
						<g:each in="${personaInstance.nacionalidades}" var="n">
						<span class="property-value" aria-labelledby="nacionalidades-label"><g:link controller="nacionalidad" action="show" id="${n.id}">${n?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${personaInstance?.id}" />
					<g:link class="edit" action="edit" id="${personaInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
