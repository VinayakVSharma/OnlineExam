/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import static java.lang.System.out;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.jdom2.Document;
import org.jdom2.Element;
import org.jdom2.input.SAXBuilder;
import org.jdom2.output.Format;
import static org.jdom2.output.Format.getPrettyFormat;
import org.jdom2.output.XMLOutputter;

/**
 *
 * @author Vinayak Sharma
 */
public class endexam extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        SAXBuilder saxBuilder = new SAXBuilder();

        // obtain file object 
        
        try {
            Context env = (Context) new InitialContext().lookup("java:comp/env");
            String path = (String) env.lookup("root_dir");
            File file = new File(path + "marks.xml");
            Document document = saxBuilder.build(file);
            Element rootNode = document.getRootElement();
            Element estat = new Element("ExamStatus");
            estat.addContent(new Element("marks").setText(req.getParameter("marks")));
            estat.addContent(new Element("status").setText(req.getParameter("end")));
            rootNode.addContent(estat);
            XMLOutputter xmlOutput = new XMLOutputter();

            // passsed System.out to see document content on console
            xmlOutput.output(document, out);

            // passed fileWriter to write content in specified file
            xmlOutput.setFormat(getPrettyFormat());
            xmlOutput.output(document, new FileWriter(file));
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}
