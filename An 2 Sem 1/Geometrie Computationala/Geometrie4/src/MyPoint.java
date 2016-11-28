/**
 * Created by Cretu Calin on 11/13/2016.
 */
public class MyPoint {
    public double getX() {
        return x;
    }

    @Override
    public String toString() {
        return "MyPoint{" +
                "x=" + x +
                ", y=" + y +
                '}';
    }

    public double getY() {
        return y;
    }

    private double x;
    private double y;
    public MyPoint(double x, double y)
    {
        this.x = x;
        this.y = y;
    }

}
