<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="admin"/>
    <g:set var="entityName" value="${message(code: 'systemStudentUser.label', default: 'SystemStudentUser')}"/>
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
                    data-tooltip="systemStudentUser List" action="index"><i
                    class="small mdi mdi-view-list teal-text"></i></g:link>
        </div>
    </div>
</div>

<g:if test="${flash.message}">
    <div class="message" role="status">${flash.message}</div>
</g:if>

<div id="create-systemStudentUser">
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <g:hasErrors bean="${this.systemStudentUser}">
        <ul class="errors" role="alert">
            <g:eachError bean="${this.systemStudentUser}" var="error">
                <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message
                        error="${error}"/></li>
            </g:eachError>
        </ul>
    </g:hasErrors>


    <g:form action="save" class="col s12">
        <h5 class="center teal white-text vPadding-1">Create Form</h5>

        <div class="" style="padding: 0 3em 3em 1em ;">
            <div class="row">
                <div class="col s6 vPadding-1">
                    <div class="input-field card vPadding-1 hoverable">
                        <input id="username" type="text" class="validate">
                        <label for="username">Username</label>
                    </div>
                </div>

                <div class="col s6 vPadding-1">
                    <div class="input-field card vPadding-1 hoverable">
                        <g:select name="gender"
                                  from="${['Mrs', 'Mrs', 'Dr', 'Dr Mrs', 'Prof']}"
                                  noSelection="${['null': 'Select Your Title...']}"/>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col s6 vPadding-1">
                    <div class="input-field card vPadding-1 hoverable">
                        <input id="firstName" name="firstName" type="text" class="validate">
                        <label for="firstName">first Name</label>
                    </div>
                </div>

                <div class="col s6 vPadding-1">
                    <div class="input-field card vPadding-1 hoverable">
                        <input id="middleName" name="middleName" type="text" class="validate">
                        <label for="middleName">Middle Name</label>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col s6 vPadding-1">
                    <div class="input-field card vPadding-1 hoverable">
                        <input id="lastName" name="lastName" type="text" class="validate">
                        <label for="lastName">Last Name</label>
                    </div>
                </div>

                <div class="col s6 vPadding-1">
                    <div class="input-field card vPadding-1 hoverable">
                        <input id="email" name="email" type="email" class="validate">
                        <label for="email">Email Address</label>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col s6 vPadding-1">
                    <div class="input-field card vPadding-1 hoverable">
                        <input id="birthDate" name="birthDate" type="date" class=" datepicker">
                        <label for="birthDate">Birth date</label>
                    </div>
                </div>

                <div class="col s6 vPadding-1">
                    <div class="input-field card vPadding-1 hoverable">
                        <g:select name="gender"
                                  from="${['Male', 'Female']}"
                                  noSelection="${['null': 'Select Your Gender...']}"/>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col s6 vPadding-1">
                    <div class="col s12 vPadding-1">
                        <div class="input-field card vPadding-1 hoverable">
                            <input id="phone" name="phone" type="text">
                            <label for="phone">Phone Number</label>
                        </div>
                    </div>
                </div>

                <div class="col s6 vPadding-1">
                    <div class="input-field card vPadding-1 hoverable">
                        <g:select name="martialStatus" id="martialStatus"
                                  from="${['Single', 'Married']}"
                                  noSelection="${['null': 'Select Marital Status...']}"/>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col s6 vPadding-1">
                    <div class="input-field card vPadding-1 hoverable">
                        <input id="primarySchool" name="primarySchool" type="text">
                        <label for="primarySchool">Primary School Attended</label>
                    </div>
                </div>

                <div class="col s6 vPadding-1">
                    <div class="input-field card vPadding-1 hoverable">
                        <input id="secondarySchool" name="secondarySchool" type="text">
                        <label for="secondarySchool">Secondary School Attended</label>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col s6 vPadding-1">
                    <div class="input-field card vPadding-1 hoverable">
                        <input id="address" name="address" type="text">
                        <label for="address">Address</label>
                    </div>
                </div>

                <div class="col s6 vPadding-1">
                    <div class="input-field card vPadding-1 hoverable">
                        <input id="prospectSchool" name="prospectSchool" type="text">
                        <label for="prospectSchool">Prospective School</label>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col s6 vPadding-1">
                    <div class="input-field card vPadding-1 hoverable">
                        <g:select name="ambition" id="ambition"
                                  from="${com.mento.utility.CareerJob.list()}"
                                  noSelection="${['null': 'Select Future Ambition...']}"
                                  optionValue="name"
                                  optionKey="id"/>
                    </div>
                </div>

                <div class="col s6 vPadding-1">
                    <div class="input-field card vPadding-1 hoverable">
                        <g:select name="hobbies" id="hobbies"
                                  from="${com.mento.utility.Interest.list()}"
                                  noSelection="${['null': 'Select Your Hobbies...']}"
                                  optionValue="name"
                                  multiple="true"
                                  optionKey="id"/>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col s6 vPadding-1">
                    <div class="input-field card vPadding-1 hoverable">
                        <textarea id="bio" class="materialize-textarea" name="bio"></textarea>
                        <label for="bio">Bio</label>
                    </div>
                </div>

                <div class="col s6 vPadding-1">
                    <div class="file-field input-field">
                        <div class="btn">
                            <span>File</span>
                            <g:uploadForm name="photo"/>
                            %{--<input type="file" id="photo" name="photo">--}%
                        </div>

                        <div class="file-path-wrapper">
                            <input class="file-path validate" type="text">
                        </div>
                    </div>
                </div>
            </div>
        </div>
    %{--<f:all bean="systemStudentUser"/>--}%
        <div class="row center-align">
            <g:submitButton name="create" class="btn teal text-white"
                            value="${message(code: 'default.button.create.label', default: 'Create')}"/>
        </div>

    </g:form>
</div>
</body>
</html>
