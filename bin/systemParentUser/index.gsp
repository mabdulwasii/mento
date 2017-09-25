<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="admin"/>
    <g:set var="entityName" value="${message(code: 'systemParentUser.label', default: 'SystemParentUser')}"/>
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
                    data-tooltip="New School" action="create"><i class="mdi mdi-plus teal-text small"></i></g:link>
        </div>
    </div>
</div>

<g:if test="${flash.message}">
    <div class="message" role="status">${flash.message}</div>
</g:if>


<div id="list-systemParentUser" class="content scaffold-list" role="main">
    <div class="row teal lighten-1 vPadding-1">
        <a href="#create" class="btn teal right white-text vPadding-1" style="margin-left: .5em;"><span
                class="mdi mdi-plus small">Add New</span></a>
        <a href="#" class="btn   teal  right white-text vPadding-1"><span class="mdi mdi-export">Export To PDF</span>
        </a>
    </div>
    <f:table collection="${systemParentUserList}"/>

    <div class="pagination">
        <g:paginate total="${systemParentUserCount ?: 0}"/>
    </div>
</div>
</body>
</html>