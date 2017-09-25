<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="admin"/>
    <g:set var="entityName" value="${message(code: 'school.label', default: 'School')}"/>
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

%{--<f:table collection="${schoolList}" />--}%
<div class="card">

    <table border="2" class="striped  responsive-table">
        <div class="row teal lighten-1 vPadding-1">
        </div>
        <thead>
        <tr>
            <th>S/N</th>
            <g:sortableColumn property="name" title="Name"/>
            <g:sortableColumn property="type" title="Type"/>
            <g:sortableColumn property="yearFounded" title="Year Founded"/>
            <g:sortableColumn property="noOfStudent" title="No Of Student"/>
            <g:sortableColumn property="noOfApplication" title="No Of Application"/>
            <th><span class="mdi mdi-view-agenda small teal-text"></span></th>
            <th><span class="mdi mdi-table-edit small teal-text"></span></th>
        </tr>
        </thead>

        <tbody class="">
        <g:each var="school" in="${schoolList}" status="i">
            <tr>
                <td>${i}</td>
                <td>
                    <g:link action="show" id="${school.id}" class="tooltipped left-align"
                            data-position="bottom" data-delay="50" data-tooltip="Show School Details">
                        ${fieldValue(bean: school, field: "name")}
                    </g:link>
                </td>
                <td>
                    ${school.type}
                </td>
                <td>${school.yearFounded}</td>
                <td>${school.noOfStudent}</td>
                <td>${school.noOfApplication}</td>
                <td>
                    <g:link action="show" id="${school.id}" class="tooltipped"
                            data-position="bottom" data-delay="50" data-tooltip="Show Record Details">
                        <span class="mdi mdi-view-agenda small teal-text"></span>
                    </g:link>
                </td>
                <td>
                    <g:link action="edit" id="${school.id}" class="tooltipped"
                            data-position="bottom" data-delay="50" data-tooltip="Edit record">
                        <span class="mdi mdi-table-edit small teal-text"></span>
                    </g:link>
                </td>
            </tr>
        </g:each>
        </tbody>
    </table>
</div>

<div class="card center">
    <g:paginate next="       Forward    " prev="   Back    " class="btn" total="${schoolCount ?: 0}"/>
</div>


<!-- Edit Structure -->
<div id="#edit" class="modal">
    <div class="modal-content">
        <h1><g:message code="default.edit.label" args="[entityName]"/></h1>
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
            <g:hiddenField name="version" value="${this.school?.version}"/>
            <fieldset class="form">
                %{--<f:all bean="school"/>--}%
            </fieldset>
            <fieldset class="buttons">
                <input class="save" type="submit"
                       value="${message(code: 'default.button.update.label', default: 'Update')}"/>
            </fieldset>
        </g:form>
    </div>

    <div class="modal-footer">
        <a href="#!" class="modal-action modal-close waves-effect waves-green btn-flat">Agree</a>
    </div>
</div>


<!-- Show Structure -->
<div id="modal1" class="modal">
    <div class="modal-content">
        <div id="show-school" class="content scaffold-show" role="main">
            <h1><g:message code="default.show.label" args="[entityName]"/></h1>
            <g:if test="${flash.message}">
                <div class="message" role="status">${flash.message}</div>
            </g:if>
            <f:display bean="school"/>
            <g:form resource="${this.school}" method="DELETE">
                <fieldset class="buttons">
                    <g:link class="edit" action="edit" resource="${this.school}"><g:message
                            code="default.button.edit.label" default="Edit"/></g:link>
                    <input class="delete" type="submit"
                           value="${message(code: 'default.button.delete.label', default: 'Delete')}"
                           onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');"/>
                </fieldset>
            </g:form>
        </div>
    </div>

    <div class="modal-footer">
        <a href="#!" class="modal-action modal-close waves-effect waves-green btn-flat">Agree</a>
    </div>
</div>

<!-- Create Structure -->
<div id="create" class="modal">
    <div class="modal-content">
    </div>
</div>

</body>
</html>