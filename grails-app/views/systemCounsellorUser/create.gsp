<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="admin"/>
    <g:set var="entityName" value="${message(code: 'systemCounsellorUser.label', default: 'SystemCounsellorUser')}"/>
    <title><g:message code="default.create.label" args="[entityName]"/></title>
</head>

<body>
<div class="card white teal-text">
    <div class="row">
        <div class="col s6">
            <h5 class="left"><g:message code="default.create.label" args="[entityName]"/></h5>
        </div>

        <div class="col s6">
            <g:link class="right teal-text tooltipped nav-icon" data-position="bottom" data-delay="50"
                    data-tooltip="systemCounsellorUser List" action="index"><i
                    class="small mdi mdi-view-list teal-text"></i></g:link>
        </div>
    </div>
</div>

<g:if test="${flash.message}">
    <div class="message" role="status">${flash.message}</div>
</g:if>


<div id="create-systemCounsellorUser">
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <g:hasErrors bean="${this.systemCounsellorUser}">
        <ul class="errors" role="alert">
            <g:eachError bean="${this.systemCounsellorUser}" var="error">
                <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message
                        error="${error}"/></li>
            </g:eachError>
        </ul>
    </g:hasErrors>


    <g:form action="save" class="col s12">
        <div class="card">
            <h5 class="center teal white-text vPadding-1">Create Form</h5>
            <f:all bean="systemCounsellorUser"/>
        </div>

        <div class="row center-align">
            <g:submitButton name="create" class="btn teal text-white"
                            value="${message(code: 'default.button.create.label', default: 'Create')}"/>
        </div>

    </g:form>
</div>
</body>
</html>
