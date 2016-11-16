/**
 * Created by Cretu Calin on 10/30/2016.
 */
public class AcoperireConvexa {

    Point point1 ;
    Point point2 ;
    Point point3 ;
    Point point4 ;
    Point point;

    public AcoperireConvexa(Point point1 , Point point2 , Point point3 , Point point4 , Point point)
    {
        this.point1 = point1;
        this.point2 = point2;
        this.point3 = point3;
        this.point4 = point4;
        this.point = point;
    }
    private double ariaTriunghi( Point point1 ,
            Point point2 ,
            Point point3 )
    {
        return point1.x*point2.y + point2.x * point3.y + point3.x * point1.y
                - point3.x * point2.y - point1.x * point3.y - point2.x * point1.y;

    }
    private boolean checkAria(Point point, Point point1, Point point2, Point point3)
    {
        double ariaTriunghiMare = ariaTriunghi(point1, point2, point3) / 2;
        double ariaTriunghi1 = ariaTriunghi(point, point1, point2) / 2;
        double ariaTriunghi2 = ariaTriunghi(point, point2, point3) / 2;
        double ariaTriunghi3 = ariaTriunghi(point, point1, point3) / 2;

        if(ariaTriunghiMare == ariaTriunghi1 + ariaTriunghi2 + ariaTriunghi3)
            return true;
        return false;
    }

    public boolean checkIfItsIn()
    {
        if (checkAria(point, point1, point2, point3))
            return true;
        if (checkAria(point, point2, point3, point4))
            return true;
        if (checkAria(point, point3, point4, point1))
            return true;
        if (checkAria(point, point4, point1, point2))
            return true;
        return false;
    }


}
