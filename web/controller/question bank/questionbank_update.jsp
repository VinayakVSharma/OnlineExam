<%-- 
    Document   : questionbank_update
    Created on : Feb 21, 2017, 1:35:28 PM
    Author     : Vinayak Sharma
--%>

<%@page import="org.hibernate.Transaction"%>
<%@page import="Helping_Classes.Session_Factory"%>
<%@page import="org.hibernate.Session"%>
<%@page import="org.hibernate.SessionFactory" %>
<%@page import="java.util.List"%>
<%@page import="java.util.ListIterator"%>
<%@page import="org.hibernate.Query"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
    <head>        
        <!-- META SECTION -->
        <title>Exam Admin</title>            
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1" />

        <link rel="icon" href="../img/logo-gpn.jpg" type="image/x-icon" />
        <!-- END META SECTION -->

        <!-- CSS INCLUDE -->        
        <link rel="stylesheet" type="text/css" id="theme" href="../../css/theme-default.css"/>
        <!-- EOF CSS INCLUDE -->                                    

        <script type="text/x-mathjax-config">
            MathJax.Hub.Config({
            extensions: ["tex2jax.js"],
            jax: ["input/TeX","output/HTML-CSS"],
            tex2jax: {inlineMath: [["$","$"],["\\(","\\)"]]}
            });
        </script>
        <script type="text/javascript" src="../MathJax-2.7.0/MathJax.js"></script>
    </head>
    <body>
        <%!
            Session s;
            Query qr;
            SessionFactory sf;

            public void jspInit() {
                sf = Session_Factory.getSessionFactory();
            }
        %>
        <!-- START PAGE CONTAINER -->
        <div class="page-container">

            <!-- START PAGE SIDEBAR -->
            <div class="page-sidebar">
                <!-- START X-NAVIGATION -->
                <ul class="x-navigation">

                    <li class="xn-logo">
                        <a href="../../Dashboard.html">Exam Admin</a>
                        <a href="#" class="x-navigation-control"></a>
                    </li>

                    <li class="xn-profile">                            
                        <div class="profile">
                            <div class="profile-image">
                                <img src="../../img/profile-photo.jpg" alt="Pravin Mali"/>
                            </div>
                            <div class="profile-data">
                                <div class="profile-data-name">ADMIN</div>
                                <div class="profile-data-title">Java Developer</div>
                            </div>
                            <div class="profile-controls">
                                <a href="pages-profile.html" class="profile-control-left"><span class="fa fa-info"></span></a>                                      
                            </div>
                        </div>                                                                        
                    </li>

                    <li class="">
                        <a href="../../Dashboard.html"><span class="fa fa-desktop"></span>Dashboard</span></a>                        
                    </li>                

                    <li class="xn-openable">
                        <a href="../../student pages/student_add_update_delete.jsp"><span class="fa fa-pencil"></span> <span class="xn-text">Student</span></a>
                        <ul>
                            <li><a href="../../student pages/student_add_update_delete.jsp"><span class="fa fa-table"></span>Add / Update / Delete </a></li>
                            <li><a href="../../student pages/student_display.jsp"><span class="fa fa-arrow-right"></span>View Student</a></li>
                            <li><a href="../../student pages/student_file_upload.jsp"><span class="fa fa-arrow-right"></span>File Upload</a></li>
                            <li><a href="../../student pages/student_list_upload.jsp"><span class="fa fa-arrow-right"></span>List Upload</a></li>
                        </ul>
                    </li>

                    <li class="xn-openable">
                        <a href="../../subject pages/subject_add_update_delete.jsp"><span class="fa fa-table"></span> <span class="xn-text">Subject</span></a>
                        <ul>                            
                            <li><a href="../../subject pages/subject_add_update_delete.jsp"><span class="fa fa-align-justify"></span>Add / Update / Delete</a></li>
                            <li><a href="../../subject pages/subject_display.jsp"><span class="fa fa-sort-alpha-desc"></span> View Subjects</a></li>

                        </ul>
                    </li>

                    <li class="xn-openable">
                        <a href="../exam pages/start_exam.jsp"><span class="fa fa-table"></span> <span class="xn-text"> Set/Schedule Exam</span></a>
                        <ul>                            
                            <li><a href="../../exam pages/start_exam.jsp"><span class="fa fa-sort-alpha-desc"></span>Start Exam</a></li>
                            <li><a href="../../exam pages/end_exam.jsp"><span class="fa fa-sort-alpha-desc"></span>End Exam</a></li>
                            <li><a href="../../exam pages/add_exam.jsp"><span class="fa fa-align-justify"></span>Add Exam</a></li>
                            <li><a href="../../exam pages/add_specification.jsp"><span class="fa fa-sort-alpha-desc"></span>Add Specification</a></li>                                                        
                            <li><a href="../../exam pages/start_exam_single_student.jsp"><span class="fa fa-sort-alpha-desc"></span>Start Exam Single Student</a></li>                                                        

                        </ul>
                    </li>

                    <li class="xn-openable">
                        <a href="../../question bank pages/questionbank_add_update_delete.jsp"><span class="fa fa-table"></span> <span class="xn-text">Question Bank</span></a>
                        <ul>                            
                            <li><a href="../../question bank pages/questionbank_add_update_delete.jsp"><span class="fa fa-align-justify"></span> Add / Update / Delete</a></li>
                            <li><a href="../../question bank pages/questionbank_display.jsp"><span class="fa fa-sort-alpha-desc"></span>View Question Bank</a></li>
                            <li><a href="../../question bank pages/questionbank_file_upload.jsp"><span class="fa fa-download"></span>File Upload</a></li> 
                            <li><a href="../../question bank pages/questionbank_list_upload.jsp"><span class="fa fa-download"></span>List Upload</a></li> 
                        </ul>
                    </li>

                    <li class="xn-openable">
                        <a href="../../result pages/result_view.jsp"><span class="fa fa-files-o"></span> <span class="xn-text">Result</span></a>
                        <ul>
                            <li><a href="../../result pages/result_view.jsp"><span class="fa fa-image"></span>View Result</a></li>
                        </ul>
                    </li>

                    <li class="xn-openable">
                        <a href="../../connection pages/connection.jsp"><span class="fa fa-bar-chart-o"></span> <span class="xn-text">Statistics & Connections</span></a>
                        <ul>
                            <li><a href="../../connection pages/connection.jsp"><span class="fa fa-user"></span>Connections</a></li>
                        </ul>
                    </li>          

                    <li class="xn-openable active">
                        <a href="../../admin pages/admin_update_picture.jsp"><span class="fa fa-cogs"></span> <span class="xn-text">Admin Settings</span></a>                        
                        <ul>
                            <li><a href="../../admin pages/admin_update_picture.jsp"><span class="fa fa-user"></span>Admin Profile Picture</a></li>
                            <li><a href="../../admin pages/admin_display.jsp"><span class="fa fa-user"></span>View Admins</a></li>
                        </ul>
                    </li>

                </ul>
                <!-- END X-NAVIGATION -->
            </div>
            <!-- END PAGE SIDEBAR -->

            <!-- PAGE CONTENT -->
            <div class="page-content">

                <!-- START X-NAVIGATION VERTICAL -->
                <ul class="x-navigation x-navigation-horizontal x-navigation-panel">
                    <!-- TOGGLE NAVIGATION -->
                    <li class="xn-icon-button">
                        <a href="#" class="x-navigation-minimize"><span class="fa fa-dedent"></span></a>
                    </li>
                    <!-- END TOGGLE NAVIGATION -->
                    <!-- SEARCH
                    <li class="xn-search">
                        <form role="form">
                            <input type="text" name="search" placeholder="Search..."/>
                        </form>
                    </li>   
                     END SEARCH -->
                    <!-- SIGN OUT -->
                    <li class="xn-icon-button pull-right">
                        <a href="#" class="mb-control" data-box="#mb-signout"><span class="fa fa-sign-out"></span></a>                        
                    </li> 
                    <!-- END SIGN OUT -->


                </ul>
                <!-- END X-NAVIGATION VERTICAL -->                   

                <!-- PAGE CONTENT WRAPPER -->
                <div class="page-content-wrap">

                    <div class="row">
                        <div class="col-md-12">


                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <h3 class="panel-title">Question Bank (Question) Update</h3>
                                </div>
                                <div class="panel-body">
                                    <form action="" method="post">

                                        <%
                                            try {

                                                s = sf.openSession();
                                                String qn = request.getParameter("q_no");
                                                String que = request.getParameter("question");
                                                System.out.println(qn);
                                                qr = s.createQuery("from bean.Question_Bank where q_no='" + qn + "' ");

                                                if (qr != null) {
                                                    List li = qr.list();
                                                    if (li != null) {
                                                        ListIterator lit = li.listIterator();
                                                        bean.Question_Bank ar = new bean.Question_Bank();

                                                        while (lit.hasNext()) {
                                                            ar = (bean.Question_Bank) lit.next();


                                        %>
                                        <div class="form-group">
                                            <label class="col-md-3 col-xs-12 control-label">Course Name</label>
                                            <div class="col-md-6 col-xs-12">                                            
                                                <div class="input-group">
                                                    <span class="input-group-addon"><span class="fa fa-pencil"></span></span>
                                                    <input type="text" class="form-control" name="c_name" value="<%=ar.getC_name()%>"/>
                                                </div>                                            
                                                <span class="help-block">Update Course Name</span>
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <label class="col-md-3 col-xs-12 control-label">Course Code</label>
                                            <div class="col-md-6 col-xs-12">                                            
                                                <div class="input-group">
                                                    <span class="input-group-addon"><span class="fa fa-pencil"></span></span>
                                                    <input type="text" class="form-control" name="c_code" value="<%=ar.getC_code()%>"/>
                                                </div>                                            
                                                <span class="help-block">Update Course Code</span>
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <label class="col-md-3 col-xs-12 control-label">Question No</label>
                                            <div class="col-md-6 col-xs-12">                                            
                                                <div class="input-group">
                                                    <span class="input-group-addon"><span class="fa fa-pencil"></span></span>
                                                    <input type="text" class="form-control" name="q_no" value="<%=ar.getQ_no()%>"/>
                                                </div>                                            
                                                <span class="help-block">Update Question No</span>
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <label class="col-md-3 col-xs-12 control-label">Enter question</label>
                                            <div class="col-md-6 col-xs-12">                                            
                                                <textarea class="form-control" rows="5" name="question" ><%=ar.getQuestion()%></textarea>
                                                <span class="help-block">Update the Question</span>
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <label class="col-md-3 col-xs-12 control-label">Option A</label>
                                            <div class="col-md-6 col-xs-12">                                            
                                                <div class="input-group">
                                                    <span class="input-group-addon"><span class="fa fa-pencil"></span></span>
                                                    <input type="text" class="form-control" name="op1" value="<%=ar.getOp1()%>"/>
                                                </div>                                            
                                                <span class="help-block">Update Option 1st</span>
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <label class="col-md-3 col-xs-12 control-label">Option B</label>
                                            <div class="col-md-6 col-xs-12">                                            
                                                <div class="input-group">
                                                    <span class="input-group-addon"><span class="fa fa-pencil"></span></span>
                                                    <input type="text" class="form-control" name="op2" value="<%=ar.getOp2()%>"/>
                                                </div>                                            
                                                <span class="help-block">Update Option 2nd</span>
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <label class="col-md-3 col-xs-12 control-label">Option C</label>
                                            <div class="col-md-6 col-xs-12">                                            
                                                <div class="input-group">
                                                    <span class="input-group-addon"><span class="fa fa-pencil"></span></span>
                                                    <input type="text" class="form-control" name="op3" value="<%=ar.getOp3()%>"/>
                                                </div>                                            
                                                <span class="help-block">Update Option 3rd</span>
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <label class="col-md-3 col-xs-12 control-label">Option D</label>
                                            <div class="col-md-6 col-xs-12">                                            
                                                <div class="input-group">
                                                    <span class="input-group-addon"><span class="fa fa-pencil"></span></span>
                                                    <input type="text" class="form-control" name="op4" value="<%=ar.getOp4()%>"/>
                                                </div>                                            
                                                <span class="help-block">Update Option 4th</span>
                                            </div>
                                        </div>


                                        <div class="form-group">
                                            <label class="col-md-3 col-xs-12 control-label">Correct Option</label>
                                            <div class="col-md-6 col-xs-12">                                                                                            
                                                <select class="form-control select" name="c_ans" required>
                                                    <option <% if ((ar.getC_ans()).equals(ar.getOp1())) {
                                                            out.println("selected");
                                                        } %> value="a">Option A</option>
                                                    <option <% if ((ar.getC_ans()).equals(ar.getOp2())) {
                                                            out.println("selected");
                                                        } %> value="b">Option B</option>
                                                    <option <% if ((ar.getC_ans()).equals(ar.getOp3())) {
                                                            out.println("selected");
                                                        } %> value="c">Option C</option>
                                                    <option <% if ((ar.getC_ans()).equals(ar.getOp4())) {
                                                            out.println("selected");
                                                        }%> value="d">Option D</option>

                                                </select>
                                                <span class="help-block">Update Correct Option</span>
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <label class="col-md-3 col-xs-12 control-label">Unit No.</label>
                                            <div class="col-md-6 col-xs-12">                                            
                                                <div class="input-group">
                                                    <span class="input-group-addon"><span class="fa fa-pencil"></span></span>
                                                    <input type="text" class="form-control" name="unit_no" value="<%=ar.getUnit_no()%>"/>
                                                </div>                                            
                                                <span class="help-block">Update Unit No</span>
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <label class="col-md-3 col-xs-12 control-label">Marks</label>
                                            <div class="col-md-6 col-xs-12">                                            
                                                <div class="input-group">
                                                    <span class="input-group-addon"><span class="fa fa-pencil"></span></span>
                                                    <input type="text" class="form-control" name="marks" value="<%=ar.getMarks()%>"/>
                                                </div>                                            
                                                <span class="help-block">Update Marks</span>
                                            </div>
                                        </div>

                                        <input type="hidden" class="form-control"  name="h_q_no" value="<%= qn%>"/>
                                        <input type="hidden" class="form-control"  name="h_question" value="<%= que%>"/>

                                        <div class="panel-footer" class="col-xs-3">                                   
                                            <button class="btn btn-primary pull-right" name="update_btn" value="update_btn">Update Question</button>
                                        </div>

                                        <%                            }

                                                    } else {
                                                        System.out.println("-----Data Not Found-----");
                                                        response.sendRedirect("../../question bank pages/questionbank_add_update_delete.jsp?result=-----Data_Not_Found-----");
                                                    }
                                                } else {
                                                    System.out.println("-----Query Is Blank-----");
                                                    response.sendRedirect("../../question bank pages/questionbank_add_update_delete.jsp?result=-----Query_Is_Blank-----");
                                                }
                                            } catch (Exception e) {
                                                e.printStackTrace();
                                            }
                                        %>

                                    </form>

                                    <%
                                        if (request.getParameter("update_btn") != null) {
                                            try {
                                                System.out.println("------After using Beans-----");
                                                //  bean.add_update_delete_student ar = new bean.add_update_delete_student();
                                                String temp_q_no = request.getParameter("h_q_no");
                                                String temp_question = request.getParameter("h_question");
                                                Transaction tr = s.beginTransaction();
                                                String answer = "";
                                                if ((request.getParameter("c_ans")).equals("a")) {
                                                    answer = request.getParameter("op1");
                                                } else if ((request.getParameter("c_ans")).equals("b")) {
                                                    answer = request.getParameter("op2");
                                                } else if ((request.getParameter("c_ans")).equals("c")) {
                                                    answer = request.getParameter("op3");
                                                } else {
                                                    answer = request.getParameter("op4");
                                                }
                                                qr = s.createQuery("update bean.Question_Bank set c_code ='" + request.getParameter("c_code") + "', c_name='" + request.getParameter("c_name") + "', q_no='" + request.getParameter("q_no") + "', question='" + request.getParameter("question") + "' , op1='" + request.getParameter("op1") + "' , op2='" + request.getParameter("op2") + "' , op3='" + request.getParameter("op3") + "' , op4='" + request.getParameter("op4") + "' , c_ans='" + answer + "' , unit_no='" + request.getParameter("unit_no") + "' , marks='" + request.getParameter("marks") + "'  where q_no= '" + temp_q_no + "'  ");

                                                int temp = qr.executeUpdate();
                                                tr.commit();
                                                System.out.println("-----Transaction Saved-----");
                                                if (temp > 0) {
                                    %>
                                    <script type="text/javascript" >
                                        window.location.href="../../question bank pages/questionbank_add_update_delete.jsp?result=success";
                                    </script>
                                    <%
                                                    System.out.println("-----Redirected-----");
                                                } else {
                                    %>
                                    <script type="text/javascript" >
                                        window.location.href="../../question bank pages/questionbank_add_update_delete.jsp?result=-----Something_Went_Wrong-----";
                                    </script>
                                    <%
                                                   
                                                }
                                            } catch (Exception e) {
                                                System.out.println("-----Error Occurred-----");
                                                e.printStackTrace();
                                            } finally {
                                                s.flush();
                                                s.close();
                                            }

                                        }
                                    %>                                                                    
                                </div>
                            </div>                           

                        </div>
                    </div>
                </div>
                <!-- END PAGE CONTENT WRAPPER -->                                                
            </div>            
            <!-- END PAGE CONTENT -->
        </div>
        <!-- END PAGE CONTAINER -->

        <!-- MESSAGE BOX-->
        <div class="message-box animated fadeIn" data-sound="alert" id="mb-signout">
            <div class="mb-container">
                <div class="mb-middle">
                    <div class="mb-title"><span class="fa fa-sign-out"></span> Log <strong>Out</strong> ?</div>
                    <div class="mb-content">
                        <p>Are you sure you want to log out?</p>                    
                        <p>Press No if you want to continue work. Press Yes to logout current user.</p>
                    </div>
                    <div class="mb-footer">
                        <div class="pull-right">
                            <a href="../../admin pages/admin_login.jsp" class="btn btn-success btn-lg">Yes</a>
                            <button class="btn btn-default btn-lg mb-control-close">No</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- END MESSAGE BOX-->

        <!-- START SCRIPTS -->
        <!-- START PLUGINS -->
        <script type="text/javascript" src="../../js/plugins/jquery/jquery.min.js"></script>
        <script type="text/javascript" src="../../js/plugins/jquery/jquery-ui.min.js"></script>
        <script type="text/javascript" src="../../js/plugins/bootstrap/bootstrap.min.js"></script>                
        <!-- END PLUGINS -->

        <!-- THIS PAGE PLUGINS -->
        <script type='text/javascript' src='../../js/plugins/icheck/icheck.min.js'></script>
        <script type="text/javascript" src="../../js/plugins/mcustomscrollbar/jquery.mCustomScrollbar.min.js"></script>

        <script type="text/javascript" src="../../js/plugins/bootstrap/bootstrap-datepicker.js"></script>                
        <script type="text/javascript" src="../../js/plugins/bootstrap/bootstrap-file-input.js"></script>
        <script type="text/javascript" src="../../js/plugins/bootstrap/bootstrap-select.js"></script>
        <script type="text/javascript" src="../../js/plugins/tagsinput/jquery.tagsinput.min.js"></script>
        <!-- END THIS PAGE PLUGINS -->       

        <!-- START TEMPLATE -->
        <script type="text/javascript" src="../../js/settings.js"></script>
        <script type="text/javascript" src="../../js/plugins.js"></script>        
        <script type="text/javascript" src="../../js/actions.js"></script>        
        <!-- END TEMPLATE -->

        <!-- END SCRIPTS -->                 
    </body>
</html>