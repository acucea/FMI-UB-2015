/**
 * Created by Cretu Calin on 10/15/2016.
 */
class Link{

    public int value;
    public Link next;

    public Link(int value)
    {
        this.value = value;
    }

}
public class LinkList
{
    public Link firstLink;
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
    public void insertFirstLink(int value)
    {
        Link newLink = new Link(value);
        newLink.next = firstLink;
        firstLink = newLink;
        size++;
    }

    public int remove()
    {
        int value = 999999;
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
            value = currentLink.value;
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
            String sting = Integer.toString(theLink.value);
            outputBuffer.append(sting);
            theLink = theLink.next;
        }
        return outputBuffer.toString();
    }
    public int atIndex(int index)
    {
        int findIndex = 0;
        Link link = firstLink;
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





}

