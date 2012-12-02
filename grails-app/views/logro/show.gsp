
<%@ page import="org.noe.eseiza.domains.Logro" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'logro.label', default: 'Logro')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-logro" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-logro" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list logro">
			
				<g:if test="${logroInstance?.logro}">
				<li class="fieldcontain">
					<span id="logro-label" class="property-label"><g:message code="logro.logro.label" default="Logro" /></span>
					
						<span class="property-value" aria-labelledby="logro-label"><g:fieldValue bean="${logroInstance}" field="logro"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${logroInstance?.reconocimiento}">
				<li class="fieldcontain">
					<span id="reconocimiento-label" class="property-label"><g:message code="logro.reconocimiento.label" default="Reconocimiento" /></span>
					
						<span class="property-value" aria-labelledby="reconocimiento-label"><g:fieldValue bean="${logroInstance}" field="reconocimiento"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${logroInstance?.id}" />
					<g:link class="edit" action="edit" id="${logroInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
