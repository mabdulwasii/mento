<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="admin"/>
    <g:set var="entityName" value="${message(code: 'event.label', default: 'Event')}"/>
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
%{--<f:table collection="${eventList}" />--}%

<div class="card">

    <table border="2" class="striped centered responsive-table">
        <div class="row teal lighten-1 vPadding-1">
            <a href="#create" class="btn teal right white-text " style="margin-left: .5em;"><span
                    class="mdi mdi-plus small">Add New</span></a>
            <a href="#" class="btn   teal  right white-text"><span class="mdi mdi-export">Export To PDF</span></a>

        </div>
        <thead>
        <tr>
            <th>S/N</th>
            <g:sortableColumn property="title" title="Title"/>
            <g:sortableColumn property="jambScore" title="Jamb Score"/>
            <g:sortableColumn property="location" title="Location, State"/>
            <g:sortableColumn property="price" title="Price"/>
            <g:sortableColumn property="eventDate" title="Event Date"/>
            <g:sortableColumn property="goers" title="Subscribers"/>
            <th></th>
            <th></th>

        </tr>
        </thead>

        <tbody>
        <g:each var="event" in="${eventList}" status="i">
            <tr>
                <td>${i}</td>
                <td>
                    <g:remotelink action="show" id="${event.id}"
                                  oncomplete="showSpinner(false);" onloading="showSpinner(true);"
                                  update="show" class="tooltipped" data-position="bottom" data-delay="50"
                                  data-tooltip="Show event Details">
                        ${fieldValue(bean: event, field: "title")}
                    </g:remotelink>
                </td>
                <td>${event.location.city}, ${event.location.state}</td>
                <td>${event.price}</td>
                <td>${event.eventDate}</td>
                <td>
                    <g:remotelink action="subscriber" controller="systemStudentUser" id="${event.goers}"
                                  oncomplete="showSpinner(false);" onloading="showSpinner(true);"
                                  update="subscribers" class="tooltipped" data-position="bottom" data-delay="50"
                                  data-tooltip="Show event Details">
                        View Subscribers
                    </g:remotelink>
                </td>
                <td>
                    <g:remoteLink action="edit" id="${event.id}" class="tooltipped" data-position="bottom"
                                  data-delay="50" data-tooltip="Edit record"
                                  update="edit"><span class="mdi mdi-table-edit small teal-text"></span>
                    </g:remoteLink>
                </td>
                <td>
                    <g:form resource="${this.event}" method="DELETE">
                        <button onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');">
                            <span class="mdi mdi-table-column-remove small tooltipped teal-text" data-position="bottom"
                                  data-delay="50" data-tooltip="Delete record"></span>
                        </button>
                    </g:form>
                </td>
            </tr>
        </g:each>
        </tbody>
    </table>
</div>

<div class="card">
    <g:paginate total="${eventCount ?: 0}"/>
</div>
</body>
</html>