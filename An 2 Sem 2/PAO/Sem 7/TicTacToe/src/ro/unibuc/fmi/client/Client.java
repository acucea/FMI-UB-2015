package ro.unibuc.fmi.client;

import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.net.Socket;
import java.net.UnknownHostException;

public class Client
{

    private Socket socket;
    private ObjectInputStream inputStream;
    private ObjectOutputStream outputStream;

    public Client()
    {

    }

    public void connect(int port, String ip) throws UnknownHostException, IOException
    {
        // TODO: adaugati cod
        socket = new Socket(ip,port);
        outputStream = new ObjectOutputStream(socket.getOutputStream());
        outputStream.flush();
        inputStream = new ObjectInputStream(socket.getInputStream());
    }

    public void SendMessage(Object message) throws IOException
    {
        // TODO: adaugati cod
        outputStream.writeObject(message);
        outputStream.flush();
    }

    public Object ReadMessage() throws ClassNotFoundException, IOException
    {
        // TODO adaugati cod.
        return inputStream.readObject();
    }

}
