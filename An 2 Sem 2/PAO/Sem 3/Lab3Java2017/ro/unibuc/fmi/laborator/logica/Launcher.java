/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ro.unibuc.fmi.laborator.logica;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;
import java.util.Scanner;
import ro.unibuc.fmi.laborator.date.Persoana;
import ro.unibuc.fmi.laborator.date.Profesor;
import ro.unibuc.fmi.laborator.date.Student;

/**
 *
 */
public class Launcher {
    
    private static List<Persoana> persoane = new ArrayList<Persoana>();
    
    public static void main(String[] args) throws IOException
    {
        int a = 0;
        for (int i = 0 ; i < 100; i++) {
            a = a;
        }
        System.out.println(a);

    
//        Scanner scan = new Scanner(new File("simplu.csv"));
//        scan.useDelimiter(",[\\r\\n]{0,2}|,?[\\r\\n]{1,2}");
//
//        String tip;
//        while(scan.hasNext())
//        {
//            tip = scan.next();
//            if (tip.equalsIgnoreCase("s"))
//            {
//                Student s = new Student();
//                s.readFromScanner(scan);
//                persoane.add(s);
//            }
//            else if (tip.equalsIgnoreCase("p"))
//            {
//                Profesor p = new Profesor();
//                p.readFromScanner(scan);
//                persoane.add(p);
//            }
//        }
//
//        for(Persoana pers : persoane)
//        {
//            System.out.println(pers);
//        }
//
//        OutputStream out = new FileOutputStream("scris.csv");
//        int i=0;
//        PrintWriter pOut = new PrintWriter(out);
//        for(Persoana pers : persoane)
//        {
//            pers.writeToStream(out);
//            if (++i != persoane.size())
//            {
//                pOut.print(",\n");
//                pOut.flush();
//            }
//        }
//        out.close();
    }
}
