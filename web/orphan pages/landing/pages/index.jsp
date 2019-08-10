<%-- 
    Document   : index.jsp
    Created on : 12 Jun, 2017, 3:42:12 PM
    Author     : Vinayak Sharma
    --%>

    <%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@page import="get.saveIp"%>
<%@page import="org.jdom2.Element"%>
    <%@page import="org.jdom2.Document"%>
    <%@page import="java.io.File"%>
    <%@page import="org.jdom2.input.SAXBuilder"%>
    <%@page contentType="text/html" pageEncoding="UTF-8"%>
    <!DOCTYPE html>

    <head>
        <!-- meta charec set -->
        <meta charset="utf-8">
        <!-- Always force latest IE rendering engine or request Chrome Frame -->
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <!-- Page Title -->
        <title>Student Panel</title>		
        <!-- Meta Description -->
        <meta name="description" content="Blue One Page Creative HTML5 Template">
        <meta name="keywords" content="one page, single page, onepage, responsive, parallax, creative, business, html5, css3, css3 animation">
        <meta name="author" content="Muhammad Morshed">
        <!-- Mobile Specific Meta -->
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <!-- Google Font -->

        <link href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700,800' rel='stylesheet' type='text/css'>

    <!-- CSS
        ================================================== -->
        <!-- Fontawesome Icon font -->
        <link rel="stylesheet" href="css/font-awesome.min.css">
        <!-- Twitter Bootstrap css -->
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <!-- jquery.fancybox  -->
        <link rel="stylesheet" href="css/jquery.fancybox.css">
        <!-- animate -->
        <link rel="stylesheet" href="css/animate.css">
        <!-- Main Stylesheet -->
        <link rel="stylesheet" href="css/main.css">
        <!-- media-queries -->
        <link rel="stylesheet" href="css/media-queries.css">
        <!-- Modernizer Script for old Browsers -->
        <script src="js/modernizr-2.6.2.min.js"></script>

    </head>

    <body id="body">

        <!-- preloader -->
        <div id="preloader">
            <img src="img/preloader.gif" alt="Preloader">
        </div>
        <!-- end preloader -->

    <!-- 
    Fixed Navigation
    ==================================== -->
    <header id="navigation" class="navbar-fixed-top navbar">
        <div class="container">
            <div class="navbar-header">
                <!-- responsive nav button -->
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <i class="fa fa-bars fa-2x"></i>
                </button>
                <!-- /responsive nav button -->

                <!-- logo -->
                <a class="navbar-brand" href="#body">
                    <h1>TechNest</h1>



                </a>
                <!-- /logo -->
            </div>

            <!-- main nav -->
            <nav class="collapse navbar-collapse navbar-right" role="navigation">
                <ul id="nav" class="nav navbar-nav">
                    <li class="current"><a href="#body">Home</a></li>
                    <li><a href="#features">Instructions</a></li>

                    <li><a href="#team">Team</a></li>
                    <li><a href="#facts">About</a></li>
                    <li><a href="#contact">Login</a></li>
                </ul>
            </nav>
            <!-- /main nav -->

        </div>
    </header>
    <!--
    End Fixed Navigation
    ==================================== -->



    <!--
    Home Slider
    ==================================== -->

    <section id="slider">
        <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">

            <!-- Indicators bullet -->
            <ol class="carousel-indicators">
                <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
                <li data-target="#carousel-example-generic" data-slide-to="1"></li>
            </ol>
            <!-- End Indicators bullet -->				

            <!-- Wrapper for slides -->
            <div class="carousel-inner" role="listbox">

                <!-- single slide -->
                <div class="item active" style="background-image: url(img/gp.jpg);">
                    <div class="carousel-caption">
                        <h2 data-wow-duration="700ms" data-wow-delay="500ms" class="wow bounceInDown animated">TechNest<span> Online Examination</span>!</h2>
                        <h3 data-wow-duration="1000ms" class="wow slideInLeft animated"><span class="color"></span></h3>
                        <p data-wow-duration="1000ms" class="wow slideInRight animated">(An Autonomous Institute of Government Of Maharashtra)</p>

                        <ul class="social-links text-center">
                            <li><a href=""><i class="fa fa-google-plus fa-lg"></i></a></li>

                        </ul>
                    </div>
                </div>
                <!-- end single slide -->

                <!-- single slide -->
                <div class="item" style="background-image: url(img/banner.jpg);">
                    <div class="carousel-caption">
                        <h2 data-wow-duration="500ms" data-wow-delay="500ms" class="wow bounceInDown animated">Meet<span> Team</span>!</h2>
                        <h3 data-wow-duration="500ms" class="wow slideInLeft animated"><span class="color"></span></h3>
                        <p data-wow-duration="500ms" class="wow slideInRight animated">Official team of professionals guided by Prof. Pravin Mali Sir!! </p>


                    </div>
                </div>
                <!-- end single slide -->

            </div>
            <!-- End Wrapper for slides -->

        </div>
    </section>

    <!--
    End Home SliderEnd
    ==================================== -->

    <!--
    Features
    ==================================== -->

    <section id="features" class="features">
        <div class="container">
            <div class="row">

                <div class="sec-title text-center mb50 wow bounceInDown animated" data-wow-duration="500ms">
                    <h2>Instructions</h2>
                    <div class="devider"><i class="fa fa-heart-o fa-lg"></i></div>
                </div>

                <!-- service item -->
                <div class="col-md-12 wow fadeInLeft" data-wow-duration="500ms">
                    <div class="service-item">
                        <div class="service-icon">
                            <i class="fa fa-github fa-2x"></i>
                        </div>

                        <div class="service-desc">

                            <h2>1.When you click the start button your countdown time will start immediately.<br><br>
                                2.You can submit only one option for every question.<br><br>
                                3.You can review the specific question later.<br><br>
                                4.After you click the submit botton you cannot re-submit the answer.<br><br>
                                5.Clicking the end button will end your test.<br><br>
                            </h2>
                        </div>
                    </div>
                </div>
                <!-- end service item -->



            </div>
        </div>
    </section>

    <!--
    End Features
    ==================================== -->


    <!--
    Our Works
    ==================================== -->



    <!--
    Meet Our Team
    ==================================== -->		

    <section id="team" class="team">
        <div class="container">
            <div class="row">

                <div class="sec-title text-center wow fadeInUp animated" data-wow-duration="700ms">
                    <h2>Meet Our Team</h2>
                    <div class="devider"><i class="fa fa-heart-o fa-lg"></i></div>
                </div>

                <div class="sec-sub-title text-center wow fadeInRight animated" data-wow-duration="500ms">
                    <p>Official Online Examination Team Guided by Prof.Pravin Mali!</p>
                </div>

                <!-- single member -->
                <figure class="team-member col-md-3 col-sm-6 col-xs-12 text-center wow fadeInUp animated" data-wow-duration="500ms">
                    <div class="member-thumb">
                        <img src="" alt="Team Member" class="img-responsive">                            
                    </div>
                    <h4>Swaraj .D</h4>
                    <span></span>
                </figure>
                <!-- end single member -->

                <!-- single member -->
                <figure class="team-member col-md-3 col-sm-6 col-xs-12 text-center wow fadeInUp animated" data-wow-duration="500ms" data-wow-delay="300ms">
                    <div class="member-thumb">
                        <img src="" alt="Team Member" class="img-responsive">
                    </div>
                    <h4>Vinayak .S</h4>
                    <span></span>
                </figure>
                <!-- end single member -->

                <!-- single member -->
                <figure class="team-member col-md-3 col-sm-6 col-xs-12 text-center wow fadeInUp animated" data-wow-duration="500ms" data-wow-delay="600ms">
                    <div class="member-thumb">
                        <img src="" alt="Team Member" class="img-responsive">
                    </div>
                    <h4>Shreya .S</h4>
                    <span></span>
                </figure>
                <!-- end single member -->

                <!-- single member -->
                <figure class="team-member col-md-3 col-sm-6 col-xs-12 text-center wow fadeInUp animated" data-wow-duration="500ms" data-wow-delay="900ms">
                    <div class="member-thumb">
                        <img src="" alt="Team Member" class="img-responsive">
                    </div>
                    <h4>Tanuja .S</h4>
                    <span></span>
                </figure>
                <!-- end single member -->

            </div>
        </div>
    </section>

    <!--
    End Meet Our Team
    ==================================== -->

    <!--
Some fun facts
==================================== -->		

<section id="facts" class="facts">
    <div class="parallax-overlay">
        <div class="container">
            <div class="row number-counters">

                <div class="sec-title text-center mb50 wow rubberBand animated" data-wow-duration="1000ms">
                    <h2>About The Exam</h2>
                    <div class="devider"><i class="fa fa-heart-o fa-lg"></i></div>
                </div>

                <!-- first count item -->
                <div class="col-md-3 col-sm-6 col-xs-12 text-center wow fadeInUp animated" data-wow-duration="500ms">
                    <div class="counters-item">
                        <i class="fa fa-clock-o fa-3x"></i>
                        <strong data-to="60">0</strong>
                        <!-- Set Your Number here. i,e. data-to="56" -->
                        <p>Total Time In Minutes</p>
                    </div>
                </div>
                <div class="col-md-3 col-sm-6 col-xs-12 text-center wow fadeInUp animated" data-wow-duration="500ms" data-wow-delay="300ms">
                    <div class="counters-item">
                        <i class="fa fa-users fa-3x"></i>
                        <strong data-to="74">0</strong>
                        <!-- Set Your Number here. i,e. data-to="56" -->
                        <p>Students appearing for exam</p>
                    </div>
                </div>
                <div class="col-md-3 col-sm-6 col-xs-12 text-center wow fadeInUp animated" data-wow-duration="500ms" data-wow-delay="600ms">
                    <div class="counters-item">
                        <i class="fa fa-rocket fa-3x"></i>
                        <strong data-to="100">0</strong>
                        <!-- Set Your Number here. i,e. data-to="56" -->
                        <p> Total Questions in exam</p>
                    </div>
                </div>
                <div class="col-md-3 col-sm-6 col-xs-12 text-center wow fadeInUp animated" data-wow-duration="500ms" data-wow-delay="900ms">
                    <div class="counters-item">
                        <i class="fa fa-trophy fa-3x"></i>
                        <strong data-to="20">0</strong>
                        <!-- Set Your Number here. i,e. data-to="56" -->
                        <p>Total Marks </p>
                    </div>
                </div>
                <!-- end first count item -->

            </div>
        </div>
    </div>
</section>

    <!--
    End Some fun facts
    ==================================== -->


    <!--
Contact Us
==================================== -->		

<section id="contact" class="contact">
    <div class="container">
        <div class="row mb50">

            <div class="sec-title text-center mb50 wow fadeInDown animated" data-wow-duration="500ms">
                <h2>Student Login</h2>
                <div class="devider"><i class="fa fa-heart-o fa-lg"></i></div>
            </div>


            <!-- contact form -->
            <div class="col-lg-8 col-md-8 col-sm-7 col-xs-12 wow fadeInDown animated" data-wow-duration="500ms" data-wow-delay="300ms">
                <div class="contact-form">

                    <form action="" class="form-horizontal" method="post">
                        <div class="login-container lightmode">

                            <div class="login-box animated fadeInDown">
                                <div class="login-body">


                                    <div class="form-group">
                                        <div class="col-md-12">
                                            <input type="text" class="form-control" placeholder="Username" name="roll" required/>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <div class="col-md-12">
                                            <input type="password" class="form-control" placeholder="Password"  name="pass" required/>
                                        </div>
                                    </div><br><br>&nbsp&nbsp
                                    <div class="form-group">
                                        <div class="col-md-6">
                                            <button class="btn btn-info btn-block" name="login">Log In</button>
                                        </div>
                                    </div><br>&nbsp&nbsp
                                </div>

                            </div>
                        </div>
                    </form>
                    <%
                    if (request.getParameter("login") != null) {
                    if (request.getParameter("roll").equals(request.getParameter("pass"))) {
                    SAXBuilder saxBuilder = new SAXBuilder();
                    Context env = (Context)new InitialContext().lookup("java:comp/env"); 
                    String path=(String)env.lookup("root_dir");
                    File file = new File(path + request.getParameter("roll") + ".xml");
                    Document document = saxBuilder.build(file);
                    Element rootNode = document.getRootElement();
                    if ((rootNode.getChild("ExamStatus").getChildText("status")).equals("Attempted")) {
                    %>
                    <script type="text/javascript">
                        alert("You have Already Given The Examination......!! Cannot Give Again");

                    </script>
                    <%
                } else {
                session = request.getSession();
                session.setAttribute("rl_no", request.getParameter("roll"));
                session.setAttribute("timer", (rootNode.getChild("Exam_Details").getChildText("time")));
                saveIp si = new saveIp();
                si.ip(request.getRemoteAddr(), request.getParameter("roll"));
                %>
                <script type="text/javascript">

                    window.location.href = "hall_ticket.jsp?stat=false&vl=0";
                </script>
                <%
            }
        } else {
        %>
        <script type="text/javascript">
            alert("Wrong Login Roll No And Password");

        </script>
        <%
    }
}

%>

</div>


</div>
</div>
<!-- end contact form -->


</div>




</section>

    <!--
    End Contact Us
    ==================================== -->



    <a href="javascript:void(0);" id="back-top"><i class="fa fa-angle-up fa-3x"></i></a>

    <!-- Essential jQuery Plugins
        ================================================== -->
        <!-- Main jQuery -->
        <script src="js/jquery-1.11.1.min.js"></script>
        <!-- Single Page Nav -->
        <script src="js/jquery.singlePageNav.min.js"></script>
        <!-- Twitter Bootstrap -->
        <script src="js/bootstrap.min.js"></script>
        <!-- jquery.fancybox.pack -->
        <script src="js/jquery.fancybox.pack.js"></script>
        <!-- jquery.mixitup.min -->
        <script src="js/jquery.mixitup.min.js"></script>
        <!-- jquery.parallax -->
        <script src="js/jquery.parallax-1.1.3.js"></script>
        <!-- jquery.countTo -->
        <script src="js/jquery-countTo.js"></script>
        <!-- jquery.appear -->
        <script src="js/jquery.appear.js"></script>
        <!-- Contact form validation -->
        <script src="http://cdnjs.cloudflare.com/ajax/libs/jquery.form/3.32/jquery.form.js"></script>
        <script src="http://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.11.1/jquery.validate.min.js"></script>
        <!-- Google Map -->
        <script type="text/javascript" src="http://maps.googleapis.com/maps/api/js?sensor=false"></script>
        <!-- jquery easing -->
        <script src="js/jquery.easing.min.js"></script>
        <!-- jquery easing -->
        <script src="js/wow.min.js"></script>
        <script>
            var wow = new WOW({
                                boxClass: 'wow', // animated element css class (default is wow)
                                animateClass: 'animated', // animation css class (default is animated)
                                offset: 120, // distance to the element when triggering the animation (default is 0)
                                mobile: false, // trigger animations on mobile devices (default is true)
                                live: true        // act on asynchronously loaded content (default is true)
                            }
                            );
            wow.init();
        </script> 
        <!-- Custom Functions -->
        <script src="js/custom.js"></script>

        <script type="text/javascript">
            $(function () {
                /* ========================================================================= */
                                /*	Contact Form
                                /* ========================================================================= */

                                $('#contact-form').validate({
                                    rules: {
                                        name: {
                                            required: true,
                                            minlength: 2
                                        },
                                        email: {
                                            required: true,
                                            email: true
                                        },
                                        message: {
                                            required: true
                                        }
                                    },
                                    messages: {
                                        name: {
                                            required: "come on, you have a name don't you?",
                                            minlength: "your name must consist of at least 2 characters"
                                        },
                                        email: {
                                            required: "no email, no message"
                                        },
                                        message: {
                                            required: "um...yea, you have to write something to send this form.",
                                            minlength: "thats all? really?"
                                        }
                                    },
                                    submitHandler: function (form) {
                                        $(form).ajaxSubmit({
                                            type: "POST",
                                            data: $(form).serialize(),
                                            url: "process.php",
                                            success: function () {
                                                $('#contact-form :input').attr('disabled', 'disabled');
                                                $('#contact-form').fadeTo("slow", 0.15, function () {
                                                    $(this).find(':input').attr('disabled', 'disabled');
                                                    $(this).find('label').css('cursor', 'default');
                                                    $('#success').fadeIn();
                                                });
                                            },
                                            error: function () {
                                                $('#contact-form').fadeTo("slow", 0.15, function () {
                                                    $('#error').fadeIn();
                                                });
                                            }
                                        });
                                    }
                                });
                            });
                        </script>
                    </body>
                    </html>
