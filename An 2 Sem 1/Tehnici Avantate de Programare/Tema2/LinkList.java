import java.util.Iterator;

import static javafx.scene.input.KeyCode.T;

/**
 * Created by Cretu Calin on 10/15/2016.
 */
class Link<M> {

    public M value;
    public Link next;

    public Link(M value)
    {
        this.value = value;
    }

}

public class LinkList<T> implements Iterable<T>
{
    public Link<T> firstLink;
    private int size;

    public LinkList()
    {
        size = 0;
        firstLink = null;
    }
    public int size()
    {
        return size;
    }
    public boolean isEmpty()
    {
        if (firstLink == null)
            return true;
        return false;
    }
    public void insertFirstLink(T value)
    {
        Link newLink = new Link(value);
        newLink.next = firstLink;
        firstLink = newLink;
        size++;
    }

    public T remove()
    {
        T value = firstLink.value;
        size--;
        Link currentLink = firstLink;
        Link previousLink = firstLink;


        if (!isEmpty()) {

            if (firstLink.next == null)
            {
                value = firstLink.value;
                firstLink = null;
            }
            while (currentLink.next != null) {
                previousLink = currentLink;
                currentLink = currentLink.next;
            }
            value = (T)currentLink.value;
            previousLink.next = null;
        }
        else

            System.out.println("Empty Link");
        return value;
    }
    public String display()
    {
        StringBuffer outputBuffer = new StringBuffer();
        Link theLink = firstLink;
        while (theLink != null)
        {
            String sting = theLink.value.toString();
            outputBuffer.append(sting);
            theLink = theLink.next;
        }
        return outputBuffer.toString();
    }
    public T atIndex(int index)
    {
        int findIndex = 0;
        Link<T> link = firstLink;
        while(findIndex != index)
        {
            link = link.next;
            findIndex ++;
        }
        return link.value;
    }
    public void insertLastLink(int value)
    {
        Link newLink = firstLink;
        while(newLink !=null)
        {
            System.out.println("Calin");
            newLink = newLink.next;
        }
        Link newLink2 = new Link(value);
        newLink=newLink2;
        size++;
    }


    @Override
    public Iterator<T> iterator() {
        Iterator<T> it = new Iterator<T>() {
            private int currentIndex = 0;
            @Override
            public boolean hasNext() {
                return currentIndex < size && atIndex(currentIndex)!=null;
            }

            @Override
            public T next() {
                return atIndex(currentIndex++);
            }
            public void remove()
            {
                throw new UnsupportedOperationException();
            }
        };
        return it;
    }
}

