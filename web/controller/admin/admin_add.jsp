<%-- 
    Document   : admin_registration
    Created on : Dec 18, 2016, 5:17:51 PM
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
        <jsp:useBean id="ar" scope="request" class="bean.Admin">
            <jsp:setProperty name="ar" property="*" />  
        </jsp:useBean>

        <%
            if (request.getParameter("register") != null) {
                if (request.getParameter("password").equals(request.getParameter("c_password"))) {
                    try {
                        System.out.println("------After using Beans-----");
                        String un = ar.getUsername();
                        s = sf.openSession();
                        qr = s.createQuery("select username from bean.Admin");
                        boolean bool = false;
                        String pk = null;
                        List li = qr.list();
                        ListIterator lit = li.listIterator();
                        String str = null;
                        while (lit.hasNext()) {
                            str = (String) lit.next();
                            if (str.equals(ar.getUsername())) {
                                bool = true;
                                System.out.println("------Data Matched-----");
                            }
                        }
                        if (!bool) {
                            System.out.println("-----Under Bool-----");
                            Transaction tr = s.beginTransaction();
                            pk = (String) s.save(ar);
                            un = (String) ar.getUsername();
                            System.out.println("-----Transaction Saved and Session Closed-----" + pk);
                            tr.commit();
                            if (pk.equals(un)) {
                                System.out.println("-----Under Mail-----");
                                response.sendRedirect("../../admin pages/admin_login.jsp?result=-----Admin_Added-----");
                            } else {
                                response.sendRedirect("../../admin pages/admin_registration.jsp?result=-----Something_Went_Wrong-----");
                            }
                        } else {
                            response.sendRedirect("../../admin pages/admin_registration.jsp?result=-----User_Already_Exist_Change_(Username)-----");
                            System.out.println("-----Under Bool Else-----");

                        }
                    } catch (Exception e) {
                        response.sendRedirect("../../admin pages/admin_login.jsp?result=-----Something_Went_Wrong-----");
                        e.printStackTrace();
                    } finally {
                        s.flush();
                        s.close();
                    }
                } else {
                    response.sendRedirect("../../admin pages/admin_registration.jsp?result=-----Password_And_Confirm_Password_Fields_Did_Not_Match-----");
                }
            }
        %>
    </body>
</html>
