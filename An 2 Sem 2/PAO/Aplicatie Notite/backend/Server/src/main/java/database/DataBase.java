package database;

import com.google.gson.JsonArray;
import org.json.JSONArray;
import pojos.Note;

import java.sql.*;
import java.util.ArrayList;
import java.util.Objects;
import java.util.UUID;

/**
 * Created by calin on 20.04.2017.
 */
public class DataBase {


    private static Connection connection;
    private static Statement statement;

    public static void main(String argc[]) throws SQLException, ClassNotFoundException {

            connectToDataBase();

            Note note = getNoteById(8,9);
            System.out.println(note);
//

//         ArrayList<Note> notes = new ArrayList<>();
//         notes = getNotes("calin");
//
//         for(int i = 0 ; i < notes.size(); i++){
//             System.out.println(notes.get(i));
//         }
//
//        JSONArray json = new JSONArray(notes);
//        System.out.println(json.toString());

//            Note note = new Note("calin", false, "password","sha lala ");
//            note.setId(4);
//            updateNote(note);

            //String username = createUser();
            //ResultSet resultSet = statement.executeQuery("SELECT * FROM users ORDER BY id");

//
//            while(resultSet.next()){
//                System.out.println(resultSet.getInt(1) + " " +
//                resultSet.getString(2) );
//            }
            //System.out.println(username);

       // System.out.println(findUser("2eafbe24-b165-4929-a2c0-878ad5034560"));
        deconectFromDataBase();

    }


    public static void connectToDataBase() throws ClassNotFoundException, SQLException {
        Class.forName("com.mysql.jdbc.Driver");
        connection = DriverManager.getConnection("jdbc:mysql://ihatethis.ddns.net:3306/testbd", "calin","proiectMDS1!");
        statement = connection.createStatement();
    }

    public static void deconectFromDataBase() throws SQLException {
        connection.close();
    }

    public static String createUser() throws SQLException {
        String username = UUID.randomUUID().toString();
        int resultSet = statement.executeUpdate("INSERT INTO users(user_name) VALUE ("+ "\""+ username+"\""+");");
        return username;
    }

    public static boolean findUser(String username) throws SQLException {
        ResultSet response = statement.executeQuery("SELECT * FROM users WHERE user_name=\"" + username + "\";");
        response.next();
        return Objects.equals(response.getString(2), username);
    }

    public static void createNote(Note note) throws SQLException {

        String user = note.getUser();
        String text = note.getText();

        int resultSet ;
        String password ;
        if(note.isHasPassword()){
            password = note.getPassword();
            System.out.println("INSERT INTO notes(text, user_name , password) VALUE (" + "\"" + text + "," +user + "," + password + "\";");
            resultSet = statement.executeUpdate("INSERT INTO notes(text, user_name , password) VALUE (" + "\"" + text + "\",\"" +user + "\",\"" + password + "\");" );
        }else{
            resultSet = statement.executeUpdate("INSERT INTO notes(text, user_name) VALUE (" + "\"" + text + "\",\"" + user + "\");" );
        }
        System.out.println(resultSet);

    }

    public static void updateNote(Note note) throws SQLException {
        //require note.id
        int id = note.getId();

        String user = note.getUser();
        String text = note.getText();

        int resultSet ;
        String password ;
        if(note.isHasPassword()){
            password = note.getPassword();
            System.out.println("UPDATE notes SET text =\"" + text + "\"," + "password=\"" + password + "\" WHERE id is "  + id + ";" );
            resultSet = statement.executeUpdate("UPDATE notes SET text =\"" + text + "\"," + "password=\"" + password + "\" WHERE id = "  + id + ";" );

        }else{
            resultSet = statement.executeUpdate("UPDATE notes SET text =\"" + text + "," + "\" WHERE id = "  + id + ";" );
        }
        System.out.println(resultSet);

    }

    public static ArrayList<Note> getNotes(String user) throws SQLException{

        ArrayList<Note> notes = new ArrayList<>();


        ResultSet response = statement.executeQuery("SELECT * FROM notes WHERE user_name=\"" + user + "\";");
        while(response.next()){
            int id = response.getInt("id");
            String text = response.getString("text");
            String password = response.getString("password");

            Note note ;

            if(password == null){
                note = new Note(id,user,false, "any", text);

            }else{
                note = new Note(id,user,true, password, text);
            }
            notes.add(note);
        }

        return notes;

    }

    public static Note getNoteById(int id, int secondID) throws SQLException{

        ResultSet response = statement.executeQuery("SELECT * FROM notes WHERE id="+id+";");
        response.next();

        String text = response.getString("text");
        String password = response.getString("password");
        String user = response.getString("user_name");


        if(password == null){
            return new Note(id,user,false, "any", text);

        }else{
            return new Note(id,user,true, password, text);
        }

    }


}
