import com.sun.prism.shader.Solid_TextureYV12_AlphaTest_Loader;

import javax.print.DocFlavor;
import java.io.File;
import java.io.FileNotFoundException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Scanner;

/**
 * Created by cretu on 12/17/2016.
 */

class Suprapunere implements Comparable<Suprapunere>{
    private char X;

    public int getMethod() {
        return method;
    }

    public void setMethod(int method) {
        this.method = method;
    }

    private int method;

    public char getX() {
        return X;
    }

    public void setX(char x) {
        X = x;
    }

    public char getY() {
        return Y;
    }

    public void setY(char y) {
        Y = y;
    }

    public int getPenalizare() {
        if(X == Y)
            return 0;
        return penalizare;
    }

    public void setPenalizare(int penalizare) {
        this.penalizare = penalizare;
    }

    private char Y;
    private int penalizare;
    public Suprapunere(char X, char Y, int penalizare)
    {
        this.X = X;
        this.Y = Y;
        this.penalizare = penalizare;
    }
    public Suprapunere(char X, char Y)
    {
        this.X = X;
        this.Y = Y;
        penalizare = 0;
    }
    public Suprapunere(int penalizare)
    {
        this.penalizare = penalizare;
        this.X = 'n';
        this.Y = 'm';
    }
    public Suprapunere()
    {
        this.penalizare = 0;
        this.X = 'n';
        this.Y = 'm';
    }


    public int compareTo(Suprapunere o) {
        if(getX() == o.getX() && getY() == o.getY())
            return 0;
        if(getX() == o.getY() && getY() == o.getX())
            return 0;
        return -1;
    }

    @Override
    public String toString() {
        return "Suprapunere{" +
                "X=" + X +
                ", Y=" + Y +
                ", penalizare=" + penalizare +
                '}';
    }
}
public class Problema4 {

    private static final int penalizareSpatiu = 2;
    private static ArrayList<Suprapunere> penalizariCustom ;
    private static final int penalizareGenerala = 3;
    private static Suprapunere[][] suprapunereArrayList;
    public static void main (String argc[]) throws FileNotFoundException {

        penalizariCustom = new ArrayList<>();

        penalizariCustom.add(new Suprapunere('A','C',1));
        penalizariCustom.add(new Suprapunere('G','T',1));

        Scanner scanner = new Scanner(new File("C:\\Users\\cretu\\Documents\\GitHub\\Laboratoare\\Laboratoare\\An 2 Sem 1\\Tehnici Avantate de Programare\\Tema5\\src\\date.in"));
        String firstString = scanner.nextLine();
        String secondString = scanner.nextLine();



        int n = firstString.length();
        int m = secondString.length();
        //mem alloc
        suprapunereArrayList = new Suprapunere[n+1][];
        for(int i =0; i <= n; i ++)
            suprapunereArrayList[i] = new Suprapunere[m+1];

        // init
        for(int i = 0; i<= n; i++)
        {
            suprapunereArrayList[i][0] = new Suprapunere('c','l',i* penalizareSpatiu);
        }
        for(int i = 0; i<=m ; i++)
        {
            suprapunereArrayList[0][i] = new Suprapunere('l','c',i*penalizareSpatiu);
        }

        for(int i = 1; i<= n; i++)
            for(int j = 1; j<= m ; j++)
            {
                char X = firstString.charAt(i-1);
                char Y = secondString.charAt(j-1);
                int penalizareXY ;

                if(X == Y)
                    penalizareXY =0;
                else
                    penalizareXY = penalizareGenerala;

                Suprapunere suprapunere = new Suprapunere(X,Y);
                for(Suprapunere suprapunere1 : penalizariCustom)
                {
                    if(suprapunere.compareTo(suprapunere1)==0) {
                        penalizareXY = suprapunere1.getPenalizare();
                        System.out.println("Contine");
                    }
                }
                /*if(suprapunereIntegerHashMap.containsKey(suprapunere)) {
                    System.out.println("Contine");
                    penalizareXY = suprapunereIntegerHashMap.get(suprapunere);
                }
                else
                    penalizareXY = penalizareGenerala;*/

                suprapunere = suprapunereArrayList[i-1][j-1];
                int penalizare1 = penalizareXY + suprapunere.getPenalizare();
                suprapunere = suprapunereArrayList[i-1][j];
                int penalizare2 = penalizareSpatiu + suprapunere.getPenalizare();
                suprapunere = suprapunereArrayList[i][j-1];
                int penalizare3 = penalizareSpatiu + suprapunere.getPenalizare();
                int min1 = Math.min(penalizare1,penalizare2);
                int minLocal = Math.min(min1, penalizare3);

                suprapunereArrayList[i][j] = new Suprapunere(minLocal);
                if(minLocal == penalizare1)
                    suprapunereArrayList[i][j].setMethod(1);
                else if (minLocal == penalizare2)
                    suprapunereArrayList[i][j].setMethod(2);
                else if(minLocal == penalizare3)
                    suprapunereArrayList[i][j].setMethod(3);

            }

        for(int i = 0; i<= n; i++) {
            for (int j = 0; j <= m; j++) {
                System.out.print(suprapunereArrayList[i][j]);
            }
            System.out.println("");
        }
        StringBuffer firstReString = new StringBuffer("");
        StringBuffer secondReString = new StringBuffer("");


        System.out.println(suprapunereArrayList[n][m].getPenalizare());

        while(m>0 && n>0)
        {
            Suprapunere suprapunere = suprapunereArrayList[n][m];
            if(suprapunere.getMethod() == 1)
            {
                firstReString.append(firstString.charAt(n-1));
                secondReString.append(secondString.charAt(m-1));
                m--;
                n--;
            }
            if(suprapunere.getMethod() == 2)
            {
                firstReString.append(firstString.charAt(n-1));
                secondReString.append("_");
                n--;
            }
            if(suprapunere.getMethod() == 3)
            {
                firstReString.append("_");
                secondReString.append(secondString.charAt(m-1));
                m--;
            }

        }

        firstReString = firstReString.reverse();
        secondReString = secondReString.reverse();
        System.out.println(firstReString);
        System.out.println(secondReString);




//        Suprapunere suprapunere = new Suprapunere('X','Y');
//        Suprapunere suprapunere1 = new Suprapunere('Y','X');

//        if(suprapunere.compareTo(suprapunere1)==0)
//            System.out.println("Egale");
//        else
//            System.out.printf("Inegale");



    }
}
