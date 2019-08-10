<%-- 
    Document   : temp_q
    Created on : Feb 22, 2017, 4:03:10 AM
    Author     : Vinayak Sharma
--%>

<%@page import="Helping_Classes.getQ_no"%>
<%@page import="bean.Question_Bank"%>
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
        <title>Exam Admin</title>
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
        <jsp:useBean id="audbq" scope="request" class="bean.Question_Bank">
            <jsp:setProperty name="audbq" property="*" />  
        </jsp:useBean>
        <%
            if (request.getParameter("add_btn") != null) {
                String answer = "";
                if ((request.getParameter("c_ans")).equals("a")) {
                    answer = request.getParameter("op1");
                } else if ((request.getParameter("c_ans")).equals("b")) {
                    answer = request.getParameter("op2");
                } else if ((request.getParameter("c_ans")).equals("c")) {
                    answer = request.getParameter("op3");
                } else {
                    answer = request.getParameter("op4");
                }
                System.out.println(" Check MArks " + request.getParameter("marks"));
                try {
                    s = sf.openSession();
                    getQ_no q = new getQ_no();
                    id=q.qnumber();
                    Transaction tr = s.beginTransaction();
                    audbq.setQ_no(String.valueOf(id));
                    audbq.setC_ans(answer);
                    s.save(audbq);
                    tr.commit();
                    response.sendRedirect("../../question bank pages/questionbank_add_update_delete.jsp?result=-----Question_Added_Successfully-----");

                } catch (Exception e) {
                    response.sendRedirect("../../question bank pages/questionbank_add_update_delete.jsp?result=-----Something_Went_Wrong-----");
                    e.printStackTrace();
                } finally {
                    s.flush();
                    s.close();
                }
            } else {
                response.sendRedirect("../../question bank pages/questionbank_add_update_delete.jsp?result=-----Something_Went_Wrong-----");
            }
        %>