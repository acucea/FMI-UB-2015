/**
 * Created by Cretu Calin on 11/24/2016.
 */
public class Problema3 {
    public static void main(String argc[])
    {
        double  N = 7;


        //This one works on a sorted array
        double x[] = new double[]{ 1, 2, 3,5, 6, 9, 11};
        double w[] = new double[]{0.12, 0.1, 0.05, 0.1, 0.13, 0.2, 0.3};

//        double x[] = new double[]{ 1, 2, 3,5, 6, 9, 11};
//        double w[] = new double[]{0.10, 0.12, 0.05, 0.1, 0.2, 0.13, 0.3};


        double S = 0;
        for(int i = 0; i <N;i++)
        {
            S = S + w[i];
        }

        System.out.println("Total weight "+ S);

        int k = 0;
        double sum = S - w[0];

        while(sum > S/2)
        {
            ++k;
            sum -= w[k];
        }

        System.out.println(x[k]);


    }
}
