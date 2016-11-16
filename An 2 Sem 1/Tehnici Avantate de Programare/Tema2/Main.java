/**
 * Created by Cretu Calin on 10/29/2016.
 */

public class Main {
    public static void main(String args[])
    {
//        DistantaFisiere distantaFisiere = new DistantaFisiere();
//        distantaFisiere.readDataFirstFile();
//        distantaFisiere.readDataSecondFile();
//        distantaFisiere.start();

//        UnorientedGraph unorientedGraph = new UnorientedGraph();
//        unorientedGraph.readData();
//        unorientedGraph.BreadthFirstSearch();

//        MyQueue<Character> myQueue = new MyQueue<>();
//        myQueue.add('a');
//        myQueue.add('b');
//        System.out.println(myQueue.remove());
//        MyQueue<Integer> myQueue1 = new MyQueue<>();
//        myQueue1.add(1);
//        myQueue1.add(2);
//        System.out.println(myQueue1.remove());
//        MyQueue<MyQueue<Integer>> myQueues = new MyQueue<>();
//        myQueues.add(myQueue1);

        BST<Integer> bst = new BST<>();
        bst.readData();

        BST<Class5> bst1 = new BST<>();
        bst1.insert(new Class5(5));
        bst1.insert(new Class5(6));
        bst1.insert(new Class5(7));
        System.out.println(bst1.toString());


        BST<Class5> bst2 = new BST<>();
        bst1.insert(new Class5(5));
        bst1.insert(new Class5(6));
        bst1.insert(new Class5(7));
        System.out.println(bst1.toString());






    }
}
