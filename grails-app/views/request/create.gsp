<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="admin"/>
    <g:set var="entityName" value="${message(code: 'request.label', default: 'Request')}"/>
    <title><g:message code="default.create.label" args="[entityName]"/></title>
</head>

<body>
<div class="card white teal-text">
    <div class="row">
        <div class="col s6">
            <h5 class="left"><g:message code="default.list.label" args="[entityName]"/></h5>
        </div>

        <div class="col s6">
            <g:link class="right teal-text tooltipped nav-icon" data-position="bottom" data-delay="50"
                    data-tooltip="School List" action="index"><i class="small mdi mdi-view-list teal-text"></i></g:link>
        </div>
    </div>
</div>

<div id="create-request" class="content scaffold-create" role="main">

    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <g:hasErrors bean="${this.school}">
        <ul class="errors" role="alert">
            <g:eachError bean="${this.school}" var="error">
                <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message
                        error="${error}"/></li>
            </g:eachError>
        </ul>
    </g:hasErrors>
    <g:form action="save">
        <div class="card white">
            <f:all bean="request"/>
        </div>

        <div class="card center">
            <g:submitButton name="create" class="save"
                            value="${message(code: 'default.button.create.label', default: 'Create')}"/>
        </div>
    </g:form>
</div>
</body>
</html>
