/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Helping_Classes;

import static Helping_Classes.Session_Factory.*;
import static java.lang.Integer.parseInt;
import static java.lang.System.out;
import java.util.Arrays;
import static java.util.Arrays.sort;
import java.util.List;
import java.util.ListIterator;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

/**
 *
 * @author Vinayak Sharma
 */
public class getQ_no {

    public int qnumber() {
        Session s;
        Query qr1, qr2;
        SessionFactory sf = getSessionFactory();
        int id = 0;
        s = sf.openSession();
        qr2 = s.createQuery("select q_no from bean.Question_Bank");
        out.println("qr is " + qr2);
        if (qr2 != null) {
            List l = qr2.list();
            if (l != null) {

                Object[] array = l.toArray(new String[l.size()]);
                int[] arr = new int[l.size()];
                for (int i = 0; i < l.size(); i++) {
                    arr[i] = parseInt((String) array[i]);

                }
                sort(arr);
                for (int i = 0; i < l.size(); i++) {

                    id = arr[i];
                }

            }
        }

        s.close();
        return id + 1;
    }

    public static ListIterator getename() {
        Session s;
        Query qr;
        SessionFactory sf = getSessionFactory();
         s = sf.openSession();
        qr = s.createQuery("select distinct(exam_name) from bean.ExamResult");
        List li=qr.list();
        ListIterator lit=li.listIterator();
        s.close();
        return lit;
    }
}
