import java.io.*;
import java.util.*;

class MyPair
{
    public int valoare;
    public float pondere;

    public MyPair(int valoare, float pondere)
    {
        this.valoare = valoare;
        this.pondere = pondere;
    }

    public void swap(MyPair other)
    {
        int val = valoare;
        float pon = pondere;

        valoare = other.valoare;
        pondere = other.pondere;

        other.valoare = val;
        other.pondere = pon;
    }
}

public class Problema3
{
    public static float sumaPonderilor(ArrayList<MyPair> arrayList, int a, int b)
    {
        float suma = 0;
        for (int i = a; i <= b; i++)
            suma += arrayList.get(i).pondere;

        return suma;
    }

    //quick sort partition lomuto
    public static int partition(ArrayList<MyPair> arrayList, int start, int end)
    {
        int pivot = arrayList.get(end).valoare;
        int i = start;
        for (int j = start; j < end; j++)
        {
            if (arrayList.get(j).valoare <= pivot)
            {
                arrayList.get(i).swap(arrayList.get(j));
                i++;
            }
        }

        arrayList.get(i).swap(arrayList.get(end));

        if (i == end)
        {
            return i - 1;
        }

        return i;
    }

    public static int DEI(ArrayList<MyPair> arrayList, int start, int end)
    {
        if (end == start)
        {
            return arrayList.get(start).valoare;
        }

        if (end - start == 1)
        {
            if (arrayList.get(start).pondere == arrayList.get(end).pondere)
            {
                return arrayList.get(start).valoare;
            }

            if (arrayList.get(start).pondere < arrayList.get(end).pondere)
            {
                return arrayList.get(start).valoare;
            }
            if (arrayList.get(end).pondere < arrayList.get(start).pondere)
            {
                return arrayList.get(end).valoare;
            }
        }

        int pivot = partition(arrayList, start, end);

        float suma1 = sumaPonderilor(arrayList, start, pivot - 1);
        float suma2 = sumaPonderilor(arrayList, pivot + 1, end);

        if (suma1 < 0.5 && suma2 <= 0.5)
        {
            return arrayList.get(pivot).valoare;
        }

        if (suma1 > suma2)
        {
            arrayList.get(pivot).pondere += suma2;
            return DEI(arrayList, start, pivot);
        }
        else
        {
            arrayList.get(pivot).pondere += suma1;
            return DEI(arrayList, pivot, end);
        }
    }

    public static void main(String args[])
    {

        Scanner sc  ;
        int nrOfPoints;
        ArrayList<MyPair> arrayList ;

        try
        {
            sc = new Scanner(new File("C:\\Users\\cretu\\Documents\\GitHub\\Laboratoare\\Laboratoare\\An 2 Sem 1\\Tehnici Avantate de Programare\\Tema4\\src\\prob3.in"));

            nrOfPoints = sc.nextInt();

            arrayList = new ArrayList<>(nrOfPoints + 1);
            arrayList.add(new MyPair(0, 0));

            for (int i = 1; i <= nrOfPoints; i++)
            {
                arrayList.add(new MyPair(0, 0));
                arrayList.get(i).valoare = sc.nextInt();
            }
            for (int i = 1; i <= nrOfPoints; i++)
            {
                arrayList.get(i).pondere = sc.nextFloat();
            }

            System.out.println(DEI(arrayList, 1, nrOfPoints));

            sc.close();
        }
        catch (Exception e)
        {
            System.out.println(e.toString());
        }
    }
}


