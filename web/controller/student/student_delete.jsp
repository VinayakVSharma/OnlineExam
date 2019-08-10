<%-- 
    Document   : student_delete
    Created on : Feb 20, 2017, 8:35:15 PM
    Author     : Vinayak Sharma
--%>

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
        <title>Exam Admin</title>
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


        <%
            
                try {
                    System.out.println("------After using Beans-----");
                    s = sf.openSession();
                    bean.Student al = new bean.Student();
                    al = (bean.Student) s.get(bean.Student.class, request.getParameter("roll_no"));
                    Transaction tr = s.beginTransaction();
                    s.delete(al);
                    response.sendRedirect("../../student pages/student_add_update_delete.jsp?result=-----Student_Deleted-----");
                    System.out.println("------Data Deleted-----");
                    tr.commit();
                    al = null;
                } catch (Exception e) {
                    e.printStackTrace();
                } finally {
                    s.flush();
                    s.close();
                }
            
        %>
    </body>
</html>
