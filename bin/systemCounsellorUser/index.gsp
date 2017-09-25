<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="admin"/>
    <g:set var="entityName" value="${message(code: 'systemCounsellorUser.label', default: 'SystemCounsellorUser')}"/>
    <title><g:message code="default.list.label" args="[entityName]"/></title>
</head>

<body>
<div class="card white teal-text">
    <div class="row">
        <div class="col s6">
            <h5 class="left">Counsellor List</h5>
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

<div id="list-systemCounsellorUser" class="content scaffold-list" role="main">
    <div class="row teal lighten-1 vPadding-1">

    </div>
    <table border="2" class="striped centered responsive-table">
        <div class="row teal lighten-1 vPadding-1">
        </div>
        <thead>
        <tr>
            <th>S/N</th>
            <th>First Name</th>
            <th>Last Name</th>
            <th>Birthday</th>
            <th>Gender</th>
            <th>Email</th>
            <th>Phone</th>
        </tr>
        </thead>

        <tbody>
        <tr>
            <td>1</td>
            <td>Adewale</td>
            <td>Adebisi</td>
            <td>13/09/1997</td>
            <td>Male</td>
            <td>princehardetuneji@gmail.com</td>
            <td>0809675656</td>
        </tr>
        <tr>
            <td>2</td>
            <td>Adesolar</td>
            <td>Mariam</td>
            <td>01/02/1994</td>
            <td>Free
            <td>derek@gmail.com</td>
            <td>0809675656</td>
        </tr>
        <tr>
            <td>3</td>
            <td>Federal Universities in Nigerial</td>
            <td>Lagos</td>
            <td>01/02/2018</td>
            <td>Free</td>
            <td>manis@gmail.com</td>
            <td>0809675656</td>
        </tr>
        </tbody>
    </table>

    <div class="pagination">
        <g:paginate total="${systemCounsellorUserCount ?: 0}"/>
    </div>
</div>
</body>
</html>