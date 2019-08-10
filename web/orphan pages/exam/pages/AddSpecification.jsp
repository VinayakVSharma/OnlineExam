<%-- 
    Document   : ViewSubject
    Created on : 7 Jan, 2017, 5:57:22 AM
    Author     : Vinayak Sharma
--%>


<%@page import="org.hibernate.cfg.AnnotationConfiguration"%>
<%@page import="Helping_Classes.Session_Factory"%>
<%@page import="org.hibernate.SessionFactory"%>
<%@page import="org.hibernate.Query"%>
<%@page import="org.hibernate.Session"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ListIterator"%>
<%@page import="bean.Subject"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>

        <!-- Session Declaration -->
        <%!
            Session s;
            Query qr;
            SessionFactory sf;
            int id;
            private static SessionFactory factory;

            public void jspInit() {
                sf = Session_Factory.getSessionFactory();
            }
        %>
        <!-- Session Declaration Ended -->
        <%
            try {
                try {
                    factory = new AnnotationConfiguration().
                            configure().
                            //addPackage("com.xyz") //add package if used.
                            addAnnotatedClass(bean.Specification.class).
                            buildSessionFactory();
                } catch (Throwable ex) {
                    System.err.println("Failed to create sessionFactory object." + ex);
                    throw new ExceptionInInitializerError(ex);
                }

                s = factory.openSession();
                qr = s.createQuery("select max(id) from Specification");
                List l = qr.list();

                if (l.get(0) == null) {
                    id = 1;
                } else {
                    id = Integer.parseInt((String) l.get(0)) + 1;
                }
        %>       
        <form action="../controller/exam/AddSpecification.jsp" method="post" name="spe">
            Enter Id:<input type="text" name="id" value="<%= id%>" readonly="readonly" /> <br /> 
            Specification Name: <input type="text" name="specname"  /><br />
            Select Course Code:   <select name="code">           

                <%
                    qr = s.createQuery("select c_code from bean.Subject");
                    boolean bool = false;

                    if (qr != null) {
                        List li = qr.list();
                        if (li != null) {
                            ListIterator lit = li.listIterator();

                            while (lit.hasNext()) {
                                String s = (String) lit.next();
                %>
                <option><%= s%> </option>
                <%
                }%>

            </select><br />
            Select Branch:    <select  name="branch">

                <option>IF</option>
                <option>CM</option>
                <option>Mech</option>
                <option>Civil</option>
                <option>Electrical</option>
                <option>E&Tc</option>
                <option>IDD</option>
                <option>Automobile</option>
                <option>DDGM</option>
                <option>Plastic</option>
            </select><br />
            Unit No: <input type="text" name="unit"  />  <br /> 
            1 Marks: <input type="text" name="om" id="om" /><br />
            2 Marks:<input type="text" name="tm"  /><br />
            4 Marks:<input type="text" name="fm"  /><br />
            8 Marks:<input type="text" name="em"  /><br />
            Total: <input type="text" name="tot"  /><br />
            <%

                        } else {
                            out.print("data not found");
                        }
                    } else {
                        out.print("-----Query is Blank-----");
                    }

                } catch (Exception e) {
                    e.printStackTrace();
                } finally {
                    s.flush();
                    s.close();
                }
            %>
            <br /> <input type="submit" value="Submit" name="submit" /> 


        </form>

    </body>
</html>
