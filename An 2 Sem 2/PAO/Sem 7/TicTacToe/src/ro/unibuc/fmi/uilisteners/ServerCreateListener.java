package ro.unibuc.fmi.uilisteners;

import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.io.IOException;

import javax.swing.JButton;
import javax.swing.JTextField;

import ro.unibuc.fmi.TicTacToeGame;

public class ServerCreateListener implements ActionListener
{

    private TicTacToeGame gameController;
    private JTextField port;

    public ServerCreateListener(TicTacToeGame gameController, JTextField port)
    {
        this.gameController = gameController;
        this.port = port;

    }

    @Override
    public void actionPerformed(ActionEvent e)
    {
        // TODO: Error handling! Exception treating!
        try
        {
            JButton buton = (JButton) e.getSource();
            buton.setText("Waiting for partner");
            buton.setEnabled(false);
            port.setEditable(false);
            Thread th = new Thread(new Runnable() {
                @Override
                public void run() {
                    try {
                        gameController.serverCreate(Integer.parseInt(port.getText()));
                    } catch (IOException | ClassNotFoundException e1) {
                        e1.printStackTrace();
                    }
                }
            });
            th.start();

        }
        catch (NumberFormatException ex)
        {
            // TODO Auto-generated catch block
            ex.printStackTrace();
        }

    }
}
