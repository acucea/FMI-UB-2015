package problema5;

import java.io.File;
import java.io.FileNotFoundException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Scanner;

/**
 * Created by cretu on 12/19/2016.
 */

class Activitate implements Comparable<Activitate>{

    private int profit;
    private int deadline;

    public int getProfit() {
        return profit;
    }

    public void setProfit(int profit) {
        this.profit = profit;
    }

    public int getDeadline() {
        return deadline;
    }

    public void setDeadline(int deadline) {
        this.deadline = deadline;
    }

    @Override
    public String toString() {
        return "Activitate{" +
                "profit=" + profit +
                ", deadline=" + deadline +
                ", durata=" + durata +
                '}';
    }

    public int getDurata() {
        return durata;
    }

    public void setDurata(int durata) {
        this.durata = durata;
    }

    private int durata;

    public Activitate(int profit, int deadline, int durata) {
        this.profit = profit;
        this.deadline = deadline;
        this.durata = durata;
    }

    @Override
    public int compareTo(Activitate o) {
        return deadline-o.deadline;
    }
}
public class Problema5 {

    private static ArrayList<Activitate> activitateArrayList = new ArrayList<>();
    private static int nrActivitati;
    private static int M[][];


    public static void PrintOpt(int i, int t)
    {
        if (i == 0) return;
        if(M[i][t] == M[i-1][t])
            PrintOpt(i-1,t );
        else
        {
            int tPrim = Math.min(t, activitateArrayList.get(i-1).getDeadline()) - activitateArrayList.get(i-1).getDurata();
            PrintOpt(i-1, tPrim);
            System.out.println("Schedule job " + i + " at time " + tPrim);
        }
    }

    public static void main(String argc[]) throws FileNotFoundException {
        Scanner scanner = new Scanner(new File("C:\\Users\\cretu\\Documents\\GitHub\\Laboratoare\\Laboratoare\\An 2 Sem 1\\Tehnici Avantate de Programare\\Tema5\\src\\problema5\\date.in"));
        nrActivitati = scanner.nextInt();
        for (int i = 0; i < nrActivitati; i++) {
            activitateArrayList.add(new Activitate(scanner.nextInt(), scanner.nextInt(), scanner.nextInt()));
        }
        Collections.sort(activitateArrayList);
        for (int i = 0; i < nrActivitati; i++) {
            System.out.println(activitateArrayList.get(i));
        }
        int maxDeadline = activitateArrayList.get(nrActivitati-1).getDeadline();
        System.out.println(maxDeadline);

        //mem alloc
        M = new int[nrActivitati+1][];
        for(int i = 0; i< nrActivitati + 1 ; i++)
        {
            M[i] = new int[maxDeadline+1];
        }
        for(int i = 0; i < nrActivitati + 1 ; i++) {
            for (int j = 0; j < maxDeadline + 1; j++)
            {
                System.out.print(M[i][j]);
            }
            System.out.println("");
        }
        //solve
//        for(int i = 0;i <= nrActivitati+1 ; i++)
//        {
//            M[0][i] = 0;
//        }

        for(int i =1; i<=nrActivitati;i++)
        {
            for(int t = 0; t <= maxDeadline; t++)
            {
                int tPrim  = Math.min(t, activitateArrayList.get(i-1).getDeadline()) - activitateArrayList.get(i-1).getDurata();
                if(tPrim < 0)
                {
                    M[i][t] = M[i-1][t];
                }
                else
                {
                    M[i][t] = Math.max(M[i-1][t], activitateArrayList.get(i-1).getProfit() + M[i-1][t]);
                }
            }
        }


        //sout M
        System.out.println(" ");
        System.out.println(" ");
        for(int i = 0; i < nrActivitati + 1 ; i++) {
            for (int j = 0; j < maxDeadline + 1; j++)
            {
                System.out.print(M[i][j] + " ");
            }
            System.out.println("");
        }

        PrintOpt(nrActivitati, maxDeadline);




    }
}
