import java.lang.reflect.Array;
import java.util.Arrays;


public class PrimaProblema {

    private int n=8,a,b,c,start,end;
    private int vec[]={3,1,2,-5,-2,10,7,3};

    public void start() {
        Arrays.sort(vec);
        for (int i = 0; i <= n - 3; i++) {
            a = vec[i];
            start = i + 1;
            end = n - 1;
            while (start < end)
            {
                b = vec[start];
                c = vec[end];
                if (a + b + c == 0) {
                    System.out.println(a + " , " + b + " , " + c + " = 0");
                    end = end - 1;
                } else if (a + b + c > 0)
                    end = end - 1;
                else
                    start = start + 1;
            }

        }

    }
}
