/**
 * Created by Cretu Calin on 10/30/2016.
 */

public class Main
        {
            public static void main(String arg[])
            {
                Point point1 = new Point(0,0);
                Point point2 = new Point(1,0);
                Point point3 = new Point(1,1);
                Point point4 = new Point(0,1);
//                CheckConvex checkConvex = new CheckConvex();
//                checkConvex.check(point1,point2,point3,point4);

                AcoperireConvexa acoperireConvexa = new AcoperireConvexa(point1, point2, point3,point4, new Point(9,0));
                if(acoperireConvexa.checkIfItsIn())
                    System.out.println(true);
                else System.out.println(false);
            }

        }

