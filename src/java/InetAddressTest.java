/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import static java.lang.System.out;
import java.net.*;
import static java.net.InetAddress.getAllByName;
/**
 *
 * @author Vinayak Sharma
 */
public class InetAddressTest {
    
    public static void main(String[] args) throws UnknownHostException{
        InetAddress SW[] = getAllByName("localhost:8080/Dashboard.html");
        
        for (InetAddress SW1 : SW) {
            out.println(SW1);
        }
    }
}
