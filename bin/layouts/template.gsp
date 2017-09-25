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

    <g:layoutHead/>
</head>

<body>
<nav class="nav white">
    <div class="nav-wrapper">
        <a href="/" class="brand-logo white-text">
            <asset:image claass="tooltipped" data-position="bottom" data-delay="50" data-tooltip="Home"
                         src="logo/logo8Normal.png" style="width: 100px; height: 40px; margin-top: 10px"/></a>
        <ul id="nav-mobile" class="right hide-on-med-and-down">
            <sec:ifLoggedIn>
                <li><a href="/dashboard" class="tooltipped white-text" data-position="bottom" data-delay="50"
                       data-tooltip="DashBoard"><span class="mdi-view-dashboard"></span></a></li>
            </sec:ifLoggedIn>
            <sec:ifNotLoggedIn>
                <li><a href="#register" class="tooltipped lighten-2 btn hoverable" data-position="bottom"
                       data-delay="50" data-tooltip="Register">Apply Now</a></li>
                <li><a href="#login" class="tooltipped teal-text" data-position="bottom" data-delay="50"
                       data-tooltip="Login">Login</a></li>
            </sec:ifNotLoggedIn>
            <sec:ifLoggedIn>
                <li><a href="/logout" class="tooltipped teal-text" data-position="bottom" data-delay="50"
                       data-tooltip="Logout">Logout</a></li>
            </sec:ifLoggedIn>

        </ul>
    </div>
</nav>

<g:layoutBody/>
<!-- START FOOTER -->
<footer class="teal">
    <div class="footer-copyright transparent">
        <div class="container white-text ">
            © 2014 Copyright Text
            <a class="white-text right" href="/">Mento</a>
        </div>
    </div>
</footer>
<!-- END FOOTER -->

<!-- register Structure -->
<div id="register" class="modal">
    <div class="modal-content">
        <div id="" class="row">
            <div class="col s12">
                <form class="login-form">
                    <div class="row">
                        <div class="input-field col s12 center ">
                            <h4 class="teal white-text" style="padding: .5em 0">Register</h4>

                            <p class="center">Register With Us Now !</p>
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
                        <div class="input-field col s12">
                            <a href="index.htm" class="btn waves-effect waves-light">Register Now</a>
                        </div>

                        <div class="input-field col s12">
                            <p class="margin center medium-small sign-up">Already have an account? <a
                                    href="#login">Login</a></p>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<!-- Modal Structure -->
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
                            <p class="margin right-align medium-small"><a href="/forgetPassword"
                                                                          class="teal-text">Forgot password ?</a></p>
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

