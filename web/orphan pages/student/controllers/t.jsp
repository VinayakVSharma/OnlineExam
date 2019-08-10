<%-- 
    Document   : t
    Created on : Feb 20, 2017, 7:19:53 PM
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
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script>
            $('.datepicker').datepicker({
                format: 'dd/mm/yyyy',
                startDate: '-3d'
            });
        </script>
    </head>
    <body>
        
        hiii
        <%!
            Session s;
            Query qr;
            SessionFactory sf;

            public void jspInit() {
                sf = Session_Factory.getSessionFactory();

            }
        %>

        <form>

            <%
                try {

                    s = sf.openSession();
                    String rl = request.getParameter("roll_no");
                    System.out.println(rl);
                    qr = s.createQuery("from bean.add_update_delete_student where roll_no='" + rl + "' ");

                    if (qr != null) {
                        List li = qr.list();
                        if (li != null) {
                            ListIterator lit = li.listIterator();
                            bean.add_update_delete_student ar = new bean.add_update_delete_student();

                            while (lit.hasNext()) {
                                ar = (bean.add_update_delete_student) lit.next();


            %>
            hiiiii
            <input type="text" class="form-control" placeholder="name" name="student_name" value="<%= ar.getStudent_name()%>"/><br>

            <input type="text" class="form-control" placeholder="roll no" name="roll_no" value="<%= ar.getRoll_no()%>"/><br>

            Year

            <select class="form-control select" name="year" selected="<%= ar.getYear()%>">
                <option value="FIRST" >First</option>
                <option value="SECOND" >Second</option>
                <option value="THIRD">Third</option>
            </select>
            <br>


            Branch<select class="form-control select" name="branch" selected="<%= ar.getBranch()%>">
                <option value="IF" >IF</option>
                <option value="CM">CM</option>
                <option value="CE">Civil</option>
                <option value="E&TC">E&TC</option>
                <option value="EE">Electrical</option>
                <option value="AE" >Automobile</option>
                <option value="ME">Mechanical</option>
                <option value="IDD">IDD</option>
                <option value="DDGM">DDGM</option>  
                <option value="PS">Plastic</option>  
            </select>
            <br>
            Date of birth
            <div class="input-group date" data-provide="datepicker">
                <input type="text" class="form-control" name="dob" value="<%= ar.getDob()%>">
                <div class="input-group-addon">
                    <span class="glyphicon glyphicon-th"></span>
                </div>
            </div>                           
            <br>

            <input type="hidden" class="form-control"  name="h_roll_no" value="<%= rl%>"/>

            Register: <button class="btn btn-info btn-block" name="submit">Register</button>



            <%

                            }

                        } else {
                            out.print("data not found");
                        }
                    } else {
                        out.print("-----Query is Blank-----");
                    }

                } catch (Exception e) {
                    e.printStackTrace();
                }
            %>

        </form>



        <%
            if (request.getParameter("submit") != null) {
                try {
                    System.out.println("------After using Beans-----");
                    //  bean.add_update_delete_student ar = new bean.add_update_delete_student();
                    String temp_roll_no = request.getParameter("h_roll_no");
                    Transaction tr = s.beginTransaction();

                    qr = s.createQuery("update bean.add_update_delete_student set student_name='" + request.getParameter("student_name") + "',roll_no='" + request.getParameter("roll_no") + "',year='" + request.getParameter("year") + "', dob='" + request.getParameter("dob") + "' , branch='" + request.getParameter("branch") + "'  where roll_no= '" + temp_roll_no + "' ");

                    int temp = qr.executeUpdate();
                    tr.commit();
                    System.out.println("-----Transaction Saved-----");
                    if (temp > 0) {
                        response.sendRedirect("../student_update.jsp?result=successfull");
                        System.out.println("-----Redirected-----");

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
    </body>
</html>
