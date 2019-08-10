/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Helping_Classes;

import java.io.File;
import java.io.IOException;
import java.util.logging.Level;
import static java.util.logging.Level.SEVERE;
import java.util.logging.Logger;
import static java.util.logging.Logger.getLogger;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import org.jdom2.Document;
import org.jdom2.Element;
import org.jdom2.JDOMException;
import org.jdom2.input.SAXBuilder;

/**
 *
 * @author Vinayak Sharma
 */
public class getStatus {

    public String status(String rollno) {
     String status = null;
     try {
        
        SAXBuilder saxBuilder = new SAXBuilder();
        Context env = (Context)new InitialContext().lookup("java:comp/env"); 
        String path=(String)env.lookup("root_dir");
        File file = new File(path + rollno + ".xml");
        Document document = saxBuilder.build(file);
        Element rootNode = document.getRootElement();
        if ((rootNode.getChild("ExamStatus").getChildText("status")).equals("Attempted")) {
            status="Over";
        }
        else{
            status="Attempting";
        }
    } catch (JDOMException | IOException | NamingException ex) {
            getLogger(getStatus.class.getName()).log(SEVERE, null, ex);
    }
    return status;
}
}
