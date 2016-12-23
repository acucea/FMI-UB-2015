/**
 * Created by Cretu Calin on 10/29/2016.
 */
public class Class5 implements Comparable<Class5> {
    public int getNumber() {
        return number;
    }

    public void setNumber(int number) {
        this.number = number;
    }

    int number;
    public Class5(int number)
    {
        this.number = number;
    }

    @Override
    public int compareTo(Class5 o) {
        return number-o.number;
    }
}
