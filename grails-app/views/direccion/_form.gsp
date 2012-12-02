<%@ page import="org.noe.eseiza.domains.Direccion" %>



<div class="fieldcontain ${hasErrors(bean: direccionInstance, field: 'codigoPostal', 'error')} required">
	<label for="codigoPostal">
		<g:message code="direccion.codigoPostal.label" default="Codigo Postal" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="codigoPostal" type="number" value="${direccionInstance.codigoPostal}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: direccionInstance, field: 'numero', 'error')} required">
	<label for="numero">
		<g:message code="direccion.numero.label" default="Numero" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="numero" from="${0..10000}" class="range" required="" value="${fieldValue(bean: direccionInstance, field: 'numero')}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: direccionInstance, field: 'calle', 'error')} required">
	<label for="calle">
		<g:message code="direccion.calle.label" default="Calle" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="calle" required="" value="${direccionInstance?.calle}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: direccionInstance, field: 'estado', 'error')} required">
	<label for="estado">
		<g:message code="direccion.estado.label" default="Estado" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="estado" name="estado.id" from="${org.noe.eseiza.domains.Estado.list()}" optionKey="id" required="" value="${direccionInstance?.estado?.id}" class="many-to-one"/>
</div>

