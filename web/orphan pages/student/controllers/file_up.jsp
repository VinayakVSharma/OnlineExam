<%-- 
    Document   : file_up
    Created on : Feb 12, 2017, 11:16:10 AM
    Author     : Vinayak Sharma
--%>

<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="java.util.ListIterator"%>
<%@page import="java.util.List"%>
<%@page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@page import="java.io.File"%>
<%@page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            File f;
            int factsize = 1024 * 1024 * 1024;
            int maxsize = 1024 * 1024 * 1024;
            String reqType = request.getContentType();
            System.out.println(" " + reqType);

            if (reqType.indexOf("multipart/form-data") >= 0) {
                try {
                    DiskFileItemFactory df = new DiskFileItemFactory();
                    df.setSizeThreshold(factsize);
                    df.setRepository(new File("c:\\temp"));

                    ServletFileUpload upload = new ServletFileUpload(df);
                    upload.setSizeMax(maxsize);
                    List fileItems = upload.parseRequest(request);
                    ListIterator lit = fileItems.listIterator();
                    while (lit.hasNext()) {
                        FileItem fi = (FileItem) lit.next();
                        String name = fi.getName();
                        f = new File("C:/Users/swara/Documents/NetBeansProjects/sample_exam/web/resources", name);
                        fi.write(f);
                        out.println("Successfull"+f.getAbsolutePath());
                    }

                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        %>
    </body>
</html>
