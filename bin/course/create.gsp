<%@ page import="com.mento.school.Course" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="admin"/>
    <g:set var="entityName" value="${message(code: 'course.label', default: 'Course')}"/>
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
                    data-tooltip="course List" action="index"><i class="small mdi mdi-view-list teal-text"></i></g:link>
        </div>
    </div>
</div>

<div id="create-course" class="content scaffold-create" role="main">

    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <g:hasErrors bean="${this.course}">
        <ul class="errors" role="alert">
            <g:eachError bean="${this.course}" var="error">
                <li <g:if test="${error in org.springframework.validation.FieldError}">data-display-id="${error.display}"</g:if>><g:message
                        error="${error}"/></li>
            </g:eachError>
        </ul>
    </g:hasErrors>

    <g:form action="save" class="col s12">

        <h5 class="center teal white-text vPadding-1 card">Create Form</h5>

        <f:with bean="course">
            <div class="card row">
                <div class="row">
                    <f:display property="name">
                        <div class="input-field col s6">
                            <input id="courseName" type="text" class="validate">
                            <label for="courseName">Course Name</label>
                        </div>
                    </f:display>
                    <f:display property="jambScore">
                        <div class="input-field col s6">
                            <input id="jambScore" type="number" class="validate">
                            <label for="jambScore">Jamb Score</label>
                        </div>
                    </f:display>
                </div>

                <div class="row">
                    <f:display property="maxNumberOfStudent">
                        <div class="input-field col s6">
                            <input id="maxNumberOfStudent" type="number" class="validate" min="1">
                            <label for="maxNumberOfStudent">Number Of Student usually Admitted</label>
                        </div>
                    </f:display>
                    <f:display property="jambSubjects">
                        <div class="input-field col s6 ">
                            <g:select name="jambSubjects"
                                      from="${com.mento.utility.Subject.list()}"
                                      multiple="true"
                                      optionKey="id"
                                      optionValue="name"/>
                            <label>Select 3 Jamb Subjects Subjects</label>
                        </div>
                    </f:display>
                </div>

                <div class="row">
                    <f:display property="olevelSubjects">
                        <div class="input-field col s6">
                            <g:select name="olevelSubjects"
                                      from="${com.mento.utility.Subject.list()}"
                                      multiple="true"
                                      optionKey="id"
                                      optionValue="name"/>
                            <label>Select 3 O level Department</label>
                        </div>
                    </f:display>
                    <f:display property="schools">
                        <div class="input-field col s6">
                            <g:select name="schools"
                                      from="${com.mento.school.School.list()}"
                                      multiple="true"
                                      optionValue="name"
                                      optionKey="id"/>
                            <label>Select Schools Offering the Course</label>
                        </div>
                    </f:display>
                </div>

                <div class="row">
                    <f:display property="interests">
                        <div class="input-field col s6">
                            <g:select name="interests"
                                      from="${com.mento.utility.Interest.list()}"
                                      multiple="true"
                                      optionValue="name"
                                      optionKey="id"/>
                            <label>Select Course Characteristics</label>
                        </div>
                    </f:display>
                    <f:display property="careerJobs">
                        <div class="input-field col s6">
                            <g:select name="interests"
                                      from="${com.mento.utility.CareerJob.list()}"
                                      multiple="true"
                                      optionValue="name"
                                      optionKey="id"/>
                            <label>Select Course Career Jobs</label>
                        </div>
                    </f:display>
                </div>

                <div class="row">
                    <f:display property="interests">
                        <div class="input-field col s6">
                            <g:select name="interests"
                                      from="${com.mento.utility.Interest.list()}"
                                      multiple="true"
                                      optionValue="name"
                                      optionKey="id"/>
                            <label>Select Course Characteristics</label>
                        </div>
                    </f:display>
                    <f:display property="careerJobs">
                        <div class="input-field col s6">
                            <g:select name="interests"
                                      from="${com.mento.utility.CareerJob.list()}"
                                      multiple="true"
                                      optionValue="name"
                                      optionKey="id"/>
                            <label>Select Course Career Jobs</label>
                        </div>
                    </f:display>
                </div>

                <div class="row">
                    <f:display property="industries">
                        <div class="input-field col s6">
                            <g:select name="industries"
                                      from="${com.mento.utility.Industry.list()}"
                                      multiple="true"
                                      optionValue="name"
                                      optionKey="id"/>
                            <label>Select Course Industries</label>
                        </div>
                    </f:display>
                </div>

                <div class="row">
                    <p class="teal-text">Course Description</p>
                    <f:display property="description">
                        <ckeditor:editor id="description" name="description" height="150px" width="100%"
                                         toolbar="Basic">
                            ${initialValue}
                        </ckeditor:editor>
                    </f:display>
                </div>
            </div>
        </f:with>
        <div class="row center-align">
            <br/>
            <g:submitButton name="create" class="btn teal text-white"
                            value="${message(code: 'default.button.create.label', default: 'Create')}"/>
        </div>

    </g:form>

</div>
</body>
</html>