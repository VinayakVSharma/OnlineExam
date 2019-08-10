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
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%!
            private List<Element> studentList;
            private int i = 0;
            private int qs;

            public Element getData(int i, List<Element> studentList) {
                Element element = studentList.get(i);
                return element;
            }
        %>
        <%--Read XML File--%>
        <%

            SAXBuilder saxBuilder = new SAXBuilder();
            Context env = (Context) new InitialContext().lookup("java:comp/env");
            String path = (String) env.lookup("root_dir");
            File file = new File(path + "145101.xml");
            Document document = saxBuilder.build(file);
            Element rootNode = document.getRootElement();
            List<Element> studentList = rootNode.getChildren("Question");
            Element el = getData(i, studentList);


        %>
        <%            try {

                if (request.getParameter("Next") != null) {

                    SAXBuilder builder = new SAXBuilder();
                    document = builder.build(new File(path + "145101.xml"));
                    Element rootElement = document.getRootElement();

                    List<Element> Questions = rootElement.getChildren("Question");
                    System.out.println("SIze IS " + Questions.size());
                    qs = Questions.size();
                    for (int temp = 0; temp < Questions.size() - 1; temp++) {
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

                    XMLOutputter xmlOutputter = new XMLOutputter();
                    xmlOutputter.output(document, new FileWriter(path + "145101.xml"));
                }
            } catch (Exception e) {
                e.printStackTrace();
            }

        %>



        <form action="" method="POST">
            Question No :- <input type="text" name="q_no" value="<%= el.getAttributeValue("q_no")%>" /><br />
            Question :- <input type="text" name="question" value="<%= el.getChildText("question")%>" /> <br />
            Select Right Answer :-<br>
            <input type="radio" name="option" value="<%= el.getChildText("op1")%>" ><%= el.getChildText("op1")%><br>        
            <input type="radio" name="option" value="<%= el.getChildText("op2")%>" ><%= el.getChildText("op2")%><br>
            <input type="radio" name="option" value="<%= el.getChildText("op3")%>" ><%= el.getChildText("op3")%><br>
            <input type="radio" name="option" value="<%= el.getChildText("op4")%>" ><%= el.getChildText("op4")%><br>
            Correct Answer :-
            <input type="text" name="Branch" value="<%= el.getChildText("c_ans")%>" /><br>
            <input type="hidden" name="vali" value="<%= i%>" />

            <%
                System.out.println(qs);
                if (i < qs - 1) {

                    out.println("<input type=\"submit\" name=\"Next\" value=\"Next\" onclick=\" " + (i = i + 1) + "\" />");

                    System.out.println("<input type=\"submit\" name=\"Next\" value=\"Next\" onclick=\" " + (i = i + 1) + "\" />");
                } else {
                    out.println("<input type=\"submit\" name=\"Next\" value=\"Next\" onclick=\"this.form.action='abc.html' \" />");
                }
            %>


        </form>


    </body>
</html>

