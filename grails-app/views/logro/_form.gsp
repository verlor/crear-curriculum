<%@ page import="org.noe.eseiza.domains.Logro" %>



<div class="fieldcontain ${hasErrors(bean: logroInstance, field: 'logro', 'error')} ">
	<label for="logro">
		<g:message code="logro.logro.label" default="Logro" />
		
	</label>
	<g:textField name="logro" value="${logroInstance?.logro}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: logroInstance, field: 'reconocimiento', 'error')} ">
	<label for="reconocimiento">
		<g:message code="logro.reconocimiento.label" default="Reconocimiento" />
		
	</label>
	<g:textField name="reconocimiento" value="${logroInstance?.reconocimiento}"/>
</div>

