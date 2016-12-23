import static java.lang.StrictMath.sqrt;

public class Main {
    private static MyPoint myPoint1;
    private static MyPoint myPoint2;
    private static MyPoint myPoint3;
    private static MyPoint myPoint4;
    private static MySegment mySegment1;
    private static MySegment mySegment2;

    public static void initData()
    {
////// merge cu intersectie intr-un punct
//        myPoint1 = new MyPoint(0,0);
//        myPoint2 = new MyPoint(4,4);
//        myPoint3 = new MyPoint(0,4);
//        myPoint4 = new MyPoint(4,0);

// merge cu segmente paralele
//        myPoint1 = new MyPoint(0,0);
//        myPoint2 = new MyPoint(4,0);
//        myPoint3 = new MyPoint(0,4);
//        myPoint4 = new MyPoint(4,4);

        // dreptele se intersecteaza, dar segmentele nu
//        myPoint1 = new MyPoint(0,0);
//        myPoint2 = new MyPoint(0,1);
//        myPoint3 = new MyPoint(1,3);
//        myPoint4 = new MyPoint(0,4);

        // pe aceeasi dreapta dar nu se intersecteaza
//        myPoint1 = new MyPoint(0,0);
//        myPoint2 = new MyPoint(0,2);
//        myPoint3 = new MyPoint(0,3);
//        myPoint4 = new MyPoint(0,4);

        //segmente pe aceeasi dreapta, care se intersecteaza
//        myPoint1 = new MyPoint(0,0);
//        myPoint2 = new MyPoint(3,0);
//        myPoint3 = new MyPoint(2,0);
//        myPoint4 = new MyPoint(4,0);

        myPoint1 = new MyPoint(0,0);
        myPoint2 = new MyPoint(2,2);
        myPoint3 = new MyPoint(1,1);
        myPoint4 = new MyPoint(3,3);

//        myPoint1 = new MyPoint(0,0);
//        myPoint2 = new MyPoint(2,2);
//        myPoint3 = new MyPoint(2,2);
//        myPoint4 = new MyPoint(4,4);

        mySegment1 = new MySegment(myPoint1, myPoint2);
        mySegment2 = new MySegment(myPoint3, myPoint4);
    }


    public static double ro()
    {
        return mySegment1.getA()*mySegment2.getB() - mySegment1.getB()*mySegment2.getA();
    }

    public static boolean isRoZero()
    {
        if(ro()==0)
            return true;
        return false;
    }

    public static double distance(MyPoint point1, MyPoint point2)
    {
        return  sqrt((point2.getX() - point1.getX()) * (point2.getX() - point1.getX())  +
                ((point2.getY()- point1.getY())*(point2.getY()- point1.getY())));
    }

    private static boolean isPointOnSegment(MyPoint myPoint, MySegment mySegment)
    {
        MyPoint myPoint1 = mySegment.getMyPoint1();
        MyPoint myPoint2 = mySegment.getMyPoint2();
        double bigDist = distance(myPoint1, myPoint2);
        double smallDist = distance(myPoint, myPoint1);
        double smallDist2 = distance(myPoint, myPoint2);
        if(bigDist == smallDist + smallDist2) {
            System.out.println("Point" + myPoint + "is on segment " + mySegment);
            return true;
        }else {
            System.out.println("Point" + myPoint + "is not on segment " + mySegment);
            return false;
        }
    }

    public static void getIntersection()
    {
        MyPoint myPoint;
        if(!isRoZero())
        {
            double x = (((-1)*mySegment1.getC()*mySegment2.getB()) + mySegment1.getB()*mySegment2.getC())/ro();
            double y = (((-1)*mySegment1.getA()*mySegment2.getC()) + mySegment1.getC()*mySegment2.getA())/ro();
            myPoint =  new MyPoint(x,y);
            if(isPointOnSegment(myPoint, mySegment1)&&isPointOnSegment(myPoint, mySegment2))
            {
                System.out.println(myPoint + "is on both "+ mySegment1 + " " + mySegment2);
                System.out.println(myPoint);
            }
        }
        else if(isRoZero())
        {
            double delta2= (mySegment1.getB()*mySegment2.getC()) - (mySegment2.getB()*mySegment1.getC());
            if(delta2 == 0)
            {
                System.out.println("Segmentele se afla pe aceeasi dreapta");
                //daca unul contine pe altul
                if(myPoint1.getX() < myPoint3.getX() && myPoint2.getX() > myPoint4.getX())
                {
                    System.out.println("Intersectia e de la punctul "+myPoint3 + "la punctul "+ myPoint4);
                }
                if(myPoint3.getX() < myPoint1.getX() && myPoint4.getX() > myPoint2.getX())
                {
                    System.out.println("Intersectia e de la punctul "+ myPoint1 + "la punctul "+ myPoint2);
                }


                //cand nu se contin

                double max1 = Math.max(myPoint1.getX(), myPoint2.getX());
                double min1 = Math.min(myPoint3.getX(), myPoint4.getX());

                double min2 = Math.min(myPoint1.getX(), myPoint2.getX());
                double max2 = Math.max(myPoint3.getX(), myPoint4.getX());
                if (max1 < min1 || max2 < min2)
                {
                    System.out.println("Segmentele sunt disjuncte");
                }
                if ((distance(myPoint1, myPoint2) == distance(myPoint1,myPoint3) + distance(myPoint3, myPoint2))
                        && myPoint2.getX()<myPoint4.getX()) {
                    System.out.println("Intersectia este de la "+myPoint3 + " la "+ myPoint2);
                }
            }
            else
                System.out.println("Segmentele nu se intersecteaza");
        }


    }

    public static void main(String argc[])
    {
        initData();
//        System.out.println(mySegment1);
//        System.out.println(mySegment2);
        getIntersection();

    }
}
