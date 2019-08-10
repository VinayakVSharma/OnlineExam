<%-- 
    Document   : mathjax_1
    Created on : Feb 4, 2017, 11:35:31 AM
    Author     : Vinayak Sharma
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="bean.admin_registration"%>
<%@page import="java.util.ListIterator"%>
<%@page import="java.util.List"%>
<%@page import="org.hibernate.Transaction"%>
<%@page import="Helping_Classes.Session_Factory"%>
<%@page import="org.hibernate.SessionFactory"%>
<%@page import="org.hibernate.Query"%>
<%@page import="org.hibernate.Session"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script type="text/x-mathjax-config">
            MathJax.Hub.Config({
            extensions: ["tex2jax.js"],
            jax: ["input/TeX","output/HTML-CSS"],
            tex2jax: {inlineMath: [["$","$"],["\\(","\\)"]]}
            });
        </script>
        <script type="text/javascript" src="../unpacked/MathJax.js"></script>
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
        <table border="1">
            <tr>
                <td>Username</td>
                <td>Email</td>
                <td>Password</td>

            </tr>  
            <%
                try {

                    s = sf.openSession();
                    qr = s.createQuery("from admin_registration");
                    boolean bool = false;
                    if (qr != null) {
                        List li = qr.list();
                        if (li != null) {
                            ListIterator lit = li.listIterator();
                            admin_registration ar = new admin_registration();
                            while (lit.hasNext()) {
                                ar = (admin_registration) lit.next();
            %>
            <tr>
                <td><%=ar.getUsername()%></td>
                <td><%=ar.getEmail()%></td>
                <td><%=ar.getPassword()%></td>
                <td style="color: black;"><a href="controller/admin_update.jsp?username=<%= ar.getUsername()%>">Update</a></td>
                <td style="color: black;"><a href="controller/admin_details_delete.jsp?username=<%= ar.getUsername()%>">Delete</a></td>
            </tr>
            <%
                            }

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
        </table>

    </body>
</html>
