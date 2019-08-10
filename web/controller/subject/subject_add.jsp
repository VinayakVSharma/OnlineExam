<%-- 
    Document   : student_add.jsp
    Created on : Mar 10, 2017, 11:55:11 AM
    Author     : Vinayak Sharma
--%>

<%@page import="java.util.ListIterator"%>
<%@page import="java.util.List"%>
<%@page import="org.hibernate.Transaction"%>
<%@page import="Helping_Classes.Session_Factory"%>
<%@page import="org.hibernate.Session"%>
<%@page import="org.hibernate.SessionFactory"%>
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
        <jsp:useBean id="auds" scope="request" class="bean.Subject">
            <jsp:setProperty name="auds" property="*" />  
        </jsp:useBean>
        <%

            if (request.getParameter("add_btn") != null) {
                try {
                    System.out.println("------After using Beans-----");
                    String un = auds.getC_code();
                    s = sf.openSession();
                    qr = s.createQuery("select c_code from bean.Subject");
                    boolean bool = false;
                    String pk = null;
                    List li = qr.list();
                    ListIterator lit = li.listIterator();
                    String str = null;
                    while (lit.hasNext()) {
                        str = (String) lit.next();
                        if (str.equals(auds.getC_code())) {
                            bool = true;
                            System.out.println("------Data Matched-----");
                        }
                    }
                    if (!bool) {
                        System.out.println("-----Under Bool-----");
                        Transaction tr = s.beginTransaction();
                        pk = (String) s.save(auds);
                        un = (String) auds.getC_code();
                        System.out.println("-----Transaction Saved and Session Closed-----" + pk);
                        tr.commit();
                        if (pk.equals(un)) {
                            System.out.println("-----Under Course Code-----");
                            response.sendRedirect("../../subject pages/subject_add_update_delete.jsp?result=-----Added_Subject_=_" + request.getParameter("c_code") + "-----");

                        } else {
                            response.sendRedirect("../../subject pages/subject_add_update_delete.jsp?result=-----Did_Not_Add-----");
                        }
                    } else {
                        response.sendRedirect("../../subject pages/subject_add_update_delete.jsp?result=-----Subject_Already_Exist-----");
                        System.out.println("-----Under Bool Else-----");

                    }
                } catch (Exception e) {
                    response.sendRedirect("../../subject pages/subject_add_update_delete.jsp?result=-----Something_Went_Wrong-----");
                    e.printStackTrace();
                } finally {
                    s.flush();
                    s.close();
                }
            } else {
                response.sendRedirect("../../subject pages/subject_add_update_delete.jsp?result=-----Something Went Wrong-----");
            }
        %>

    </body>
</html>
