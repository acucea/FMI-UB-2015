package ro.unibuc.fmi.uilisteners;

import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.io.IOException;

import javax.swing.JButton;

import ro.unibuc.fmi.TicTacToeGame;

public class ButtonListener implements ActionListener
{

    private TicTacToeGame gameController;
    private int row, col;

    public ButtonListener(TicTacToeGame gameController, int row, int col)
    {
        this.gameController = gameController;
        this.row = row;
        this.col = col;
    }

    @Override
    public void actionPerformed(ActionEvent e)
    {
        JButton buton = (JButton) e.getSource();
        if (buton.isEnabled())
        {
            try {
                gameController.tickAt(row, col);
            } catch (IOException e1) {
                e1.printStackTrace();
            }
        }
        // should never get this when the button is disabled.
    }
}
