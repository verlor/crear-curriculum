<%@ page import="org.noe.eseiza.domains.Idioma" %>



<div class="fieldcontain ${hasErrors(bean: idiomaInstance, field: 'idioma', 'error')} required">
	<label for="idioma">
		<g:message code="idioma.idioma.label" default="Idioma" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="idioma" required="" value="${idiomaInstance?.idioma}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: idiomaInstance, field: 'certificacion', 'error')} required">
	<label for="certificacion">
		<g:message code="idioma.certificacion.label" default="Certificacion" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="certificacion" name="certificacion.id" from="${org.noe.eseiza.domains.Certificacion.list()}" optionKey="id" required="" value="${idiomaInstance?.certificacion?.id}" class="many-to-one"/>
</div>

