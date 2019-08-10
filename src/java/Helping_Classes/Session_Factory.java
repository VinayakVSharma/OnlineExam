/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Helping_Classes;

import static java.lang.System.out;
import org.hibernate.SessionFactory;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import org.hibernate.cfg.Configuration;
import org.hibernate.service.ServiceRegistry;

/**
 *
 * @author Vinayak Sharma
 */
public class Session_Factory {
    static SessionFactory sf;
    private static ServiceRegistry sr;
    
    public static SessionFactory getSessionFactory(){
        Configuration con= new Configuration();
        con.configure("hibernate.cfg.xml");
        sr= new StandardServiceRegistryBuilder().applySettings(con.getProperties()).build();
        sf=con.buildSessionFactory(sr);
        
        out.println("Builded");
        return sf;
    }
    
}
