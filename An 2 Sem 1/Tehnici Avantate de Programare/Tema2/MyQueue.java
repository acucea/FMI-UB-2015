import java.util.Iterator;

/**
 * Created by Cretu Calin on 10/17/2016.
 */
public class MyQueue<T> implements Iterable<T>
{
    private LinkList<T> linkList;

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
    public void add(T value)
    {
        linkList.insertFirstLink(value);
    }
    public T remove()
    {
        T lastNumber = linkList.remove();
        return lastNumber;
    }
    public T element()
    {
        return linkList.remove();
    }
    public String toString()
    {
        String toString = linkList.display();
        return toString;
    }

    @Override
    public Iterator<T> iterator() {
        return linkList.iterator();
    }
}