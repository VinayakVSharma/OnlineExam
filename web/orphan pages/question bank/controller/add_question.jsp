<%-- 
    Document   : add_question
    Created on : Jan 31, 2017, 9:12:34 PM
    Author     : Vinayak Sharma
--%>

<%@page import="Helping_Classes.xlsxextract"%>
<%@page import="com.opencsv.CSVReader"%>
<%@page import="java.nio.file.Paths"%>
<%@page import="java.io.InputStream"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="Helping_Classes.Session_Factory"%>
<%@page import="org.hibernate.SessionFactory"%>
<%@page import="org.hibernate.Query"%>
<%@page import="org.hibernate.Session"%>
<%@page import="org.hibernate.Transaction"%>
<%@page import="java.util.ListIterator"%>
<%@page import="java.util.List"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="java.io.FileNotFoundException"%>
<%@page import="java.io.FileReader"%>
<%@page import="java.io.IOException"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.io.FileReader"%>
<%@page import="java.io.FileWriter"%>
<%@page import="java.io.IOException"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import=" java.io.BufferedReader"%>
<%@page import="java.io.FileNotFoundException"%>
<%@page import="java.io.FileReader"%>
<%@page import="java.io.IOException"%>
<%@page import="java.util.ArrayList"%>

<%@page import="bean.add_update_delete_question_bank"%>
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
        <jsp:useBean id="auds" scope="request" class="bean.add_update_delete_question_bank">
            <jsp:setProperty name="auds" property="*" />  
        </jsp:useBean>
        <%

            if (request.getParameter("add_btn") != null) {
                try {
                    System.out.println("------After using Beans-----");
                    String un = auds.getQ_no();
                    s = sf.openSession();
                    qr1 = s.createQuery("select q_no from bean.add_update_delete_question_bank");
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
                            response.sendRedirect("../question bank pages/add_update_delete_question_bank.jsp?result=added new student");
                        } else {
                            response.sendRedirect("../question bank pages/add_update_delete_question_bank.jsp?result=did not add new student to the lsit");
                        }
                    } else {
                        response.sendRedirect("../question bank pages/add_update_delete_question_bank.jsp?result=user already exist change (roll_no) ");
                        System.out.println("-----Under Bool Else-----");

                    }
                } catch (Exception e) {
                    response.sendRedirect("../question bank pages/add_update_delete_question_bank.jsp?result=something went wrong");
                    e.printStackTrace();
                } finally {
                    s.flush();
                    s.close();
                }

            }
        %>
        <%
            if (request.getParameter("btn2") != null) {
                try {
                    System.out.println("-----After Using Beans-----");
                    s = sf.openSession();
                    Transaction tr = s.beginTransaction();
                    String s1 = request.getParameter("file_select");
                    System.out.println("Is the File path " + s1);
                    String filepath = getServletContext().getRealPath("resources/" + s1);
                    System.out.println(filepath);

                    if (request.getParameter("file_select").endsWith(".csv")) {
                        CSVReader reader = new CSVReader(new FileReader(filepath));
                        String[] nextLine;

                        s = sf.openSession();
                        qr2 = s.createQuery("select max(q_no) from bean.add_update_delete_question_bank");

                        List l = qr2.list();

                        if (l.get(0) == null) {
                            id = 1;
                        } else {
                            id = Integer.parseInt((String) l.get(0)) + 1;
                        }

                        while ((nextLine = reader.readNext()) != null) {
                            bean.add_update_delete_question_bank b = new bean.add_update_delete_question_bank();
                            // nextLine[] is an array of values from the line
                            // System.out.println(nextLine[0] + nextLine[1] + "etc...");

                            b.setC_name(nextLine[0]);
                            System.out.println(nextLine[0]);
                            b.setC_code(nextLine[1]);
                            System.out.println(nextLine[1]);
                            b.setQ_no(String.valueOf(id));
                            System.out.println(nextLine[2]);
                            b.setQuestion(nextLine[3]);
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
                            System.out.println("-----Saved-----");

                        }
                        if (nextLine == null) {
                            response.sendRedirect("../question bank pages/add_update_delete_question_bank.html?result=imported");

                        }

                    } else if (request.getParameter("file_select").endsWith(".xls") || request.getParameter("file_select").endsWith(".xlsx")) {
                        System.out.println("Its an Xlsx File");
                        xlsxextract x = new xlsxextract(filepath);

                    } else {
                        System.out.println("Wrong file Type");
                    }
                    tr.commit();
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
