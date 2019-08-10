<%-- 
    Document   : result_calculate
    Created on : 27 Mar, 2017, 9:21:41 PM
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
    <%@page import="Helping_Classes.Session_Factory"%>
    <%@page import="org.hibernate.SessionFactory"%>
    <%@page import="org.hibernate.Query"%>
    <%@page import="org.hibernate.Session"%>
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
        private int i;

        bean.Exam e = new bean.Exam();

        public Element getData(int i, List<Element> studentList) {
            Element element = studentList.get(i);
            return element;
        }

        Session s;
        Query qr;
        SessionFactory sf;

        public void jspInit() {
        sf = Session_Factory.getSessionFactory();
    }
    %>

    <%--Read XML File--%>   
    <%

    SAXBuilder saxBuilder = new SAXBuilder();
    Context env = (Context)new InitialContext().lookup("java:comp/env"); 
    String path=(String)env.lookup("root_dir");
    File file = new File(path+"145101.xml");
    Document document = saxBuilder.build(file);
    Element rootNode = document.getRootElement();
    List<Element> studentList = rootNode.getChildren("Question");
    Element el = getData(i, studentList);


    %>
    <%            List<Element> Questions = null;
    try {
    s = sf.openSession();
    session = request.getSession();
    SAXBuilder builder = new SAXBuilder();
    document = builder.build(new File(path + session.getAttribute("rl_no") + ".xml"));
    Element rootElement = document.getRootElement();
    Questions = rootElement.getChildren("Question");
    int cnt = 0, a = 0, c = 0, na = 0;
                // simple iteration to see the result on console
                for (int i = 0; i <= Questions.size() - 1; i++) {
                Element element = Questions.get(i);
                System.out.println("User Correct Answer : " + element.getChildText("user_c_ans"));
                System.out.println("Correct Answer : " + element.getChildText("c_ans"));
                System.out.println("Marks : " + element.getChildText("marks"));
                if ((element.getChildText("user_c_ans")).equals(element.getChildText("c_ans"))) {
                cnt = cnt + Integer.parseInt(element.getChildText("marks"));
                a++;
            }
            if (element.getChildText("user_c_ans") != null) {
            na++;
        }
        c++;
    }

    System.out.println("The result is Total Questions:" + studentList.size() + "Result:  " + cnt + " Attempted Questions:" + na + "Unattempted: " + (c - na) + " Correct: " + a);
    Element ed = new Element("Exam_Details");
                // ed.addContent(new Element("result").setText(String.valueOf(cnt)));
                ed.addContent(new Element("result").setText(String.valueOf(cnt)));
                document.getRootElement().addContent(ed);

                XMLOutputter xmlOutput = new XMLOutputter();

                xmlOutput.setFormat(Format.getPrettyFormat());
                FileWriter fw = new FileWriter(path + session.getAttribute("rl_no") + ".xml");
                xmlOutput.output(document, fw);
                fw.close();

            } catch (Exception e) {
            e.printStackTrace();
        }

        %>


    </body>
    </html>