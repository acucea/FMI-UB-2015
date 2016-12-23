import java.util.LinkedList;

/**
 * Created by Cretu Calin on 10/17/2016.
 */
public class MyQueue
{
    private LinkList linkList;

    public MyQueue()
    {
        linkList = new LinkList();
    }
    public boolean isEmpty()
    {
        if (linkList.isEmpty())
            return true;
        return false;
    }
    public void add(int value)
    {
        linkList.insertFirstLink(value);
    }
    public int remove()
    {
        int lastNumber = linkList.remove();
        return lastNumber;
    }
    public int element()
    {
        return linkList.remove();
    }
    public String toString()
    {
        String toString = linkList.display();
        return toString;
    }

}