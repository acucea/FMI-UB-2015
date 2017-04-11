package ro.unibuc.fmi.server;

import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.net.ServerSocket;
import java.net.Socket;
import java.util.ArrayList;
import java.util.List;

import ro.unibuc.fmi.TicTacToeGame;
import ro.unibuc.fmi.messages.AmIPartner;

public class Server
{

    private ServerSocket server;
    private TicTacToeGame gameController;

    private List<Socket> clients;
    private List<ObjectInputStream> clientInputStreams;
    private List<ObjectOutputStream> clientOutputStreams;

    public boolean online;

    public Server(TicTacToeGame gameController, int port) throws IOException
    {
        // TODO: What to do with exceptions?
        server = new ServerSocket(port);
        this.gameController = gameController;
        clients = new ArrayList<Socket>();
        clientInputStreams = new ArrayList<ObjectInputStream>();
        clientOutputStreams = new ArrayList<ObjectOutputStream>();
    }

    public void startServer() throws IOException
    {
        online = true;
        Socket clientSocket;
        while(online){
            clientSocket = server.accept();
            clients.add(clientSocket);

            System.out.println("Client connected" + clients.size());

            ObjectOutputStream output = new ObjectOutputStream(clientSocket.getOutputStream());
            ObjectInputStream input = new ObjectInputStream(clientSocket.getInputStream());

            clientInputStreams.add(input);
            clientOutputStreams.add(output);
            output.flush();

            gameController.playerJoined(clients.size() -1);

            //partner or not

            if (clients.size() == 1){
                sendMessage(0, new AmIPartner(true));
            }else{
                sendMessage(clients.size()-1,new AmIPartner(false) );
            }

        }



    }

    public void sendMessage(int pointerConexiune, Object message) throws IOException
    {
        // TODO
        System.out.println("Send message");
        clientOutputStreams.get(pointerConexiune).writeObject(message);
        clientOutputStreams.get(pointerConexiune).flush();
    }

    public Object readMessage(int pointerConexiune) throws ClassNotFoundException, IOException
    {
        // TODO
        System.out.println("Read message");
        return clientInputStreams.get(pointerConexiune).readObject();
    }

    public void stopListening()
    {
        online = false;
    }

    public void stopServer()
    {
        stopListening();
        for (int i = 0; i < clients.size(); i++)
        {
            try
            {
                clientInputStreams.get(i).close();
                clientOutputStreams.get(i).close();
                clients.get(i).close();
            }
            catch (IOException e)
            {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }
        }
    }

    public int getNoOfClients(){
        if (clients == null){
            return 0;
        }
        return clients.size();
    }
}
