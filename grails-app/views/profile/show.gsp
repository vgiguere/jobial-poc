
<%@ page import="com.jobial.domain.Profile" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'profile.label', default: 'Profile')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.show.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="dialog">
                <table>
                    <tbody>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="profile.religion.label" default="Religion" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: profileInstance, field: "religion")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="profile.sexualOrientation.label" default="Sexual Orientation" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: profileInstance, field: "sexualOrientation")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="profile.profession.label" default="Profession" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: profileInstance, field: "profession")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="profile.gender.label" default="Gender" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: profileInstance, field: "gender")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="profile.yearsExperience.label" default="Years Experience" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: profileInstance, field: "yearsExperience")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="profile.education.label" default="Education" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: profileInstance, field: "education")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="profile.seniority.label" default="Seniority" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: profileInstance, field: "seniority")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="profile.ethnicity.label" default="Ethnicity" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: profileInstance, field: "ethnicity")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="profile.city.label" default="City" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: profileInstance, field: "city")}</td>
                            
                        </tr>
                    
                    </tbody>
                </table>
            </div>
            <div class="buttons">
                <g:form>
                    <g:hiddenField name="id" value="${profileInstance?.id}" />
                    <span class="button"><g:actionSubmit class="edit" action="edit" value="${message(code: 'default.button.edit.label', default: 'Edit')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </g:form>
            </div>
        </div>
    </body>
</html>
