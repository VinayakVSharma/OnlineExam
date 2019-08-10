<%-- 
    Document   : upload_list
    Created on : Feb 20, 2017, 8:26:22 PM
    Author     : Vinayak Sharma
--%>

<%@page import="Helping_Classes.student_excel_upload"%>
<%@page import="java.io.FileReader"%>
<%@page import="Helping_Classes.student_excel_upload"%>
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
            if (request.getParameter("upload_list_btn") != null) {
                try {
                    System.out.println("-----After Using Beans-----");
                    s = sf.openSession();
                    
                    String s1 = request.getParameter("file_select");
                    System.out.println("Is the File path " + s1);
                    String filepath = getServletContext().getRealPath("/resources/" + s1);
                    System.out.println(filepath);

                    if (request.getParameter("file_select").endsWith(".csv")) {
                        CSVReader reader = new CSVReader(new FileReader(filepath));
                        String[] nextLine;
                        Transaction tr = s.beginTransaction();
                        while ((nextLine = reader.readNext()) != null) {
                            bean.Student auds1 = new bean.Student();
                            //    nextLine[] is an array of values from the line
                            //  System.out.println(nextLine[0] + nextLine[1] + "etc...");
                            auds1.setStudent_name(nextLine[0]);
                            System.out.println(nextLine[0]);
                            auds1.setRoll_no(nextLine[1]);
                            System.out.println(nextLine[1]);
                            auds1.setBranch(nextLine[2]);
                            System.out.println(nextLine[2]);
                            auds1.setYear(nextLine[3]);
                            System.out.println(nextLine[3]);
                            auds1.setDob(nextLine[4]);
                            System.out.println(nextLine[4]);
                            s.saveOrUpdate(auds1);
                            
                            System.out.println("-----Saved-----");
                            
                        }
                        tr.commit();
                        if (nextLine == null) {
                            response.sendRedirect("../../student pages/student_list_upload.jsp?result=-----Student_List_Imported-----");

                        }

                    } else if (request.getParameter("file_select").endsWith(".xls") || request.getParameter("file_select").endsWith(".xlsx")) {
                        System.out.println("Its an Xlsx File");
                        student_excel_upload seu = new student_excel_upload(filepath);
                        response.sendRedirect("../../student pages/student_list_upload.jsp?result=-----Student_List_Imported-----");
                    } else {
                        response.sendRedirect("../../student pages/student_list_upload.jsp?result=-----Wrong_File_Type-----");
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
