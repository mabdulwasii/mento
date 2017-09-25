<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="admin"/>
    <g:set var="entityName" value="${message(code: 'course.label', default: 'Course')}"/>
    <title><g:message code="default.show.label" args="[entityName]"/></title>
</head>

<body>
<div class="card white teal-text">
    <div class="row">
        <div class="col s6">
            <h5 class="left"><g:message code="default.show.label" args="[entityName]"/></h5>
        </div>

        <div class="col s6">
            <g:link class="right teal-text tooltipped nav-icon " data-position="bottom" data-delay="50"
                    data-tooltip="New Faculty" action="create"><i class="mdi mdi-plus teal-text small"></i></g:link>
        </div>
    </div>
</div>

<div id="show-course" class="content scaffold-show" role="main">

    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <f:with bean="course">
        <section class="lighten-3">
            <div class="parallax-container">
                <div class="parallax imageOverlay">
                    <asset:image src="image/Tech.jpg"/>
                </div>
            </div>

            <h1 class="white-text left-align department"><span class="fa fa-book"></span>${course.name}</h1>

            <div class="grey">
                <div class="row">
                    <div class="col s6">
                        <div class="row">
                            <div class="col s12s">
                                <div class="card white hoverable ">
                                    <div class="card-content grey-text text-darken-3 lighten-2">
                                        <span class="card-title center">Description</span>

                                        <p>${course.description}</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="col s6">
                        <div class="col s12">
                            <div class="row">
                                <div class="col s12 ">
                                    <div class="card white hoverable">
                                        <div class="card-content grey-text text-darken-3 lighten-2">
                                            <span class="card-title center">Jamb Details</span>
                                            <br/>

                                            <div class="row">
                                                <p class=" grey-text text-darken-3">Jamb Cut Off Score: ${course.jambScore}</p>
                                                <br/>

                                                <div class="collection white  row">
                                                    <div class="col s12 m12">
                                                        <g:each in="${course.jambSubjects}" var="j">
                                                            <span class="collection-item white  grey-text text-darken-3 lighten-2 left">${j.name}</span>
                                                        </g:each>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>

                <div class=" row">
                    <div class="col s6">
                        <div class="col s12">
                            <div class="row">
                                <div class="col s12 ">
                                    <div class="card white hoverable">
                                        <div class="card-content grey-text text-darken-3 lighten-2">
                                            <span class="card-title center">O' Level Details</span>
                                            <br/>

                                            <div class="row">
                                                <div class="collection white  row">
                                                    <div class="col s12 m12">
                                                        <g:each in="${course.olevelSubjects}" var="j">
                                                            <span class="collection-item white  grey-text text-darken-3 lighten-2 left">${j.name}</span>
                                                        </g:each>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>

                    <div class="col s6">
                        <div class="col s12">
                            <div class="row">
                                <div class="col s12 ">
                                    <div class="card white hoverable">
                                        <div class="card-content grey-text text-darken-3 lighten-2">
                                            <span class="card-title center">Required Skills/ Characteristics</span>
                                            <br/>
                                            <br/>

                                            <div class="row">
                                                <div class="collection white  row">
                                                    <div class="col s12 m12">
                                                        <g:each in="${course.interests}" var="j">
                                                            <span class="collection-item white  grey-text text-darken-3 lighten-2 left">${j.name}</span>
                                                        </g:each>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>

                <div class=" row">
                    <div class="col s6">
                        <div class="col s12">
                            <div class="row">
                                <div class="col s12 ">
                                    <div class="card white hoverable">
                                        <div class="card-content grey-text text-darken-3 lighten-2">
                                            <span class="card-title center">Industries</span>
                                            <br/>

                                            <div class="row">
                                                <div class="collection white  row">
                                                    <div class="col s12 m12">
                                                        <g:each in="${course.industries}" var="j">
                                                            <span class="collection-item white  grey-text text-darken-3 lighten-2 left">${j.name}</span>
                                                        </g:each>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>

                    <div class="col s6">
                        <div class="col s12">
                            <div class="row">
                                <div class="col s12 ">
                                    <div class="card white hoverable">
                                        <div class="card-content grey-text text-darken-3 lighten-2">
                                            <span class="card-title center">Career Jobs</span>
                                            <br/>

                                            <div class="row">
                                                <div class="collection white  row">
                                                    <div class="col s12 m12">
                                                        <g:each in="${course.careerJobs}" var="j">
                                                            <span class="collection-item white  grey-text text-darken-3 lighten-2 left">${j.name}</span>
                                                        </g:each>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col s12 ">
                        <div class="card white">
                            <div class="card-content grey-text text-darken-3 lighten-2">
                                <span class="card-title center">Schools</span>

                                <p>Schools Offering the Course</p>

                                <div class="row">
                                    <div class="collection white  row">
                                        <div class="col s12 m12">
                                            <g:each in="${course.jambSubjects}" var="j">
                                                <span class="collection-item white  grey-text text-darken-3 lighten-2 left">${j.name}</span>
                                            </g:each>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>

        </section>
    </f:with>
    <div class="grey">
        <g:form resource="${this.course}" method="DELETE">
            <div class="card center vPadding-1">
                <g:link class="btn teal white-text" action="edit" resource="${this.course}"><g:message
                        code="default.button.edit.label" default="Edit"/></g:link>
                <input class="btn teal white-text" type="submit"
                       value="${message(code: 'default.button.delete.label', default: 'Delete')}"
                       onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');"/>
            </div>
        </g:form>
    </div>

</body>
</html>
