/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pojos;

/**
 *
 * @author Student
 */
public class Student extends Persoana {
    private Integer anDeStudiu;
    private String numeFacultate;

    public Student(String nume, String prenume, Integer varsta) {
        super(nume, prenume, varsta);
    }

    public Integer getAnDeStudiu() {
        return anDeStudiu;
    }

    public void setAnDeStudiu(Integer anDeStudiu) {
        this.anDeStudiu = anDeStudiu;
    }

    public String getNumeFacultate() {
        return numeFacultate;
    }

    public void setNumeFacultate(String numeFacultate) {
        this.numeFacultate = numeFacultate;
    }
}
