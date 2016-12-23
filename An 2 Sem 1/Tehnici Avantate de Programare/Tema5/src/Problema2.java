import javafx.util.Pair;

import java.io.File;
import java.io.FileNotFoundException;
import java.util.Scanner;
import java.util.Stack;

/**
 *G Created by cretu on 12/13/2016.
 */

//Robotul pe tabla de sah
public class Problema2 {
    private static int[][] matrix;
    public static void main(String argc[]) throws FileNotFoundException {

        Scanner scanner = new Scanner(new File("C:\\Users\\cretu\\Documents\\GitHub\\Laboratoare\\" +
                "Laboratoare\\An 2 Sem 1\\Tehnici Avantate de Programare\\Tema5\\src\\problema2.txt"));
        int n = scanner.nextInt();
        int m = scanner.nextInt();
        matrix = new int[n][];
        for(int i = 0; i <n ; i++)
        {
            matrix[i] = new int[m];
        }

        for(int i =0; i< n; i++)
            for(int j = 0; j<m; j++)
                matrix[i][j]=scanner.nextInt();

        int [][] secondMatrix = new int[matrix.length][];
        for(int i = 0; i < matrix.length; i++)
            secondMatrix[i] = matrix[i].clone();
        for(int i =0; i< n; i++)
            for(int j = 0; j<m; j++)
                secondMatrix[i][j]=Integer.MIN_VALUE;

        for(int i =0; i< n; i++) {
            for (int j = 0; j < m; j++)
                System.out.print(matrix[i][j] + " ");
            System.out.println();
        }
        secondMatrix[n-1][0] = matrix[n-1][0];
        for(int i =0; i< n; i++) {
            for (int j = 0; j < m; j++)
                System.out.print(secondMatrix[i][j] + " ");
            System.out.println();
        }

        Stack<Pair< Integer, Integer >> mystack = new Stack<>();
        mystack.push(new Pair<>(n-1,0));
        while(!mystack.empty())
        {
            Pair<Integer, Integer> pair = mystack.pop();
            int x = pair.getKey();
            int y = pair.getValue();
            if(x > 0)
            {
                 if(secondMatrix[x-1][y] < secondMatrix[x][y] + matrix[x-1][y])
                 {
                     secondMatrix[x-1][y] = secondMatrix[x][y] + matrix[x-1][y];
                 }
                 mystack.push(new Pair<>(x-1,y));
            }
            if(y < m-1)
            {
                if(secondMatrix[x][y+1] < secondMatrix[x][y] + matrix[x][y+1])
                {
                    secondMatrix[x][y+1] = secondMatrix[x][y] + matrix[x][y+1];
                }
                mystack.push(new Pair<>(x,y+1));
            }
        }



        for(int i =0; i< n; i++) {
            for (int j = 0; j < m; j++)
                System.out.print(secondMatrix[i][j] + " ");
            System.out.println();
        }

        System.out.println(secondMatrix[0][m-1]);
        mystack.push(new Pair<>(0,m-1));
        int x = 0;
        int y = m-1;
        while(x != n-1  ||  y != 0)
        {
            if(x == n-1)
            {
                mystack.push(new Pair<>(x,y-1));
                y--;
            }
            else if (y == 0)
            {
                mystack.push(new Pair<>(x+1, y));
                x++;
            }
            else if(secondMatrix[x][y-1] > secondMatrix[x+1][y])
            {
                mystack.push(new Pair<>(x,y-1));
                y--;
            }
            else
            {
                mystack.push(new Pair<>(x+1, y));
                x++;
            }
        }
        while(!mystack.empty())
        {
            Pair<Integer, Integer > myPair = mystack.pop();
            System.out.println(myPair.getKey() + 1 +" "+ (myPair.getValue() + 1));
        }
    }


}
