/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ro.unibuc.fmi.laborator.date;

import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.Scanner;

/**
 *
 */
public class Student extends Persoana {
    
    private int anDeStudiu;
    private String facultate;

    public int getAnDeStudiu() {
        return anDeStudiu;
    }

    public void setAnDeStudiu(int anDeStudiu) {
        this.anDeStudiu = anDeStudiu;
    }

    public String getFacultate() {
        return facultate;
    }

    public void setFacultate(String facultate) {
        this.facultate = facultate;
    }

    @Override
    public String toString() {
        return "Student{"+super.toString()+", " + "anDeStudiu=" + anDeStudiu + ", facultate=" + facultate + '}';
    }
    
    @Override
    public void readFromScanner(Scanner scan)
    {
        super.readFromScanner(scan);
        anDeStudiu = scan.nextInt();
        facultate = scan.next();
    }
    
    @Override
    public void writeToStream(OutputStream output)
    {
        PrintWriter out = new PrintWriter(output);
        out.print("s,");
        out.flush();
        super.writeToStream(output);
        out.print(",");
        out.print(anDeStudiu);
        out.print(",");
        out.print(facultate);
        out.flush();
    }
}
