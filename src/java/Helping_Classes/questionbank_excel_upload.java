package Helping_Classes;

import static Helping_Classes.Session_Factory.getSessionFactory;
import java.io.*;
import static java.lang.System.out;
import java.util.Iterator;
import java.util.List;
import org.apache.poi.ss.usermodel.DataFormatter;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

public class questionbank_excel_upload {

    public questionbank_excel_upload(String filepath) {
        Session s;

        Query qr;
        int id;
        SessionFactory sf;
        sf = getSessionFactory();
        s = sf.openSession();
        try {
Transaction tr = s.beginTransaction();
            FileInputStream file;
            file = new FileInputStream(new File(filepath));

//Create Workbook instance holding reference to .xlsx file
            XSSFWorkbook workbook = new XSSFWorkbook(file);

//Get first/desired sheet from the workbook
            XSSFSheet sheet = workbook.getSheetAt(0);

//Iterate through each rows one by one
            Iterator<Row> rowIterator = sheet.iterator();
            
            while (rowIterator.hasNext()) {
                
                Row row = rowIterator.next();
//For each row, iterate through all the columns
                DataFormatter df = new DataFormatter();
//Check the cell type and format accordingly

                bean.Question_Bank aa1 = new bean.Question_Bank();
String var1 = df.formatCellValue(row.getCell(0));
                String var2 = df.formatCellValue(row.getCell(1));
                String var3 = df.formatCellValue(row.getCell(2));
                String var4 = df.formatCellValue(row.getCell(3));
                String var5 = df.formatCellValue(row.getCell(4));
                String var6 = df.formatCellValue(row.getCell(5));
                String var7 = df.formatCellValue(row.getCell(6));
                String var8 = df.formatCellValue(row.getCell(7));
                String var9 = df.formatCellValue(row.getCell(8));
                String var10 = df.formatCellValue(row.getCell(9));
                String var11 = df.formatCellValue(row.getCell(10));

                out.println(" " + var2 + " " + var3 + " " + var4 + " " + var5 + " " + var6 + " " + var7 + " " + var8 + " " + var9 + " " + var10 + " " + var11);

//Code to save in Database
                // nextLine[] is an array of values from the line
                // System.out.println(nextLine[0] + nextLine[1] + "etc...");
                          // s.evict(aa);
                aa1.setQ_no(var1);
                aa1.setC_name(var2);
                aa1.setC_code(var3);
                aa1.setQuestion(var4);
                aa1.setOp1(var5);
                aa1.setOp2(var6);
                aa1.setOp3(var7);
                aa1.setOp4(var8);
                aa1.setC_ans(var9);
                aa1.setUnit_no(var10);
                aa1.setMarks(var11);

                s.saveOrUpdate(aa1);
                 
                out.println("-----Saved-----");
               
            }

            file.close();
            out.println("-----File Closed-----");
 tr.commit();
            out.println("-----Transaction Closed-----");
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            s.flush();
            //  s2.close();
        }
    }
}
