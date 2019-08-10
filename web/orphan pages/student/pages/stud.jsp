<html>
   <head>
      <title>File Uploading Form</title>
   </head>
   
   <body>
      <h3>File Upload:</h3>
      Select a file to upload: <br />
      <form action = "../controller/student/t_fup.jsp" method = "post"
         enctype = "multipart/form-data">
         <input type = "file" name = "file" size = "50" multiple="multiple" />
         <br />
         <input type = "submit" value = "Upload File" />
      </form>
   </body>
   
</html>