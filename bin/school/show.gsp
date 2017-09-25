<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="admin"/>
    <g:set var="entityName" value="${message(code: 'school.label', default: 'School')}"/>
    <title><g:message code="default.show.label" args="[entityName]"/></title>
</head>

<body>
<div class="card white teal-text">
    <div class="row">
        <div class="col s6">
            <h5 class="left"><g:message code="default.create.label" args="[entityName]"/></h5>
        </div>

        <div class="col s6">
            <g:link class="right indigo-text tooltipped nav-icon" data-position="bottom" data-delay="50"
                    data-tooltip="Lecturer List" action="index"><i class="mdi mdi-view-list indigo-text"></i></g:link>
            <g:link class="right indigo-text tooltipped nav-icon" data-position="bottom" data-delay="50"
                    data-tooltip="New Lecturer" action="create"><i class="mdi mdi-plus indigo-text"></i></g:link>
        </div>
    </div>
</div>

<g:if test="${flash.message}">
    <div class="message" role="status">${flash.message}</div>
</g:if>

<div id="show-school" class="content scaffold-show" role="main">
    <h1><g:message code="default.show.label" args="[entityName]"/></h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <div class="card">
        <f:with bean="school">
            <div class="row">
                <div class="col s6">
                    <f:display property="name"/>
                </div>

                <div class="col s6">
                    <f:display property="type"/>
                </div>
            </div>

            <div class="row">
                <div class="col s6">
                    <f:display property="yearFounded"/>
                </div>

                <div class="col s6">
                    <f:display property="website"/>
                </div>
            </div>

            <div class="row">
                <div class="col s4">
                    <f:display property="email"/>
                </div>

                <div class="col s4">
                    <f:display property="phoneNumber"/>
                </div>

                <div class="col s4">
                    <f:display property="address"/>
                </div>
            </div>

            <div class="row">
                <div class="col s6">
                    <f:display property="noOfStudent"/>
                </div>

                <div class="col s6">
                    <f:display property="noOfApplication"/>
                </div>
            </div>
        </f:with>
    </div>
    <g:form resource="${this.school}" method="DELETE">
        <div class="card">
            <g:link class="edit" action="edit" resource="${this.school}"><g:message code="default.button.edit.label"
                                                                                    default="Edit"/></g:link>
            <input class="delete" type="submit"
                   value="${message(code: 'default.button.delete.label', default: 'Delete')}"
                   onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');"/>
        </div>
    </g:form>
</div>
</body>
</html>
