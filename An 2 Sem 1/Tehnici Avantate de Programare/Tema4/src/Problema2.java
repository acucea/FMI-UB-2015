import java.util.Map;

/**
 * Created by Cretu Calin on 11/23/2016.
 */

class Tabla
{
    private Point hole;
    private int table[][];
    private int dimension;
    private static int piesaCurenta = 1;
    public Tabla(int x, Point hole)
    {
        this.hole = hole;
        dimension = (int) Math.pow(2,x);
        table= new int[dimension][];
        for(int i =0; i<dimension; i++)
        {
            table[i] = new int[dimension];
        }
        initTabla();
    }
    public void initTabla()
    {
        for(int i=0; i<dimension; i++)
        {
            for(int j = 0; j< dimension; j++)
            {
                table[i][j] = 0;
            }
        }
        table[hole.getX()] [hole.getY()]= -1;
    }
    public void printTable()
    {
        for(int i=0; i<dimension; i++)
        {
            for(int j = 0; j< dimension; j++)
            {
                if(i==hole.getX() && j == hole.getY())
                    System.out.print("x ");
                else
                    System.out.print(table[i][j]+ " ") ;
            }
            System.out.println();
        }
    }
    public boolean isPointInSquare(Point pointX, Point point1, Point point2)
    {
        if(pointX.getX()>=point1.getX() && pointX.getY()>=point1.getY()
                && pointX.getX()<=point2.getX() && pointX.getY()<=point2.getY())
            return true;
        return false;
    }
    public void divideEtImperaStart()
    {
        divideEtImpera(new Point(0,0), new Point(dimension-1, dimension-1), dimension);
    }
    private void divideEtImpera(Point coltStangaSus, Point coltDreaptaJos, int dimension)
    {
        if(dimension == 2)
        {
            for(int i = coltStangaSus.getX(); i<= coltDreaptaJos.getX(); i++)
            {
                for(int j = coltStangaSus.getY(); j<=coltDreaptaJos.getY(); j++)
                {
                    if(table[i][j]==0) {
                        table[i][j] = piesaCurenta;
                    }
                }
            }
            piesaCurenta++;
        }
        else{
            int center1 = (coltStangaSus.getX() + coltDreaptaJos.getX())/2;
            int center2 = (coltStangaSus.getY() + coltDreaptaJos.getY())/2;
            Point point1 = new Point(center1, center2);
            Point point2 = new Point(center1, center2+1);
            Point point3 = new Point(center1+1, center2);
            Point point4 = new Point(center1+1, center2+1);
            //verificare pt primul patrat
            int dimensiunePtPuncte = dimension/2 -1;
            if(isPointInSquare(hole, coltStangaSus, point1)) {
                table[point2.getX()][point2.getY()] = piesaCurenta;
                table[point3.getX()][point3.getY()] = piesaCurenta;
                table[point4.getX()][point4.getY()] = piesaCurenta;
                piesaCurenta ++;
            }
            //verificare pt al doiea netestat
            else if(isPointInSquare(hole, new Point(point2.getX() - dimensiunePtPuncte, point2.getY())
                    , new Point(point2.getX(), point2.getY() + dimensiunePtPuncte))) {
                table[point1.getX()][point1.getY()] = piesaCurenta;
                table[point3.getX()][point3.getY()] = piesaCurenta;
                table[point4.getX()][point4.getY()] = piesaCurenta;
                piesaCurenta ++;
            }
            //verificare pt al treilea netestat
            else if(isPointInSquare(hole, new Point(point3.getX(), point3.getY() - dimensiunePtPuncte),
                    new Point(point3.getX() + dimensiunePtPuncte, point3.getY()))) {
                table[point1.getX()][point1.getY()] = piesaCurenta;
                table[point2.getX()][point2.getY()] = piesaCurenta;
                table[point4.getX()][point4.getY()] = piesaCurenta;
                piesaCurenta ++;
            }
            //verificare pt al patrulea
            else if(isPointInSquare(hole, point4, coltDreaptaJos)) {
                table[point1.getX()][point1.getY()] = piesaCurenta;
                table[point2.getX()][point2.getY()] = piesaCurenta;
                table[point3.getX()][point3.getY()] = piesaCurenta;
                piesaCurenta ++;
            }

            if(piesaCurenta >= 2)
            {
                if(table[coltStangaSus.getX()][coltStangaSus.getY()]!=0
                        && table[coltStangaSus.getX()][coltStangaSus.getY()]!=-1)
                {
                    table[point2.getX()][point2.getY()]=piesaCurenta;
                    table[point3.getX()][point3.getY()]=piesaCurenta;
                    table[point4.getX()][point4.getY()]=piesaCurenta;
                    piesaCurenta++;
                }
                else if(table[coltStangaSus.getX()][coltDreaptaJos.getY()]!=0
                        &&table[coltStangaSus.getX()][coltDreaptaJos.getY()]!=-1)
                {
                    table[point1.getX()][point1.getY()]=piesaCurenta;
                    table[point3.getX()][point3.getY()]=piesaCurenta;
                    table[point4.getX()][point4.getY()]=piesaCurenta;
                    piesaCurenta++;
                }
                else if(table[coltDreaptaJos.getX()][coltStangaSus.getY()]!=0&&
                table[coltDreaptaJos.getX()][coltStangaSus.getY()]!=-1)
                {
                    table[point1.getX()][point1.getY()]=piesaCurenta;
                    table[point2.getX()][point2.getY()]=piesaCurenta;
                    table[point4.getX()][point4.getY()]=piesaCurenta;
                    piesaCurenta++;
                }
                else if(table[coltDreaptaJos.getX()][coltDreaptaJos.getY()]!=0
                        &&table[coltDreaptaJos.getX()][coltDreaptaJos.getY()]!=-1)
                {
                    table[point1.getX()][point1.getY()]=piesaCurenta;
                    table[point2.getX()][point2.getY()]=piesaCurenta;
                    table[point3.getX()][point3.getY()]=piesaCurenta;
                    piesaCurenta++;
                }

            }

            divideEtImpera(coltStangaSus, point1,dimension/2);
            divideEtImpera(new Point(point2.getX() - dimensiunePtPuncte, point2.getY())
                    , new Point(point2.getX(), point2.getY() + dimensiunePtPuncte),dimension/2);
            divideEtImpera(new Point(point3.getX(), point3.getY() - dimensiunePtPuncte),
                    new Point(point3.getX() + dimensiunePtPuncte, point3.getY()),dimension/2);
            divideEtImpera( point4, coltDreaptaJos,dimension/2);

        }
    }
}

public class Problema2 {

    public static void main(String arg[])
    {
        Tabla tabla = new Tabla(4, new Point(7,7));
        tabla.divideEtImperaStart();
        tabla.printTable();
        //System.out.println((int)3/2);
    }
}
