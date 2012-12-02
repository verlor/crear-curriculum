<%@ page import="org.noe.eseiza.domains.RedSocial" %>



<div class="fieldcontain ${hasErrors(bean: redSocialInstance, field: 'redSocial', 'error')} required">
	<label for="redSocial">
		<g:message code="redSocial.redSocial.label" default="Red Social" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="redSocial" required="" value="${redSocialInstance?.redSocial}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: redSocialInstance, field: 'perfilUrl', 'error')} required">
	<label for="perfilUrl">
		<g:message code="redSocial.perfilUrl.label" default="Perfil Url" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="perfilUrl" required="" value="${redSocialInstance?.perfilUrl}"/>
</div>

