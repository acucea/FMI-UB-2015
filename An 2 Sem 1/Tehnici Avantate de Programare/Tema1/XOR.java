import com.sun.scenario.effect.impl.sw.sse.SSEBlend_SRC_OUTPeer;
import jdk.nashorn.internal.runtime.regexp.joni.ScanEnvironment;

import java.io.*;
import java.util.ArrayList;
import java.util.Scanner;


public class XOR {
    private BufferedReader br;
    private String string1, string2,myString;
    private ArrayList<Integer> arrayList;
    private String key;

    public void readData() {

        try {

            string1 = "";
            string2 = "";
            myString = "";
            arrayList = new ArrayList<Integer>() ;
            File text = new File("E:\\Java\\Impartire\\src\\date.in");
            Scanner fileScanner = new Scanner(text);
            //br = new BufferedReader(new FileReader("E:\\Java\\Impartire\\src\\date.in"));
            while((fileScanner.hasNextLine()))
            {
                string1 = fileScanner.nextLine();
                string2 = string2 + string1;
                if (fileScanner.hasNextLine())
                    string2 = string2.concat("\n");
            }
            myString = string2;
            Scanner scanner = new Scanner(System.in);
            System.out.println("Enter the key :");
            key=scanner.nextLine();


        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
    public void encrypt()
    {
        int stringLenght = myString.length();
        int keyLenght = key.length();
        for (int i = 0; i<stringLenght; i++)
        {
            int firstCh = (int) myString.charAt(i);
            int secondCh = (int) key.charAt(i%keyLenght);
            int number = firstCh^secondCh;
            arrayList.add(number);
        }
    }
    public void decrypt()
    {
        Scanner scanner = new Scanner(System.in);
        System.out.println("Enter the key :");
        String key=scanner.nextLine();
        String decrypted = "";
        for (int i =0;i < arrayList.size();i++)
        {
            int number = arrayList.get(i);
            int secondNumber = (int) key.charAt(i%key.length());
            int xor = number ^ secondNumber;
            System.out.print((char)xor);
        }
    }
    public void printData()
    {
        for(int i =0; i<arrayList.size() ;i++)
        {
            System.out.print(arrayList.get(i)+ " ");
        }
    }
}
