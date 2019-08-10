<%-- 
    Document   : subjec_delete
    Created on : Mar 10, 2017, 12:06:20 PM
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
        <title>EXAM</title>
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
                    bean.Subject al = new bean.Subject();
                    al = (bean.Subject) s.get(bean.Subject.class, request.getParameter("c_code"));
                    Transaction tr = s.beginTransaction();
                    s.delete(al);
                    response.sendRedirect("../../subject pages/subject_add_update_delete.jsp?result=-----Subject_Deleted-----");
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
