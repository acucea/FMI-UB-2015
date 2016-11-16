import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.LinkedList;

/**
 * Created by Cretu Calin on 10/16/2016.
 */
public class UnorientedGraph {

    private MyQueue myQueue;
    private int nrVarfuri, nrMuchii, varfStart;
    private LinkList linkList[];


    void readData()
    {
        BufferedReader br = null;
        try {
            br = new BufferedReader(new FileReader("E:\\Java\\Impartire\\src\\graph.txt"));
            nrVarfuri = Integer.parseInt(br.readLine());
            linkList = new LinkList[nrVarfuri+1];
            for (int i = 1; i <= nrVarfuri; i++) {

            linkList[i]=new LinkList();
            }
            nrMuchii = Integer.parseInt(br.readLine());
            for(int i =0; i <nrMuchii; i++)
            {
                int varf1 = Integer.parseInt(br.readLine());
                int varf2 = Integer.parseInt(br.readLine());
                linkList[varf1].insertFirstLink(varf2);
                linkList[varf2].insertFirstLink(varf1);

            }
            varfStart = Integer.parseInt(br.readLine());

        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
    void printData()
    {
        for (int i = 1; i<= nrVarfuri;i++)
        {
            System.out.print(i + " : ");
            System.out.println(linkList[i].display());
        }
    }
    void BreadthFirstSearch()
    {
        int marked[] = new int[nrVarfuri+1];
        for(int i =0; i < marked.length; i ++)
            marked[i] = 0;
        myQueue = new MyQueue();
        myQueue.add(varfStart);
        while(!myQueue.isEmpty())
        {
            int varf = myQueue.remove();
            System.out.println(varf);
            marked[varf]=1;
            for(int i =0; i<linkList[varf].size();i++)
            {
                if (marked[linkList[varf].atIndex(i)]==0) {
                    myQueue.add(linkList[varf].atIndex(i));
                    marked[linkList[varf].atIndex(i)]=1;
                }
            }
        }
    }



}
