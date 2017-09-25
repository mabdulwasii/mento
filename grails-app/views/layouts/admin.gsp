<!doctype html>
<html lang="en" class="no-js" xmlns="http://www.w3.org/1999/html">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <title>
        <g:layoutTitle default="Welcome to Mento"/>
    </title>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <asset:stylesheet src="application.css"/>
    <asset:stylesheet src="preloader.css"/>
    <asset:stylesheet src="custom.css"/>
    <g:layoutHead/>
    <ckeditor:resources/>

</head>

<body class="grey lighten-3">

<nav class="teal header">
    <a href="/" class="hide-on-med-and-down white-text brand-logo tooltipped admin"
       data-position="bottom" data-delay="50" data-tooltip="Home" style="padding-left: 240px;">
        <i class="fa fa-user"></i>
    </a>
    <a href="#" class="brand-logo center white-text" style="padding-left: 105px">
        <g:pageProperty name="page.header"/>
    </a>
    <ul id="nav-mobile" class="right hide-on-med-and-down">
        <g:pageProperty name="page.nav"/>
        <li><a href="/wsChat" class="tooltipped" data-position="bottom" data-delay="50" data-tooltip="Chat"><i
                class="mdi mdi-camera-front white-text"></i></a>
        </li>
        <li><a href="#event" class="tooltipped" data-position="bottom" data-delay="50"
               data-tooltip="Event Request"><i class="mdi mdi-message-processing white-text"></i></a>
        </li>
        <li><a href="#notification" class="tooltipped " data-position="bottom" data-delay="50"
               data-tooltip="Notifications"><i class="mdi mdi-bell-ring white-text"></i></a>
        </li>
        <li><a href="/logout" class="tooltipped" data-position="bottom" data-delay="50" data-tooltip="Logout"><i
                class="mdi mdi-logout white-text"></i></a>
        </li>
    </ul>

    <ul id="slide-out" class="side-nav fixed lighten-0 z-depth-2 teal">
        <li>
            <div class="userView" style="padding-bottom: .3em;">

                <a href="/" class="center tooltipped" data-position="bottom" data-delay="50" data-tooltip="Home">
                    <asset:image src="logo/wees1.png"
                                 style="width: 120px; height: 30px; margin-top: 10px; margin-left: 0;"/>
                </a>

                <div class="background">
                    <asset:image src="image/004.jpg"/>
                </div>
                <ul id="profile-dropdown" class="dropdown-content center white">
                    <li><a href="index.htm#" class="teal-text"><i class="mdi mdi-face teal-text"></i> Profile</a>
                    </li>
                    <li><a href="index.htm#" class="teal-text"><i class="mdi mdi-settings teal-text"></i> Settings</a>
                    </li>
                    <li><a href="index.htm#" class="teal-text"><i class="mdi mdi-help teal-text"></i> Help</a>
                    </li>
                    <li class="divider"></li>
                    <li><a href="/lock.gsp" class="teal-text"><i class="mdi mdi-lock teal-text"></i> Lock</a>
                    </li>
                    <li><a href="/logout" class="teal-text"><i class="mdi mdi-logout teal-text"></i> Logout</a>
                    </li>
                </ul>

                <div class="row center center-align">
                    <div>
                        <div>
                            <a class="btn-flat dropdown-button waves-effect waves-light white-text profile-btn"
                               href="index.htm#" style="height: 60px;" data-activates="profile-dropdown">
                                <asset:image class="circle responsive-img" src="image/cap.jpg"/>
                                <i class="mdi mdi-menu-down right"></i>
                            </a>
                        </div>
                        <span class="white-text profile-text ">Abdulwasii Moronkola</span>
                    </div>

                </div>
            </div>
        </li>
        <li class="active"><g:link controller="dashboard" class="white-text"><i
                class="white-text fa fa-dashboard small"></i>Dashoard</g:link></li>
        <li><div class="divider teal lighten-3"></div></li>
        <li class="bold"><g:link controller="course" class="waves-effect waves-tel  white-text"><i
                class="fa fa-book small white-text"></i> Courses</g:link>
        </li>
        <li class="bold"><g:link controller="school" class="waves-effect waves-tel  white-text"><i
                class="fa fa-hospital-o small white-text"></i> School</g:link>
        </li>
        <li><div class="divider teal lighten-3"></div></li>

        <li class="bold"><g:link controller="systemCounsellorUser" class="waves-effect waves-cyan  white-text"><i
                class="fa fa-user-md small white-text"></i> Counsellors</g:link>
        </li>
        <li class="bold"><g:link controller="systemStudentUser" class="waves-effect waves-cyan  white-text"><i
                class="fa fa-user small white-text"></i> Students</g:link>
        </li>
        <li><div class="divider teal lighten-3"></div></li>
        <li class="bold"><g:link controller="request" class="waves-effect waves-cyan  white-text"><i
                class="fa fa-mail-forward small white-text"></i> Event Request</g:link>
        </li>
        <li class="bold">
            <g:link controller="event" class="waves-effect waves-teal  white-text"><i
                    class="fa fa-calendar-plus-o small white-text"></i> Upcoming Event</g:link>
        </li>
        <li><div class="divider teal lighten-3"></div></li>

        <li class="bold"><g:link controller="logout" class="waves-effect waves-teal  white-text"><i
                class="mdi mdi-logout white-text"></i> Logout</g:link>
        </li>
    </ul>
    <a href="#" data-activates="slide-out" class="button-collapse "><i class="mdi mdi-menu white-text"></i></a>
</nav>

<div class="divider"></div>
<main class="marginMain" id="mainContent">
    <g:layoutBody/>
</main>

<div id="spinner" class="spinner" style="display:none;">
    <g:message code="spinner.alt" default="Loading&hellip;"/>
</div>

%{--EVENT--}%
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
<asset:javascript src="preloader.js"/>

</body>

</html>