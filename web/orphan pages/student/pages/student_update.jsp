<%-- 
    Document   : student
    Created on : Dec 29, 2016, 11:19:35 PM
    Author     : Vinayak Sharma
--%>

<%@page import="bean.admin_registration"%>
<%@page import="java.util.ListIterator"%>
<%@page import="java.util.List"%>
<%@page import="org.hibernate.Transaction"%>
<%@page import="Helping_Classes.Session_Factory"%>
<%@page import="org.hibernate.SessionFactory"%>
<%@page import="org.hibernate.Query"%>
<%@page import="org.hibernate.Session"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>admin login controller </title>

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
        <form>
        <table border="1">
            <tr>
                <td>Roll No</td>
                <td>Student Name</td>
                <td>Year</td>
                <td>Branch</td>

            </tr>  
            <%
                try {
                    s = sf.openSession();
                    String rl = request.getParameter("roll_no");
                    qr = s.createQuery("from bean.student.add_update_delete_student");

                    if (qr != null) {
                        List li = qr.list();
                        if (li != null) {
                            ListIterator lit = li.listIterator();
                            bean.add_update_delete_student ar = new bean.add_update_delete_student();

                            while (lit.hasNext()) {
                                ar = (bean.add_update_delete_student) lit.next();
            %>
            <tr>
                <td><%=ar.getRoll_no()%></td>
                <td><%=ar.getStudent_name()%></td>
                <td><%=ar.getYear()%></td>
                <td><%=ar.getBranch()%></td>



                <td style="color: black;"><a href="controller/update_student.jsp?roll_no=<%= ar.getRoll_no()%>">Update</a></td>
            </tr>
            <input type="hidden" value="<%=ar.getRoll_no()%>" name="h_roll_no">
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
                } finally {
                    s.flush();
                    s.close();
                }
            %>
        </table>
        </form>




    </body>
</html>
