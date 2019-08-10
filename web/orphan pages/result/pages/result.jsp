<%-- 
    Document   : index
    Created on : 14 Jan, 2017, 2:12:32 PM
    Author     : Vinayak Sharma
    --%>

    <%@page import="javax.naming.Context"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="org.jdom2.JDOMException"%>
    <%@page import="org.jdom2.Attribute"%>
    <%@page import="java.io.IOException"%>
    <%@page import="org.jdom2.output.Format"%>
    <%@page import="java.io.File"%>
    <%@page import="org.jdom2.Document"%>
    <%@page import="org.jdom2.input.SAXBuilder"%>
    <%@page import="java.util.List"%>
    <%@page import="java.io.FileWriter"%>
    <%@page import="org.jdom2.Element"%>
    <%@page import="org.jdom2.output.XMLOutputter"%>
    <%@page contentType="text/html" pageEncoding="UTF-8"%>
    <!DOCTYPE html>
    <html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
        session = request.getSession();
        SAXBuilder saxBuilder = new SAXBuilder();
        Context env = (Context)new InitialContext().lookup("java:comp/env"); 
        String path=(String)env.lookup("root_dir");

            // obtain file object 
        File file = new File(path+"marks.xml");

        try {
                // converted file to document object
                Document document = saxBuilder.build(file);

                // get root node from xml
                Element rootNode = document.getRootElement();

                // got all xml elements into a list
                List<Element> studentList = rootNode.getChildren("ques");
                    int cnt = 0, a = 0, c = 0, na = 0;
                // simple iteration to see the result on console
                for (int i = 0; i <= studentList.size() - 1; i++) {
                Element element = studentList.get(i);
                System.out.println("First Name : " + element.getChildText("ans"));
                System.out.println("Last Name : " + element.getChildText("uans"));
                System.out.println("Email : " + element.getChildText("m"));
                if ((element.getChildText("uans")).equals(element.getChildText("ans"))) {
                cnt = cnt + Integer.parseInt(element.getChildText("m"));
                a++;
            }
            if (element.getChildText("uans") != null) {
            na++;
        }
        c++;
    }
    System.out.println("The result is Total Questions:" + studentList.size() + "Result:  " + cnt + " Attempted Questions:" + na + "Unattempted: " + (c - na) + " Correct: " + a);
} catch (JDOMException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            } catch (IOException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            } finally {
            session.invalidate();
        }

        %>
    </body>
    </html>
