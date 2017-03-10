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
public class Profesor extends Persoana{

    private String titlu;
    private Integer vechime;
    private String categra;

    public Profesor(String nume, String prenume, Integer varsta) {
        super(nume, prenume, varsta);
    }
      
    /**
     *
     * @param is
     * @return
     */
    @Override
    public Profesor readFromStream(InputStream is)
    {
        
    }
    public String getTitlu() {
        return titlu;
    }

    public void setTitlu(String titlu) {
        this.titlu = titlu;
    }

    public Integer getVechime() {
        return vechime;
    }

    public void setVechime(Integer vechime) {
        this.vechime = vechime;
    }

    public String getCategra() {
        return categra;
    }

    public void setCategra(String categra) {
        this.categra = categra;
    }
  
    
}
