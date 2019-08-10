<%-- 
    Document   : startexam
    Created on : 8 Feb, 2017, 4:07:05 PM
    Author     : Vinayak Sharma
--%>

<%@page import="java.util.ListIterator"%>
<%@page import="java.util.List"%>
<%@page import="org.hibernate.Query"%>
<%@page import="org.hibernate.SessionFactory"%>
<%@page import="Helping_Classes.Session_Factory"%>
<%@page import="org.hibernate.Session"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
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

        <table border="1px">
            <tr>
                <td>Exam Name</td>
            </tr>
            <%
                s = sf.openSession();
                qr = s.createQuery("from bean.Exam");

                if (qr != null) {
                    List li = qr.list();
                    if (li != null) {
                        ListIterator lit = li.listIterator();
                        bean.Exam ar = new bean.Exam();
                        while (lit.hasNext()) {
                            ar = (bean.Exam) lit.next();
                   %>
                   <tr>
                       <td><%= ar.getEname() %></td>
                       <td> <a href="../controller/exam/sexam.jsp?ename=<%= ar.getEname() %>"> Start</a></td>
                   </tr>
                   <%
                       
                        }
                    }
                }


            %>

        </table>

    </body>
</html>
