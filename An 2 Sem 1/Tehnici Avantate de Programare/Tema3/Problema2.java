import javafx.util.Pair;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.util.*;

/**
 * Created by Cretu Calin on 11/13/2016.
 */
public class Problema2 {

    public static class Task implements Comparable<Task>
    {
        double dimensiune;
        double freventa;
        double raport;

        public int getIndex() {
            return index;
        }

        int index;

        public Task(double dimensiune, double freventa, int index)
        {
            this.dimensiune = dimensiune;
            this.freventa = freventa;
            this.raport = dimensiune / freventa;
            this.index = index;
        }

        @Override
        public int compareTo(Task o) {
            if(raport < o.raport)
                return -1;
            if(raport > o.raport)
                return 1;
            else
                return 0;
        }
    }
    private static int nrTexte;
    private static ArrayList<Task> tasksArrayList;
    private static Task task;
    public static void main(String argc[]) throws FileNotFoundException, UnsupportedEncodingException {
        tasksArrayList = new ArrayList<>();
        Scanner scanner = new Scanner(new File("E:\\Facultate\\TapTema3\\src\\date2.in"));
        PrintWriter writer = new PrintWriter("date2.out", "UTF-8");
        nrTexte = scanner.nextInt();

        for(int i = 0 ; i< nrTexte; i++)
        {
            double dimensiune = scanner.nextInt();
            double frecventa = scanner.nextInt();
            task = new Task(dimensiune, frecventa,i+1);
            tasksArrayList.add(task);
        }

        Collections.sort(tasksArrayList);

        for(int i= 0; i<tasksArrayList.size(); i++) {
            int index = tasksArrayList.get(i).getIndex();
            writer.print(index+" ");
        }

        writer.close();
        scanner.close();
    }
}
