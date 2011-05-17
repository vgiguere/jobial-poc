
<%@ page import="com.jobial.domain.Profile" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'profile.label', default: 'Profile')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.list.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        


                            <g:sortableColumn property="email" title="${message(code: 'profile.email.label', default: 'Email')}" />
                            <g:sortableColumn property="religion" title="${message(code: 'profile.religion.label', default: 'Religion')}" />
                            <g:sortableColumn property="city" title="${message(code: 'profile.city.label', default: 'City')}" />
                            <g:sortableColumn property="ethnicity" title="${message(code: 'profile.city.label', default: 'Ethnicity')}" />

                            <g:sortableColumn property="sexualOrientation" title="${message(code: 'profile.sexualOrientation.label', default: 'Sexual Orientation')}" />
                        
                            <g:sortableColumn property="profession" title="${message(code: 'profile.profession.label', default: 'Profession')}" />
                            <g:sortableColumn property="seniority" title="${message(code: 'profile.profession.label', default: 'Seniority')}" />

                            <g:sortableColumn property="gender" title="${message(code: 'profile.gender.label', default: 'Gender')}" />
                        
                            <g:sortableColumn property="yearsExperience" title="${message(code: 'profile.yearsExperience.label', default: 'Years Experience')}" />
                        
                            <g:sortableColumn property="education" title="${message(code: 'profile.education.label', default: 'Education')}" />
                            <g:sortableColumn property="salary" title="${message(code: 'profile.salary.label', default: 'Salary')}" />


                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${profileInstanceList}" status="i" var="profileInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${profileInstance.email}">${fieldValue(bean: profileInstance, field: "email")}</g:link></td>
                        
                            <td>${fieldValue(bean: profileInstance, field: "religion")}</td>
                            <td>${fieldValue(bean: profileInstance, field: "city")}</td>
                            <td>${fieldValue(bean: profileInstance, field: "ethnicity")}</td>
                            <td>${fieldValue(bean: profileInstance, field: "sexualOrientation")}</td>

                            <td>${fieldValue(bean: profileInstance, field: "profession")}</td>
                            <td>${fieldValue(bean: profileInstance, field: "seniority")}</td>

                            <td>${fieldValue(bean: profileInstance, field: "gender")}</td>
                        
                            <td>${fieldValue(bean: profileInstance, field: "yearsExperience")}</td>
                        
                            <td>${fieldValue(bean: profileInstance, field: "education")}</td>
                            <td>${fieldValue(bean: profileInstance, field: "salary")}</td>

                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${profileInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
