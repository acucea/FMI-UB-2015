import java.io.File;
import java.io.FileNotFoundException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.util.*;


public class Problema3 {

    public static class Activitate implements Comparable<Activitate>{

        private int sfarsit;
        private int profit;
        private int indice;

        public Activitate(int sfarsit, int profit, int indice)  {
            this.sfarsit = sfarsit;
            this.profit = profit;
            this.indice = indice;
        }

        public int compareTo(Activitate o){
            return  o.sfarsit - sfarsit;
        }

        public int getSfarsit() {
            return sfarsit;
        }

        public int getProfit() {
            return profit;
        }

        public int getIndice() {
            return indice;
        }


        @Override
        public String toString() {
            return "Activitate{" +
                    "sfarsit=" + sfarsit +
                    ", profit=" + profit +
                    ", indice=" + indice +
                    '}';
        }
    }

    public static void main(String[] args) throws FileNotFoundException, UnsupportedEncodingException {

        PrintWriter writer = new PrintWriter("date3.out", "UTF-8");
        Scanner scanner = new Scanner(new File("E:\\Facultate\\TapTema3\\src\\date3.in"));
        int nrActitivati = scanner.nextInt();
        Activitate[] activitati = new Activitate[nrActitivati];

        for (int i = 0; i < nrActitivati; i++) {
            int profit = scanner.nextInt();
            int sfarsit = scanner.nextInt();
            activitati[i] = new Activitate(sfarsit, profit, i + 1);
        }

        Arrays.sort(activitati);

        PriorityQueue<Activitate> pq= new PriorityQueue<>(10, new Comparator<Activitate>() {
            public int compare(Activitate x, Activitate y) {
                if (x.getProfit() < y.getProfit()) return 1;
                if (x.getProfit() > y.getProfit()) return -1;
                return 0;
            }
        });

        int promitMaxim = 0;
        Stack<Activitate> activitateStack = new Stack<>();

        int poz = 0;
        for(int i = activitati[0].getSfarsit(); i >= 1; i--){
            if(poz != nrActitivati) {
                while (activitati[poz].getSfarsit() == i) {
                    pq.add(activitati[poz]);
                    poz++;
                    if (poz == nrActitivati) {
                        break;
                    }
                }
            }
            if(pq.isEmpty() == false){
                Activitate temp = pq.poll();
                promitMaxim = promitMaxim + temp.getProfit();
                activitateStack.add(temp);
            }
        }

        writer.println(promitMaxim);
        while(activitateStack.isEmpty() == false)
        {
            writer.print(activitateStack.pop().getIndice() + " ");
        }
        scanner.close();
        writer.close();
    }
}
