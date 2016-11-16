import java.io.*;
import java.util.*;

/**
 * Created by Cretu Calin on 11/11/2016.
 */

public class Problema1 {
    private static int nrCuburi;
    private static int nrCulori;
    private static int currentColor = 0;
    private static int height = 0;
    private static Cub cub;
    private static ArrayList<Cub> cubs;
    private static ArrayList<Integer> indexArrayList;

    public static class Cub implements Comparable<Cub>
    {
        public Cub(int dimensiune, int culoare, int indice) {
            this.culoare = culoare;
            this.indice = indice;
            this.dimensiune = dimensiune;
        }

        private int dimensiune;
        private int culoare;
        private int indice;

        public int getDimensiune() {
            return dimensiune;
        }

        public int getCuloare() {
            return culoare;
        }

        public int getIndice() {
            return indice;
        }

        @Override
        public int compareTo(Cub o) {
            return o.dimensiune-dimensiune;
        }

    }

    public static void main(String arg[]) throws IOException {

        cubs = new ArrayList<>();
        indexArrayList = new ArrayList<>();
        Scanner scanner = new Scanner(new File("E:\\Facultate\\TapTema3\\src\\data1.in"));
        PrintWriter writer = new PrintWriter("date1.out", "UTF-8");
        nrCuburi = scanner.nextInt();
        nrCulori = scanner.nextInt();

        for(int i = 0 ; i< nrCuburi; i++)
        {
            int dimensiune = scanner.nextInt();
            int culoare = scanner.nextInt();
            cub = new Cub(dimensiune,culoare,i+1);
            cubs.add(cub);
        }

        Collections.sort(cubs);

        for(int i=0 ; i< cubs.size(); i++) {

            int color = cubs.get(i).getCuloare();
            if(color  != currentColor) {
                int dimension = cubs.get(i).getDimensiune();
                height = height + dimension;
                int index = cubs.get(i).getIndice();
                indexArrayList.add(index);
                currentColor = color;
            }
        }



        writer.println(height);
        for (Integer index: indexArrayList) {
            writer.print(index+" ");
        }
        writer.close();
        scanner.close();

    }


}
