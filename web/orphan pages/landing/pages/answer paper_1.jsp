<%-- 
 Document   : answer paper
 Created on : Mar 20, 2017, 4:44:36 AM
 Author     : Vinayak Sharma
 --%>

 <%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@page import="java.util.Collections"%>
 <%@page import="java.util.ArrayList"%>
 <%@page import="org.w3c.dom.NodeList"%>
 <%@page import="java.io.FileWriter"%>
 <%@page import="org.jdom2.output.Format"%>
 <%@page import="org.jdom2.output.XMLOutputter"%>
 <%@page import="java.util.List"%>
 <%@page import="org.jdom2.Element"%>
 <%@page import="org.jdom2.Document"%>
 <%@page import="java.io.File"%>
 <%@page import="org.jdom2.input.SAXBuilder"%>
 <%@page contentType="text/html" pageEncoding="UTF-8"%>
 <!DOCTYPE html>
 <html >
 <div id="divCounter">

 </div>
 <%
 session = request.getSession();
 String tmp = (String) session.getAttribute("duration");
 System.out.println(session.getAttribute("duration"));
 %>
 <script type="text/javascript">
    if (localStorage.getItem("counter")) {
        if (localStorage.getItem("counter") <= 0) {
            var value = <%= tmp%>;
        } else {
            var value = localStorage.getItem("counter");
        }
    } else {
        var value = 0;
    }
    document.getElementById('divCounter').innerHTML = value;

    var counter = function () {
        if (value <= 0) {

            localStorage.setItem("counter", 0);
            value = 0;
            window.location.href = "abc.html";
        } else {
            value = parseInt(value) - 1;
            localStorage.setItem("counter", value);
        }
        document.getElementById('divCounter').innerHTML = value;
        document.getElementById('n').value = value;
    };

    var interval = setInterval(function () {
        counter();
    }, 1000);
</script>

</head>

<body>
    <%!
    private List<Element> studentList;
    private int i = 0;
    public int qs = 0;

    public Element getData(int i, List<Element> studentList) {
        Element element = studentList.get(i);
        return element;
    }

    %>
    <%--Read XML File--%>
    <%

        //System.out.println(session.getAttribute("rl_no"));
    SAXBuilder saxBuilder = new SAXBuilder();
    Context env = (Context)new InitialContext().lookup("java:comp/env"); 
    String path=(String)env.lookup("root_dir");
    File file = new File(path + session.getAttribute("rl_no") + ".xml");
    Document document = saxBuilder.build(file);
    Element rootNode = document.getRootElement();
    List<Element> studentList = rootNode.getChildren("Question");
    Element el = getData(i, studentList);
    try {

    if (request.getParameter("Next") != null) {

    SAXBuilder builder = new SAXBuilder();
    document = builder.build(new File(path + session.getAttribute("rl_no") + ".xml"));
    Element rootElement = document.getRootElement();
    List<Element> Questions = rootElement.getChildren("Question");
        qs = Questions.size();

        for (int temp = 0; temp <= Questions.size() - 1; temp++) {
        Element ques = Questions.get(temp);
        System.out.println(ques.getAttribute("q_no"));
        System.out.println(request.getParameter("q_no"));
        System.out.println(el.getAttributeValue("q_no"));
        int qnum = Integer.parseInt(ques.getAttributeValue("q_no"));
        if ((String.valueOf(qnum)).equals(request.getParameter("q_no"))) {
        Element list = ques.getChild("user_c_ans");

        System.out.println(ques.getChild("user_c_ans") + "C_ANS");
        list.setText(request.getParameter("option"));

        System.out.println("The Size is : " + Questions.size());

    }

}
Element ed = new Element("ExamStatus");
ed.addContent(new Element("timer").setText(request.getParameter("timer")));
XMLOutputter xmlOutputter = new XMLOutputter();
xmlOutputter.output(document, new FileWriter(path + session.getAttribute("rl_no") + ".xml"));
}

} catch (Exception e) {
e.printStackTrace();
}

%>


<input type="text" name="n" value="" id="n">
<form action="" method="POST">          
    Time :- <input type="text" id="kulu" name="timer"/><br> 
    Question No :- <input type="text" name="q_no" value="<%= el.getAttributeValue("q_no")%>" /><br />
    Question :- <input type="text" name="question" value="<%= el.getChildText("question")%>" /> <br />
    Select Right Answer :-<br>
    <input type="radio" name="option" value="<%= el.getChildText("o1")%>" ><%= el.getChildText("op1")%><br>        
    <input type="radio" name="option" value="<%= el.getChildText("o2")%>" ><%= el.getChildText("op2")%><br>
    <input type="radio" name="option" value="<%= el.getChildText("o3")%>" ><%= el.getChildText("op3")%><br>
    <input type="radio" name="option" value="<%= el.getChildText("o4")%>" ><%= el.getChildText("op4")%><br>
    Correct Answer :-
    <input type="text" name="Branch" value="<%= el.getChildText("c_ans")%>" /><br>
    <input type="hidden" name="vali" value="<%= i%>" />

    <input type="submit" name="Next" value="Next" onclick="<%i = i + 1;
    System.out.println("Vali i " + i);%>
    " />
</form> 
</body>

</html>

