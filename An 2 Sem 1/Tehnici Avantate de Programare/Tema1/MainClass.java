/**
 * Created by Cretu Calin on 9/19/2016.
 */
public class MainClass {

    public static void main(String []args)
    {
//        PrimaProblema primaProblema = new PrimaProblema();
//        primaProblema.start();
//
//        UnorientedGraph unorientedGraph = new UnorientedGraph();
//        unorientedGraph.readData();
//        unorientedGraph.printData();
//        unorientedGraph.BreadthFirstSearch();

        XOR xor = new XOR();
        xor.readData();
        xor.encrypt();
        xor.printData();
        xor.decrypt();

//        LinkList linkList = new LinkList();
//        linkList.insertFirstLink(3);
//        linkList.insertFirstLink(4);
//        linkList.insertFirstLink(5);
//        linkList.insertFirstLink(6);
//        linkList.insertLastLink(2);
//
//        System.out.println(linkList.display());





    }

}
