import javafx.util.Pair;

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

class PerechePuncte
{

}


public class Problema4 {

    static double inf = Double.POSITIVE_INFINITY;
    static double minDistance = inf;
    static ArrayList<Point> points;
    static int nrOfPoints;

    public static void main (String argc[]) throws FileNotFoundException {
        points = new ArrayList<>();
        Scanner scanner = new Scanner(new File("E:\\Github\\Laboratoare\\An 2 Sem 1\\Tehnici Avantate de Programare\\Tema4\\src\\cmap.in"));
        nrOfPoints = scanner.nextInt();
        for(int i= 0 ; i < nrOfPoints; i++)
        {
            points.add(new Point(scanner.nextInt(), scanner.nextInt()));
        }

        Collections.sort(points, Point.getAttribute1Comparator());


//        System.out.println(minDistanceStart());
      //  double minDist = Min(1,nrOfPoints);
//
//        try {
//            PrintWriter writer = new PrintWriter("cmap.out", "UTF-8");
//            writer.println(minDist);
//        } catch (UnsupportedEncodingException e) {
//            e.printStackTrace();
//        }


    }

    public static double sqdouble(double x)
    {
        return x*x;
    }
    public static double distance(Point a, Point b)
    {
        return sqdouble(a.getX()-b.getX())+sqdouble(a.getY()-b.getY());
    }

//    private static Pair<Point,Point> minDistance(int startIndex, int stopIndex, int length)
//    {
//        if(length<=3)
//        {
//
//        }
//    }
//    public static double minDistanceStart()
//    {
//        return minDistance(0,points.size(),points.size());
//    }


//    public static double Min(int st, int dr)
//    {
//        if (dr==st)
//            return inf;
//        if (dr==st+1)
//            return distance(points.get(st),points.get(dr));
//
//        ArrayList <Point> A, B;
//        A = new ArrayList<>();
//        B = new ArrayList<>();
//        int i = (st+dr)/2;
//        double d1, d2;
//        d1 = Min(st, i);
//        d2 = Min(i, dr);
//        mn = Math.min(d1,Math.min(mn, d2));
//
//        int sav = i-1;
//        double m = points.get(i).getX();
//        while (Math.abs(m - points.get(sav).getX()) < mn && sav > 0)
//        {
//            A.add(points.get(sav));
//            sav--;
//        }
//
//        sav = i;
//        while (Math.abs(points.get(sav).getX() - m) < mn && sav <= nrOfPoints )
//        {
//            B.add(points.get(sav));
//            sav++;
//        }
//
//        Collections.sort(A, Point.getAttribute2Comparator());
//        Collections.sort(B, Point.getAttribute2Comparator());
//
//        int j ;
//        if (B.size() != 0 && A.size() != 0)
//        {
//            for (i = 0; i < A.size(); i++)
//            {
//                for (j =0 ; j + 1 < B.size() && B.get(j+1).getY() + mn < A.get(i).getY(); ++j);
//
//                sav = j;
//                while (sav >= 0 && Math.abs(B.get(sav).getY()-A.get(i).getY()) < mn)
//                    mn = Math.min(distance(B.get(sav--),A.get(i)), mn);
//
//                while (j + 1 < B.size() && Math.abs(B.get(j+1).getY()-A.get(i).getY()) < mn)
//                    mn = Math.min(distance(B.get(++j),A.get(i)), mn);
//            }
//        }
//        return mn;
//    }


}
