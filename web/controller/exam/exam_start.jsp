<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@page import="Helping_Classes.GenerateQB"%>
<%@page import="org.hibernate.SQLQuery"%>

<%-- 
Document   : sexam
Created on : 8 Feb, 2017, 4:38:43 PM
Author     : Vinayak Sharma
--%>


<%@page import="java.io.FileWriter"%>
<%@page import="org.jdom2.output.Format"%>
<%@page import="org.jdom2.Attribute"%>
<%@page import="org.jdom2.output.XMLOutputter"%>
<%@page import="org.jdom2.Document"%>
<%@page import="org.jdom2.Element"%>
<%@page import="org.hibernate.Transaction"%>
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
        <title>JSP Page</title>
    </head>
    <body>
        <%!
            Session s;
            Query stud_qr;
            SessionFactory sf;
            GenerateQB qb = new GenerateQB();

            public void jspInit() {
                sf = Session_Factory.getSessionFactory();
            }
        %>
        <%
            try {
                s = sf.openSession();
                bean.Exam e = (bean.Exam) s.get(bean.Exam.class, request.getParameter("ename"));
                System.out.println(e.getEname());
                bean.Subject b = (bean.Subject) s.get(bean.Subject.class, e.getCcode());
                stud_qr = s.createQuery("from bean.Student where branch='" + e.getBranch() + "' and year='" + b.getYear() + "'");
                List studList = stud_qr.list();
                //Genereating QuestionBank
                Element examstud = new Element("Question_Bank");
                Document document = new Document(examstud);
                XMLOutputter xmlOutput = new XMLOutputter();
                ListIterator stud_list_it = studList.listIterator();
                ListIterator Questions = null;
                bean.Student student = null;
                while (stud_list_it.hasNext()) {
                    student = (bean.Student) stud_list_it.next();
                    out.println(student.getRoll_no() + "<br> ");
                    Questions = qb.fetchSpecification(e.getSpecname(), s, qb);
                    qb.createXML(student.getRoll_no(), e, b, Questions, student);
                }
                Element Connection = new Element("Connection");
                Document doc = new Document(Connection);
                XMLOutputter xml = new XMLOutputter();
                xmlOutput.setFormat(Format.getPrettyFormat());
                Context env = (Context) new InitialContext().lookup("java:comp/env");
                String path = (String) env.lookup("root_dir");
                FileWriter fw = new FileWriter(path + "Connection.xml");
                xmlOutput.output(doc, fw);
                fw.close();

            } catch (Exception e) {
            } finally {
                s.close();
                response.sendRedirect("../../connection pages/connection.jsp?result=-----Started-----");
            }

        %>

    </body>
</html>
