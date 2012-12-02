<%@ page import="org.noe.eseiza.domains.Institucion" %>



<div class="fieldcontain ${hasErrors(bean: institucionInstance, field: 'institucion', 'error')} required">
	<label for="institucion">
		<g:message code="institucion.institucion.label" default="Institucion" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="institucion" required="" value="${institucionInstance?.institucion}"/>
</div>

