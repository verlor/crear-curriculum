<%@ page import="org.noe.eseiza.domains.Estado" %>



<div class="fieldcontain ${hasErrors(bean: estadoInstance, field: 'estado', 'error')} required">
	<label for="estado">
		<g:message code="estado.estado.label" default="Estado" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="estado" required="" value="${estadoInstance?.estado}"/>
</div>

