package managers;

import database.DataBase;

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


}
