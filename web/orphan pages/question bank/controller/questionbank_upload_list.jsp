<%-- 
    Document   : questionbank_uppload_list
    Created on : Feb 21, 2017, 1:36:06 PM
    Author     : Vinayak Sharma
--%>

<%@page import="java.util.List"%>
<%@page import="Helping_Classes.student_excel_upload"%>
<%@page import="java.io.FileReader"%>
<%@page import=""%>
<%@page import="com.opencsv.CSVReader"%>
<%@page import="org.hibernate.Transaction"%>
<%@page import="Helping_Classes.Session_Factory"%>
<%@page import="org.hibernate.Query"%>
<%@page import="org.hibernate.Session"%>
<%@page import="org.hibernate.SessionFactory"%>
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
            Query qr;
            SessionFactory sf;
            int id;

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
                    String filepath = getServletContext().getRealPath("resources/question bank/" + s1);
                    System.out.println("The path is : " + filepath);
                    if (request.getParameter("file_select").endsWith(".csv")) {

                        CSVReader reader = new CSVReader(new FileReader(filepath));
                        String[] nextLine;

                        while ((nextLine = reader.readNext()) != null) {
                            bean.add_update_delete_question_bank b = new bean.add_update_delete_question_bank();
                            // nextLine[] is an array of values from the line
                            // System.out.println(nextLine[0] + nextLine[1] + "etc...");
                            qr = s.createQuery("select max(q_no) from bean.add_update_delete_question_bank");

                            List l = qr.list();

                            if (l.get(0) == null) {
                                id = 1;
                            } else {
                                id = Integer.parseInt((String) l.get(0)) + 1;
                            }

                            b.setC_name(nextLine[0]);
                            System.out.println(nextLine[0]);
                            b.setC_code(nextLine[1]);
                            System.out.println(nextLine[1]);
                            b.setQ_no(String.valueOf(id));
                            System.out.println(nextLine[2]);
                            b.setQuestion(String.valueOf(id));
                            System.out.println(nextLine[3]);
                            b.setOp1(nextLine[4]);
                            System.out.println(nextLine[4]);
                            b.setOp2(nextLine[4]);
                            System.out.println(nextLine[4]);
                            b.setOp3(nextLine[4]);
                            System.out.println(nextLine[4]);
                            b.setOp4(nextLine[4]);
                            System.out.println(nextLine[4]);
                            b.setC_ans(nextLine[4]);
                            System.out.println(nextLine[4]);
                            s.saveOrUpdate(b);
                            tr.commit();
                            System.out.println("-----Saved-----");

                        }
                        if (nextLine == null) {
                            response.sendRedirect("../question bank pages/questionbank_list_upload.jsp?result=imported");

                        }

                    } else if (request.getParameter("file_select").endsWith(".xls") || request.getParameter("file_select").endsWith(".xlsx")) {

                        System.out.println("Its an Xlsx File");

      
                       // questionbank_excel_upload qbeu = new questionbank_excel_upload(filepath);
                        tr.commit();
                        response.sendRedirect("../question bank pages/questionbank_list_upload.jsp?result=imported");

                    } else {
                        System.out.println("Wrong file Type");
                    }

                } catch (Exception e) {
                    e.printStackTrace();
                } finally {
                    s.flush();
                    s.close();
                }
            }
        %>
    </body>
</html>
