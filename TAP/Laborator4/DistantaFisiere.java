import javafx.util.Pair;

import java.io.File;
import java.io.FileNotFoundException;
import java.util.*;

import static java.lang.StrictMath.sqrt;

/**
 * Created by Cretu Calin on 10/29/2016.
 */
public class DistantaFisiere {
    private Scanner scan;
    private HashMap hashMap;

    public DistantaFisiere()
    {
        hashMap = new HashMap();
    }
    public void readDataFirstFile()
    {
        try {
            scan = new Scanner(new File("E:\\TapTema2\\src\\file1"));
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        }
        while(scan.hasNextLine())
        {
            String line = scan.nextLine();
            String[] words = line.split("[ ,.]");

            for(int i = 0 ; i<words.length; i++)
            {
                if(!hashMap.containsKey(words[i]))
                {
                    Pair<Integer,Integer> pair = new Pair<>(1,0);
                    hashMap.put(words[i],pair );
                }
                else
                {
                    Pair<Integer,Integer> pair =
                    pair = (Pair) hashMap.get(words[i]);
                    int number = pair.getKey();
                    int number2 = pair.getValue();
                    number ++;
                    Pair newPair = new Pair(number, number2);
                    hashMap.put(words[i], newPair);
                }
            }

        }
    }

    public void readDataSecondFile()
    {
        try {
            scan = new Scanner(new File("E:\\TapTema2\\src\\file2"));
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        }
        while(scan.hasNextLine())
        {
            String line = scan.nextLine();
            String[] words = line.split("[ ,.]");

            for(int i = 0 ; i<words.length; i++)
            {
                if(!hashMap.containsKey(words[i]))
                {
                    Pair<Integer,Integer> pair = new Pair<>(0,1);
                    hashMap.put(words[i],pair );
                }
                else
                {
                    Pair<Integer,Integer> pair = (Pair) hashMap.get(words[i]);
                    int number = pair.getKey();
                    int number2 = pair.getValue();
                    number2 ++;
                    Pair newPair = new Pair(number, number2);
                    hashMap.put(words[i], newPair);
                }
            }
        }
    }
    public void start()
    {
        double firstSum=0;
        double secontSum=0;
        double thirdSum=0;
        Set set = hashMap.entrySet();
        Iterator i = set.iterator();

        while(i.hasNext()) {
            Map.Entry me = (Map.Entry)i.next();
            Pair<Integer, Integer> pair = (Pair) me.getValue();

            double element = pair.getKey() * pair.getValue();
            firstSum = firstSum + element;

            secontSum = secontSum + (pair.getKey() * pair.getKey());

            thirdSum = thirdSum + (pair.getValue() * pair.getValue());

        }
        double resoult = firstSum / (sqrt(secontSum) * sqrt(thirdSum));
        System.out.println(resoult);
    }
}
