<%-- 
    Document   : questionbank_delete
    Created on : Feb 21, 2017, 1:35:39 PM
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
                    bean.Question_Bank al = new bean.Question_Bank();
                    al = (bean.Question_Bank) s.get(bean.Question_Bank.class, request.getParameter("q_no"));
                    Transaction tr = s.beginTransaction();
                    s.delete(al);
                    response.sendRedirect("../../question bank pages/questionbank_add_update_delete.jsp?result=-----Question_Deleted-----");
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
