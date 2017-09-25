<!doctype html>
<html>
<head>
    %{--<meta name="layout" content="template"/>--}%
    <title>Welcome to CareerGuide</title>

    <asset:link rel="icon" href="favicon.ico" type="image/x-ico"/>


    <asset:stylesheet src="application.css"/>
    <asset:stylesheet src="frontend.css"/>
    <asset:stylesheet src="animate.css"/>

    <asset:javascript src="application.js"/>
    <asset:stylesheet src="bgHome.css"/>

    <asset:javascript src="wow.min.js"/>
    <asset:javascript src="typed.min.js"/>
    <asset:javascript src="common.js"/>
    <script>
        var wow = new WOW(
            {
                boxClass: 'wow',      // animated element css class (default is wow)
                animateClass: 'animated', // animation css class (default is animated)
                offset: 0,          // distance to the element when triggering the animation (default is 0)
                mobile: true,       // trigger animations on mobile devices (default is true)
                live: true,       // act on asynchronously loaded content (default is true)
                callback: function (box) {
                    // the callback is fired every time an animation is started
                    // the argument that is passed in is the DOM node being animated
                },
                scrollContainer: null // optional scroll container selector, otherwise use window
            }
        );
        wow.init();
    </script>
</head>

<body class="">
<main>
    <nav class="transparent black homeNav">
        <div class="nav-wrapper">
            %{--<a href="#" class="brand-logo">Logo</a>--}%
            <ul id="nav-mobile" class="right hide-on-med-and-down">
                <sec:ifNotLoggedIn>
                    <li><a href="#register" class="tooltipped" data-position="bottom" data-delay="50"
                           data-tooltip="Register">
                        Register</a></li>
                    <li><a href="#login" class="tooltipped" data-position="bottom" data-delay="50" data-tooltip="Login">
                        Login</a></li>
                </sec:ifNotLoggedIn>

                <sec:ifLoggedIn>
                    <li><a href="/dashboard" class="tooltipped" data-position="bottom" data-delay="50"
                           data-tooltip="DashBoard">
                        <span class="mdi mdi-view-dashboard"></span></a></li>
                    <li><a href="/logout" class="tooltipped" data-position="bottom" data-delay="50"
                           data-tooltip="Logout">
                        <span class="mdi mdi-logout"></span></a></li>
                </sec:ifLoggedIn>
            </ul>
        </div>
    </nav>
    <section class="row ">
        <div class="center imageContainer">
            %{--<asset:image src="logo/wees1.png" style="width: 500px; height: 120px"/>--}%
            <h1 class="yellow-text center">Career <br/> Guidance System</h1>
        </div>
        <!--<div class="center col s10 offset-s1 banner" style="position: absolute; top: 20em;">-->
        <div class="center col s10 offset-s1 banner">
            <div class="type-wrap row white-text">
                <div id="typed-strings">
                    <p>academics,</p>

                    <p>finance,</p>

                    <p>career advancement.</p>
                </div>

                <h3><span class="glyphicons glyphicons-education"></span>Unparalled Counselling on <strong><span
                        id="typed" style="white-space: pre;"></span></strong></h3>
            </div>

        </div>

        <div class="col s8 offset-s2">
            <g:form controller="search" action="searchQuery" class="col s12" name="query">
                <div class="row">
                    <div class="input-field col s8 offset-s2 search ">
                        <span class="mdi mdi-magnify large teal-text"></span>
                        <input name="query" value="${params.query}" id="query"
                               class="validate browser-default white teal-text hoverable" minlength="1"
                               placeholder="Search for Institutions, Courses, ...">
                    </div>
                </div>

                <div class="row">
                    <div class="col s12 center">
                        <button class="btn waves-effect waves-light hoverable teal white-text" name="action">Search
                            <i class="mdi mdi-magnify"></i>
                        </button>
                    </div>
                </div>

            </g:form>

        </div>

        %{--Fab to toolbar--}%
        <div class="fixed-action-btn toolbar">
            <a class="btn-floating pink pulse">
                <i class=" mdi mdi-tooltip-edit"></i>
            </a>

            <div class="row center">
                <ul class="col s12 m12">
                    <li class="waves-effect waves-light"><a href="/suggestion">Get Suggestion</a></li>
                    <li class="waves-effect waves-light"><a href="#!">Terms And Condition</a></li>
                    <li class="waves-effect waves-light"><a href="#!">Live Chat</a></li>

                </ul>
            </div>
        </div>
    </section>

</main>
<script>
    $(function () {

        $("#typed").typed({
            stringsElement: $('#typed-strings'),
            typeSpeed: 100,
            backDelay: 2000,
            loop: true,
            contentType: 'html', // or text
            // defaults to false for infinite loop
            loopCount: false,
            callback: function () {
                foo();
            },
            resetCallback: function () {
                newTyped();
            }
        });

        $(".reset").click(function () {
            $("#typed").typed('reset');
        });

    });

    function newTyped() { /* A new typed object */
    }

    function foo() {
        console.log("Callback");
    }

</script>

<style>
/* code for animated blinking cursor */
.typed-cursor {
    opacity: 1;
    font-weight: 100;
    -webkit-animation: blink 0.7s infinite;
    -moz-animation: blink 0.7s infinite;
    -ms-animation: blink 0.7s infinite;
    -o-animation: blink 0.7s infinite;
    animation: blink 0.7s infinite;
}

@
@-keyframes blink {
0% {
    opacity: 1;
}
50% {
    opacity: 0;
}
100% {
    opacity: 1;
}
}
@
@-webkit-keyframes blink {
    0% {
        opacity: 1;
    }
    50% {
        opacity: 0;
    }
    100% {
        opacity: 1;
        \
    }
}

@
@-moz-keyframes blink {
    0% {
        opacity: 1;
    }
    50% {
        opacity: 0;
    }
    100% {
        opacity: 1;
    }
}

@
@-ms-keyframes blink {
    0% {
        opacity: 1;
    }
    50% {
        opacity: 0;
    }
    100% {
        opacity: 1;
    }
}

@
@-o-keyframes blink {
    0% {
        opacity: 1;
    }
    50% {
        opacity: 0;
    }
    100% {
        opacity: 1;
    }
}
</style>


<!-- register Structure -->
<div id="register" class="modal">
    <div class="modal-content">
        <div id="" class="row">
            <div class="col s12">
                <form class="login-form">
                    <div class="row">
                        <div class="input-field col s12 center ">
                            <h4 class="teal white-text" style="padding: .5em 0">Register With Us</h4>
                            %{--<p class="center">Register With Us Now !</p>--}%
                        </div>
                    </div>

                    <div class="row margin">
                        <div class="input-field col s12">
                            <i class="mdi-social-person-outline prefix"></i>
                            <input id="username1" name="username" type="text">
                            <label for="username1" class="center-align">Username</label>
                        </div>
                    </div>

                    <div class="row margin">
                        <div class="input-field col s12">
                            <i class="mdi-communication-email prefix"></i>
                            <input id="email" type="email">
                            <label for="email" class="center-align">Email</label>
                        </div>
                    </div>

                    <div class="row margin">
                        <div class="input-field col s12">
                            <i class="mdi-action-lock-outline prefix"></i>
                            <input id="password1" name="password" type="password">
                            <label for="password1">Password</label>
                        </div>
                    </div>

                    <div class="row margin">
                        <div class="input-field col s12">
                            <i class="mdi-action-lock-outline prefix"></i>
                            <input id="password-again" type="password">
                            <label for="password-again">Password again</label>
                        </div>
                    </div>

                    <div class="row">
                        <div class="input-field col s12 center">
                            <a href="index.htm" class="btn waves-effect waves-light">Register Now</a>
                        </div>

                        <div class="input-field col s12">
                            <p class="margin center medium-small sign-up">Already have an account?
                                <a href="#login" class="modal-action modal-close">Login</a></p>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<!-- Login Structure -->
<div id="login" class="modal center loginModal">
    <div class="modal-content">
        <div id="login-page" class="row">
            <div class="col s12">

                <g:if test='${flash.message}'>
                    <div class="login_message">${flash.message}</div>
                </g:if>

                <form class="login-form" id="loginForm" action="${postUrl ?: '/login/authenticate'}" method="POST"
                      autocomplete="on">
                    <div class="row center  ">
                        <h5 class="teal white-text" style="padding: .5em 0">Login</h5>
                        <a href="#!" class="right modal-action modal-close waves-effect waves-green btn-flat"><i
                                class="mdi mdi-close"></i></a>
                        %{--<div class="input-field col s12 center">
                            <asset:image src="logo/logo8Normal.png"  alt="" class="circle responsive-img profile-image-login" />
                            <p class="center login-form-text teal-text"><g:message code='springSecurity.login.header'/></p>
                        </div>--}%
                    </div>

                    <div class="row margin center">
                        <div class="input-field col s12 center">
                            <i class="mdi-social-person-outline prefix"></i>
                            <input id="username" type="text" name="${usernameParameter ?: 'username'}">
                            <label for="username" class="center-align">Username</label>
                        </div>
                    </div>

                    <div class="row margin center">
                        <div class="input-field col s12 center center">
                            <i class="mdi-action-lock-outline prefix"></i>
                            <input id="password" type="password" name="${passwordParameter ?: 'password'}">
                            <label for="password">Password</label>
                        </div>
                    </div>

                    <div class="row">
                        <div class="input-field col s12 m12 l12  login-text">
                            <input type="checkbox" id="remember_me" name="${rememberMeParameter ?: 'remember-me'}"
                                   <g:if test='${hasCookie}'>checked="checked"</g:if>/>
                            <label for="remember_me">Remember me</label>
                        </div>
                    </div>

                    <div class="row">
                        <div class="input-field col s12 center">
                            <input type="submit" id="submit" class="btn waves-effect waves-light"
                                   value="${message(code: 'springSecurity.login.button')}"/>
                        </div>
                    </div>

                    <div class="row">
                        <div class="input-field col s6 m6 l6 center">
                            <p class="margin medium-small"><a href="#register" class="teal-text">Register Now!</a></p>
                        </div>

                        <div class="input-field col s6 m6 l6 center-block">
                            <p class="margin right-align medium-small">
                                <a href="/forgetPassword"
                                   class="modal-action modal-close teal-text">Forgot password ?</a></p>
                        </div>

                    </div><br>

                </form>
            </div>
        </div>
    </div>
</div>

<asset:javascript src="application.js"/>

</body>
</html>
