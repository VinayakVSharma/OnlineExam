<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@page import="org.jdom2.Attribute"%>
<%@page import="java.io.FileWriter"%>
<%@page import="org.jdom2.output.Format"%>
<%@page import="org.jdom2.Document"%>
<%@page import="java.io.File"%>
<%@page import="org.jdom2.input.SAXBuilder"%>
<%@page import="get.GetQue"%>
<%@page import="java.util.List"%>
<%@page import="org.jdom2.Element"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>  

    </head>
    <body>
        <%!
        String path;
        %>
        <!-- Declaration Ended -->
        <div class="panel panel-default">

            <div class="panel-body">  

                <div class="row">

                    <div class="col-md-12">
                        <div class="row">

                            <div class="col-md-4">
                                <div class="gallery">
                                    <a class="gallery-item">
                                        <div class="image">                              
                                            <img src="../img/logo-gpn.jpg" />     
                                        </div>
                                    </a>                                        
                                </div>
                            </div>

                            <div class="col-md-4">
                                <%
                                    try {
                                        SAXBuilder saxBuilder = new SAXBuilder();
                                        Context env = (Context) new InitialContext().lookup("java:comp/env");
                                        path = (String) env.lookup("root_dir");
                                        File file = new File(path + session.getAttribute("rl_no") + ".xml");
                                        Document document = saxBuilder.build(file);
                                        Element rootNode = document.getRootElement();
                                        Element student = rootNode.getChild("Exam_Details");
                                %>
                                <table class="table table-striped table-bordered">
                                    <tr>
                                        <td><h6><strong>Name</strong></h6></td>
                                        <td><%=student.getChildText("student_name")%></td>


                                        <td><h6><strong>Roll No</strong></h6></td>
                                        <td><%=student.getChildText("roll_no")%></td>

                                    </tr>
                                    <tr>
                                        <td><h6><strong>Branch</strong></h6></td>
                                        <td><%=student.getChildText("branch")%></td>

                                        <td><h6><strong>Year</strong></h6></td>
                                        <td><%=student.getChildText("year")%></td>
                                    </tr>
                                    <tr>
                                        <td><h6><strong>Course Code</strong></h6></td>
                                        <td><%=student.getChildText("c_code")%></td>


                                        <td><h6><strong>Course Name</strong></h6></td>
                                        <td><%=student.getChildText("c_name")%></td>

                                    </tr>
                                    <tr>
                                </table>
                                <%
                                    } catch (Exception e) {
                                        e.printStackTrace();
                                    }
                                %>
                            </div>

                            <div class="col-md-4">
                                <!-- CONTACT ITEM -->
                                <div class="gallery">
                                    <a class="gallery-item pull-right">
                                        <div class="image">                              
                                            <img src="../img/" class="" />     
                                        </div>
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <%!
            HttpSession session;

        %>
        <%
            session = request.getSession();
            String clock = request.getParameter("clock");
            if (clock == null) {
                System.out.println();
                clock = (String) session.getAttribute("timer");
            }
        %>
        <!-- Declaration Started -->
        <%!            GetQue g = new GetQue();
            List<Element> q = null;

        %>
        <!-- Start of Code -->        
        <%
            int i = Integer.parseInt(request.getParameter("vl"));
            q = g.getQue(path + session.getAttribute("rl_no") + ".xml");
            Element e = g.que(q, i);
            out.println(request.getParameter("stat"));

            if (request.getParameter("stat").equals("true")) {

                g.saveA(request.getParameter("option"), Integer.parseInt(request.getParameter("q_no")), path + session.getAttribute("rl_no") + ".xml", clock);
            }

        %>

        <form method="POST" name="forma">
            Seconds remaining: <input type="text" name="clock" value="<%=clock%>" style="border:0px solid white" hidden>
            <input type="text" name="clock1" value="<%=clock%>" style="border:0px solid white">
            Question No:<input type="text" name="q_no" value="<%= e.getAttributeValue("q_no")%>" /> <br />
            Question :- <input type="text" name="question" value="<%= e.getChildText("question")%>" /> <br />
            Select Right Answer :-<br>
            <%
                if (e.getChildText("user_c_ans").equals(e.getChildText("op1"))) {
            %>
            <input type="radio" name="option" value="<%= e.getChildText("op1")%>" checked ><%= e.getChildText("op1")%><br>        

            <%
            } else {
            %>
            <input type="radio" name="option" value="<%= e.getChildText("op1")%>"><%= e.getChildText("op1")%><br>        

            <%
                }
            %>

            <%
                if (e.getChildText("user_c_ans").equals(e.getChildText("op2"))) {
            %>
            <input type="radio" name="option" value="<%= e.getChildText("op2")%>" checked ><%= e.getChildText("op2")%><br>        

            <%
            } else {
            %>
            <input type="radio" name="option" value="<%= e.getChildText("op2")%>"><%= e.getChildText("op2")%><br>        

            <%
                }
            %>

            <%
                if (e.getChildText("user_c_ans").equals(e.getChildText("op3"))) {
            %>
            <input type="radio" name="option" value="<%= e.getChildText("op3")%>" checked ><%= e.getChildText("op3")%><br>        

            <%
            } else {
            %>
            <input type="radio" name="option" value="<%= e.getChildText("op3")%>"><%= e.getChildText("op3")%><br>        

            <%
                }
            %>

            <%
                if (e.getChildText("user_c_ans").equals(e.getChildText("op4"))) {
            %>
            <input type="radio" name="option" value="<%= e.getChildText("op4")%>" checked ><%= e.getChildText("op4")%><br>        

            <%
            } else {
            %>
            <input type="radio" name="option" value="<%= e.getChildText("op4")%>"><%= e.getChildText("op4")%><br>        

            <%
                }
            %>



            <%
                if (i > 0) {
            %>
            <input type="submit" value="Previous" name="ext" onclick="this.form.action = 'answer.jsp?stat=true&vl=<%= i - 1%>'" />
            <%
                }
            %>
            <%
                if (i < q.size() - 1) {
            %>
            <input type="submit" value="Next" name="ext" onclick="this.form.action = 'answer.jsp?stat=true&vl=<%= i + 1%>'" />
            <%
                }
            %>
            <input type="submit" value="Summary" name="Summary" onclick="this.form.action = 'summary.jsp?vl=<%= i%> '" />

        </form>

        <script>


            var timeout = <%=clock%>;
            function timer()
            {
                if (--timeout > 0)
                {
                    document.forma.clock.value = timeout;
                    document.forma.clock1.value = parseInt(timeout / 60) + ":" + timeout % 60;
                    window.setTimeout("timer()", 1000);
                } else
                {
                    document.forma.clock.value = "Time over";
                    ///disable submit-button etc
                    var vl =<%= request.getParameter("vl")%>;
                    window.location.href = "summary.jsp?vl=" + vl + "&option=" + document.forma.option.value;
                }
            }

        </script>

        <script>

            timer();

        </script>
    </body>
</html>
