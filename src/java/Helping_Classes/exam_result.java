/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Helping_Classes;

import bean.ExamResult;
import bean.Exam_Question_Bank;
import java.io.File;
import java.io.IOException;
import static java.lang.Integer.parseInt;
import static java.lang.System.out;
import java.util.List;
import java.util.logging.Level;
import static java.util.logging.Level.SEVERE;
import java.util.logging.Logger;
import static java.util.logging.Logger.getLogger;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.jdom2.Document;
import org.jdom2.Element;
import org.jdom2.JDOMException;
import org.jdom2.Namespace;
import org.jdom2.input.SAXBuilder;

/**
 *
 * @author Vinayak Sharma
 */
public class exam_result {

    public void studentMarks(String roll_no, Session s, bean.Exam e) {
        try {
            Context env = (Context) new InitialContext().lookup("java:comp/env");
            String path = (String) env.lookup("root_dir");
            // obtain file object
            File file = new File(path + roll_no + ".xml");
            if (file.exists()) {
                SAXBuilder saxBuilder = new SAXBuilder();
                Document document = saxBuilder.build(file);

                // get root node from xml
                Element rootNode = document.getRootElement();
                Element examDetails = rootNode.getChild("Exam_Details");
                Element examStatus = rootNode.getChild("ExamStatus");
                bean.ExamResult er = new ExamResult();
                er.setExam_name(e.getEname());
                er.setMarks(examStatus.getChildText("marks"));
                er.setRoll_no(examDetails.getChildText("roll_no"));
                er.setStudent_name(examDetails.getChildText("student_name"));
                out.println(er.getExam_name() + "  " + er.getMarks() + "  " + er.getRoll_no() + "  " + er.getStudent_name());
                Transaction tr = s.beginTransaction();
                s.saveOrUpdate(er);
                tr.commit();
            }

        } catch (JDOMException | IOException | NamingException ex) {
            getLogger(exam_result.class.getName()).log(SEVERE, null, ex);
        }

    }

    public void exam_question_bank(String roll_no, bean.Exam e, SessionFactory sf) {

        Session s = sf.openSession();
        try {
            Context env = (Context) new InitialContext().lookup("java:comp/env");
            String path = (String) env.lookup("root_dir");
            Query qr = s.createQuery("select max(id) from bean.Exam_Question_Bank");
            List li = qr.list();
            int iid = 0;
            if (li.get(0) == null) {
                iid = 1;
                out.println("The Value of ID is: " + iid + li.get(0));
            } else {
                iid = parseInt((li.get(0)).toString()) + 1;
                out.println("The Value of ID is ELSE: " + iid + li.get(0));

            }
            // obtain file object
            File file = new File(path + roll_no + ".xml");
            if (file.exists()) {
                SAXBuilder saxBuilder = new SAXBuilder();
                Document document = saxBuilder.build(file);

                // get root node from xml
                Element rootNode = document.getRootElement();
                List<Element> Questions = rootNode.getChildren("Question");
                for (int i = 0; i <= Questions.size() - 1; i++) {
                    Element quest = Questions.get(i);
                    bean.Exam_Question_Bank er = new Exam_Question_Bank();
                    String id = "";
                    er.setId(iid);
                    iid++;
                    er.setExam_name(e.getEname());
                    er.setRoll_no(roll_no);
                    er.setUnit_no(quest.getChildText("unit_no"));
                    er.setQ_no(quest.getAttributeValue("q_no"));
                    er.setQ_id(quest.getChildText("q_id"));
                    er.setQuestion(quest.getChildText("question"));
                    er.setOp1(quest.getChildText("op1"));
                    er.setOp2(quest.getChildText("op2"));
                    er.setOp3(quest.getChildText("op3"));
                    er.setOp4(quest.getChildText("op4"));
                    er.setC_ans(quest.getChildText("c_ans"));
                    er.setUser_c_ans(quest.getChildText("user_c_ans"));
                    er.setMarks(quest.getChildText("marks"));
                    out.println(er.getId() + "  " + er.getExam_name() + "  " + er.getRoll_no() + "  " + er.getUnit_no() + "  " + er.getQ_no() + "  " + er.getQ_id() + "  " + er.getQuestion());
                    out.println("  " + er.getOp1() + "  " + er.getOp2() + "  " + er.getOp3() + "  " + er.getOp4() + "  " + er.getC_ans() + "  " + er.getUser_c_ans() + "  " + er.getMarks());
                    Transaction tr = s.beginTransaction();
                    s.save(er);
                    tr.commit();

                }
            }

        } catch (JDOMException | IOException | NamingException ex) {
            getLogger(exam_result.class.getName()).log(SEVERE, null, ex);
        } finally {
            // s.flush();
        }

    }
}
