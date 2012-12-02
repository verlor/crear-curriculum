
<%@ page import="org.noe.eseiza.domains.RedSocial" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'redSocial.label', default: 'RedSocial')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-redSocial" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-redSocial" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="redSocial" title="${message(code: 'redSocial.redSocial.label', default: 'Red Social')}" />
					
						<g:sortableColumn property="perfilUrl" title="${message(code: 'redSocial.perfilUrl.label', default: 'Perfil Url')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${redSocialInstanceList}" status="i" var="redSocialInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${redSocialInstance.id}">${fieldValue(bean: redSocialInstance, field: "redSocial")}</g:link></td>
					
						<td>${fieldValue(bean: redSocialInstance, field: "perfilUrl")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${redSocialInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
