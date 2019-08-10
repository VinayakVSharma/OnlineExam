<%-- 
    Document   : answer paper
    Created on : Mar 20, 2017, 4:44:36 AM
    Author     : Vinayak Sharma
    --%>

    <%@page import="javax.naming.Context"%>
<%@page import="javax.naming.InitialContext"%>
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
        private int i;

        public Element getData(int i, List<Element> studentList) {
            Element element = studentList.get(i);
            return element;
        }
        %>
        <%--Read XML File--%>
        <%
        Context env = (Context)new InitialContext().lookup("java:comp/env"); 
        String path=(String)env.lookup("root_dir");
        SAXBuilder saxBuilder = new SAXBuilder();
        File file = new File(path+"145101.xml");
        Document document = saxBuilder.build(file);
        Element rootNode = document.getRootElement();
        List<Element> studentList = rootNode.getChildren("Question");
        Element el = getData(i, studentList);


        %>

        <form action="" method="POST">
            Question No :- <input type="text" name="q_id" value="<%= el.getAttributeValue("q_no")%>" /><br />
            Question :- <input type="text" name="question" value="<%= el.getChildText("question")%>" /> <br />
            Select Right Answer :-<br>
            <input type="radio" name="option" value="<%= el.getChildText("op1")%>" ><%= el.getChildText("op1")%><br>        
            <input type="radio" name="option" value="<%= el.getChildText("op2")%>" ><%= el.getChildText("op2")%><br>
            <input type="radio" name="option" value="<%= el.getChildText("op3")%>" ><%= el.getChildText("op3")%><br>
            <input type="radio" name="option" value="<%= el.getChildText("op4")%>" ><%= el.getChildText("op4")%><br>
            Correct Answer :-
            <input type="text" name="Branch" value="<%= el.getChildText("c_ans")%>" /><br>

            <input type="hidden" name="vali" value="<%= i%>" />
            <input type="submit" name="submit" value="Next" onclick="<%i = i + 1;
            System.out.println("Vali i " + i);%>" />

        </form>

        <%
        
        try{
        
        if (request.getParameter("submit") != null) {
        SAXBuilder builder = new SAXBuilder();
        File xmlFile = new File(path+"145101.xml");
        FileWriter fw=new FileWriter(xmlFile);
        Document doc = builder.build(xmlFile);

        String op = request.getParameter("option");
        System.out.println("The op is : " + op);
                // update staff id attribute
                
                Element rootNode_2 = document.getRootElement();
                
                List<Element> que = rootNode_2.getChildren("Question");
                    
                    for(int i=0; i <= que.size()-1;i++)
                    {
                     Element element = que.get(i);     
                     
                     System.out.println("The Selected Answer is  : " + op);
                     
                     XMLOutputter xmlOutput = new XMLOutputter();

		// display nice nice
		xmlOutput.setFormat(Format.getPrettyFormat());
		xmlOutput.output(doc, fw);
               // fw.close();
           }
       }
   }catch(Exception e)
   {
    e.printStackTrace();
}

%>

</body>
</html>

