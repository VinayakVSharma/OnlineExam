<%-- 
    Document   : eexam
    Created on : 4 May, 2017, 4:36:22 PM
    Author     : Vinayak Sharma
--%>

<%@page import="Helping_Classes.exam_result"%>
<%@page import="java.util.ListIterator"%>
<%@page import="java.util.List"%>
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
                List questionlist = null;
                s = sf.openSession();
                System.out.println(" '" + request.getParameter("maxmarks") + "' ");
                bean.Exam e = (bean.Exam) s.get(bean.Exam.class, request.getParameter("ename"));
                bean.Subject b = (bean.Subject) s.get(bean.Subject.class, e.getCcode());
                qr = s.createQuery("from bean.Student where year='"+b.getYear()+"' and branch='"+e.getBranch()+"'");
                List li = qr.list();
                ListIterator lit = li.listIterator();

                while (lit.hasNext()) {
                    bean.Student student = (bean.Student) lit.next();
                    out.println(student.getRoll_no());
                    exam_result er = new exam_result();
                    er.studentMarks(student.getRoll_no(), s, e);
                    er.exam_question_bank(student.getRoll_no(), e,sf);
                }
                response.sendRedirect("../../Dashboard.html?result=-----Exam_Stopped_&_Database_Uploaded-----");
            } catch (Exception e) {
                e.printStackTrace();
                out.println(e);
            } finally {
                s.close();
            }
        %>
    </body>
</html>
