<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="admin"/>
    <g:set var="entityName" value="${message(code: 'request.label', default: 'Request')}"/>
    <title><g:message code="default.edit.label" args="[entityName]"/></title>
</head>

<body>
<div class="card white teal-text">
    <div class="row">
        <div class="col s6">
            <h5 class="left"><g:message code="default.edit.label" args="[entityName]"/></h5>
        </div>

        <div class="col s6">
            <g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]"/></g:link>
            <g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]"/></g:link>
        </div>
    </div>
</div>

<g:if test="${flash.message}">
    <div class="message" role="status">${flash.message}</div>
</g:if>
<div id="edit-request" class="card">
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <g:hasErrors bean="${this.request}">
        <ul class="errors" role="alert">
            <g:eachError bean="${this.request}" var="error">
                <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message
                        error="${error}"/></li>
            </g:eachError>
        </ul>
    </g:hasErrors>
    <g:form resource="${this.request}" method="PUT">
        <div class="card">
            <h5 class="center teal white-text vPadding-1">Submit Form</h5>
            <g:hiddenField name="version" value="${this.request?.version}"/>
            <f:with bean="school">
                <div class="card row">
                    <div class="row">
                        <f:display property="name">
                            <div class="input-field col s6">
                                <input id="name" type="text" class="validate">
                                <label for="name">Institution Name</label>
                            </div>
                        </f:display>
                        <f:display property="type">
                            <div class="input-field col s6">
                                <g:select name="type"
                                          noSelection="['': 'Choose School Type']"
                                          from="${['University', 'Polytechnic', 'College']}"/>
                                <label>Institution Type</label>
                            </div>
                        </f:display>
                    </div>

                    <div class="row">
                        <f:display property="yearFounded">
                            <div class="input-field col s6">
                                <input id="yearFounded" type="number" class="validate" min="1">
                                <label for="yearFounded">Year Founded</label>
                            </div>
                        </f:display>
                        <f:display property="noOfStudent">
                            <div class="input-field col s6">
                                <input id="noOfStudent" type="number" class="validate" min="1">
                                <label for="noOfStudent">Average Number Of Student</label>
                            </div>
                        </f:display>

                    </div>

                    <div class="row">
                        <f:display property="noOfApplication">
                            <div class="input-field col s6">
                                <input id="noOfApplication" type="text" class="validate">
                                <label for="noOfApplication">No Of Application</label>
                            </div>
                        </f:display>

                        <f:display property="faculties">
                            <div class="input-field col s6">
                                <g:select name="faculties"
                                          noSelection="['': 'Select Faculties']"
                                          from="${com.mento.school.Faculty.list()}"
                                          multiple="true"
                                          optionKey="id"/>
                                <label>Select Faculties</label>
                            </div>
                        </f:display>
                    </div>

                    <div class="row">
                        <f:display property="admin">
                            <div class="input-field col s6">
                                <g:select name="admin"
                                          noSelection="['': 'Choose academy Admin']"
                                          from="${com.mento.utility.user.SystemAcademyOfficerUser.list()}"
                                          optionValue="${firstname}${lastname}"
                                          optionKey="id"/>
                                <label>Select Academy Admin</label>
                            </div>
                        </f:display>
                    %{--<f:display property="description">
                    <ckeditor:editor id="description" name="description" height="400px" width="80%"  toolbar="Basic">
                        ${initialValue}
                    </ckeditor:editor>
                    </f:display>--}%
                    </div>
                </div>
            </f:with>
        </div>

        <div class="class">
            <input class="save" type="submit"
                   value="${message(code: 'default.button.update.label', default: 'Update')}"/>
        </div>
    </g:form>
</div>
</body>
</html>
