<%@ page import="org.noe.eseiza.domains.Nacionalidad" %>



<div class="fieldcontain ${hasErrors(bean: nacionalidadInstance, field: 'nacionalidad', 'error')} required">
	<label for="nacionalidad">
		<g:message code="nacionalidad.nacionalidad.label" default="Nacionalidad" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="nacionalidad" required="" value="${nacionalidadInstance?.nacionalidad}"/>
</div>

