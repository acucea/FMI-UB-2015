import javafx.util.Pair;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.util.*;

import static java.util.Collections.reverseOrder;

/**
 * Created by Cretu Calin on 11/13/2016.
 */
public class Problema2b {
    public static class Task2 implements Comparable<Task2>
    {
        public Task2(double lungime, int index) {
            this.lungime = lungime;
            this.index = index;
        }

        private double lungime;

        public int getIndex() {
            return index;
        }

        public void setIndex(int index) {
            this.index = index;
        }

        public double getLungime() {
            return lungime;
        }

        public void setLungime(int lungime) {
            this.lungime = lungime;
        }

        private int index;

        @Override
        public int compareTo(Task2 o) {
            return (int) (getLungime()-o.getLungime());
        }
    }
    private static int nrTexte;
    private static int nrBenzi;
    private static ArrayList<Integer> benzi[];
    private static ArrayList<Task2> taskuri;
    private static Task2 task;
    public static void main(String argc[]) throws FileNotFoundException, UnsupportedEncodingException {
        taskuri = new ArrayList<>();
        Scanner scanner = new Scanner(new File("E:\\Facultate\\TapTema3\\src\\date2b.in"));
        PrintWriter writer = new PrintWriter("date2b.out", "UTF-8");

        nrTexte = scanner.nextInt();
        nrBenzi = scanner.nextInt();

        benzi = new ArrayList[nrBenzi];
        for(int i =0;i <nrBenzi; i++)
        {
            benzi[i]= new ArrayList<>();
        }

        for(int i = 0 ; i< nrTexte; i++)
        {
            double lungime = scanner.nextInt();
            task = new Task2(lungime, i+1);
            taskuri.add(task);
        }

        Collections.sort(taskuri);

        for(int i = 0 ; i< taskuri.size(); i++)
        {
            benzi[i%nrBenzi].add(taskuri.get(i).getIndex());
        }


        for(int i =0; i<nrBenzi; i ++ )
        {
            writer.print("Banda numarul "+i+" : ");
            for(int j = 0; j<benzi[i].size(); j++)
            {
                writer.print(benzi[i].get(j)+ " ");
            }
            writer.println("");
        }
        writer.close();
        scanner.close();
    }
}
