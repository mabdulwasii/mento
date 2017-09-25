<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="admin"/>
    <g:set var="entityName" value="${message(code: 'school.label', default: 'School')}"/>
    <title><g:message code="default.edit.label" args="[entityName]"/></title>
</head>

<body>
<div class="card white teal-text">
    <div class="row">
        <div class="col s6">
            <h5 class="left"><g:message code="default.list.label" args="[entityName]"/></h5>
        </div>

        <div class="col s6">
            <g:link class="right teal-text tooltipped nav-icon " data-position="bottom" data-delay="50"
                    data-tooltip="New Faculty" action="create"><i class="mdi mdi-plus teal-text small"></i></g:link>
        </div>
    </div>
</div>

<div id="edit-school" class="content scaffold-edit" role="main">

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

    <g:form resource="${this.school}" method="PUT">
        <div class="card">
            <h5 class="center teal white-text vPadding-1">Submit Form</h5>
            <g:hiddenField name="version" value="${this.school?.version}"/>
            <f:with bean="school">
                <div class="card row">
                    <div class="row">
                        <f:field property="name">
                            <div class="input-field col s6">
                                <input id="name" type="text" class="validate">
                                <label for="name">School Name</label>
                            </div>
                        </f:field>
                        <f:field property="type">
                            <div class="input-field col s6">
                                <g:select name="type"
                                          noSelection="['': 'Choose School Type']"
                                          from="${['University', 'Polytechnic', 'Monotechnic', 'College']}"/>
                                <label>Institution Type</label>
                            </div>
                        </f:field>
                    </div>

                    <div class="row">
                        <f:field property="yearFounded">
                            <div class="input-field col s6">
                                <input id="yearFounded" type="text" class="validate">
                                <label for="yearFounded">Year Founded</label>
                            </div>
                        </f:field>
                        <f:field property="noOfStudent">
                            <div class="input-field col s6">
                                <input id="noOfStudent" type="number" class="validate" min="1">
                                <label for="noOfStudent">Average Number Of Student</label>
                            </div>
                        </f:field>

                    </div>

                    <div class="row">
                        <f:field property="noOfApplication">
                            <div class="input-field col s6">
                                <input id="noOfApplication" type="number" class="validate">
                                <label for="noOfApplication">No Of Application</label>
                            </div>
                        </f:field>
                        <f:field property="website">
                            <div class="input-field col s6">
                                <input id="website" type="text" class="validate">
                                <label for="website">School Website</label>
                            </div>
                        </f:field>

                    </div>

                    <div class="row">
                        <f:field property="email">
                            <div class="input-field col s6">
                                <input id="email" type="email" class="validate">
                                <label for="email">School Email</label>
                            </div>
                        </f:field>
                        <f:field property="phoneNumber">
                            <div class="input-field col s6">
                                <input id="phoneNumber" type="text" class="validate">
                                <label for="phoneNumber">Contact Number</label>
                            </div>
                        </f:field>

                    </div>

                    <div class="row">
                        <f:field property="address">
                            <div class="input-field col s6">
                                <input id="address" type="text" class="validate">
                                <label for="address">School Address</label>
                            </div>
                        </f:field>
                    </div>
                </div>
            </f:with>
        </div>

        <div class="card">
            <input class="save" type="submit"
                   value="${message(code: 'default.button.update.label', default: 'Update')}"/>
        </div>

    </g:form>
</div>
</body>
</html>
