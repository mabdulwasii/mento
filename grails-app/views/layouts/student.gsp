<%@ page import="com.mento.event.Request" %>
<!doctype html>
<html lang="en" class="no-js">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <title>
        <g:layoutTitle default="Grails"/>
    </title>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>

    <asset:stylesheet src="application.css"/>
    <asset:stylesheet src="frontend.css"/>
    <asset:stylesheet src="preloader.css"/>

    <g:layoutHead/>
</head>

<body>
</nav>

<nav>
    <div class="nav-wrapper white teal-text">
        <a href="/" class="brand-logo">
            <asset:image src="logo/logo8Normal.png" style="width: 100px; height: 40px; margin-top: 10px"/>
        </a>
        <a href="#" data-activates="mobile-demo" class="button-collapse">
            <i class="mdi mdi-menu"></i>
        </a>
        <ul class="right hide-on-med-and-down student">
            <g:pageProperty name="nav"/>
            %{--<li>Welcome <sec:username/></li>--}%
            <li><a href="/wsChat" class="tooltipped" data-position="bottom" data-delay="50" data-tooltip="Chat"><i
                    class="mdi mdi-camera-front teal-text"></i></a>
        <li>
            <a href="#upcoming" class="tooltipped" data-position="bottom" data-delay="50"
               data-tooltip="Upcoming Seminar"><i class="teal-text mdi mdi-calendar"></i></a>
            <sec:ifAllGranted roles="ROLE_USER">
                <li><a href="#createRequest" class="tooltipped" data-position="bottom" data-delay="50"
                       data-tooltip="Seminar request"><i class="teal-text mdi mdi-calendar-clock"></i></a>
                <li><a href="#survey" class="tooltipped" data-position="bottom" data-delay="50"
                       data-tooltip="Take Survey"><i class="teal-text mdi mdi-camera"></i></a>
                <li><a href="#olevel" class="tooltipped" data-position="bottom" data-delay="50" data-tooltip="Suggestion By O level"><i class="teal-text mdi mdi-file-excel"></i></a>
            </sec:ifAllGranted>
            <li><a href="#notification" class="tooltipped" data-position="bottom" data-delay="50"
                   data-tooltip="Notification"><i class="teal-text mdi mdi-bell"></i></a>
                %{--<li><a href="#profile" class="tooltipped" data-position="bottom" data-delay="50" data-tooltip="Profile"><i class="fa fa-user small teal-text"></i></a></li>--}%
            <li><a href="/logout" class="tooltipped" data-position="bottom" data-delay="50" data-tooltip="Logout"><i
                    class="mdi mdi-logout teal-text"></i></a>
            </li>
        </ul>
    </div>
</nav>
<main>
    <g:layoutBody/>
</main>

<footer class="page-footer white">
    <div class="footer-copyright teal">
        <div class="container white-text ">
            © 2014 Copyright Text
            <a class="white-text right" href="/">Mento</a>
        </div>
    </div>
</footer>

<div id="spinner" class="spinner" style="display:none;">
    <g:message code="spinner.alt" default="Loading&hellip;"/>
</div>

<!-- Event Structure -->
<div id="event" class="modal">
    <div class="modal-content">
        <ul class="collection">
            <li class="collection-item avatar">
                <img src="images/yuna.jpg" alt="" class="circle">
                <span class="title">Title</span>

                <p>First Line <br>
                    Second Line
                </p>
                <a href="#!" class="secondary-content"><i class="mdi mdi-star"></i></a>
            </li>
            <li class="collection-item avatar">
                <i class="mdi mdi-star circle">folder</i>
                <span class="title">Title</span>

                <p>First Line <br>
                    Second Line
                </p>
                <a href="#!" class="secondary-content"><i class="mdi mdi-star"></i></a>
            </li>
            <li class="collection-item avatar">
                <i class="mdi mdi-star circle green">insert_chart</i>
                <span class="title">Title</span>

                <p>First Line <br>
                    Second Line
                </p>
                <a href="#!" class="secondary-content"><i class="mdi mdi-star"></i></a>
            </li>
            <li class="collection-item avatar">
                <i class="mdi mdi-star circle red">play_arrow</i>
                <span class="title">Title</span>

                <p>First Line <br>
                    Second Line
                </p>
                <a href="#!" class="secondary-content"><i class="mdi mdi-star"></i></a>
            </li>
        </ul>
    </div>

    <div class="modal-footer">
        <a href="#!" class="modal-action modal-close waves-effect waves-green btn-flat">Close</a>
    </div>
</div>

<!-- Interested Structure -->
<div id="interested" class="modal">
    <div class="modal-content">
        <h4>Are You Willing to Go</h4>

        <div class="switch">
            <label>
                No
                <input type="checkbox">
                <span class="lever"></span>
                Yes
            </label>
        </div>
    </div>

    <div class="modal-footer">
        <a href="#!" class="modal-action modal-close waves-effect waves-green btn-flat">Submit</a>
    </div>
</div>

%{--Upcoming EVENT--}%
<div id="upcoming" class="modal">
    <g:form controller="request" action="save">
        <div class="modal-content">
            <h2>Upcoming event</h2>

            <div class="card-panel">
                <div class="row">
                    <ul class="collection">
                        <li class="collection-item">
                            <div class="col s4">
                                RoadMap to be a Doctor
                            </div>

                            <div class="col s7">
                                Event stated for Ibadan Lagos State...
                            </div>

                            <div class="s1 col">
                                <a href="#" class="btn-flat teal white-text hoverable">Read more</a>
                            </div>
                        </li>
                        <li class="collection-item">
                            <div class="col s4">
                                How to Enter University
                            </div>

                            <div class="col s7">
                                Details About how to successfully gain admission into the university will be discussed...
                            </div>

                            <div class="s1 col">
                                <a href="#" class="btn-flat teal white-text hoverable">Read more</a>
                            </div>
                        </li>
                    </ul>
                </div>
            </div>
        </div>

        <div class="modal-footer">
            <a href="#!" class="modal-action modal-close waves-effect waves-green left btn-flat">Close</a>
        </div>
    </g:form>
</div>

%{--REQUEST--}%
<div id="createRequest" class="modal">
    <g:form controller="request" action="save">
        <div class="modal-content">
            <div class="row">
                <div class="center teal-text">
                    <h3>Seminar Request</h3>
                </div>

                <form class="col s12">
                    <div class="row">
                        <div class="input-field col s12">
                            <input id="title" type="text" class="validate">
                            <label for="title">Event Title</label>
                        </div>

                        <div class="input-field col s12">
                            <input id="location" type="text" class="validate">
                            <label for="location">Location</label>
                        </div>
                    </div>

                    <div class="row">
                        <div class="input-field col s12">
                            <textarea id="description" class="materialize-textarea"></textarea>
                            <label for="description">Description</label>
                        </div>
                    </div>

                    <div class="row">
                        <div class="input-field col s12">
                            <input id="proposedNoOfDays" type="number" min="0" maxlength="5" class="validate">
                            <label for="proposedNoOfDays">No Of days</label>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col s12 center">
                            <g:submitButton name="request" class="btn" value="submit"/>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </g:form>
</div>

<!-- Notification Structure -->
<div id="notification" class="modal">
    <div class="modal-content teal-text ">
        <ul class="collection">
            <li class="collection-item avatar">
                <img src="images/yuna.jpg" alt="" class="circle">
                <span class="title">New Event</span>

                <p>Seminar Request <br>
                    This is to inform you that some of the links are not working
                </p>
                <a href="#!" class="secondary-content"><i class="mdi mdi-star">grade</i></a>
            </li>
            <li class="collection-item avatar">
                <i class="mdi mdi-star circle">folder</i>
                <span class="title">Counsellor Misbehaving</span>

                <p>Counsellor review <br>
                    Can Dr. Adewale position to be reviewed and call to actions
                </p>
                <a href="#!" class="secondary-content"><i class="mdi mdi-star">grade</i></a>
            </li>
            <li class="collection-item avatar">
                <i class="mdi mdi-star circle green">insert_chart</i>
                <span class="title">Trial Teacher</span>

                <p>Teacher Summit <br>
                    Summer seminar can helps students in preparing for Jamb Exams
                </p>
                <a href="#!" class="secondary-content"><i class="mdi mdi-star">grade</i></a>
            </li>
            <li class="collection-item avatar">
                <i class="mdi mdi-star circle red">play_arrow</i>
                <span class="title">Call For Mobile Application</span>

                <p>Mobile Applications for the mento Application <br>
                    The need For a traditional mobile application for mento is now eminent...
                </p>
                <a href="#!" class="secondary-content"><i class="mdi mdi-star">grade</i></a>
            </li>
        </ul>
    </div>

    <div class="modal-footer">
        <a href="#!" class="modal-action modal-close waves-effect waves-green btn-flat">Close</a>
    </div>
</div>

<asset:javascript src="application.js"/>
<asset:javascript src="preloaader.js"/>

</body>
</html>
