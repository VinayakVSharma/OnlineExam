/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Helping_Classes;

import java.io.FileWriter;
import java.io.IOException;
import static java.lang.String.valueOf;
import static java.lang.String.valueOf;
import static java.lang.String.valueOf;
import static java.lang.System.out;
import java.util.Collections;
import static java.util.Collections.shuffle;
import java.util.List;
import java.util.ListIterator;
import java.util.logging.Level;
import static java.util.logging.Level.SEVERE;
import java.util.logging.Logger;
import static java.util.logging.Logger.getLogger;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import org.hibernate.Query;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.jdom2.Attribute;
import org.jdom2.Document;
import org.jdom2.Element;
import org.jdom2.output.Format;
import static org.jdom2.output.Format.getPrettyFormat;
import org.jdom2.output.XMLOutputter;

/**
 *
 * @author Vinayak Sharma
 */
public class GenerateQB {

    public ListIterator fetchSpecification(String specname, Session s, GenerateQB qb) {
        Query qr = s.createQuery("from bean.Specification where spec_name='" + specname + "'");
        List li = qr.list();
        ListIterator lit = li.listIterator();
        return qb.getQuestions(lit, s);
    }

    public ListIterator getQuestions(ListIterator specification, Session s) {
        SQLQuery qr = null;
        List li = null;
        while (specification.hasNext()) {
            bean.Specification spec = (bean.Specification) specification.next();
            qr = s.createSQLQuery("SELECT * FROM `question_bank` where `unit_no`='" + spec.getUnit_no() + "'and `marks`=1 order by rand() limit " + spec.getMk1());
            qr.addEntity(bean.Question_Bank.class);
            if (li == null) {
                li = qr.list();
            } else {
                li.addAll(qr.list());
            }
            qr = s.createSQLQuery("SELECT * FROM `question_bank` where `unit_no`='" + spec.getUnit_no() + "'and `marks`=2 order by rand() limit " + spec.getMk2());
            qr.addEntity(bean.Question_Bank.class);
            li.addAll(qr.list());
            qr = s.createSQLQuery("SELECT * FROM `question_bank` where `unit_no`='" + spec.getUnit_no() + "'and `marks`=4 order by rand() limit " + spec.getMk4());
            qr.addEntity(bean.Question_Bank.class);
            li.addAll(qr.list());
            qr = s.createSQLQuery("SELECT * FROM `question_bank` where `unit_no`='" + spec.getUnit_no() + "'and `marks`=8 order by rand() limit " + spec.getMk8());
            qr.addEntity(bean.Question_Bank.class);
            li.addAll(qr.list());
        }
        shuffle(li);
        return li.listIterator();
    }

    public void createXML(String roll_no, bean.Exam e, bean.Subject b, ListIterator Questions, bean.Student student) throws IOException {
        try {
            Element examstud = new Element("Question_Bank");
            Document document = new Document(examstud);
            Format format = getPrettyFormat();
            format.setEncoding("ISO-8859-1");
            XMLOutputter xmlOutput = new XMLOutputter(format);
            int i = 1;
            while (Questions.hasNext()) {
                bean.Question_Bank Question = (bean.Question_Bank) Questions.next();
                Element q = new Element("Question");
                q.setAttribute(new Attribute("q_no", valueOf(i)));
                i++;
                q.addContent(new Element("q_id").setText(valueOf(Question.getQ_no())));
                q.addContent(new Element("unit_no").setText(Question.getUnit_no()));
                q.addContent(new Element("question").setText(Question.getQuestion()));
                q.addContent(new Element("op1").setText(Question.getOp1()));
                q.addContent(new Element("op2").setText(Question.getOp2()));
                q.addContent(new Element("op3").setText(Question.getOp3()));
                q.addContent(new Element("op4").setText(Question.getOp4()));
                q.addContent(new Element("c_ans").setText(Question.getC_ans()));
                q.addContent(new Element("user_c_ans").setText("null"));
                q.addContent(new Element("marks").setText(Question.getMarks()));
                document.getRootElement().addContent(q);
            }
            
            Element ed = new Element("Exam_Details");
            ed.addContent(new Element("c_code").setText(e.getCcode()));
            ed.addContent(new Element("c_name").setText(e.getCname()));
            ed.addContent(new Element("roll_no").setText(student.getRoll_no()));
            ed.addContent(new Element("student_name").setText(student.getStudent_name()));
            ed.addContent(new Element("year").setText(student.getYear()));
            ed.addContent(new Element("branch").setText(student.getBranch()));
            ed.addContent(new Element("time").setText(valueOf(e.getEtime())));
            ed.addContent(new Element("m_question").setText(valueOf(e.getMquestions())));
            ed.addContent(new Element("exam_type").setText(e.getEtype()));
            ed.addContent(new Element("result"));
            document.getRootElement().addContent(ed);
            Element estat = new Element("ExamStatus");
            estat.addContent(new Element("marks").setText(""));
            estat.addContent(new Element("status").setText(""));
            document.getRootElement().addContent(estat);
            xmlOutput.output(document, out);
            
            xmlOutput.setFormat(getPrettyFormat().setEncoding("ISO-8859-1"));
            Context env;
            env = (Context)new InitialContext().lookup("java:comp/env");
            String path=(String)env.lookup("root_dir");
            try (FileWriter fw = new FileWriter(path + student.getRoll_no() + ".xml")) {
                xmlOutput.output(document, fw);
            }
        } catch (NamingException ex) {
            getLogger(GenerateQB.class.getName()).log(SEVERE, null, ex);
        }
    }

}
