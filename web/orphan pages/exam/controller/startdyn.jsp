<%-- 
    Document   : startdyn
    Created on : 9 Apr, 2017, 1:33:34 PM
    Author     : Vinayak Sharma
    --%>

    <%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@page import="java.io.FileWriter"%>
    <%@page import="org.jdom2.output.Format"%>
    <%@page import="org.jdom2.Attribute"%>
    <%@page import="org.jdom2.Document"%>
    <%@page import="org.jdom2.output.XMLOutputter"%>
    <%@page import="org.jdom2.Element"%>
    <%@page import="java.util.ListIterator"%>
    <%@page import="java.util.List"%>
    <%@page import="Helping_Classes.Session_Factory"%>
    <%@page import="org.hibernate.SessionFactory"%>
    <%@page import="org.hibernate.Session"%>
    <%@page import="org.hibernate.Query"%>
    <%@page contentType="text/html" pageEncoding="UTF-8"%>
    <!DOCTYPE html>
    <html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%!
        Session s;
        Query qr;
        SessionFactory sf;

        public void jspInit() {
        sf = Session_Factory.getSessionFactory();
    }
    %>
    <%
    try {
    s = sf.openSession();
    bean.Exam e = (bean.Exam) s.get(bean.Exam.class, request.getParameter("ename"));
    bean.Subject b = (bean.Subject) s.get(bean.Subject.class, e.getCcode());
    System.out.println(" '" + e.getMaxmarks() + "' ");

    bean.Student student = (bean.Student) s.get(bean.Student.class, request.getParameter("roll"));

    int i = 1;
    Element examstud = new Element("Question_Bank");
    Document document = new Document(examstud);
    XMLOutputter xmlOutput = new XMLOutputter();

    Query qr12 = s.createQuery("from bean.Specification where spec_name='" + e.getSpecname() + "'");
    out.println("<br>The quesry for spec is :" + qr12);
    List li12 = qr12.list();
    ListIterator lit12 = li12.listIterator();

    while (lit12.hasNext()) {
    bean.Specification spec = (bean.Specification) lit12.next();
    Query questions = s.createQuery("from bean.Question_Bank where unit_no='" + spec.getUnit_no() + "' and marks=1 and rownum<=" + spec.getMk1());
    List questionlist = questions.list();
    out.println("<br>The quesry for spec is :" + questionlist);
    questions = s.createQuery("from bean.Question_Bank where unit_no='" + spec.getUnit_no() + "' and marks=2 and rownum<=" + spec.getMk2());
    questionlist.addAll(questions.list());
    out.println("<br>The quesry for spec is :" + questionlist);
    questions = s.createQuery("from bean.Question_Bank where unit_no='" + spec.getUnit_no() + "' and marks=4 and rownum<=" + spec.getMk4());
    questionlist.addAll(questions.list());
    questions = s.createQuery("from bean.Question_Bank where unit_no='" + spec.getUnit_no() + "' and marks=8 and rownum<=" + spec.getMk8());
    questionlist.addAll(questions.list());
    ListIterator qlit = questionlist.listIterator();

    while (qlit.hasNext()) {

    bean.Question_Bank que = (bean.Question_Bank) qlit.next();
    out.println(student.getRoll_no());
    out.println("<br>" + que.getC_code());
    out.println("<br>" + que.getC_name());
    out.println("<br>" + que.getUnit_no());
    out.println("<br>" + que.getQuestion());
    out.println("<br>" + que.getOp1());
    out.println("<br>" + que.getOp2());
    out.println("<br>" + que.getOp3());
    out.println("<br>" + que.getOp4());
    out.println("<br>" + que.getC_ans());
    out.println("<br>" + que.getQ_no());
    out.println("<br>" + que.getMarks());

    Element q = new Element("Question");
    q.setAttribute(new Attribute("q_no", String.valueOf(i)));
    i++;
    q.addContent(new Element("q_id").setText(que.getQ_no()));
    q.addContent(new Element("unit_no").setText(que.getUnit_no()));
    q.addContent(new Element("question").setText(que.getQuestion()));
    q.addContent(new Element("op1").setText(que.getOp1()));
    q.addContent(new Element("op2").setText(que.getOp2()));
    q.addContent(new Element("op3").setText(que.getOp3()));
    q.addContent(new Element("op4").setText(que.getOp4()));
    q.addContent(new Element("c_ans").setText(que.getC_ans()));
    q.addContent(new Element("user_c_ans").setText("null"));
    q.addContent(new Element("marks").setText(que.getMarks()));
    document.getRootElement().addContent(q);

}
}
out.println("<br><br><br><br>Student Details");
out.println(e.getCcode());
out.println(e.getCname());
out.println(student.getRoll_no());
out.println(student.getStudent_name());
out.println(student.getYear());
out.println(student.getBranch());
out.println(String.valueOf(e.getEtime()));
out.println(String.valueOf(e.getMquestions()));
out.println(e.getEtype());

Element ed = new Element("Exam_Details");
ed.addContent(new Element("c_code").setText(e.getCcode()));
ed.addContent(new Element("c_cname").setText(e.getCname()));
ed.addContent(new Element("roll_no").setText(student.getRoll_no()));
ed.addContent(new Element("student_name").setText(student.getStudent_name()));
ed.addContent(new Element("year").setText(student.getYear()));
ed.addContent(new Element("branch").setText(student.getBranch()));
ed.addContent(new Element("time").setText(String.valueOf(e.getEtime())));
ed.addContent(new Element("m_question").setText(String.valueOf(e.getMquestions())));
ed.addContent(new Element("exam_type").setText(e.getEtype()));

document.getRootElement().addContent(ed);
Element estat = new Element("ExamStatus");
estat.addContent(new Element("marks").setText(request.getParameter("marks")));
estat.addContent(new Element("status").setText(""));
document.getRootElement().addContent(estat);
System.out.println("Exam Details");
xmlOutput.output(document.getRootElement().getChild("Exam_Details"), System.out);
System.out.println("Document");
xmlOutput.output(document, System.out);

xmlOutput.setFormat(Format.getPrettyFormat());
Context env = (Context)new InitialContext().lookup("java:comp/env"); 
String path=(String)env.lookup("root_dir");
FileWriter fw = new FileWriter(path+ request.getParameter("roll") + ".xml");
xmlOutput.output(document, fw);
fw.close();
response.sendRedirect("../../Dashboard.html?started");

} catch (Exception e) {
e.printStackTrace();
} finally {
s.close();
}
%>
</body>
</html>
