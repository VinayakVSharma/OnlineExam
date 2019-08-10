<%-- 
    Document   : AddSpecification
    Created on : 7 Jan, 2017, 10:01:24 PM
    Author     : Vinayak Sharma
--%>
<%@page import="bean.Specification"%>
<%@page import="org.hibernate.cfg.AnnotationConfiguration"%>
<%@page import="org.hibernate.Transaction"%>
<%@page import="Helping_Classes.Session_Factory"%>
<%@page import="org.hibernate.Session"%>
<%@page import="org.hibernate.SessionFactory" %>
<%@page import="java.util.List"%>
<%@page import="java.util.ListIterator"%>
<%@page import="org.hibernate.Query"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Exam Admin</title>
    </head>
    <body>
        <%!
            Session s;
            Query qr;
            SessionFactory sf;
            bean.Specification sp;
            Transaction tr;

            public void jspInit() {
                sf = Session_Factory.getSessionFactory();
            }

            int[] convertStringToInt(String[] arr) {
                int a[] = new int[arr.length];
                for (int i = 0; i < arr.length; i++) {
                    a[i] = Integer.parseInt(arr[i].trim());
                }
                return a;
            }
        %>
        <%

                try {
                    s = sf.openSession();
                    qr = s.createQuery("select max(spec_id) from bean.Specification");
                    List li = qr.list();
                    int spec_id = 0;
                    if( !( (li.toString()).equals("[null]")) ){
                         ListIterator lit = li.listIterator();
                    
                    while (lit.hasNext()) {
                        spec_id = (Integer) lit.next();
                        out.println(spec_id);
                    }
                    }else{
                        spec_id=0;
                    }
                    String spec_name = request.getParameter("spec_name");
                    String branch = request.getParameter("branch");
                    String c_code = request.getParameter("c_code");
                    String unit_no[] = request.getParameterValues("unit_no");
                    int mk1[] = convertStringToInt(request.getParameterValues("mk1"));
                    int mk2[] = convertStringToInt(request.getParameterValues("mk2"));
                    int mk4[] = convertStringToInt(request.getParameterValues("mk4"));
                    int mk8[] = convertStringToInt(request.getParameterValues("mk8"));
                    for (int i = 0; i < unit_no.length; i++) {
                        int total = mk1[i] + mk2[i] + mk4[i] + mk8[i];
                        Transaction tr = s.beginTransaction();
                        bean.Specification sp = new Specification();
                        sp.setSpec_id(++spec_id);
                        sp.setSpec_name(spec_name);
                        sp.setBranch(branch);
                        sp.setC_code(c_code);
                        sp.setUnit_no(unit_no[i]);
                        sp.setMk1(String.valueOf(mk1[i]));
                        sp.setMk2(String.valueOf(mk2[i]));
                        sp.setMk4(String.valueOf(mk4[i]));
                        sp.setMk8(String.valueOf(mk8[i]));
                        sp.setTotal(String.valueOf(total));
                        s.saveOrUpdate(sp);
                        tr.commit();
                    }
                    System.out.println("-----Transaction Saved and Session Closed-----");

                    response.sendRedirect("../../exam pages/add_exam.jsp?result=-----Specification_Added-----");

                } catch (Exception e) {
                    response.sendRedirect("../../exam pages/add_specification.jsp?result=-----Something_Went_Wrong-----");
                    e.printStackTrace();
                } finally {
                    s.flush();
                    s.close();
                }


        %>       
    </body>
</html>
