/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Helping_Classes;

import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * @author Vinayak Sharma
 */
public class questionlist {
    public void saveque( bean.Question_Bank aa1,Session s){
        Transaction tr=s.beginTransaction();
        s.save(aa1);
        tr.commit();
    }
}
