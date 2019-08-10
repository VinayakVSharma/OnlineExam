<%-- 
    Document   : student_add
    Created on : Feb 20, 2017, 8:29:57 PM
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
        <jsp:useBean id="auds" scope="request" class="bean.Student">
            <jsp:setProperty name="auds" property="*" />  
        </jsp:useBean>
        <%

            if (request.getParameter("add_btn") != null) {
                try {
                    System.out.println("------After using Beans-----");
                    String un = auds.getRoll_no();
                    s = sf.openSession();
                    qr = s.createQuery("select roll_no from bean.Student");
                    boolean bool = false;
                    String pk = null;
                    List li = qr.list();
                    ListIterator lit = li.listIterator();
                    String str = null;
                    while (lit.hasNext()) {
                        str = (String) lit.next();
                        if (str.equals(auds.getRoll_no())) {
                            bool = true;
                            System.out.println("------Data Matched-----");
                        }
                    }
                    if (!bool) {
                        System.out.println("-----Under Bool-----");
                        Transaction tr = s.beginTransaction();
                        String date = request.getParameter("add_dob");
                        System.out.println("date is : " + date);
                        pk = (String) s.save(auds);
                        un = (String) auds.getRoll_no();
                        System.out.println("-----Transaction Saved and Session Closed-----" + pk);
                        tr.commit();
                        if (pk.equals(un)) {
                            System.out.println("-----Under Roll No-----");
                            if (request.getParameter("dynordb").equals("yes")) {
                                response.sendRedirect("../../exam pages/start_exam_single_student.jsp?roll= " + request.getParameter("roll_no") + "-----");
                            } else {
                                response.sendRedirect("../../student pages/student_add_update_delete.jsp?result=-----Added_Roll_No_=_" + request.getParameter("roll_no") + "-----");
                            }

                        } else {
                            response.sendRedirect("../../student pages/student_add_update_delete.jsp?result=-----Did_Not_Add-----");
                        }
                    } else {
                        response.sendRedirect("../../student pages/lstudent_add_update_delete.jsp?result=-----Student_Already_Exist----- ");
                        System.out.println("-----Under Bool Else-----");

                    }
                } catch (Exception e) {
                    response.sendRedirect("../../student pages/student_add_update_delete.jsp?result=-----Something_Went_Wrong-----");
                    e.printStackTrace();
                } finally {
                    s.flush();
                    s.close();
                }
            } else {
                response.sendRedirect("../../student pages/student_add_update_delete.jsp?result=-----Something_Went_Wrong-----");

            }
        %>

    </body>
</html>
