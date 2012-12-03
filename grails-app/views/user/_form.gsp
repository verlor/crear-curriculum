<%@ page import="org.noe.eseiza.security.domains.User" %>



<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'username', 'error')} required">
	<label for="username">
		<g:message code="user.username.label" default="Username" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="username" required="" value="${userInstance?.username}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'password', 'error')} required">
	<label for="password">
		<g:message code="user.password.label" default="Password" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="password" required="" value="${userInstance?.password}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'condicion', 'error')} ">
	<label for="condicion">
		<g:message code="user.condicion.label" default="Condicion" />
		
	</label>
	<g:select id="condicion" name="condicion.id" from="${org.noe.eseiza.domains.Condicion.list()}" optionKey="id" value="${userInstance?.condicion?.id}" class="many-to-one" noSelection="['null': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'contacto', 'error')} ">
	<label for="contacto">
		<g:message code="user.contacto.label" default="Contacto" />
		
	</label>
	<g:select id="contacto" name="contacto.id" from="${org.noe.eseiza.domains.Contacto.list()}" optionKey="id" value="${userInstance?.contacto?.id}" class="many-to-one" noSelection="['null': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'direccion', 'error')} ">
	<label for="direccion">
		<g:message code="user.direccion.label" default="Direccion" />
		
	</label>
	<g:select id="direccion" name="direccion.id" from="${org.noe.eseiza.domains.Direccion.list()}" optionKey="id" value="${userInstance?.direccion?.id}" class="many-to-one" noSelection="['null': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'nombre', 'error')} required">
	<label for="nombre">
		<g:message code="user.nombre.label" default="Nombre" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="nombre" required="" value="${userInstance?.nombre}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'accountExpired', 'error')} ">
	<label for="accountExpired">
		<g:message code="user.accountExpired.label" default="Account Expired" />
		
	</label>
	<g:checkBox name="accountExpired" value="${userInstance?.accountExpired}" />
</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'accountLocked', 'error')} ">
	<label for="accountLocked">
		<g:message code="user.accountLocked.label" default="Account Locked" />
		
	</label>
	<g:checkBox name="accountLocked" value="${userInstance?.accountLocked}" />
</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'companias', 'error')} ">
	<label for="companias">
		<g:message code="user.companias.label" default="Companias" />
		
	</label>
	<g:select name="companias" from="${org.noe.eseiza.domains.Compania.list()}" multiple="multiple" optionKey="id" size="5" value="${userInstance?.companias*.id}" class="many-to-many"/>
</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'enabled', 'error')} ">
	<label for="enabled">
		<g:message code="user.enabled.label" default="Enabled" />
		
	</label>
	<g:checkBox name="enabled" value="${userInstance?.enabled}" />
</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'escuelas', 'error')} ">
	<label for="escuelas">
		<g:message code="user.escuelas.label" default="Escuelas" />
		
	</label>
	<g:select name="escuelas" from="${org.noe.eseiza.domains.Escuela.list()}" multiple="multiple" optionKey="id" size="5" value="${userInstance?.escuelas*.id}" class="many-to-many"/>
</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'habilidades', 'error')} ">
	<label for="habilidades">
		<g:message code="user.habilidades.label" default="Habilidades" />
		
	</label>
	<g:select name="habilidades" from="${org.noe.eseiza.domains.Habilidad.list()}" multiple="multiple" optionKey="id" size="5" value="${userInstance?.habilidades*.id}" class="many-to-many"/>
</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'idiomas', 'error')} ">
	<label for="idiomas">
		<g:message code="user.idiomas.label" default="Idiomas" />
		
	</label>
	<g:select name="idiomas" from="${org.noe.eseiza.domains.Idioma.list()}" multiple="multiple" optionKey="id" size="5" value="${userInstance?.idiomas*.id}" class="many-to-many"/>
</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'nacionalidades', 'error')} ">
	<label for="nacionalidades">
		<g:message code="user.nacionalidades.label" default="Nacionalidades" />
		
	</label>
	<g:select name="nacionalidades" from="${org.noe.eseiza.domains.Nacionalidad.list()}" multiple="multiple" optionKey="id" size="5" value="${userInstance?.nacionalidades*.id}" class="many-to-many"/>
</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'passwordExpired', 'error')} ">
	<label for="passwordExpired">
		<g:message code="user.passwordExpired.label" default="Password Expired" />
		
	</label>
	<g:checkBox name="passwordExpired" value="${userInstance?.passwordExpired}" />
</div>

