<%-- 
    Document   : questionbank_file_upload
    Created on : Feb 21, 2017, 1:35:52 PM
    Author     : Vinayak Sharma
--%>

<%@page import="java.io.File"%>
<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@page import="org.apache.commons.fileupload.FileItemFactory"%>
<%@page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Exam Admin</title>
    </head>
    <body>
        <%
            boolean isMultipart = ServletFileUpload.isMultipartContent(request);

            if (isMultipart) {  
                FileItemFactory factory = new DiskFileItemFactory();
                ServletFileUpload upload = new ServletFileUpload(factory);

                try {
                    List items = upload.parseRequest(request);
                    Iterator iterator = items.iterator();
                    while (iterator.hasNext()) {
                        FileItem item = (FileItem) iterator.next();

                        if (!item.isFormField()) {
                            String fileName = item.getName();

                            String root = getServletContext().getRealPath("/resources/question bank");
                            File path = new File(root);
                            if (!path.exists()) {
                                boolean status = path.mkdirs();
                            }

                            File uploadedFile = new File(path + "/" + fileName);
                            System.out.println(uploadedFile.getAbsolutePath());
                            item.write(uploadedFile);

                            

                        }
                    }
                    response.sendRedirect("../../question bank pages/questionbank_file_upload.jsp?result=-----File_Uploaded_In_Question_Bank_Folder-----");
                } catch (IllegalStateException ise) {
                    ise.printStackTrace();
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
            else{
            response.sendRedirect("../../question bank pages/questionbank_file_upload.jsp?result=-----Something_Went_Wrong-----");
                
            }
        %>
    </body>
</html>
