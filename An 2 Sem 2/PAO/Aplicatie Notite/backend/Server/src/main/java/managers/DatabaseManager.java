package managers;

import database.DataBase;
import pojos.Note;

import java.sql.SQLException;
import java.util.ArrayList;

/**
 * Created by calin on 20.04.2017.
 */
public class DatabaseManager {

    private DataBase dataBase ;

    public DatabaseManager() throws SQLException, ClassNotFoundException {
        dataBase = new DataBase();
        dataBase.connectToDataBase();
    }

    public String createUser() throws SQLException {
        return dataBase.createUser();
    }

    public boolean findUser(String username) throws SQLException {
        return dataBase.findUser(username);
    }
    public void createNote(Note note) throws SQLException {
        dataBase.createNote(note);
    }
    public void updateNote(Note note) throws  SQLException {
        dataBase.updateNote(note);
    }
    public ArrayList<Note> getNotesByUser(String user) throws SQLException {
        return dataBase.getNotes(user);

    }
    public Note getNoteById(int id) throws SQLException{
        return dataBase.getNoteById(id);
    }




}
