<%@ page import="org.noe.eseiza.domains.Habilidad" %>



<div class="fieldcontain ${hasErrors(bean: habilidadInstance, field: 'certificacion', 'error')} ">
	<label for="certificacion">
		<g:message code="habilidad.certificacion.label" default="Certificacion" />
		
	</label>
	<g:select id="certificacion" name="certificacion.id" from="${org.noe.eseiza.domains.Certificacion.list()}" optionKey="id" value="${habilidadInstance?.certificacion?.id}" class="many-to-one" noSelection="['null': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: habilidadInstance, field: 'descripcion', 'error')} required">
	<label for="descripcion">
		<g:message code="habilidad.descripcion.label" default="Descripcion" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="descripcion" required="" value="${habilidadInstance?.descripcion}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: habilidadInstance, field: 'habilidad', 'error')} required">
	<label for="habilidad">
		<g:message code="habilidad.habilidad.label" default="Habilidad" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="habilidad" required="" value="${habilidadInstance?.habilidad}"/>
</div>

