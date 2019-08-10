package get;

import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import static java.lang.Integer.parseInt;
import static java.lang.System.out;
import java.util.List;
import org.jdom2.Document;
import org.jdom2.Element;
import org.jdom2.JDOMException;
import org.jdom2.input.SAXBuilder;
import org.jdom2.output.Format;
import static org.jdom2.output.Format.getPrettyFormat;
import org.jdom2.output.XMLOutputter;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 *
 * @author Vinayak Sharma
 */
public class GetQue {

    public List getQue(String path) {

        SAXBuilder saxBuilder = new SAXBuilder();
        File file = new File(path);
        Document document = null;
        List<Element> qlist = null;
        try {
            document = saxBuilder.build(file);
            Element rootNode = document.getRootElement();
            qlist = rootNode.getChildren("Question");

        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return qlist;
    }

    public Element que(List qlist, int i) {
        Element q = (Element) qlist.get(i);
        return q;
    }

    public String saveA(String a, int q_no, String path, String clock) {
        String stat = "false";
        SAXBuilder saxBuilder = new SAXBuilder();
        File file = new File(path);
        XMLOutputter xmlOutput = new XMLOutputter();
        Document document = null;
        List<Element> qlist = null;
        try {
            document = saxBuilder.build(file);
            Element rootNode = document.getRootElement();
            qlist = rootNode.getChildren("Question");
            for (int i = 0; i < qlist.size(); i++) {
                Element e = (Element) qlist.get(i);
                //       System.out.println(e.getAttributeValue("q_no"));
                //       System.out.println("HELL:   " + a);
                if (q_no == parseInt(e.getAttributeValue("q_no"))) {
                    out.println("QNO MATCHED" + e.getAttributeValue("q_no"));
                    (e.getChild("user_c_ans")).setText(a);
                    out.println(e.getChildText("user_c_ans"));
                }
                ((rootNode.getChild("Exam_Details")).getChild("time")).setText(clock);
                // xmlOutput.output(document.getRootElement().getChild("Exam_Details"), System.out);
                //  xmlOutput.output(document, System.out);

                xmlOutput.setFormat(getPrettyFormat().setEncoding("ISO-8859-1"));
                try (FileWriter fw = new FileWriter(file)) {
                    xmlOutput.output(document, fw);
                }
            }

        } catch (IOException | NumberFormatException | JDOMException ex) {
            ex.printStackTrace();
        }

        return stat;
    }

}
