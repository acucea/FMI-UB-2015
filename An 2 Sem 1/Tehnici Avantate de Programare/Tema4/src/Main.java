import java.io.File;
import java.io.FileNotFoundException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.Scanner;

/**
 * Created by Cretu Calin on 11/23/2016.
 */

class Point
{
    static Comparator<Point> getAttribute1Comparator() {
        return new Comparator<Point>() {
            @Override
            public int compare(Point o1, Point o2) {

                if (o1.x==o2.x)
                    return o1.y - o2.y;
                return o1.x - o2.x;
            }
            // compare using attribute 1
        };
    }

    static Comparator<Point> getAttribute2Comparator() {
        return new Comparator<Point>() {
            @Override
            public int compare(Point o1, Point o2) {
                if (o1.y==o2.y)
                    return o1.x - o2.x;
                return o1.y - o2.y;
            }
            // compare using attribute 2
        };
    }

    public int getX() {
        return x;
    }

    public int getY() {
        return y;
    }

    private int x, y;
    public Point(int x, int y)
    {
        this.x = x;
        this.y = y;
    }


    @Override
    public String toString() {
        return "Point{" +
                "x=" + x +
                ", y=" + y +
                '}';
    }
}

public class Main {

    static double inf = Double.POSITIVE_INFINITY;
    static double minDistance = inf;
    static ArrayList<Point>  pointsX;
    static int nrOfPoints;

    public static void main (String argc[]) throws FileNotFoundException {
        pointsX = new ArrayList<>();
        Scanner scanner = new Scanner(new File("C:\\Users\\cretu\\Documents\\GitHub\\Laboratoare\\Laboratoare\\An 2 Sem 1\\Tehnici Avantate de Programare\\Tema4\\src\\cmap.in"));
        nrOfPoints = scanner.nextInt();
        pointsX.add(new Point(0,0));
        for(int i= 0 ; i < nrOfPoints; i++)
        {
            pointsX.add(new Point(scanner.nextInt(), scanner.nextInt()));
        }


        Collections.sort(pointsX, Point.getAttribute1Comparator());

        double minDistance = divide(1,nrOfPoints);

        System.out.println(Math.sqrt(minDistance));

        try {
            PrintWriter writer = new PrintWriter("cmap.out", "UTF-8");
            writer.println(Math.sqrt(minDistance));
            writer.close();
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }


    }

    public static double sqdouble(double x)
    {
        return x*x;
    }

    public static double distance(Point a, Point b)
    {
        return sqdouble(a.getX()-b.getX())+sqdouble(a.getY()-b.getY());
    }

    public static double divide(int st, int dr) {

        if(dr - st + 1 > 3)
        {
            int mij = (st + dr) / 2;
            double minim = Math.min(divide(st,mij),divide(mij+1,dr));

            int st1 = Math.max(st-7,1);
            int dr1 = Math.min(dr+7,nrOfPoints);

            for(int i = st1; i <= dr1; ++i)
                for(int j = i + 1; j <= i + 7 && j <= dr1; ++j) // ???
                    minim = Math.min(minim,distance(pointsX.get(i),pointsX.get(j)));

            return minim;
        }
        else
        {
            double minim = distance(pointsX.get(st),pointsX.get(st+1));
            for(int i = st; i < dr; ++i)
                for(int j = i + 1; j <= dr; ++j)
                    minim = Math.min(minim,distance(pointsX.get(i),pointsX.get(j)));

            return minim;
        }

    }


}
