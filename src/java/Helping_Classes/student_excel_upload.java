package Helping_Classes;

import Helping_Classes.Session_Factory;
import static Helping_Classes.Session_Factory.getSessionFactory;
import java.io.*;
import static java.lang.String.valueOf;
import static java.lang.System.out;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Iterator;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

public class student_excel_upload {

    public student_excel_upload(String filepath) {
        Session s;
        Query qr;
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

//Check the cell type and format accordingly
                DateFormat df = new SimpleDateFormat("dd/MM/YYYY");
                out.print(row.getCell(0).getStringCellValue() + " " + row.getCell(1).getNumericCellValue() + " " + row.getCell(2).getStringCellValue() + " " + row.getCell(3).getStringCellValue() + " " + df.format(row.getCell(4).getDateCellValue()) + "\n");
              
//Code to save in Database
                int rn = (int) row.getCell(1).getNumericCellValue();
                bean.Student b = new bean.Student();
                b.setStudent_name(row.getCell(0).getStringCellValue());
                b.setRoll_no(valueOf(rn));
                b.setBranch(row.getCell(2).getStringCellValue());
                b.setYear(row.getCell(3).getStringCellValue());
                b.setDob(df.format(row.getCell(4).getDateCellValue()));
                s.saveOrUpdate(b);
                out.println("-----Saved-----");

            }
            out.println("");
            tr.commit();
            file.close();

        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            s.flush();
            s.close();
        }
    }
}
