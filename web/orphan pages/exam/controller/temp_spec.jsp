<%-- 
    Document   : temp_spec
    Created on : Mar 16, 2017, 9:52:30 PM
    Author     : Vinayak Sharma
--%>

<%@page import="org.hibernate.Transaction"%>
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
            Session s;
            Query qr;
            SessionFactory sf;

            public void jspInit() {
                sf = Session_Factory.getSessionFactory();
            }
        %>
        <%

            try {

                String[] spec_id = request.getParameterValues("spec_id[]");
                String[] spec_name = request.getParameterValues("spec_name[]");
                String[] c_code = request.getParameterValues("c_code[]");
                String[] branch = request.getParameterValues("branch[]");
                String[] unit_no = request.getParameterValues("unit_no[]");
                String[] mk1 = request.getParameterValues("mk1[]");
                String[] mk2 = request.getParameterValues("mk2[]");
                String[] mk4 = request.getParameterValues("mk4[]");
                String[] mk8 = request.getParameterValues("mk8[]");
                String[] total = request.getParameterValues("total[]");
                s = sf.openSession();
                Transaction tr = s.beginTransaction();
                for (int i = 0; i < spec_id.length; i++) {
                    bean.Specification spec = new bean.Specification();
                    spec.setSpec_id(spec_id[i]);
                    System.out.println("Spec_ID: " + spec.getSpec_id());
                    spec.setSpec_name(spec_name[i]);
                    System.out.println("SPECNAME: " + spec.getSpec_name());
                    spec.setC_code(c_code[i]);
                    System.out.println("CCODE: " + spec.getC_code());
                    spec.setBranch(branch[i]);
                    System.out.println("Branch: " + spec.getBranch());
                    spec.setUnit_no(unit_no[i]);
                    System.out.println("UNIT NO: " + spec.getUnit_no());
                    spec.setMk1(mk1[i]);
                    System.out.println("MK1: " + spec.getMk1());
                    spec.setMk2(mk2[i]);
                    System.out.println("MK2: " + spec.getMk2());
                    spec.setMk4(mk4[i]);
                    System.out.println("MK4: " + spec.getMk4());
                    spec.setMk8(mk8[i]);
                    System.out.println("MK8: " + spec.getMk8());
                    spec.setTotal(total[i]);
                    System.out.println("Total: " + spec.getTotal());
                    System.out.println(" '" + spec_id[i] + "' , '" + spec_name[i] + "' ,'" + branch[i] + "' ,'" + c_code[i] + "' ,'" + unit_no[i] + "' ,'" + mk1[i] + "' ,'" + mk2[i] + "' ,'" + mk4[i] + "' ,'" + mk8[i] + "' , '" + total[i] + "'");
                    s.save(spec);

                }
                tr.commit();
                response.sendRedirect("../exam pages/specification.jsp?Success");
            } catch (Exception e) {
                e.printStackTrace();
            } finally {
                s.flush();
                s.close();
            }
        %>
    </body>
</html>
