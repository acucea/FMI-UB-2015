package problema3;

import java.io.File;
import java.io.FileNotFoundException;
import java.util.Scanner;
import java.util.Stack;
import java.util.StringJoiner;

/**
 * Created by teo on 17.12.2016.
 */
public class ProblemThree {

    public static class Element{
        private int length;
        private int last;

        public Element(int length, int last) {
            this.length = length;
            this.last = last;
        }

        public int getLength() {
            return length;
        }

        public void setLength(int length) {
            this.length = length;
        }

        public int getLast() {
            return last;
        }

        public void setLast(int last) {
            this.last = last;
        }

        @Override
        public String toString() {
            return length + "-" + last;
        }
    }

    public static void main(String[] args) throws FileNotFoundException {
        Scanner scanner = new Scanner(new File("/home/calin/GitHub/Laboratoare/Laboratoare/An 2 Sem 1/Tehnici Avantate de Programare/Tema5/src/problema3/date.in"));
        Scanner scan = new Scanner(new File("/home/calin/GitHub/Laboratoare/Laboratoare/An 2 Sem 1/Tehnici Avantate de Programare/Tema5/src/problema3/cod.in"));

        int m = scanner.nextInt();
        String cod = scan.next();

        String[] worlds = new String[m + 2];

        for(int i = 0; i < m; i++){
            worlds[i] = scanner.next();
        }

        worlds[m] = "0";
        worlds[m + 1] = "1";

        int[] minMatrix = new int[cod.length()];

        for(int i = 0; i < minMatrix.length; i++){
            minMatrix[i] = cod.length() + 1;
        }

        Element[][] matrix = new Element[cod.length()][cod.length()];


        for(int i = 0; i < cod.length(); i++){
            for(int j = 0; j <= i; j++){
                String subString = cod.substring(j,i + 1);
                boolean modif = false;
                for(int k = 0; k < m + 2; k++){
                    if(worlds[k].equals(subString) == true){
                        modif = true;
                        if(i - subString.length() < 0){
                            matrix[i][j] = new Element(1,k);
                        }
                        else{
                            matrix[i][j] = new Element(1 + minMatrix[i - subString.length()],k);
                        }
                        if(minMatrix[i] > matrix[i][j].getLength()){
                            minMatrix[i] = matrix[i][j].getLength();
                        }
                    }
                }
                if(modif == false){
                    matrix[i][j] = new Element(cod.length() + 1, -1);
                }
            }
        }


        Stack<String> stack = new Stack<String>();
        int ind = 0;
        for(int i = 0 ; i< cod.length(); i++){
            if(minMatrix[cod.length() - 1] == matrix[cod.length() - 1][i].getLength()){
                ind = i;
            }
        }
        int i = cod.length() - 1;
        int nr = minMatrix[cod.length() - 1];
        while(nr != 0){
            stack.push(worlds[matrix[i][ind].getLast()]);
            i = i - worlds[matrix[i][ind].getLast()].length();
            nr = nr - 1;

            for(int j = 0 ; j <= i; j++){
                if(minMatrix[i] == matrix[i][j].getLength()){
                    ind = j;
                }

            }

        }

        System.out.print(stack.pop());
        while(stack.isEmpty() == false){
            System.out.print( " + " + stack.pop());
        }

    }
}
