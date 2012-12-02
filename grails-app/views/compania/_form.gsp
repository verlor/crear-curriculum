<%@ page import="org.noe.eseiza.domains.Compania" %>



<div class="fieldcontain ${hasErrors(bean: companiaInstance, field: 'logros', 'error')} ">
	<label for="logros">
		<g:message code="compania.logros.label" default="Logros" />
		
	</label>
	<g:select name="logros" from="${org.noe.eseiza.domains.Logro.list()}" multiple="multiple" optionKey="id" size="5" value="${companiaInstance?.logros*.id}" class="many-to-many"/>
</div>

<div class="fieldcontain ${hasErrors(bean: companiaInstance, field: 'nombre', 'error')} required">
	<label for="nombre">
		<g:message code="compania.nombre.label" default="Nombre" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="nombre" required="" value="${companiaInstance?.nombre}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: companiaInstance, field: 'descripcion', 'error')} required">
	<label for="descripcion">
		<g:message code="compania.descripcion.label" default="Descripcion" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="descripcion" required="" value="${companiaInstance?.descripcion}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: companiaInstance, field: 'telefono', 'error')} required">
	<label for="telefono">
		<g:message code="compania.telefono.label" default="Telefono" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="telefono" required="" value="${companiaInstance?.telefono}"/>
</div>

