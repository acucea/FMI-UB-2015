/**
 * Created by Cretu Calin on 11/13/2016.
 */
public class MySegment {
    public MyPoint getMyPoint2() {
        return myPoint2;
    }

    public MyPoint getMyPoint1() {
        return myPoint1;
    }

    private MyPoint myPoint1, myPoint2;
    private double a;
    private double b;
    private double c;

    public double getA() {
        return a;
    }

    public double getB() {
        return b;
    }

    public double getC() {
        return c;
    }


    public MySegment(MyPoint myPoint1, MyPoint myPoint2)
    {
        this.myPoint1 = myPoint1;
        this.myPoint2 = myPoint2;
        a = myPoint1.getY() - myPoint2.getY();
        b = myPoint2.getX() - myPoint1.getX();
        c = (myPoint1.getX()*myPoint2.getY()) - (myPoint2.getX()*myPoint1.getY());
    }

    public static void main(String argc[])
    {
        MyPoint myPoint1 = new MyPoint(1,3);
        MyPoint myPoint2 = new MyPoint(1,-3);
        MySegment mySegment = new MySegment(myPoint1,myPoint2);
        System.out.println(mySegment.toString());
    }

    @Override
    public String toString() {
        return "MySegment{" +
                "myPoint1=" + myPoint1 +
                ", myPoint2=" + myPoint2 +
                '}';
    }
}
