<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- 
    Document   : admin_details_update
    Created on : Dec 23, 2016, 1:17:50 AM
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
                bean.Admin al = new bean.Admin();
                al = (bean.Admin) s.get(bean.Admin.class, request.getParameter("username"));
                Transaction tr = s.beginTransaction();
                s.delete(al);
                response.sendRedirect("../../admin pages/admin_display.jsp?result=-----Admin_Deleted-----");
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
