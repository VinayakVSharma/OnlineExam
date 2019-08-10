<%-- 
    Document   : start
    Created on : 9 Apr, 2017, 1:09:35 PM
    Author     : Vinayak Sharma
--%>

<%@page import="org.hibernate.Session"%>
<%@page import="org.hibernate.Query"%>
<%@page import="org.hibernate.SessionFactory"%>
<%@page import="Helping_Classes.Session_Factory"%>
<%@page import="java.util.ListIterator"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form action="../controller/exam/startdyn.jsp" method="post" >  
            <input type="hidden" name="roll" value="<%= request.getParameter("roll")%>" />
            <select name="ename" >
            
         
        <%!
            Session s;
            Query qr;
            SessionFactory sf;

            public void jspInit() {
                sf = Session_Factory.getSessionFactory();
            }
        %>

        
            <%
                s = sf.openSession();
                qr = s.createQuery("from bean.Exam");

                if (qr != null) {
                    List li = qr.list();
                    if (li != null) {
                        ListIterator lit = li.listIterator();
                        bean.Exam ar = new bean.Exam();
                        while (lit.hasNext()) {
                            ar = (bean.Exam) lit.next();
                   %>
              
                       <option><%= ar.getEname() %></option>

                   <%
                       
                        }
                    }
                }


            %>
    </select>
    <input type="submit" value="Start Student Exam" />
    </form>
        </body>
</html>
