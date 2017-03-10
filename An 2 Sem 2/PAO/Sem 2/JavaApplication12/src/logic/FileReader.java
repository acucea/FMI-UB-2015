/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package logic;

import java.io.File;
import java.io.FileNotFoundException;
import java.util.ArrayList;
import java.util.NoSuchElementException;
import java.util.Scanner;
import pojos.Profesor;
import pojos.Student;

/**
 *
 * @author Student
 */

public class FileReader {
    private Scanner scan;
    private String type;
    
    
    public void readData(ArrayList<Profesor> prof, ArrayList<Student> stud) throws Exception
    {
    try {
    scan = new Scanner(new File("D:\\231\\JavaApplication12\\src\\Simplu - Sheet1.csv"));
    scan.useDelimiter(",[\\n\\r]{0,2}");
    
    while(true)
    {
        type = scan.next();
        
    if (type.equals("p"))
    {
        String nume, prenume,titlu,catedra;
        Integer varsta,vechime;
        nume = scan.next();
        prenume = scan.next();
        varsta = scan.nextInt();
        Profesor profesor = new Profesor(nume, prenume,varsta);
        titlu = scan.next();
        vechime = scan.nextInt();
        catedra = scan.next();
        profesor.setCategra(catedra);
        profesor.setTitlu(titlu);
        profesor.setVechime(vechime);
        prof.add(profesor);
        
    }
    else if (type.equals("s"))
    {
        String nume, prenume, facultate;
        Integer varsta, anStudiu;
        nume = scan.next();
        prenume = scan.next();
        varsta = scan.nextInt();
        Student student = new Student(nume, prenume,varsta);
        anStudiu = scan.nextInt();
        facultate = scan.next();
      
        student.setNumeFacultate(facultate);
        student.setAnDeStudiu(anStudiu);
        stud.add(student);
    }
    else
        throw new Exception("LALALA");
    }
    }
    catch (FileNotFoundException e) {
            e.printStackTrace();
    }
    catch (NoSuchElementException el)
    {
      
    }
    
    
    }
    

}