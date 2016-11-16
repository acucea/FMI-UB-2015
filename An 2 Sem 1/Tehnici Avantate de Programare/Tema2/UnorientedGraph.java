import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.lang.reflect.Array;
import java.util.ArrayDeque;
import java.util.LinkedList;

/**
 * Created by Cretu Calin on 10/16/2016.
 */
public class UnorientedGraph {

    private MyQueue<Integer> myQueue;
    private int nrVarfuri, nrMuchii, varfStart;
    private LinkedList<Integer> []linkList;

    void readData()
    {
        BufferedReader br = null;
        try {
            br = new BufferedReader(new FileReader("E:\\Java\\Impartire\\src\\graph.txt"));
            nrVarfuri = Integer.parseInt(br.readLine());
            linkList = new LinkedList[nrVarfuri+1];
            for (int i = 1; i <= nrVarfuri; i++) {

            linkList[i]=new LinkedList();
            }
            nrMuchii = Integer.parseInt(br.readLine());
            for(int i =0; i <nrMuchii; i++)
            {
                int varf1 = Integer.parseInt(br.readLine());
                int varf2 = Integer.parseInt(br.readLine());
                linkList[varf1].add(varf2);
                linkList[varf2].add(varf1);

            }
            varfStart = Integer.parseInt(br.readLine());

        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    void BreadthFirstSearch()
    {
        int marked[] = new int[nrVarfuri+1];
        for(int i =0; i < marked.length; i ++)
            marked[i] = 0;
        myQueue = new MyQueue<>();
        myQueue.add(varfStart);
        while(!myQueue.isEmpty())
        {
            int varf = myQueue.remove();
            System.out.println(varf);
            marked[varf]=1;
            for(int i =0; i<linkList[varf].size();i++)
            {
                if (marked[linkList[varf].get(i)]==0) {
                    myQueue.add(linkList[varf].get(i));
                    marked[linkList[varf].get(i)]=1;
                }
            }
        }
    }



}
