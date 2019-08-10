<%-- 
    Document   : questionbank_add
    Created on : Feb 21, 2017, 1:33:32 PM
    Author     : Vinayak Sharma
--%>

<%@page import="org.hibernate.SessionFactory"%>
<%@page import="org.hibernate.Transaction"%>
<%@page import="java.util.ListIterator"%>
<%@page import="java.util.List"%>
<%@page import="Helping_Classes.Session_Factory"%>
<%@page import="org.hibernate.Query"%>
<%@page import="org.hibernate.Session"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%!
            Session s;
            Query qr1, qr2;
            SessionFactory sf;
            int id;

            public void jspInit() {
                sf = Session_Factory.getSessionFactory();
            }
        %>
        <jsp:useBean id="auds" scope="request" class="bean.Question_Bank">
            <jsp:setProperty name="auds" property="*" />  
        </jsp:useBean>
        <%

            if (request.getParameter("add_btn") != null) {
                try {
                    System.out.println("------After using Beans-----");
                    String un = auds.getQ_no();
                    
                    s = sf.openSession();
                    qr1 = s.createQuery("select q_no from bean.Question_Bank");
                    boolean bool = false;
                    String pk = null;
                    List li = qr1.list();
                    ListIterator lit = li.listIterator();
                    String str = null;
                    while (lit.hasNext()) {
                        str = (String) lit.next();
                        if (str.equals(auds.getQ_no())) {
                            bool = true;
                            System.out.println("------Data Matched-----");
                        }
                    }
                    if (!bool) {
                        System.out.println("-----Under Bool-----");
                        Transaction tr = s.beginTransaction();

                        pk = (String) s.save(auds);
                        un = (String) auds.getQ_no();
                        System.out.println("-----Transaction Saved and Session Closed-----" + pk);
                        tr.commit();

                        if (pk.equals(un)) {
                            System.out.println("-----Under Mail-----");
                            response.sendRedirect("../../question bank pages/questionbank_add_update_delete.jsp?result=added new student");
                        } else {
                            response.sendRedirect("../../question bank pages/questionbank_add_update_delete.jsp?result=did not add new student to the lsit");
                        }
                    } else {
                        response.sendRedirect("../../question bank pages/questionbank_add_update_delete.jsp?result=user already exist change (roll_no) ");
                        System.out.println("-----Under Bool Else-----");

                    }
                } catch (Exception e) {
                    response.sendRedirect("../../question bank pages/questionbank_add_update_delete.jsp?result=something went wrong");
                    e.printStackTrace();
                } finally {
                    s.flush();
                    s.close();
                }

            }
        %>