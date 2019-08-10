<%-- 
    Document   : list_ new
    Created on : Mar 22, 2017, 9:32:40 PM
    Author     : Vinayak Sharma
--%>

<%@page import="Helping_Classes.questionbank_excel_upload"%>
<%@page import="java.util.List"%>
<%@page import="Helping_Classes.student_excel_upload"%>
<%@page import="java.io.FileReader"%>
<%@page import="com.opencsv.CSVReader"%>
<%@page import="org.hibernate.Transaction"%>
<%@page import="Helping_Classes.Session_Factory"%>
<%@page import="org.hibernate.Query"%>
<%@page import="org.hibernate.Session"%>
<%@page import="org.hibernate.SessionFactory"%>
<%@page import="org.apache.xmlbeans.*"%>
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
            int id;
            public String filepath;

            public void jspInit() {
                sf = Session_Factory.getSessionFactory();
            }
        %>

        <%
            if (request.getParameter("upload_list_btn") != null) {
                try {
                    System.out.println("-----After Using Beans-----");
                    s = sf.openSession();
                    Transaction tr = s.beginTransaction();
                    String s1 = request.getParameter("file_select");
                    System.out.println("Is the File path " + s1);
                    filepath = getServletContext().getRealPath("/resources/question bank/" + s1);
                    System.out.println("The path is : " + filepath);

                    if (request.getParameter("file_select").endsWith(".csv")) {

                        CSVReader reader = new CSVReader(new FileReader(filepath));
                        String[] nextLine;

                        while ((nextLine = reader.readNext()) != null) {
                            bean.Question_Bank b = new bean.Question_Bank();
                            // nextLine[] is an array of values from the line
                            // System.out.println(nextLine[0] + nextLine[1] + "etc...");
                            qr = s.createQuery("select max(q_no) from bean.Question_Bank");

                            List l = qr.list();

                            if (l.get(0) == null) {
                                id = 1;
                            } else {
                                id = Integer.parseInt((String) l.get(0)) + 1;
                            }
                            b.setQ_no(String.valueOf(id));
                            System.out.println(id);
                            b.setC_code(nextLine[1]);
                            System.out.println(nextLine[1]);
                            b.setC_name(nextLine[2]);
                            System.out.println(nextLine[2]);
                            b.setQuestion(nextLine[3]);
                            System.out.println(nextLine[3]);
                            b.setOp1(nextLine[4]);
                            System.out.println(nextLine[4]);
                            b.setOp2(nextLine[5]);
                            System.out.println(nextLine[5]);
                            b.setOp3(nextLine[6]);
                            System.out.println(nextLine[6]);
                            b.setOp4(nextLine[7]);
                            System.out.println(nextLine[7]);
                            b.setC_ans(nextLine[8]);
                            System.out.println(nextLine[8]);
                            b.setUnit_no(nextLine[9]);
                            System.out.println(nextLine[9]);
                            b.setMarks(nextLine[10]);
                            System.out.println(nextLine[10]);
                            s.saveOrUpdate(b);
                            tr.commit();
                            System.out.println("-----Saved-----");

                        }
                        if (nextLine == null) {
                            response.sendRedirect("../question bank pages/questionbank_list_upload.jsp?result=-----Question_Bank_Uploaded-----");
                        }

                    } else if (request.getParameter("file_select").endsWith(".xls") || request.getParameter("file_select").endsWith(".xlsx")) {

                        System.out.println("Its an Xlsx File");
                        questionbank_excel_upload ql = new questionbank_excel_upload(filepath);
                        tr.commit();
                        response.sendRedirect("../../question bank pages/questionbank_list_upload.jsp?result=-----Question_Bank_Uploaded-----");

                    } else {
                        response.sendRedirect("../../question bank pages/questionbank_list_upload.jsp?result=-----Wrong_File_Type-----");
                    }

                } catch (Exception e) {
                    e.printStackTrace();
                } finally {
                    s.flush();
                    s.close();
                }
            } else {
                response.sendRedirect("../../question bank pages/questionbank_list_upload.jsp.jsp?result=-----Something_Went_Wrong-----");
            }
        %>
    </body>
</html>

