<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="admin"/>
    <g:set var="entityName" value="${message(code: 'school.label', default: 'School')}"/>
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
                    data-tooltip="School List" action="index"><i class="small mdi mdi-view-list teal-text"></i></g:link>
        </div>
    </div>
</div>

<g:if test="${flash.message}">
    <div class="message" role="status">${flash.message}</div>
</g:if>

<div id="create-school">
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


    <g:form action="save" class="col s12">
        <div class="card">
            <h5 class="center teal white-text vPadding-1">Submit Form</h5>
            <f:with bean="school">
                <div class="card row">
                    <div class="row">
                        <f:display property="name">
                            <div class="input-field col s6">
                                <input id="name" type="text" class="validate">
                                <label for="name">School Name</label>
                            </div>
                        </f:display>
                        <f:display property="type">
                            <div class="input-field col s6">
                                <g:select name="type"
                                          noSelection="['': 'Choose School Type']"
                                          from="${['University', 'Polytechnic', 'Monotechnic', 'College']}"/>
                                <label>Institution Type</label>
                            </div>
                        </f:display>
                    </div>

                    <div class="row">
                        <f:display property="yearFounded">
                            <div class="input-field col s6">
                                <input id="yearFounded" type="text" class="validate">
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
                                <input id="noOfApplication" type="number" class="validate">
                                <label for="noOfApplication">No Of Application</label>
                            </div>
                        </f:display>
                        <f:display property="website">
                            <div class="input-field col s6">
                                <input id="website" name="website" value="${school.website}" type="text"
                                       class="validate">
                                <label for="website">School Website</label>
                            </div>
                        </f:display>

                    </div>

                    <div class="row">
                        <f:display property="email">
                            <div class="input-field col s6">
                                <input id="email" type="email" name="email" class="validate">
                                <label for="email">School Email</label>
                            </div>
                        </f:display>
                        <f:display property="phoneNumber">
                            <div class="input-field col s6">
                                <input id="phoneNumber" name="phoneNumber" type="text" class="validate">
                                <label for="phoneNumber">Contact Number</label>
                            </div>
                        </f:display>

                    </div>

                    <div class="row">
                        <f:display property="address">
                            <div class="input-field col s6">
                                <input id="address" name="address" type="text" class="validate">
                                <label for="address">School Address</label>
                            </div>
                        </f:display>
                        <f:display property="owner">
                            <div class="input-field col s6">
                                <g:select name="owner"
                                          noSelection="['': 'Ownened By']"
                                          from="${["federal School", "State School", "Private School"]}"/>
                                <label>Owned by</label>
                            </div>
                        </f:display>
                    </div>
                </div>
            </f:with>
        </div>

        <div class="row center-align">
            <g:submitButton name="create" class="btn teal text-white"
                            value="${message(code: 'default.button.create.label', default: 'Create')}"/>
        </div>

    </g:form>
</div>

</body>
</html>
