<%@page import="org.hibernate.Transaction"%>
<%@page import="bean.Specification"%>
<%@page import="bean.Subject"%>
<%@page import="java.util.ListIterator"%>
<%@page import="java.util.List"%>
<%@page import="Helping_Classes.Session_Factory"%>
<%@page import="org.hibernate.SessionFactory"%>
<%@page import="org.hibernate.Query"%>
<%@page import="org.hibernate.Session"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>        
        <!-- META SECTION -->
        <title>Admin Template</title>            
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1" />

        <link rel="icon" href="favicon.ico" type="image/x-icon" />
        <!-- END META SECTION -->

        <!-- CSS INCLUDE -->        
        <link rel="stylesheet" type="text/css" id="theme" href="css/theme-default.css"/>
        <!-- EOF CSS INCLUDE -->                                    
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
        %>
        Exam Name: <%= request.getParameter("examname")%> <br />
        Course Code:<%= request.getParameter("ccode")%> <br/>        
        Course Name: <% bean.Subject b = new bean.Subject();
            Transaction tr = s.beginTransaction();
            b = (bean.Subject) s.get(bean.Subject.class, request.getParameter("ccode"));
            System.out.println("------Data Found-----");
            tr.commit();
            out.println(b.getC_name());
        %> <br />
        Maximum Marks: <%= request.getParameter("maxmarks") %> <br/>
        Exam Type: <%= request.getParameter("etype") %> <br/>
        Max Time: <%= request.getParameter("etime") %> <br/>
        Max Questions: <%= request.getParameter("mquestions") %> <br/>
        Specification Table: 
        <table border="1">
            <tr>

                <td>SpecName</td>
                <td>Branch</td>
                <td>Code</td>
                <td>Unit No</td>
                <td>One Mark</td>
                <td>Two Mark</td>
                <td>Four Mark</td>
                <td>Eight Mark</td>
                <td>Total Marks</td>

            </tr>  
            <%
                qr = s.createQuery("from Specification where spec_name='" + request.getParameter("specname") + "'");
                //where branch='" +request.getParameter("branch") +"' and code='"+request.getParameter("code") + "'"
                boolean bool = false;
                if (qr != null) {
                    List li = qr.list();
                    if (li != null) {
                        ListIterator lit = li.listIterator();
                        Specification ar = new Specification();
                        while (lit.hasNext()) {
                            ar = (Specification) lit.next();
            %>
            <tr>

                <td><%=ar.getSpec_name()%></td>
                <td><%=ar.getBranch()%></td>
                <td><%=ar.getC_code()%></td>
                <td><%=ar.getUnit_no()%></td>
                <td><%=ar.getMk1()%></td>
                <td><%=ar.getMk2()%></td>
                <td><%=ar.getMk4()%></td>
                <td><%=ar.getMk8()%></td>
                <td><%=ar.getTotal()%></td>

            </tr>

            <%  }
                    }
                }
            %> <br />
        </table>
        View Students: <br />
        <table border="1">
            <tr>
                <td>Sr No</td>
                <td>Student Name</td>
                <td>Roll No</td>
                <td>Branch</td>
                <td>Year</td>
                <td>DOB</td>
            </tr>
            <%
                qr = s.createQuery("from bean.Student where branch='" + request.getParameter("branch") + "' and year='" + b.getYear() + "' ");
                int i=0;
                if (qr != null) {
                    List li = qr.list();
                    if (li != null) {
                        ListIterator lit = li.listIterator();
                        bean.Student st = new bean.Student();
                        while (lit.hasNext()) {
                            st = (bean.Student) lit.next();
                            i=i+1;
            %>
            <tr>
                <td><%= i %></td>
                <td><%= st.getStudent_name() %></td>
                <td><%= st.getRoll_no()%></td>
                <td><%= st.getBranch()%></td>
                <td><%= st.getYear()%></td>
                <td><%= st.getDob()%></td>
            </tr>


            <%                        }
                    }
                }
            %>
        </table>




        <%
            } catch (Exception e) {
                e.printStackTrace();
                System.out.println(e);
            } finally {
                s.close();
            }
        %>
    </body>
</html>