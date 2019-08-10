/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package get;

import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import static java.lang.Integer.parseInt;
import static java.lang.String.valueOf;
import static java.lang.System.out;
import java.util.List;
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
public class End {

    public void end(String path) throws JDOMException, IOException {
        int cnt = 0, a = 0, c = 0, na = 0;

        SAXBuilder saxBuilder = new SAXBuilder();

        // obtain file object 
        File file = new File(path);
        try {
            Document document = saxBuilder.build(file);
            Element rootNode = document.getRootElement();
            List<Element> studentList = rootNode.getChildren("Question");

            // simple iteration to see the result on console
            for (int i = 0; i <= studentList.size() - 1; i++) {
                Element element = studentList.get(i);
                out.println("<br>  ");
                out.println("<br>Correct Ans : " + element.getChildText("c_ans"));
                out.println("<br>Your Ans : " + element.getChildText("user_c_ans"));
                out.println("<br>Marks : " + element.getChildText("marks"));
                if ((element.getChildText("user_c_ans")).equals(element.getChildText("c_ans"))) {
                    cnt = cnt + parseInt(element.getChildText("marks"));
                    a++;
                }
                if (element.getChildText("user_c_ans") != null) {
                    na++;
                }
                c++;
            }
            out.println("<br> The result is Total Questions:" + studentList.size() + "Result:  " + cnt + " Attempted Questions:" + na + "Unattempted: " + (c - na) + " Correct: " + a);

            Element estat = rootNode.getChild("ExamStatus");

            (estat.getChild("marks")).setText(valueOf(cnt));
            (estat.getChild("status")).setText("Attempted");
            Format format = getPrettyFormat();
            format.setEncoding("ISO-8859-1");
            XMLOutputter xmlOutput = new XMLOutputter(format);

            // passsed System.out to see document content on console
            xmlOutput.output(document, out);

            // passed fileWriter to write content in specified file
            xmlOutput.setFormat(getPrettyFormat().setEncoding("ISO-8859-1"));
            xmlOutput.output(document, new FileWriter(file));

        } catch (Exception e) {
            e.printStackTrace();

        }
    }

}
