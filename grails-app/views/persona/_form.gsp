<%@ page import="org.noe.eseiza.domains.Persona" %>



<div class="fieldcontain ${hasErrors(bean: personaInstance, field: 'condicion', 'error')} ">
	<label for="condicion">
		<g:message code="persona.condicion.label" default="Condicion" />
		
	</label>
	<g:select id="condicion" name="condicion.id" from="${org.noe.eseiza.domains.Condicion.list()}" optionKey="id" value="${personaInstance?.condicion?.id}" class="many-to-one" noSelection="['null': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: personaInstance, field: 'contacto', 'error')} ">
	<label for="contacto">
		<g:message code="persona.contacto.label" default="Contacto" />
		
	</label>
	<g:select id="contacto" name="contacto.id" from="${org.noe.eseiza.domains.Contacto.list()}" optionKey="id" value="${personaInstance?.contacto?.id}" class="many-to-one" noSelection="['null': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: personaInstance, field: 'direccion', 'error')} ">
	<label for="direccion">
		<g:message code="persona.direccion.label" default="Direccion" />
		
	</label>
	<g:select id="direccion" name="direccion.id" from="${org.noe.eseiza.domains.Direccion.list()}" optionKey="id" value="${personaInstance?.direccion?.id}" class="many-to-one" noSelection="['null': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: personaInstance, field: 'nombre', 'error')} required">
	<label for="nombre">
		<g:message code="persona.nombre.label" default="Nombre" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="nombre" required="" value="${personaInstance?.nombre}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: personaInstance, field: 'companias', 'error')} ">
	<label for="companias">
		<g:message code="persona.companias.label" default="Companias" />
		
	</label>
	<g:select name="companias" from="${org.noe.eseiza.domains.Compania.list()}" multiple="multiple" optionKey="id" size="5" value="${personaInstance?.companias*.id}" class="many-to-many"/>
</div>

<div class="fieldcontain ${hasErrors(bean: personaInstance, field: 'escuelas', 'error')} ">
	<label for="escuelas">
		<g:message code="persona.escuelas.label" default="Escuelas" />
		
	</label>
	<g:select name="escuelas" from="${org.noe.eseiza.domains.Escuela.list()}" multiple="multiple" optionKey="id" size="5" value="${personaInstance?.escuelas*.id}" class="many-to-many"/>
</div>

<div class="fieldcontain ${hasErrors(bean: personaInstance, field: 'habilidades', 'error')} ">
	<label for="habilidades">
		<g:message code="persona.habilidades.label" default="Habilidades" />
		
	</label>
	<g:select name="habilidades" from="${org.noe.eseiza.domains.Habilidad.list()}" multiple="multiple" optionKey="id" size="5" value="${personaInstance?.habilidades*.id}" class="many-to-many"/>
</div>

<div class="fieldcontain ${hasErrors(bean: personaInstance, field: 'idiomas', 'error')} ">
	<label for="idiomas">
		<g:message code="persona.idiomas.label" default="Idiomas" />
		
	</label>
	<g:select name="idiomas" from="${org.noe.eseiza.domains.Idioma.list()}" multiple="multiple" optionKey="id" size="5" value="${personaInstance?.idiomas*.id}" class="many-to-many"/>
</div>

<div class="fieldcontain ${hasErrors(bean: personaInstance, field: 'nacionalidades', 'error')} ">
	<label for="nacionalidades">
		<g:message code="persona.nacionalidades.label" default="Nacionalidades" />
		
	</label>
	<g:select name="nacionalidades" from="${org.noe.eseiza.domains.Nacionalidad.list()}" multiple="multiple" optionKey="id" size="5" value="${personaInstance?.nacionalidades*.id}" class="many-to-many"/>
</div>

