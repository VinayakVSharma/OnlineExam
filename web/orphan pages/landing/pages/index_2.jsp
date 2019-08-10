<%-- 
    Document   : index
    Created on : 14 Jan, 2017, 2:12:32 PM
    Author     : Vinayak Sharma
    --%>

    <%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
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
        
        <form action="" method="POST">
            Enter Password For End Exam:   <input type="text" name="eepass" value="" />
            <br>
            Enter Roll No:   <input type="text" name="roll" value="" />

            <input type="submit" value="End Exam" name="eesub" />
        </form>
        
        <%
        session = request.getSession();
        System.out.println(session.getAttribute("rl_no"));
        if (request.getParameter("eesub") != null) {
        try {
        int cnt = 0, a = 0, c = 0, na = 0;
        SAXBuilder saxBuilder = new SAXBuilder();
        Context env = (Context)new InitialContext().lookup("java:comp/env"); 
        String path=(String)env.lookup("root_dir");

                    // obtain file object 
                    File file = new File(path + session.getAttribute("rl_no") + ".xml");

                    // converted file to document object
                    Document document = saxBuilder.build(file);

                    // get root node from xml
                    Element rootNode = document.getRootElement();

                    // got all xml elements into a list
                    List<Element> studentList = rootNode.getChildren("Question");

                    // simple iteration to see the result on console
                    for (int i = 0; i <= studentList.size() - 1; i++) {
                    Element element = studentList.get(i);
                        System.out.println("Correct Answer : " + element.getChildText("c_ans"));// Get Correct Answer From Xml
                        System.out.println("User Answer : " + element.getChildText("user_c_ans")); // Get User Given Answer From Xml
                        System.out.println("Marks : " + element.getChildText("marks")); // Get Marks to the Question
                        if ((element.getChildText("user_c_ans")).equals(element.getChildText("c_ans"))) { // Check If both answets are Matching
                            cnt = cnt + Integer.parseInt(element.getChildText("marks")); // If MAtching Add the marks to the counter
                            a++;
                        }
                        if (element.getChildText("user_c_ans") != null) { // Check if User answer is null in Xml
                            na++; //if yes not attempted counter ++ Increment
                        }
                        c++; // Calculate total No Of Questions
                    }
                    System.out.println("The result is Total Questions:" + studentList.size() + "Result:  " + cnt + " Attempted Questions:" + na + "Unattempted: " + (c - na) + " Correct: " + a);
                    Element estat = rootNode.getChild("ExamStatus"); //Get Element Exam Status
                    System.out.println("Elemnet Estat fetched " + estat);
                    (estat.getChild("marks")).setText(String.valueOf(cnt)); //Update the marks and status
                    System.out.println(estat.getChildText("marks"));
                    (estat.getChild("status")).setText("Attempted"); // Add Attempted ka Shikka
                    System.out.println(estat.getChildText("status"));
                    XMLOutputter xmlOutput = new XMLOutputter();
                    System.out.println("Outputter : " + xmlOutput);
                    // passsed System.out to see document content on console
                    xmlOutput.output(document, System.out);

                    // passed fileWriter to write content in specified file
                    xmlOutput.setFormat(Format.getPrettyFormat());
                    xmlOutput.output(document, new FileWriter(file));
                } catch (Exception e) {
                    // TODO Auto-generated catch block
                    e.printStackTrace();
                }

            }
            %>

        </body>
        </html>
