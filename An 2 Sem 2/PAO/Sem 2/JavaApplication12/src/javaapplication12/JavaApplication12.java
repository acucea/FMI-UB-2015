/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package javaapplication12;

import java.util.ArrayList;
import logic.FileReader;
import pojos.Persoana;
import pojos.Profesor;
import pojos.Student;

/**
 *
 * @author Student
 */
public class JavaApplication12 {

    /**
     * @param args the command line arguments
     */
    private static ArrayList<Profesor> prof ;
    private static ArrayList<Student> stud ;
    private static ArrayList<Persoana> pers;
    
    public static void main(String[] args) throws Exception {
        prof = new ArrayList<>();
        stud = new ArrayList<>();
        pers = new ArrayList<>();
        
        FileReader fl = new FileReader();
        fl.readData(prof,stud);
        
        for (int i = 0 ; i< stud.size() ; i++)
        {
            pers.add(stud.get(i));
        }
        for (int i = 0 ; i< prof.size() ; i++)
        {
            pers.add(prof.get(i));
        }
        
       
        for(int i =0;i<pers.size();i++)
        {
            System.out.println(pers.get(i));
        }
 
    }
    
}
