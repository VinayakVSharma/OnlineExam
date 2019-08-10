<%-- 
    Document   : check.jsp
    Created on : 12 Jun, 2017, 3:52:16 PM
    Author     : Vinayak Sharma
    --%>

    <%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@page import="org.jdom2.Element"%>
    <%@page import="org.jdom2.Document"%>
    <%@page import="java.io.File"%>
    <%@page import="org.jdom2.input.SAXBuilder"%>
    <%@page contentType="text/html" pageEncoding="UTF-8"%>
    <!DOCTYPE html>
    <html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
        if (request.getParameter("confirm") == "true") {
        SAXBuilder saxBuilder = new SAXBuilder();
        Context env = (Context)new InitialContext().lookup("java:comp/env"); 
        String path=(String)env.lookup("root_dir");
        File file = new File(path + request.getParameter("roll") + ".xml");
        Document document = saxBuilder.build(file);
        Element rootNode = document.getRootElement();
        if ((rootNode.getChild("ExamStatus").getChildText("status")).equals("Attempted")) {
        %>
        <script type="text/javascript">
            alert("You have Already Given The Examination......!! Cannot Give Again");
            window.location.href = "index.jsp";
        </script>
        <%
    } else {
    session = request.getSession();
    session.setAttribute("rl_no", request.getParameter("roll"));
    %>
    <script type="text/javascript">

        window.location.href = "hall_ticket.jsp ?stat=false&vl=0";
    </script>
    <%
}
}
%>
</body>
</html>
