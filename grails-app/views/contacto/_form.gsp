<%@ page import="org.noe.eseiza.domains.Contacto" %>



<div class="fieldcontain ${hasErrors(bean: contactoInstance, field: 'telefonoCelular', 'error')} required">
	<label for="telefonoCelular">
		<g:message code="contacto.telefonoCelular.label" default="Telefono Celular" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="telefonoCelular" required="" value="${contactoInstance?.telefonoCelular}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: contactoInstance, field: 'telefonoLocal', 'error')} required">
	<label for="telefonoLocal">
		<g:message code="contacto.telefonoLocal.label" default="Telefono Local" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="telefonoLocal" required="" value="${contactoInstance?.telefonoLocal}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: contactoInstance, field: 'mail', 'error')} required">
	<label for="mail">
		<g:message code="contacto.mail.label" default="Mail" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="email" name="mail" required="" value="${contactoInstance?.mail}"/>
</div>

