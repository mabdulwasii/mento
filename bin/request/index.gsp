<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="admin"/>
    <g:set var="entityName" value="${message(code: 'request.label', default: 'Request')}"/>
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
%{--<f:table collection="${requestList}" />--}%

<div class="card">

    <table border="2" class="striped centered responsive-table">
        <div class="row teal lighten-1 vPadding-1">
        </div>
        <thead>
        <tr>
            <th>S/N</th>
            <th>Title</th>
            <th>Location</th>
            <th>event date</th>
            <th>Price</th>
            <th>Price</th>
        </tr>
        </thead>

        <tbody>
        <tr>
            <td>1</td>
            <td>How to Choose Career Job</td>
            <td>Ibadan</td>
            <td>13/09/2017</td>
            <td>Free</td>
        </tr>
        <tr>
            <td>2</td>
            <td>What it takes to be a doctor</td>
            <td>Lagos</td>
            <td>01/02/2018</td>
            <td>Free</td>
        </tr>
        <tr>
            <td>3</td>
            <td>Federal Universities in Nigerial</td>
            <td>Lagos</td>
            <td>01/02/2018</td>
            <td>Free</td>
        </tr>
        </tbody>
    </table>
</div>

<div class="card">
    <g:paginate total="${requestCount ?: 0}"/>
</div>
</body>
</html>