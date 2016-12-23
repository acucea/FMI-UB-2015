/**
 * Created by Cretu Calin on 10/30/2016.
 */
public class CheckConvex
{
    Point point1 ;
    Point point2 ;
    Point point3 ;
    Point point4 ;

    public boolean checkProduct(Point point1, Point point2, Point point3, Point point4)
    {
        int det1 = point3.x * point1.y + point1.x * point2.y + point2.x*point3.y
                - point2.x*point1.y - point1.x*point3.y - point3.x*point2.y;
        int det2 = point4.x * point1.y + point1.x * point2.y + point2.x*point4.y
                - point2.x*point1.y - point1.x*point4.y - point4.x*point2.y;
        return (det1*det2>0);
    }
    public void check(Point point1, Point point2, Point point3, Point point4)
    {
        if (checkProduct(point1, point2,point3, point4) == true
                && checkProduct(point2, point3,point1, point4) == true
                && checkProduct(point3, point4,point1, point2) == true
                && checkProduct(point4, point1,point2, point3) == true)
        {
            System.out.println("True");
        }
        else System.out.println("False");
    }
}