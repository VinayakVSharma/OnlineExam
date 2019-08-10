<%-- 
    Document   : admin_login
    Created on : Dec 18, 2016, 1:07:02 PM
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
        <jsp:useBean id="al" scope="request" class="bean.Admin">
            <jsp:setProperty name="al" property="*" />  
        </jsp:useBean>

        <%
            try {
                System.out.println("------After using Beans-----");

                String un = al.getUsername();
                s = sf.openSession();
                qr = s.createQuery("select username from bean.Admin");
                boolean bool = false;
                String pk = null;
                List li = qr.list();
                ListIterator lit = li.listIterator();
                String str = null;
                while (lit.hasNext()) {
                    str = (String) lit.next();
                    if (str.equals(al.getUsername())) {
                        bool = true;
                        System.out.println("------Data Matched-----");
                    }
                }
                if (!bool) {
                    response.sendRedirect("../../admin pages/admin_login.jsp?result=-----No_Such_User_Exist-----");
                } else {
                    response.sendRedirect("../../Dashboard.html?result=-----Login_Successfull-----");
                }

            } catch (Exception e) {
                e.printStackTrace();
            } finally {
                s.flush();
                s.close();
            }
        %>
    </body>
</html>
