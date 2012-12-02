<%@ page import="org.noe.eseiza.domains.Condicion" %>



<div class="fieldcontain ${hasErrors(bean: condicionInstance, field: 'prestaciones', 'error')} required">
	<label for="prestaciones">
		<g:message code="condicion.prestaciones.label" default="Prestaciones" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="prestaciones" required="" value="${condicionInstance?.prestaciones}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: condicionInstance, field: 'sueldo', 'error')} required">
	<label for="sueldo">
		<g:message code="condicion.sueldo.label" default="Sueldo" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="sueldo" from="${0..200000}" class="range" required="" value="${fieldValue(bean: condicionInstance, field: 'sueldo')}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: condicionInstance, field: 'puesto', 'error')} required">
	<label for="puesto">
		<g:message code="condicion.puesto.label" default="Puesto" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="puesto" required="" value="${condicionInstance?.puesto}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: condicionInstance, field: 'diasLaborables', 'error')} required">
	<label for="diasLaborables">
		<g:message code="condicion.diasLaborables.label" default="Dias Laborables" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="diasLaborables" required="" value="${condicionInstance?.diasLaborables}"/>
</div>

