package managers;

import java.sql.SQLException;

/**
 * Created by calin on 20.04.2017.
 */
public class Manager {
    private static Manager instance = null;

    public static DatabaseManager databaseManager;


    protected Manager() throws SQLException, ClassNotFoundException {
        databaseManager = new DatabaseManager();

    }


    public static Manager getInstance() throws SQLException, ClassNotFoundException {

        if(instance==null){
            instance = new Manager();
        }
        return instance;

    }

    public DatabaseManager getDatabaseManager(){

        return databaseManager;

    }

}
