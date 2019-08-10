/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import Helping_Classes.Session_Factory;
import static Helping_Classes.Session_Factory.getSessionFactory;
import bean.Exam;
import java.io.IOException;
import static java.lang.Integer.parseInt;
import static java.lang.Integer.parseInt;
import static java.lang.Integer.parseInt;
import static java.lang.Integer.parseInt;
import static java.lang.Integer.parseInt;
import static java.lang.Integer.parseInt;
import static java.lang.System.out;
import java.util.List;
import java.util.ListIterator;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

/**
 *
 * @author Vinayak Sharma
 */
public class AddExam extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Session s;
        Query qr;
        SessionFactory sf;
        Exam e = new Exam();
        sf = getSessionFactory();
        s = sf.openSession();
        int mm = 0,mq=0;
        try {

            bean.Subject b = new bean.Subject();
            qr = s.createQuery("from bean.Specification where spec_name='" + req.getParameter("specname")+"'");
            List li = qr.list();
            ListIterator lit = li.listIterator();
            while (lit.hasNext()) {
                bean.Specification spec = (bean.Specification) lit.next();
                mm=mm+parseInt(spec.getTotal());
                mq=mq+parseInt(spec.getMk1())+parseInt(spec.getMk2())+parseInt(spec.getMk4())+parseInt(spec.getMk8());
            }
            Transaction tr = s.beginTransaction();
            b = (bean.Subject) s.get(bean.Subject.class, req.getParameter("ccode"));
            out.println("------Data Found-----");
            tr.commit();
            e.setEname(req.getParameter("examname"));
            e.setCcode(req.getParameter("ccode"));
            e.setCname(b.getC_name());
            e.setSpecname(req.getParameter("specname"));
            e.setMaxmarks(mm);
            e.setEtype(req.getParameter("etype"));
            e.setBranch(req.getParameter("branch"));
            e.setEtime((parseInt(req.getParameter("etime"))) * 60);
            e.setMquestions(mq);
            tr = s.beginTransaction();
            s.save(e);
            tr.commit();
            out.println("Exam Added Successfully");
            resp.sendRedirect("exam pages/add_exam.jsp");
        } catch (Exception ex) {
            ex.printStackTrace();
            out.println(ex);
            RequestDispatcher rd = req.getRequestDispatcher("exam pages/add_exam.jsp?result=-----Something Went Wrong-----");
            rd.forward(req, resp);
        } finally {
            s.flush();
            // s.close();
        }
    }

}
