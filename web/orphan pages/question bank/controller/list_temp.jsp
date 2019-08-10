<%-- 
    Document   : list_temp
    Created on : Mar 22, 2017, 4:20:19 PM
    Author     : Vinayak Sharma
--%>
<%@page import="java.io.IOException"%>
<%@page import="org.apache.poi.ss.usermodel.DataFormatter"%>
<%@page import="org.apache.poi.ss.usermodel.Row"%>
<%@page import="java.util.Iterator"%>
<%@page import="org.apache.poi.xssf.usermodel.XSSFSheet"%>
<%@page import="org.apache.poi.xssf.usermodel.XSSFWorkbook"%>
<%@page import="java.io.File"%>
<%@page import="java.io.FileInputStream"%>
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

            public void jspInit() {
                sf = Session_Factory.getSessionFactory();
            }
        %>


        <%
            if (request.getParameter("file_select").endsWith(".xls") || request.getParameter("file_select").endsWith(".xlsx")) {

                System.out.println("Its an Xlsx File");
                // questionbank_excel_upload ql = new questionbank_excel_upload(filepath);
                s = sf.openSession();
                try {
                    System.out.println("-----After Using Beans-----");

                    Transaction tr = s.beginTransaction();
                    String s1 = request.getParameter("file_select");
                    System.out.println("Is the File path " + s1);
                    String filepath = getServletContext().getRealPath("/resources/question bank/" + s1);
                    System.out.println("The path is : " + filepath);

                    FileInputStream file;
                    file = new FileInputStream(new File(filepath));

//Create Workbook instance holding reference to .xlsx file
                    XSSFWorkbook workbook = new XSSFWorkbook(file);

//Get first/desired sheet from the workbook
                    XSSFSheet sheet = workbook.getSheetAt(0);

//Iterate through each rows one by one
                    Iterator<Row> rowIterator = sheet.iterator();
                    qr = s.createQuery("select max(q_no) from bean.Question_Bank");
                    while (rowIterator.hasNext()) {

                        bean.Question_Bank aa1 = new bean.Question_Bank();
                        Row row = rowIterator.next();
//For each row, iterate through all the columns
                        DataFormatter df = new DataFormatter();
//Check the cell type and format accordingly

                        List l = qr.list();

                        if (l.get(0) == null) {
                            id = 1;
                        } else {
                            id = Integer.parseInt((String) l.get(0)) + 1;
                        }

                        String var2 = df.formatCellValue(row.getCell(1));
                        String var3 = df.formatCellValue(row.getCell(2));
                        String var4 = df.formatCellValue(row.getCell(3));
                        String var5 = df.formatCellValue(row.getCell(4));
                        String var6 = df.formatCellValue(row.getCell(5));
                        String var7 = df.formatCellValue(row.getCell(6));
                        String var8 = df.formatCellValue(row.getCell(7));
                        String var9 = df.formatCellValue(row.getCell(8));
                        String var10 = df.formatCellValue(row.getCell(9));
                        String var11 = df.formatCellValue(row.getCell(10));

                        System.out.println(" " + var2 + " " + var3 + " " + var4 + " " + var5 + " " + var6 + " " + var7 + " " + var8 + " " + var9 + " " + var10 + " " + var11);

//Code to save in Database
                        // nextLine[] is an array of values from the line
                        // System.out.println(nextLine[0] + nextLine[1] + "etc...");
                        // s.evict(aa);
                        aa1.setQ_no(String.valueOf(id));
                        aa1.setC_name(var2);
                        aa1.setC_code(var3);
                        aa1.setQuestion(var4);
                        aa1.setOp1(var5);
                        aa1.setOp2(var6);;
                        aa1.setOp3(var7);
                        aa1.setOp4(var8);
                        aa1.setC_ans(var9);
                        aa1.setUnit_no(var10);
                        aa1.setMarks(var11);
                        //  aa1.setUser_c_ans("null");
                        s.saveOrUpdate(aa1);

                        System.out.println("-----Saved-----");

                    }

                    file.close();
                    System.out.println("-----File Closed-----");
                    tr.commit();
                    s.clear();
                    System.out.println("-----Transaction Closed-----");
                    response.sendRedirect("../../question bank pages/questionbank_list_upload.jsp.jsp?result=-----Question_Bank_Uploaded-----");

                } catch (IOException e) {
                    e.printStackTrace();
                } finally {
                    s.flush();
                    s.close();
                }
            } else {
                System.out.println("Wrong file Type");
                response.sendRedirect("../../question bank pages/questionbank_list_upload.jsp.jsp?result=-----Wrong_File_Type-----");
            }

        %>
    </body>
</html>
