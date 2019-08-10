<%-- 
    Document   : admin_image_upload
    Created on : 27 Jun, 2017, 2:27:40 PM
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
        <%!
            public String root = null;
        %>
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
                            root = getServletContext().getRealPath("/img");
                            File path = new File(root);
                            if (!path.exists()) {
                                boolean status = path.mkdirs();
                            }

                            File uploadedFile = new File(path + "/" + fileName);
                            System.out.println(uploadedFile.getAbsolutePath());
                            item.write(uploadedFile);
                        }
                    }
                    response.sendRedirect("../../admin pages/admin_update_picture.jsp?result=-----Image_Uploaded-----");
                } catch (IllegalStateException ise) {
                    ise.printStackTrace();
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }

        %>
    </body>
</html>
