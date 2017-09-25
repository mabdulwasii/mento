<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="admin"/>
    <g:set var="entityName" value="${message(code: 'course.label', default: 'Course')}"/>
    <title><g:message code="default.list.label" args="[entityName]"/></title>
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

<g:if test="${flash.message}">
    <div class="message" role="status">${flash.message}</div>
</g:if>
%{--<f:table collection="${departmentList}" />--}%

<div class="card">

    <table border="2" class="striped centered responsive-table">
        <div class="row teal lighten-1 vPadding-1">

        </div>
        <thead>
        <tr>
            <th>S/N</th>
            <g:sortableColumn property="name" title="Name"/>
            <g:sortableColumn property="jambScore" title="Jamb Score"/>
            <th>Jamb Subject</th>
            <th>Industry</th>
            <th><span class="mdi mdi-view-agenda small teal-text"></span></th>
            <th><span class="mdi mdi-table-edit small teal-text"></span></th>
        </tr>
        </thead>

        <tbody>
        <g:each var="course" in="${courseList}" status="i">
            <tr>
                <td>${i + 1}</td>
                <td>
                    <g:link action="show" id="${course.id}"
                            data-position="bottom" data-delay="50" data-tooltip="Show Course Details">
                        ${fieldValue(bean: course, field: "name")}
                    </g:link>
                </td>
                <td>${course.jambScore}</td>
                <td>
                    <g:each var="j" in="${course.jambSubjects}">
                        ${j.name},
                    </g:each>
                </td>

                <td>
                    <g:each var="j" in="${course.industries}">
                        ${j.name},
                    </g:each>
                </td>
                <td>
                    <g:link action="show" id="${course.id}" class="tooltipped"
                            data-position="bottom" data-delay="50" data-tooltip="Show record">
                        <span class="mdi mdi-view-agenda small teal-text"></span>
                    </g:link>
                </td>
                <td>
                    <g:link action="edit" id="${course.id}" class="tooltipped"
                            data-position="bottom" data-delay="50" data-tooltip="Edit record">
                        <span class="mdi mdi-table-edit small teal-text"></span>
                    </g:link>
                </td>
            </tr>
        </g:each>
        </tbody>
    </table>
</div>

<div class="card">
    <g:paginate total="${schoolCount ?: 0}"/>
</div>
</body>
</html>