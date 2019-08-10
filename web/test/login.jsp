<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@page import="get.GetQue"%>
<%@page import="java.util.List"%>
<%@page import="org.jdom2.Element"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>JSP Page</title>  

</head>
<body>
    <%!
    HttpSession session;

    %>
    <%
    session = request.getSession();
    String clock = request.getParameter("clock");
    if (clock == null) {
    System.out.println();
    clock = (String) session.getAttribute("timer");
}
%>
<!-- Declaration Started -->
<%!            GetQue g = new GetQue();
List<Element> q = null;

%>
<!-- Declaration Ended -->


<!-- Start of Code -->        
<%
int i = Integer.parseInt(request.getParameter("vl"));
Context env = (Context)new InitialContext().lookup("java:comp/env"); 
String path=(String)env.lookup("root_dir");
q = g.getQue(path + session.getAttribute("rl_no") + ".xml");
Element e = g.que(q, i);
out.println(request.getParameter("stat"));

if (request.getParameter("stat").equals("true")) {

g.saveA(request.getParameter("option"), Integer.parseInt(request.getParameter("q_no")), path + session.getAttribute("rl_no") + ".xml", clock);
}

%>

<form method="POST" name="forma">
    Seconds remaining: <input type="text" name="clock" value="<%=clock%>" style="border:0px solid white" hidden>
    <input type="text" name="clock1" value="<%=clock%>" style="border:0px solid white">
    Question No:<input type="text" name="q_no" value="<%= e.getAttributeValue("q_no")%>" /> <br />
    Question :- <input type="text" name="question" value="<%= e.getChildText("question")%>" /> <br />
    Select Right Answer :-<br>
    <%
    if (e.getChildText("user_c_ans").equals(e.getChildText("op1"))) {
    %>
    <input type="radio" name="option" value="<%= e.getChildText("op1")%>" checked ><%= e.getChildText("op1")%><br>        

    <%
} else {
%>
<input type="radio" name="option" value="<%= e.getChildText("op1")%>"><%= e.getChildText("op1")%><br>        

<%
}
%>

<%
if (e.getChildText("user_c_ans").equals(e.getChildText("op2"))) {
%>
<input type="radio" name="option" value="<%= e.getChildText("op2")%>" checked ><%= e.getChildText("op2")%><br>        

<%
} else {
%>
<input type="radio" name="option" value="<%= e.getChildText("op2")%>"><%= e.getChildText("op2")%><br>        

<%
}
%>

<%
if (e.getChildText("user_c_ans").equals(e.getChildText("op3"))) {
%>
<input type="radio" name="option" value="<%= e.getChildText("op3")%>" checked ><%= e.getChildText("op3")%><br>        

<%
} else {
%>
<input type="radio" name="option" value="<%= e.getChildText("op3")%>"><%= e.getChildText("op3")%><br>        

<%
}
%>

<%
if (e.getChildText("user_c_ans").equals(e.getChildText("op4"))) {
%>
<input type="radio" name="option" value="<%= e.getChildText("op4")%>" checked ><%= e.getChildText("op4")%><br>        

<%
} else {
%>
<input type="radio" name="option" value="<%= e.getChildText("op4")%>"><%= e.getChildText("op4")%><br>        

<%
}
%>



<%
if (i > 0) {
%>
<input type="submit" value="Previous" name="ext" onclick="this.form.action = 'ind.jsp?stat=true&vl=<%= i - 1%>'" />
<%
}
%>
<%
if (i < q.size() - 1) {
%>
<input type="submit" value="Next" name="ext" onclick="this.form.action = 'ind.jsp?stat=true&vl=<%= i + 1%>'" />
<%
}
%>
<input type="submit" value="Summary" name="Summary" onclick="this.form.action = 'summary.jsp?vl=<%= i%> '" />

</form>

<script>


    var timeout = <%=clock%>;
    function timer()
    {
        if (--timeout > 0)
        {
            document.forma.clock.value = timeout;
            document.forma.clock1.value = parseInt(timeout / 60) + ":" + timeout % 60;
            window.setTimeout("timer()", 1000);
        } else
        {
            document.forma.clock.value = "Time over";
                    ///disable submit-button etc
                    var vl =<%= request.getParameter("vl")%>;
                    window.location.href = "summary.jsp?vl=" + vl + "&option=" + document.forma.option.value;
                }
            }

        </script>

        <script>

            timer();

        </script>
    </body>
    </html>
