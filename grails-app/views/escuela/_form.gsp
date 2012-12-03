<%@ page import="org.noe.eseiza.domains.Escuela" %>


<div class="fieldcontain ${hasErrors(bean: escuelaInstance, field: 'escuela', 'error')} required">
	<label for="escuela">
		<g:message code="escuela.escuela.label" default="Escuela" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="escuela" required="" value="${escuelaInstance?.escuela}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: escuelaInstance, field: 'tiempoCursado', 'error')} required">
	<label for="tiempoCursado">
		<g:message code="escuela.tiempoCursado.label" default="Tiempo Cursado" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="tiempoCursado" from="${0..15}" class="range" required="" value="${fieldValue(bean: escuelaInstance, field: 'tiempoCursado')}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: escuelaInstance, field: 'grado', 'error')} required">
	<label for="grado">
		<g:message code="escuela.grado.label" default="Grado" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="grado" required="" value="${escuelaInstance?.grado}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: escuelaInstance, field: 'promedio', 'error')} required">
	<label for="promedio">
		<g:message code="escuela.promedio.label" default="Promedio" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="promedio" from="${6.0..10.0}" class="range" required="" value="${fieldValue(bean: escuelaInstance, field: 'promedio')}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: escuelaInstance, field: 'institucion', 'error')} required">
	<label for="institucion">
		<g:message code="escuela.institucion.label" default="Institucion" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="institucion" name="institucion.id" from="${org.noe.eseiza.domains.Institucion.list()}" optionKey="id" required="" value="${escuelaInstance?.institucion?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: escuelaInstance, field: 'graduacion', 'error')} required">
	<label for="graduacion">
		<g:message code="escuela.graduacion.label" default="Graduacion" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="graduacion" precision="day"  value="${escuelaInstance?.graduacion}"  />
</div>

