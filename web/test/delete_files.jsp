<%@page import="java.io.File"%>
<html>
    <head>
        <title>File Uploading Form</title>
    </head>

    <body>
        <h3>File Upload:</h3>
        Select a file to upload: <br />
        <form action = "">
            <input type = "text" name = "file" />
            <br />
            <input type = "submit" value = "Upload File" name="submit"/>
        </form>
        <%
            if (request.getParameter("submit") != null) {
                String path = request.getParameter("file");
                String file = path;
                File f = new File(file);
                f.delete();
               /* String[] fileNames = f.list();
                File[] fileObjects = f.listFiles();
                for (int i = 0; i < fileObjects.length; i++) {
                    f.delete();
                    if (!fileObjects[i].isDirectory()) {
                        String fname = file + fileNames[i];
                        fileObjects[i].delete();
                        out.println(fileNames[i]);
                    }
                }*/

            }
        %>
    </body>
    <%

    %>
</html>
