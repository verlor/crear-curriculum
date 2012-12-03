<%@ page import="org.noe.eseiza.domains.Idioma" %>



<div class="fieldcontain ${hasErrors(bean: idiomaInstance, field: 'idioma', 'error')} required">
	<label for="idioma">
		<g:message code="idioma.idioma.label" default="Idioma" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="idioma" required="" value="${idiomaInstance?.idioma}"/>
</div>

<h1>¿Tienes alguna certificacion?</h1>

<div class="fieldcontain ${hasErrors(bean: certificacionInstance, field: 'nivel', 'error')} required">
	<label for="nivel">
		<g:message code="certificacion.nivel.label" default="Nivel" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="nivel" required="" value="${certificacionInstance?.nivel}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: certificacionInstance, field: 'realizacion', 'error')} required">
	<label for="realizacion">
		<g:message code="certificacion.realizacion.label" default="Realizacion" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="realizacion" precision="day"  value="${certificacionInstance?.realizacion}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: certificacionInstance, field: 'termino', 'error')} required">
	<label for="termino">
		<g:message code="certificacion.termino.label" default="Termino" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="termino" precision="day"  value="${certificacionInstance?.termino}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: certificacionInstance, field: 'nombre', 'error')} required">
	<label for="nombre">
		<g:message code="certificacion.nombre.label" default="Nombre" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="nombre" required="" value="${certificacionInstance?.nombre}"/>
</div>

