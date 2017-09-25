<!doctype html>
<html>
<head>
    <meta name="layout" content="template"/>
    <title>Welcome to Mento</title>

    <asset:link rel="icon" href="favicon.ico" type="image/x-ico"/>
    <asset:stylesheet src="preloader.css"/>
</head>

<body>
<main>
    <!-- Page Loader -->
    <div class="page-loader-wrapper center">
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

            <p class="black-text">Please wait...</p>
        </div>
    </div>
    <!-- #END# Page Loader -->
    <g:if test="${!results}">
    %{--<div>
            <ul class="collection">
                    <g:each in="${results}" var="r" >
                        <li>${r.name}</li>
                    </g:each>
            </ul>
        </div>--}%
    </g:if>
    <div class="parallax-container">
        <div class="parallax imageOverlay">
            <asset:image src="image/Tech.jpg"/>
        </div>
    </div>
    <section class="grey lighten-3">
        <div class="row">
            <div class="col s8">
                <h1 class="white-text center found">We Found 5 results</h1>

                <div class="row">
                    <div class="col s12">
                        <div class="card white darken-1 z-depth-4">
                            <div class="card-content black-text">
                                <span class="card-title center">Information And Communication Science</span>

                                <p>A degree program in Computer Science is the study of how to manipulate, manage, transform and encode information. There are many areas in computer science, in which some of the areas consider problems in an abstract way and some areas need special machines called computers. A person who work
                                with computers will often need mathematics, science, and logic in order to make and use computers.</p>
                            </div>

                            <div class="card-action teal right-align ">
                                <g:link controller="search" action="resultDetailsInfo">Read More</g:link>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col s12">
                        <div class="card white lighten-1 z-depth-4">
                            <div class="card-content black-text">
                                <span class="card-title center">Computer Science</span>

                                <p>A degree program in Computer Engineering is a discipline that integrates several
                                fields of electrical engineering and computer science required to develop computer hardware and software
                                </p>
                            </div>

                            <div class="card-action teal right-align">
                                <g:link controller="search" action="resultDetails">Read More</g:link>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col s12">
                        <div class="card white darken-1 z-depth-3">
                            <div class="card-content black-text">
                                <span class="card-title center">Telecommunication Sciences</span>

                                <p>A degree program in Telecommunication Science is to enable students acquire strong theoretical and
                                practical skills in Telecommunication in order to work in any IT-driven environment.
                                Understand and apply the underlying principles of Networking to a variety of problem domains.</p>
                            </div>

                            <div class="card-action teal right-align">
                                <g:link controller="search" action="resultDetailsBio">Read More</g:link>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col s12">
                        <div class="card white darken-1 z-depth-4">
                            <div class="card-content black-text">
                                <span class="card-title center">Political Science</span>

                                <p>A degree program in Political Science is a social science which deals with systems of governments, and the analysis of political activities, political thoughts and political behaviour. It deals extensively with the theory and practice of politics
                                which is commonly thought of as determining of the distribution of power and resources</p>
                            </div>

                            <div class="card-action teal right-align">
                                <g:link controller="search" action="resultDetailsPol">Read More</g:link>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col s12">
                        <div class="card white darken-1 z-depth-3">
                            <div class="card-content black-text">
                                <span class="card-title center">Biomedical Science</span>

                                <p>A degree program in Bio Medical Science exposes the students to the study of the
                                chemical processes and transformations in living organisms. In studying biochemistry, memorising facts alone will not make you a good biochemist. A good biochemistry student must understand the principles of biochemistry, and must be able to apply the knowledge acquired to everyday life. Good results in a biochemistry degree will enable you to pursue a higher degree in various fields. Career wise, a biochemistry degree offers a
                                wide range of career prospects in both the public and private sectors</p>
                            </div>

                            <div class="card-action teal right-align">
                                <g:link controller="search" action="resultDetailsBio">Read More</g:link>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="col s4">
                <div class="card-panel white lighten-1 z-depth-4">
                    <h5 class="grey-text center">Advertisement Panel</h5>
                </div>

                <div class="card sticky-action white darken-1">
                    <div class="card-image waves-effect waves-block waves-light">
                        <asset:image class="activator" src="logo/logo5.png"/>
                    </div>

                    <div class="card-content ">
                        <span class="card-title activator black-text text-darken-4">Career Guidance System<i
                                class="mdi mdi-menu-up small right"></i></span>
                    </div>

                    <div class="card-action teal">

                        <a href="#" class="right">More...</a>
                        <a href="#"></a>
                    </div>

                    <div class="card-reveal">
                        <span class="card-title grey-text text-darken-4">Card Title<i
                                class="material-icons right">close</i></span>

                        <p>Here is some more information about this product that is only revealed once clicked on.</p>
                    </div>
                </div>

            </div>
        </div>
    </section>

</main>
<asset:javascript src="preloader.js"/>
</body>
</html>
