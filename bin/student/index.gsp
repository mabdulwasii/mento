<%@ page import="com.mento.school.School" %>
<!doctype html>
<html lang="en" class="no-js">
<head>
    <meta name="layout" content="student"/>
    <title>Admin DashBoard</title>

    <asset:link rel="icon" href="favicon.ico" type="image/x-ico"/>
    <asset:stylesheet src="bg.css"/>

    <script type="text/javascript">
        function getNext1() {
            $('ul.tabs').tabs('select_tab', 'test-swipe-2');
        }

        function getNext2() {
            $('ul.tabs').tabs('select_tab', 'test-swipe-3');
        }

        function getPrevious1() {
            $('ul.tabs').tabs('select_tab', 'test-swipe-1');
        }

        function getPrevious2() {
            $('ul.tabs').tabs('select_tab', 'test-swipe-2');
        }
    </script>
</head>

<body>

<content tag="nav">
    <li><a href="#survey" class="tooltipped" data-position="bottom" data-delay="50" data-tooltip="Survey"><i
            class="mdi mdi-comment-question-outline fa fa-question"></i></a>
</content>

<!-- Page Loader -->
<div class="page-loader-wrapper">
    <div class="loader">
        <div class="preloader">
            <div class="spinner-layer pl-red">
                <div class="circle-clipper left">
                    <div class="circle"></div>
                </div>

                <div class="circle-clipper right">
                    <div class="circle"></div>
                </div>
            </div>
        </div>

        <p>Please wait...</p>
    </div>
</div>
<!-- #END# Page Loader -->
<!-- //////////////////////////////////////////////////////////////////////////// -->
<div class="row">
    %{-- <div class="center" style="margin-bottom: 2em; margin-top: 2em">
         <asset:image src="logo/logo2.png" />
     </div>--}%
    <h3 class="center white-text" style="margin-top: 4em;">Get Started with a Course</h3>

    <div class="searchResult center">
        <div class="row center">
            <div class="col s8 offset-s2">
                <g:form action="resultDetails" controller="search" name="search">
                    <div class="row white-text">
                        <div class="input-field col s4">
                            <g:select name="${com.mento.school.School.name}"
                                      class="teal-text browser-default transparent"
                                      noSelection="['': 'Choose School']"
                                      from="['University Of Ilorin', 'University Of Ibadan', 'Federal University Minna', 'University Of Maiduguri', 'Ahmadu Bello university']"/>
                        </div>

                        <div class="input-field col s4">
                            <g:select name="faculty" class="browser-default transparent teal-text"
                                      noSelection="['': 'Choose Faculty']"
                                      from="['Communication And Information Science', 'Art', 'Social Sciences', 'Law', 'School Medicine']"/>
                        </div>

                        <div class="input-field col s4">
                            <g:select name="query" class="browser-default transparent teal-text"
                                      noSelection="['': 'Choose Course']"
                                      from="['Computer Science', 'Information And Communication', 'Telecommunication Science', 'Library And Info Scienec']"/>
                        </div>
                    </div>
                    <br/>

                    <div class="row center">
                        <button class="btn waves-effect waves-light hoverable teal white-text" name="action">
                            <i class="mdi mdi-magnify"></i> Search
                        </button>
                    </div>
                </g:form>
            </div>
        </div>
        <br/>
        %{--<div class="divider teal"></div>
        <div class="row">
            <div class="col s8 offset-s2" style="margin-top: 2%">
                <h4 class="teal-text">Quick Survey</h4>
                <h5 class="teal-text">
                    Our Survey helps you to quickly get started with career guidance.
                    take a quick survey and know where your skills can take your in life.
                </h5>
                <a href="#survey" class="btn btn-flat teal pulse white-text" style="margin-top: 2em">Take Survey Now</a>
            </div>
        </div>--}%
    </div>
</div>
<a href="#survey" class="right btn-floating pink z-depth-2 pulse hoverable " id="surveyBtn"><i
        class="mdi mdi-camera-enhance"></i></a>
<!-- //////////////////////////////////////////////////////////////////////////// -->

<!-- Modal Structure -->
<div id="survey" class="modal">
    <div class="row">
        <g:form class="col s12">
            <div class="modal-content">
                <h4 class="center teal-text">Quick Survey</h4>
                <ul id="tabs-swipe-demo" class="tabs">
                    <li class="tab col s4"><a class="active" href="#test-swipe-1">Test 1</a></li>
                    <li class="tab col s4"><a class="disabled" href="#test-swipe-2">Test 2</a></li>
                    <li class="tab col s4"><a class="disabled" href="#test-swipe-3">Test 3</a></li>
                </ul>

                <div id="test-swipe-1" class="col s12 card ">
                    <div class="row">
                        <div class="card">
                            <div class="input-field col s6">
                                <i class="fa fa-user"></i>
                                <input id="fullname" name="fuulname" class="validate">
                                <label for="fullname">Full Name</label>
                            </div>
                        </div>

                        <div class="card">
                            <div class="input-field col s6">
                                <i class="mdi mdi-numeric"></i>
                                <input id="age" name="age" type="tel" class="validate">
                                <label for="age">Age</label>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="card">
                            <div class="input-field col s12">
                                <textarea id="bio" name="bio" class="materialize-textarea"></textarea>
                                <label for="bio">Location</label>
                            </div>
                        </div>
                    </div>

                    <div class="divider"></div>

                    <div>
                        <a href="#!"
                           class="teal white-text center-align modal-action modal-close waves-effect waves-green btn-flat">close</a>
                        <a href="#!" class="right waves-effect waves-green btn-flat teal white-text"
                           onclick="getNext1()">Next</a>
                    </div>
                </div>

                <div id="test-swipe-2" class="col s12 card">
                    <div class="row">
                        <div class="card">
                            <div class="input-field col s6">
                                <i class="mdi mdi-light"></i>
                                <g:select name="hobbies" id="hobbies"
                                          from="${com.mento.utility.Interest.list()}"
                                          optionValue="name"
                                          multiple="true"
                                          optionKey="id"/>
                                <label for="hobbies">Select Hobbies</label>
                            </div>
                        </div>

                        <div class="card">
                            <div class="input-field col s6">
                                <i class="mdi mdi-book-multiple"></i>
                                <g:select name="bestSubjects" id="bestSubjects"
                                          from="${com.mento.utility.Subject.list()}"
                                          multiple="true"
                                          optionValue="name"
                                          optionKey="id"/>
                                <label for="bestSubjects">Select Best Subjects</label>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="card">
                            <div class="input-field col s6">
                                <i class="mdi mdi-book-multiple"></i>
                                <g:select name="olevels" id="olevels"
                                          from="${com.mento.utility.Subject.list()}"
                                          multiple="true"
                                          optionValue="name"
                                          optionKey="id"/>
                                <label for="olevels">Select Olevel Subjects</label>
                            </div>
                        </div>

                        <div class="card">
                            <div class="input-field col s6">
                                <i class="mdi mdi-worker"></i>
                                <g:select name="careerJob" id="careerJob"
                                          from="${com.mento.utility.CareerJob.list()}"
                                          multiple="true"
                                          optionValue="name"
                                          optionKey="id"/>
                                <label for="careerJob">Select Future Career</label>
                            </div>
                        </div>
                    </div>

                    <div class="divider"></div>

                    <div>
                        <a href="#!"
                           class="teal white-text center-align modal-action modal-close waves-effect waves-green btn-flat">close</a>
                        <a href="#!" class="teal white-text left waves-effect waves-green btn-flat"
                           onclick="getPrevious1()">previous</a>
                        <a href="#!" class="teal white-text right waves-effect waves-green btn-flat"
                           onclick="getNext2()">Next</a>
                    </div>
                </div>

                <div id="test-swipe-3" class="col s12 card">
                    <div class="row">
                        <div class="card">
                            <div class="input-field col s6">
                                <i class="mdi mdi-hospital-building"></i>
                                <g:select name="choiceInstitution" id="choiceInstitution"
                                          from="${School.list()}"
                                          multiple="true"
                                          optionValue="name"
                                          optionKey="id"/>
                                <label for="choiceInstitution">Select Institution of Choice</label>
                            </div>
                        </div>

                        <div class="card">
                            <div class="input-field col s6">
                                <i class="fa fa-building"></i>
                                <g:select name="choiceCourse" id="choiceCourse"
                                          from="${School.list()}"
                                          optionValue="name"
                                          optionKey="id"/>
                                <label for="choiceCourse">Select Institution of Choice</label>
                            </div>
                        </div>
                    </div>

                    <div class="divider"></div>

                    <div>
                        <a href="#!"
                           class="teal white-text center modal-action modal-close waves-effect waves-green btn-flat">close</a>
                        <a href="#!" class="teal white-text left waves-effect waves-green btn-flat"
                           onclick="getPrevious2()">previous</a>
                        <g:submitButton name="submit"
                                        class=" right btn btn-flat teal text-white modal-action waves-effect waves-green"
                                        value="Save"/>
                    </div>
                </div>
            </div>
        </g:form>
    </div>
</div>
<!-- Profile Structure -->
<div id="profile" class="modal">
    <div class="modal-content center">
        <h4>Profile</h4>

    </div>

    <div class="modal-footer">
        <a href="#!" class="modal-action modal-close waves-effect waves-green btn-flat">Agree</a>
    </div>
</div>

<!-- Olevel Reulst Structure -->
<div id="olevel" class="modal">
    <div class="modal-content center">
        <h4>O level</h4>
        <g:form class="col s12">
            <table>
                <thead>
                <h3>O level Result</h3>
                <tr>
                    <th data-field="number">Serial</th>
                    <th data-field="subject">Subject</th>
                    <th data-field="grade">Score Grade</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <td>1</td>
                    <td>
                        <div class="input-field col s12">
                            Methematics:
                        </div>
                    </td>
                    <td>
                        <div class="input-field col s12">
                            <g:select name="grade"
                                      from="['A', 'B', 'C', 'D', 'E', 'F']"/>
                            <label>Select Grade</label>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td>2</td>
                    <td>
                        <div class="input-field col s12">
                            English:
                        </div>
                    </td>
                    <td>
                        <div class="input-field col s12">
                            <g:select name="grade"
                                      from="['A', 'B', 'C', 'D', 'E', 'F']"/>
                            <label>Select Grade</label>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td>3</td>
                    <td>
                        <div class="input-field col s12">
                            <g:select name="department"
                                      from="${com.mento.utility.Subject.list()}"
                                      optionValue="name"
                                      optionKey="id"/>
                            <label>Select Other Related Subject</label>
                        </div>
                    </td>
                    <td>
                        <div class="input-field col s12">
                            <g:select name="grade"
                                      from="['A', 'B', 'C', 'D', 'E', 'F']"/>
                            <label>Select Grade</label>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td>4</td>
                    <td>
                        <div class="input-field col s12">
                            <g:select name="department"
                                      from="${com.mento.utility.Subject.list()}"
                                      optionValue="name"
                                      optionKey="id"/>
                            <label>Select Other Related Subject</label>
                        </div>
                    </td>
                    <td>
                        <div class="input-field col s12">
                            <g:select name="grade"
                                      from="['A', 'B', 'C', 'D', 'E', 'F']"/>
                            <label>Select Grade</label>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td>5</td>
                    <td>
                        <div class="input-field col s12">
                            <g:select name="department"
                                      from="${com.mento.utility.Subject.list()}"
                                      optionValue="name"
                                      optionKey="id"/>
                            <label>Select Other Related Subject</label>
                        </div>
                    </td>
                    <td>
                        <div class="input-field col s12">
                            <g:select name="grade"
                                      from="['A', 'B', 'C', 'D', 'E', 'F']"/>
                            <label>Select Grade</label>
                        </div>
                    </td>
                </tr>
                </tbody>
            </table>

            <div class="row center-align">
                <g:submitButton name="create" class="btn teal text-white" action="resultDetails" controller="search"
                                value="${message(code: 'default.button.create.label', default: 'Create')}"/>
            </div>
        </g:form>
    </div>

    <div class="modal-footer">
        <a href="#!" class="modal-action modal-close waves-effect waves-green btn-flat">Close</a>
    </div>
</div>
</body>
</html>