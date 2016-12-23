
import java.io.File;
import java.io.FileNotFoundException;
import java.util.Comparator;
import java.util.Scanner;

/**
 * Created by Cretu Calin on 10/29/2016.
 */
class Node<T extends Comparable<T>> implements Comparable<Node<T>>{

    T data;
    Node left;
    Node right;
    public Node(T data){
        this.data = data;
        left = null;
        right = null;
    }
    public T getT()
    {
        return data;
    }

    @Override
    public int compareTo(Node<T> o)
    {
        return getT().compareTo(o.getT());
    }
}

public class BST<T extends Comparable<T>> implements Comparable<BST<T>>{

    private Node<T> root;
    private String toString;

    public BST(){
        this.root = null;
    }

    public void readData()
    {
        try {
            Scanner scan = new Scanner (new File ("E:\\TapTema2\\src\\BSTFile"));
            while(scan.hasNext())
            {
                T t = (T) scan.next();
                insert(t);
            }
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        }
        System.out.println("");
        System.out.println(toString());

    }

    public boolean insert(T id){
        Node<T> newNode = new Node<T>(id);
        if(root==null){
            root = newNode;
            return false;
        }
        Node<T> current = root;
        Node<T> parent = null;
        while(true){
            parent = current;
            if(id.compareTo(current.data) < 0){
                current = current.left;
                if(current==null){
                    parent.left = newNode;
                    return true;
                }
            }else if(id.compareTo(current.data) > 0){
                current = current.right;
                if(current==null){
                    parent.right = newNode;
                    return true;
                }
            }
            else if(id.compareTo(current.data) == 0)
            {
                current = current.left;
                if(current==null){
                    parent.left = newNode;
                    return false;
                }
            }
        }
    }
    private void displayRec(Node root){
        if(root!=null){
            displayRec(root.left);
            toString = toString + " " + root.data;
            displayRec(root.right);
        }
    }
    @Override
    public String toString()
    {
        toString = "";
        displayRec(root);
        return toString;
    };

    @Override
    public int compareTo(BST<T> o) {
        return 0;
    }
}
