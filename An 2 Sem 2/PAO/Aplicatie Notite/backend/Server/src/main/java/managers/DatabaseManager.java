package managers;

import database.DataBase;
import pojos.Note;

import java.sql.SQLException;

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
    public void getNotesByUser(){

    }
    public void getNoteById(){

    }




}
