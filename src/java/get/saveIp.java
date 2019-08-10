/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package get;

import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import static java.lang.System.out;
import java.util.List;
import java.util.logging.Level;
import static java.util.logging.Level.SEVERE;
import java.util.logging.Logger;
import static java.util.logging.Logger.getLogger;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import org.jdom2.Attribute;
import org.jdom2.Document;
import org.jdom2.Element;
import org.jdom2.JDOMException;
import org.jdom2.input.SAXBuilder;
import org.jdom2.output.Format;
import static org.jdom2.output.Format.getPrettyFormat;
import org.jdom2.output.XMLOutputter;

/**
 *
 * @author Vinayak Sharma
 */
public class saveIp {

    public void ip(String ip, String rollno) {
        try {
            String stat="";
            SAXBuilder saxBuilder = new SAXBuilder();
            Context env = (Context)new InitialContext().lookup("java:comp/env"); 
            String path=(String)env.lookup("root_dir");
            File file = new File(path+"Connection.xml");
            XMLOutputter xmlOutput = new XMLOutputter();
            Document document = saxBuilder.build(file);
            Element rootNode = document.getRootElement();
            List<Element> studentList = rootNode.getChildren("Student");
            for (int i = 0; i <= studentList.size()-1; i++) {
                out.println("hdgvZHxcvzxhcv");
                Element element = studentList.get(i);
                if ((element.getAttributeValue("rollno")).equals(rollno)) {
                    (element.getChild("ip")).setText(ip);
                    stat = "true";
                    out.println("HIIIIIIII");
                }
            }
            if(!stat.equals("true")){
                out.println(ip);
                Element student=new Element("Student");
                student.setAttribute("rollno", rollno);
                student.addContent(new Element("ip").setText(ip));
                rootNode.addContent(student);
            }
            

            xmlOutput.setFormat(getPrettyFormat().setEncoding("ISO-8859-1"));
            try (FileWriter fw = new FileWriter(file)) {
                xmlOutput.output(document, out);
                xmlOutput.output(document, fw);
            }

        } catch (JDOMException | IOException | NamingException ex) {
            getLogger(saveIp.class.getName()).log(SEVERE, null, ex);
        }
    }
}
