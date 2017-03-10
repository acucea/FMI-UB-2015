/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pojos;

import java.io.InputStream;

/**
 *
 * @author Student
 */
public abstract class Persoana {
    
    public Persoana(String nume, String prenume, Integer varsta) {
        this.nume = nume;
        this.prenume = prenume;
        this.varsta = varsta;
    }
    
    public String toString()
    {
        return "Persoana : " + nume + " " + prenume + " " + varsta ;
    }
    
    public Persoana readFromStream(InputStream is)
    {
        return this;
    }
    
    private String nume;

    public String getNume() {
        return nume;
    }

    public void setNume(String nume) {
        this.nume = nume;
    }

    public String getPrenume() {
        return prenume;
    }

    public void setPrenume(String prenume) {
        this.prenume = prenume;
    }

    public Integer getVarsta() {
        return varsta;
    }

    public void setVarsta(Integer varsta) {
        this.varsta = varsta;
    }

    
    private String prenume;
    private Integer varsta;
    
    
}
