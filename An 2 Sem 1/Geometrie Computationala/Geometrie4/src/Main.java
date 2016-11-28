import java.util.Scanner;

import static java.lang.StrictMath.sqrt;

/**
 * Created by Cretu Calin on 11/27/2016.
 */

class Patrulater
{
    public static double distance(MyPoint point1, MyPoint point2)
    {
        return  sqrt((point2.getX() - point1.getX()) * (point2.getX() - point1.getX())  +
                ((point2.getY()- point1.getY())*(point2.getY()- point1.getY())));
    }

    private MyPoint point1, point2, point3, point4;

    public Patrulater(MyPoint point1, MyPoint point2, MyPoint point3, MyPoint point4) {
        this.point1 = point1;
        this.point2 = point2;
        this.point3 = point3;
        this.point4 = point4;
    }

    public MyPoint getPoint1() {
        return point1;
    }

    public MyPoint getPoint2() {
        return point2;
    }

    public MyPoint getPoint3() {
        return point3;
    }

    public MyPoint getPoint4() {
        return point4;
    }

    public double masuraLuiA2()
    {
        double cosA2 = (-1)*((Math.pow(distance(point1,point3),2) - Math.pow(distance(point2,point3),2) - Math.pow(distance(point1,point2),2) )
                / (2 * distance(point2, point3) * distance(point1, point2)));
        return Math.round(Math.toDegrees(Math.acos(cosA2)));
    }

    public double masuraLuiA4()
    {
        double cosA4 = (-1)*((Math.pow(distance(point1,point3),2) - Math.pow(distance(point4,point3),2) - Math.pow(distance(point1,point4),2) )
                / ((2 * distance(point4, point3) * distance(point1, point4))));
        return Math.round(Math.toDegrees(Math.acos(cosA4)));
    }
}
public class Main {


    public static void main(String argc[])
    {
//        MyPoint myPoint1 = new MyPoint(1,1);
//        MyPoint myPoint2 = new MyPoint(3,1);
//        MyPoint myPoint3 = new MyPoint(1,4);
//        MyPoint myPoint4 = new MyPoint(3,3);

        MyPoint myPoint1 = new MyPoint(3,0);
        MyPoint myPoint2 = new MyPoint(0,0);
        MyPoint myPoint3 = new MyPoint(0,3);
        MyPoint myPoint4 = new MyPoint(3,3);

        Patrulater myPatrulater = new Patrulater(myPoint1, myPoint2, myPoint3, myPoint4);

        double sumaA2A4 = myPatrulater.masuraLuiA2() + myPatrulater.masuraLuiA4();

        if(sumaA2A4 == 180)
        {
            System.out.println("Punctul A4 este pe cerc");
        }
        else  if(sumaA2A4 > 180)
        {
            System.out.println("Punctul A4 este in interiorul cercului");
        }
        else  if(sumaA2A4 < 180)
        {
            System.out.println("Punctul A4 este in exteriorul cercului");
        }
    }
}
