<%@ page import="com.jobial.domain.profile.City; com.jobial.domain.profile.Ethnicity; com.jobial.domain.profile.Seniority; com.jobial.domain.profile.Education; com.jobial.domain.profile.Gender; com.jobial.domain.profile.OnetCode; com.jobial.domain.profile.SexualOrientation; com.jobial.domain.profile.Religion; com.jobial.domain.Profile" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="main"/>
    <g:set var="entityName" value="${message(code: 'profile.label', default: 'Profile')}"/>
    <title><g:message code="default.edit.label" args="[entityName]"/></title>
</head>
<body>
<div class="nav">
    <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
    <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]"/></g:link></span>
    <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]"/></g:link></span>
</div>
<div class="body">
    <h1>Search Matching Profiles</h1>


    <g:if test="${message}">
        <h2>${message}</h2>
    </g:if>


    <g:if test="${flash.message}">
        <div class="message">${flash.message}</div>
    </g:if>
    <g:hasErrors bean="${profileInstance}">
        <div class="errors">
            <g:renderErrors bean="${profileInstance}" as="list"/>
        </div>
    </g:hasErrors>
    <g:form method="post" action="doSearch">
        <g:hiddenField name="id" value="${profileInstance?.email}"/>
        <g:hiddenField name="version" value="${profileInstance?.version}"/>
        <div class="dialog">
            <table>
                <tbody>

                <tr class="prop">
                    <td valign="top" class="name">
                        <label for="religion"><g:message code="profile.religion.label" default="Religion"/></label>
                    </td>
                    <td valign="top" class="value ${hasErrors(bean: profileInstance, field: 'religion', 'errors')}">
                        <g:select name="religion" id="www" from="${Religion.values()}" noSelection="${['':'Select a religion...']}" value="${selection?.religion}"/>
                    </td>
                </tr>

                <tr class="prop">
                    <td valign="top" class="name">
                        <label for="sexualOrientation"><g:message code="profile.sexualOrientation.label" default="Sexual Orientation"/></label>
                    </td>
                    <td valign="top" class="value ${hasErrors(bean: profileInstance, field: 'sexualOrientation', 'errors')}">
                        <g:select name="sexualOrientation" id="yyy" from="${SexualOrientation.values()}" noSelection="${['':'Select a sexual orientation...']}" value="${selection?.sexualOrientation}"/>
                    </td>
                </tr>

                <tr class="prop">
                    <td valign="top" class="name">
                        <label for="profession"><g:message code="profile.profession.label" default="Profession"/></label>
                    </td>
                    <td valign="top" class="value ${hasErrors(bean: profileInstance, field: 'profession', 'errors')}">
                        <g:select name="profession" id="zzz" from="${OnetCode.values()}" noSelection="${['':'Select a profession...']}" value="${selection?.profession}"/>
                    </td>
                </tr>

                <tr class="prop">
                    <td valign="top" class="name">
                        <label for="gender"><g:message code="profile.gender.label" default="Gender"/></label>
                    </td>
                    <td valign="top" class="value ${hasErrors(bean: profileInstance, field: 'gender', 'errors')}">
                       <g:select name="gender" id="zzz" from="${Gender.values()}" noSelection="${['':'Select a gender...']}" value="${selection?.gender}"/>
                    </td>
                </tr>


                <tr class="prop">
                    <td valign="top" class="name">
                        <label for="education"><g:message code="profile.education.label" default="Education"/></label>
                    </td>
                    <td valign="top" class="value ${hasErrors(bean: profileInstance, field: 'education', 'errors')}">
                       <g:select name="education" id="zzz" from="${Education.values()}" noSelection="${['':'Select an education level...']}" value="${selection?.education}"/>
                    </td>
                </tr>

                <tr class="prop">
                    <td valign="top" class="name">
                        <label for="seniority"><g:message code="profile.seniority.label" default="Seniority"/></label>
                    </td>
                    <td valign="top" class="seniority ${hasErrors(bean: profileInstance, field: 'seniority', 'errors')}">
                       <g:select name="seniority" id="zzz" from="${Seniority.values()}" noSelection="${['':'Select an seniority  level...']}" value="${selection?.seniority}"/>
                    </td>
                </tr>

                <tr class="prop">
                    <td valign="top" class="name">
                        <label for="ethnicity"><g:message code="profile.ethnicity.label" default="Ethnicity"/></label>
                    </td>
                    <td valign="top" class="value ${hasErrors(bean: profileInstance, field: 'ethnicity', 'errors')}">
                        <g:select name="ethnicity" id="zzz" from="${Ethnicity.values()}" noSelection="${['':'Select an ethnicity...']}" value="${selection?.ethnicity}"/>
                    </td>
                </tr>

                <tr class="prop">
                    <td valign="top" class="name">
                        <label for="city"><g:message code="profile.city.label" default="City"/></label>
                    </td>
                    <td valign="top" class="value ${hasErrors(bean: profileInstance, field: 'city', 'errors')}">
                        <g:select name="city" id="zzz" from="${City.values()}" noSelection="${['':'Select a city...']}" value="${selection?.city}"/>
                    </td>
                </tr>

                </tbody>
            </table>
        </div>
        <div class="buttons">
            <span class="button"><g:actionSubmit class="save" action="doSearch" value="${message(code: 'default.button.updadsdsdte.label', default: 'Search Members with Matching Profiles')}"/></span>

        </div>
    </g:form>
</div>
</body>
</html>
